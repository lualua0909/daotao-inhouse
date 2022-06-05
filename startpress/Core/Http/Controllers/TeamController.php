<?php

namespace StartPress\Core\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use StartPress\Core\Models\Post;

class TeamController extends Controller
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
            $members = $this->post->type('member')->status('publish')->orderBy('menu_order')->get();
            $member_object = $this->post->type('member_object')->first();
            return view('option.team', compact('members', 'member_object'));
        endif;

        /**
         * Menu items
         */
        $members_serialize = [];

        /**
         * Request
         */
        $input = $request->all();

        if (isset($input['serialize'])):
            $members_serialize = json_decode($input['serialize']);
        endif;

        if (isset($input['member_object_id'])):
            $post = $this->post->find($input['member_object_id']);
        else:
            $post = new Post();
        endif;

        $post->post_author = Auth::guard($this->guard)->user()->ID;
        $post->post_type = 'member_object';
        $post->post_status = 'publish';
        $post->comment_status = 'closed';
        $post->ping_status = 'closed';
        $post->save();
        $post->saveMeta([
            'member_object_title' => isset($input['member_object_title']) ? $input['member_object_title'] : '',
            'member_object_desc' => isset($input['member_object_desc']) ? $input['member_object_desc'] : '',
            'member_object_url' => isset($input['member_object_url']) ? $input['member_object_url'] : ''
        ]);

        if ($members_serialize):
            foreach ($members_serialize as $member):
                $post = $this->post->find($member->id);
                $post->menu_order = $this->menu_order++;
                $post->save();
                if (isset($input['member-name']) && $input['member-name']):
                    foreach ($input['member-name'] as $item => $item_name):
                        if ($post->ID === $item):
                            $post->saveMeta([
                                'member_name' => $item_name,
                            ]);
                        endif;
                    endforeach;
                endif;
                if (isset($input['member-desc']) && $input['member-desc']):
                    foreach ($input['member-desc'] as $item => $item_desc):
                        if ($post->ID === $item):
                            $post->saveMeta([
                                'member_desc' => $item_desc,
                            ]);
                        endif;
                    endforeach;
                endif;
                if (isset($input['member-img']) && $input['member-img']):
                    foreach ($input['member-img'] as $item => $item_img):
                        if ($post->ID === $item):
                            $post->saveMeta([
                                'member_img' => $item_img,
                            ]);
                        endif;
                    endforeach;
                else:
                    $post->saveMeta([
                        'member_img' => '',
                    ]);
                endif;
            endforeach;
        endif;
        return redirect()->back()->with('success', 'Nội đã được cập nhật');
    }

    function addMember()
    {
        $this->post = new Post();
        $this->post->post_author = Auth::guard($this->guard)->user()->ID;
        $this->post->post_type = 'member';
        $this->post->post_status = 'publish';
        $this->post->comment_status = 'closed';
        $this->post->ping_status = 'closed';
        if ($this->post->save()):
            return response()->json([
                'ID' => $this->post->ID,
            ]);
        endif;
    }

    function deleteMember(Request $request)
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
