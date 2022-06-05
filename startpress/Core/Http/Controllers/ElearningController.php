<?php

namespace StartPress\Core\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use StartPress\Core\Models\Post;

class ElearningController extends Controller
{

    protected $post;

    /**
     * @var string
     */
    protected $guard = 'admin';

    public function __construct(Post $post)
    {
        $this->post = $post;
        $this->menu_order = 1;
    }

    function index(Request $request)
    {
        if ($request->getMethod() == 'GET'):
            $elearnings = $this->post->type('elearning')->status('publish')->orderBy('menu_order')->get();
            $elearning_object = $this->post->type('elearning_object')->first();
            return view('option.elearning', compact('elearnings', 'elearning_object'));
        endif;

        /**
         * Menu items
         */
        $elearnings_serialize = [];

        /**
         * Request
         */
        $input = $request->all();

        if (isset($input['serialize'])):
            $elearnings_serialize = json_decode($input['serialize']);
        endif;

        if (isset($input['elearning_object_id'])):
            $post = $this->post->find($input['elearning_object_id']);
        else:
            $post = new Post();
        endif;

        $post->post_author = Auth::guard($this->guard)->user()->ID;
        $post->post_type = 'elearning_object';
        $post->post_status = 'publish';
        $post->comment_status = 'closed';
        $post->ping_status = 'closed';
        $post->save();
        $post->saveMeta([
            'elearning_object_title' => isset($input['elearning_object_title']) ? $input['elearning_object_title'] : '',
            'elearning_object_desc' => isset($input['elearning_object_desc']) ? $input['elearning_object_desc'] : ''
        ]);

        if ($elearnings_serialize):
            foreach ($elearnings_serialize as $elearning):
                $post = $this->post->find($elearning->id);
                $post->menu_order = $this->menu_order++;
                $post->save();
                if (isset($input['elearning-name']) && $input['elearning-name']):
                    foreach ($input['elearning-name'] as $item => $item_name):
                        if ($post->ID === $item):
                            $post->saveMeta([
                                'elearning_name' => $item_name,
                            ]);
                        endif;
                    endforeach;
                endif;
                if (isset($input['elearning-url']) && $input['elearning-url']):
                    foreach ($input['elearning-url'] as $item => $item_url):
                        if ($post->ID === $item):
                            $post->saveMeta([
                                'elearning_url' => $item_url,
                            ]);
                        endif;
                    endforeach;
                endif;
                if (isset($input['elearning-img']) && $input['elearning-img']):
                    foreach ($input['elearning-img'] as $item => $item_img):
                        if ($post->ID === $item):
                            $post->saveMeta([
                                'elearning_img' => $item_img,
                            ]);
                        endif;
                    endforeach;
                else:
                    $post->saveMeta([
                        'elearning_img' => '',
                    ]);
                endif;
            endforeach;
        endif;

        return redirect()->back()->with('success', 'Nội đã được cập nhật');
    }

    function addElearning()
    {
        $this->post = new Post();
        $this->post->post_author = Auth::guard($this->guard)->user()->ID;
        $this->post->post_type = 'elearning';
        $this->post->post_status = 'publish';
        $this->post->comment_status = 'closed';
        $this->post->ping_status = 'closed';
        if ($this->post->save()):
            return response()->json([
                'ID' => $this->post->ID,
            ]);
        endif;
    }

    function deleteElearning(Request $request)
    {
        $post = $this->post->find($request->id);
        if ($post):
            $post->meta()->delete();
            $post->delete();
            return response()->json([
                'success' => true,
            ]);
        endif;
    }
}
