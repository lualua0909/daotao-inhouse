<?php

namespace StartPress\Core\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use StartPress\Core\Models\Post;

class Why2Controller extends Controller
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
            $whys_2 = $this->post->type('why_2')->status('publish')->orderBy('menu_order')->get();
            $why_2_object = $this->post->type('why_2_object')->first();
            return view('option.why-2', compact('whys_2', 'why_2_object'));
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

        if (isset($input['why_2_object_id'])):
            $post = $this->post->find($input['why_2_object_id']);
        else:
            $post = new Post();
        endif;

        $post->post_author = Auth::guard($this->guard)->user()->ID;
        $post->post_type = 'why_2_object';
        $post->post_status = 'publish';
        $post->comment_status = 'closed';
        $post->ping_status = 'closed';
        $post->save();
        $post->saveMeta([
            'why_2_object_title' => isset($input['why_2_object_title']) ? $input['why_2_object_title'] : '',
            'why_2_object_desc' => isset($input['why_2_object_desc']) ? $input['why_2_object_desc'] : '',
            'why_2_object_img' => isset($input['why_2_object_img']) ? $input['why_2_object_img'] : '',
            'why_2_object_text_1' => isset($input['why_2_object_text_1']) ? $input['why_2_object_text_1'] : '',
            'why_2_object_text_2' => isset($input['why_2_object_text_2']) ? $input['why_2_object_text_2'] : '',
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
                                'why_2_name' => $item_name,
                            ]);
                        endif;
                    endforeach;
                endif;
                if (isset($input['why-desc']) && $input['why-desc']):
                    foreach ($input['why-desc'] as $item => $item_desc):
                        if ($post->ID === $item):
                            $post->saveMeta([
                                'why_2_desc' => $item_desc,
                            ]);
                        endif;
                    endforeach;
                endif;
                if (isset($input['why-number']) && $input['why-number']):
                    foreach ($input['why-number'] as $item => $item_number):
                        if ($post->ID === $item):
                            $post->saveMeta([
                                'why_2_number' => $item_number,
                            ]);
                        endif;
                    endforeach;
                endif;
                if (isset($input['why-img']) && $input['why-img']):
                    foreach ($input['why-img'] as $item => $item_img):
                        if ($post->ID === $item):
                            $post->saveMeta([
                                'why_img' => $item_img,
                            ]);
                        endif;
                    endforeach;
                else:
                    $post->saveMeta([
                        'why_img' => '',
                    ]);
                endif;
            endforeach;
        endif;

        return redirect()->back()->with('success', 'Nội đã được cập nhật');
    }

    function addWhy()
    {
        $this->post = new Post();
        $this->post->post_author = Auth::guard($this->guard)->user()->ID;
        $this->post->post_type = 'why_2';
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
