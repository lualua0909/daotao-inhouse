<?php

namespace StartPress\Core\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use StartPress\Core\Models\Option;

class OptionController extends Controller
{
    /**
     * @var Option
     */
    protected $option;

    public function __construct(Option $option)
    {
        $this->option = $option;
    }

    public function general(Request $request)
    {
        if ($request->getMethod() == 'GET'):
            $options = [
                'site_name' => $this->option->get('site_name'),
                'site_description' => $this->option->get('site_description'),
                'site_url' => $this->option->get('site_url'),
                'posts_per_page' => $this->option->get('posts_per_page'),
            ];
            return view('option.general', compact('options'));
        endif;

        $input = $request->all();

        $this->option = new Option();

        if ($input['site_name'] === null):
            $input['site_name'] = '';
        endif;

        if ($input['site_description'] === null):
            $input['site_description'] = '';
        endif;

        if ($input['site_url'] === null):
            $input['site_url'] = '';
        endif;

        if ($input['posts_per_page'] === null):
            $input['posts_per_page'] = '';
        endif;

        $this->option->saveOption([
            'site_name' => $input['site_name'],
            'site_description' => $input['site_description'],
            'site_url' => $input['site_url'],
            'posts_per_page' => $input['posts_per_page'],
        ]);

        return redirect()->back()->with('success', 'Đã lưu mọi cài đặt.');
    }
}
