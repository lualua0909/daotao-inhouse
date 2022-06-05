<?php

namespace StartPress\Core\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use StartPress\Core\Models\Post;

class TimelineController extends Controller
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
            $timelines = $this->post->type('timeline')->status('publish')->orderBy('menu_order')->get();
            $timeline_object = $this->post->type('timeline_object')->first();
            return view('option.timeline', compact('timelines', 'timeline_object'));
        endif;

        /**
         * Menu items
         */
        $timelines_serialize = [];

        /**
         * Request
         */
        $input = $request->all();

        if (isset($input['serialize'])):
            $timelines_serialize = json_decode($input['serialize']);
        endif;

        if (isset($input['timeline_object_id'])):
            $post = $this->post->find($input['timeline_object_id']);
        else:
            $post = new Post();
        endif;

        $post->post_author = Auth::guard($this->guard)->user()->ID;
        $post->post_type = 'timeline_object';
        $post->post_status = 'publish';
        $post->comment_status = 'closed';
        $post->ping_status = 'closed';
        $post->save();
        $post->saveMeta([
            'timeline_object_title' => isset($input['timeline_object_title']) ? $input['timeline_object_title'] : '',
            'timeline_object_desc' => isset($input['timeline_object_desc']) ? $input['timeline_object_desc'] : ''
        ]);

        if ($timelines_serialize):
            foreach ($timelines_serialize as $timeline):
                $post = $this->post->find($timeline->id);
                $post->menu_order = $this->menu_order++;
                $post->save();
                if (isset($input['timeline-name']) && $input['timeline-name']):
                    foreach ($input['timeline-name'] as $item => $item_name):
                        if ($post->ID === $item):
                            $post->saveMeta([
                                'timeline_name' => $item_name,
                            ]);
                        endif;
                    endforeach;
                endif;
                if (isset($input['timeline-desc']) && $input['timeline-desc']):
                    foreach ($input['timeline-desc'] as $item => $item_desc):
                        if ($post->ID === $item):
                            $post->saveMeta([
                                'timeline_desc' => $item_desc,
                            ]);
                        endif;
                    endforeach;
                endif;
            endforeach;
        endif;

        return redirect()->back()->with('success', 'Nội đã được cập nhật');
    }

    function addTimeline()
    {
        $this->post = new Post();
        $this->post->post_author = Auth::guard($this->guard)->user()->ID;
        $this->post->post_type = 'timeline';
        $this->post->post_status = 'publish';
        $this->post->comment_status = 'closed';
        $this->post->ping_status = 'closed';
        if ($this->post->save()):
            return response()->json([
                'ID' => $this->post->ID,
            ]);
        endif;
    }

    function deleteTimeline(Request $request)
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
