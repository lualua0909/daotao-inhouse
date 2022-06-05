<?php

namespace StartPress\Core\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use StartPress\Core\Models\Post;

class CertificateController extends Controller
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
            $certificate_object = $this->post->type('certificate')->first();
            $certificate_slider = $this->post->type('certificate_slider')->status('publish')->orderBy('menu_order')->get();
            return view('option.certificate', compact('certificate_object', 'certificate_slider'));
        endif;

        /**
         * Request
         */
        $input = $request->all();

        if (isset($input['certificate_id'])):
            $post = $this->post->find($input['certificate_id']);
        else:
            $post = new Post();
        endif;

        if (isset($input['serialize'])):
            $slider_serialize = json_decode($input['serialize']);
        endif;

        $post->post_author = Auth::guard($this->guard)->user()->ID;
        $post->post_type = 'certificate';
        $post->post_status = 'publish';
        $post->comment_status = 'closed';
        $post->ping_status = 'closed';
        $post->save();
        $post->saveMeta([
            'certificate_title' => isset($input['certificate_title']) ? $input['certificate_title'] : '',
            'certificate_content' => isset($input['certificate_content']) ? $input['certificate_content'] : '',
            'certificate_url' => isset($input['certificate_url']) ? $input['certificate_url'] : ''
        ]);

        if ($slider_serialize):
            foreach ($slider_serialize as $slide):
                $post = $this->post->find($slide->id);
                $post->menu_order = $this->menu_order++;
                $post->save();
                if (isset($input['slide-desc']) && $input['slide-desc']):
                    foreach ($input['slide-desc'] as $item => $item_desc):
                        if ($post->ID === $item):
                            $post->saveMeta([
                                'slide_desc' => $item_desc,
                            ]);
                        endif;
                    endforeach;
                endif;
                if (isset($input['slide-img']) && $input['slide-img']):
                    foreach ($input['slide-img'] as $item => $item_img):
                        if ($post->ID === $item):
                            $post->saveMeta([
                                'slide_img' => $item_img,
                            ]);
                        endif;
                    endforeach;
                else:
                    $post->saveMeta([
                        'slide_img' => '',
                    ]);
                endif;
            endforeach;
        endif;

        return redirect()->back()->with('success', 'Nội đã được cập nhật');
    }

    function addSlide(){
        $this->post = new Post();
        $this->post->post_author = Auth::guard($this->guard)->user()->ID;
        $this->post->post_type = 'certificate_slider';
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
