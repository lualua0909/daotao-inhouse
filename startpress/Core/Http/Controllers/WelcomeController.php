<?php

namespace StartPress\Core\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use StartPress\Core\Models\Post;

class WelcomeController extends Controller
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
            $welcome_object = $this->post->type('welcome')->first();
            return view('option.welcome', compact('welcome_object'));
        endif;

        /**
         * Request
         */
        $input = $request->all();

        if (isset($input['welcome_id'])):
            $post = $this->post->find($input['welcome_id']);
        else:
            $post = new Post();
        endif;

        $post->post_author = Auth::guard($this->guard)->user()->ID;
        $post->post_type = 'welcome';
        $post->post_status = 'publish';
        $post->comment_status = 'closed';
        $post->ping_status = 'closed';
        $post->save();
        $post->saveMeta([
            'welcome_title' => isset($input['welcome_title']) ? $input['welcome_title'] : '',
            'welcome_desc' => isset($input['welcome_desc']) ? $input['welcome_desc'] : '',
            'welcome_url' => isset($input['welcome_url']) ? $input['welcome_url'] : '',
            'welcome_img' => isset($input['welcome_img']) ? $input['welcome_img'] : '',
        ]);
        return redirect()->back()->with('success', 'Nội đã được cập nhật');
    }
}
