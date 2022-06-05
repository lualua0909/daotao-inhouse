<?php

namespace StartPress\Core\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Jobs\SendEmail;
use Illuminate\Http\Request;
use StartPress\Core\Models\Form;

class FormController extends Controller
{

    protected $form;

    public function __construct(Form $form)
    {
        $this->form = $form;
    }

    function index()
    {
        $entries = $this->form->orderBy('ID', 'DESC')->paginate(20);
        return view('form.entries', compact('entries'));
    }

    function form_submit(Request $request)
    {
        if ($request->getMethod() == 'GET'):
            return null;
        endif;

        $input = $request->all();
        $form = new Form();

        if (isset($input['form-data'])):
            $form_data = $input['form-data'];
            $company = $form_data['company'] !== null ? $form_data['company'] : '';
            $email = $form_data['email'] !== null ? $form_data['email'] : '';
            $full_name = $form_data['full_name'] !== null ? $form_data['full_name'] : '';
            $note = $form_data['note'] !== null ? $form_data['note'] : '';
            $phone = $form_data['phone'] !== null ? $form_data['phone'] : '';
        else:
            $form_data = $input['form-data-2'];
            $company = $form_data['company_2_1'] !== null ? $form_data['company_2_1'] : '';
            $email = $form_data['email_2_4'] !== null ? $form_data['email_2_4'] : '';
            $full_name = $form_data['full_name_2_2'] !== null ? $form_data['full_name_2_2'] : '';
            $note = $form_data['note_2_5'] !== null ? $form_data['note_2_5'] : '';
            $phone = $form_data['phone_2_3'] !== null ? $form_data['phone_2_3'] : '';
        endif;


        $this->form->company = $company;
        $this->form->email = $email;
        $this->form->full_name = $full_name;
        $this->form->phone = $phone;
        $this->form->note = $note;
        if ($this->form->save()):

            $message = [
                'company' => $company,
                'email' => $email,
                'full_name' => $full_name,
                'phone' => $phone,
                'note' => $note
            ];

            SendEmail::dispatch($message, 'training@ifa.edu.vn')->delay(now()->addMinute(1));

            SendEmail::dispatch($message, 'nhannt@ifa.edu.vn')->delay(now()->addMinute(1));

            return response()->json(['success' => true]);
        else:
            return response()->json(['success' => false]);
        endif;
    }

    public function delete_entry($id)
    {
        $entry = $this->form->find($id);
        if ($entry):
            $entry->delete();
            return redirect()->back()->with('success', 'Xoá thành công');
        endif;
    }
}
