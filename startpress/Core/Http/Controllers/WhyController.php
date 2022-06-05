<?php

namespace StartPress\Core\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use StartPress\Core\Models\Post;

class WhyController extends Controller
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
            $whys = $this->post->type('why')->status('publish')->orderBy('menu_order')->get();
            $why_object = $this->post->type('why_object')->first();
            return view('option.why', compact('whys', 'why_object'));
        endif;

        /**
         * Menu items
         */
        $whys_serialize = [];

        /**
         * Request
         */
        $input = $request->all();

        if (isset($input['serialize'])):
            $whys_serialize = json_decode($input['serialize']);
        endif;

        if (isset($input['why_object_id'])):
            $post = $this->post->find($input['why_object_id']);
        else:
            $post = new Post();
        endif;

        $post->post_author = Auth::guard($this->guard)->user()->ID;
        $post->post_type = 'why_object';
        $post->post_status = 'publish';
        $post->comment_status = 'closed';
        $post->ping_status = 'closed';
        $post->save();
        $post->saveMeta([
            'why_object_title' => isset($input['why_object_title']) ? $input['why_object_title'] : '',
            'why_object_desc' => isset($input['why_object_desc']) ? $input['why_object_desc'] : '',
            'why_object_img' => isset($input['why_object_img']) ? $input['why_object_img'] : '',
        ]);

        if ($whys_serialize):
            foreach ($whys_serialize as $why):
                $post = $this->post->find($why->id);
                $post->menu_order = $this->menu_order++;
                $post->save();
                if (isset($input['why-name']) && $input['why-name']):
                    foreach ($input['why-name'] as $item => $item_name):
                        if ($post->ID === $item):
                            $post->saveMeta([
                                'why_name' => $item_name,
                            ]);
                        endif;
                    endforeach;
                endif;
                if (isset($input['why-desc']) && $input['why-desc']):
                    foreach ($input['why-desc'] as $item => $item_desc):
                        if ($post->ID === $item):
                            $post->saveMeta([
                                'why_desc' => $item_desc,
                            ]);
                        endif;
                    endforeach;
                endif;
                if (isset($input['why-number']) && $input['why-number']):
                    foreach ($input['why-number'] as $item => $item_number):
                        if ($post->ID === $item):
                            $post->saveMeta([
                                'why_number' => $item_number,
                            ]);
                        endif;
                    endforeach;
                endif;
            endforeach;
        endif;

        return redirect()->back()->with('success', 'Nội đã được cập nhật');
    }

    function addWhy()
    {
        $this->post = new Post();
        $this->post->post_author = Auth::guard($this->guard)->user()->ID;
        $this->post->post_type = 'why';
        $this->post->post_status = 'publish';
        $this->post->comment_status = 'closed';
        $this->post->ping_status = 'closed';
        if ($this->post->save()):
            return response()->json([
                'ID' => $this->post->ID,
            ]);
        endif;
    }

    function deleteWhy(Request $request)
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
