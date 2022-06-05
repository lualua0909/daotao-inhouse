<?php

namespace StartPress\Core\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use StartPress\Core\Models\Post;

class PartnerController extends Controller
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
            $partners = $this->post->type('partner')->status('publish')->orderBy('menu_order')->get();
            return view('option.partner', compact('partners'));
        endif;

        /**
         * Menu items
         */
        $partners_serialize = [];

        /**
         * Request
         */
        $input = $request->all();

        if (isset($input['serialize'])):
            $partners_serialize = json_decode($input['serialize']);
        endif;

        if ($partners_serialize):
            foreach ($partners_serialize as $partner):
                $post = $this->post->find($partner->id);
                $post->menu_order = $this->menu_order++;
                $post->save();
                if (isset($input['partner-name']) && $input['partner-name']):
                    foreach ($input['partner-name'] as $item => $item_name):
                        if ($post->ID === $item):
                            $post->saveMeta([
                                'partner_name' => $item_name,
                            ]);
                        endif;
                    endforeach;
                endif;
                if (isset($input['partner-url']) && $input['partner-url']):
                    foreach ($input['partner-url'] as $item => $item_url):
                        if ($post->ID === $item):
                            $post->saveMeta([
                                'partner_url' => $item_url,
                            ]);
                        endif;
                    endforeach;
                endif;
                if (isset($input['partner-img']) && $input['partner-img']):
                    foreach ($input['partner-img'] as $item => $item_img):
                        if ($post->ID === $item):
                            $post->saveMeta([
                                'partner_img' => $item_img,
                            ]);
                        endif;
                    endforeach;
                else:
                    $post->saveMeta([
                        'partner_img' => '',
                    ]);
                endif;
            endforeach;
        endif;

        return redirect()->back()->with('success', 'Nội đã được cập nhật');
    }

    function addPartner()
    {
        $this->post = new Post();
        $this->post->post_author = Auth::guard($this->guard)->user()->ID;
        $this->post->post_type = 'partner';
        $this->post->post_status = 'publish';
        $this->post->comment_status = 'closed';
        $this->post->ping_status = 'closed';
        if ($this->post->save()):
            return response()->json([
                'ID' => $this->post->ID,
            ]);
        endif;
    }

    function deletePartner(Request $request)
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
