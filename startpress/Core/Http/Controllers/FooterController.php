<?php

namespace StartPress\Core\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use StartPress\Core\Models\Post;

class FooterController extends Controller
{

    protected $post;

    /**
     * @var string
     */
    protected $guard = 'admin';

    public function __construct(Post $post)
    {
        $this->post = $post;
    }

    function index(Request $request)
    {
        if ($request->getMethod() == 'GET'):
            $footer_object = $this->post->type('footer')->first();
            return view('option.footer', compact('footer_object'));
        endif;

        /**
         * Request
         */
        $input = $request->all();

        if (isset($input['footer_id'])):
            $post = $this->post->find($input['footer_id']);
        else:
            $post = new Post();
        endif;

        $post->post_author = Auth::guard($this->guard)->user()->ID;
        $post->post_type = 'footer';
        $post->post_status = 'publish';
        $post->comment_status = 'closed';
        $post->ping_status = 'closed';
        $post->save();
        $post->saveMeta([
            'footer_desc' => isset($input['footer_desc']) ? $input['footer_desc'] : '',
            'footer_facebook' => isset($input['footer_facebook']) ? $input['footer_facebook'] : '',
            'footer_zalo' => isset($input['footer_zalo']) ? $input['footer_zalo'] : '',
            'footer_youtube' => isset($input['footer_youtube']) ? $input['footer_youtube'] : '',
            'footer_address' => isset($input['footer_address']) ? $input['footer_address'] : '',
            'footer_email' => isset($input['footer_email']) ? $input['footer_email'] : '',
            'footer_phone' => isset($input['footer_phone']) ? $input['footer_phone'] : '',
        ]);
        return redirect()->back()->with('success', 'Nội đã được cập nhật');
    }
}
