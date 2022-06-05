<?php

namespace StartPress\Core\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use StartPress\Core\Models\Post;

class HeaderController extends Controller
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
            $header_object = $this->post->type('header')->first();
            return view('option.header', compact('header_object'));
        endif;

        /**
         * Request
         */
        $input = $request->all();

        if (isset($input['header_id'])):
            $post = $this->post->find($input['header_id']);
        else:
            $post = new Post();
        endif;

        $post->post_author = Auth::guard($this->guard)->user()->ID;
        $post->post_type = 'header';
        $post->post_status = 'publish';
        $post->comment_status = 'closed';
        $post->ping_status = 'closed';
        $post->save();
        $post->saveMeta([
            'header_hotline' => isset($input['header_hotline']) ? $input['header_hotline'] : '',
            'header_facebook' => isset($input['header_facebook']) ? $input['header_facebook'] : '',
            'header_zalo' => isset($input['header_zalo']) ? $input['header_zalo'] : '',
            'header_youtube' => isset($input['header_youtube']) ? $input['header_youtube'] : '',
        ]);
        return redirect()->back()->with('success', 'Nội đã được cập nhật');
    }
}
