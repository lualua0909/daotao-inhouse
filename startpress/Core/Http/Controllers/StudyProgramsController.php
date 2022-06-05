<?php

namespace StartPress\Core\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use StartPress\Core\Models\Post;

class StudyProgramsController extends Controller
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
        /**
         * Menu items
         */
        $study_program_items = [];

        if ($request->getMethod() == 'GET'):
            $study_programs = $this->post->type('study_program')->status('publish')->orderBy('menu_order')->get();
            return view('option.study-programs', compact('study_programs'));
        endif;

        /**
         * Request
         */
        $input = $request->all();

        if (isset($input['serialize'])):
            $study_program_items = json_decode($input['serialize']);
        endif;

        if ($study_program_items):
            foreach ($study_program_items as $study_program_item):
                $post = $this->post->find($study_program_item->id);
                $post->menu_order = $this->menu_order++;
                $post->save();
                if (isset($input['study-program-title']) && $input['study-program-title']):
                    foreach ($input['study-program-title'] as $item => $item_title):
                        if ($post->ID === $item):
                            $post->saveMeta([
                                'study_program_title' => $item_title,
                            ]);
                        endif;
                    endforeach;
                endif;
                if (isset($input['study-program-content']) && $input['study-program-content']):
                    foreach ($input['study-program-content'] as $item => $item_content):
                        if ($post->ID === $item):
                            $post->saveMeta([
                                'study_program_content' => $item_content,
                            ]);
                        endif;
                    endforeach;
                endif;
                if (isset($input['study-program-url']) && $input['study-program-url']):
                    foreach ($input['study-program-url'] as $item => $item_url):
                        if ($post->ID === $item):
                            $post->saveMeta([
                                'study_program_url' => $item_url,
                            ]);
                        endif;
                    endforeach;
                endif;
                if (isset($input['study-program-gallery']) && $input['study-program-gallery']):
                    foreach ($input['study-program-gallery'] as $item => $item_gallery):
                        if ($post->ID === $item):
                            $post->saveMeta([
                                'study_program_gallery' => serialize(array_values($item_gallery)),
                            ]);
                        endif;
                    endforeach;
                else:
                    $post->saveMeta([
                        'study_program_gallery' => '',
                    ]);
                endif;
            endforeach;
        endif;
        return redirect()->back()->with('success', 'Nội đã được cập nhật');
    }

    public function addStudyProgram()
    {
        $this->post = new Post();
        $this->post->post_author = Auth::guard($this->guard)->user()->ID;
        $this->post->post_type = 'study_program';
        $this->post->post_status = 'publish';
        $this->post->comment_status = 'closed';
        $this->post->ping_status = 'closed';
        if ($this->post->save()):
            return response()->json([
                'ID' => $this->post->ID,
            ]);
        endif;
    }

    public function deleteStudyProgram(Request $request)
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
