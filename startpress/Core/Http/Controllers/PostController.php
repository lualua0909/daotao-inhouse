<?php

namespace StartPress\Core\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Config\Repository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use StartPress\Core\Helpers\Helpers;
use StartPress\Core\Helpers\UserRole;
use StartPress\Core\Models\Post;
use StartPress\Core\Models\Taxonomy;

class PostController extends Controller
{
    /**
     * @var string
     */
    protected $guard = 'admin';

    /**
     * @var Repository
     */
    protected $config;

    /**
     * @var Taxonomy
     */
    protected $taxonomy;

    /**
     * @var Post
     */
    protected $post;

    /**
     * @var Helpers
     */
    protected $helpers;

    /**
     * @var UserRole
     */
    protected $userRole;

    public function __construct(Post $post, Repository $config, Taxonomy $taxonomy, Helpers $helpers, UserRole $userRole)
    {
        $this->config = $config->get('core');

        $this->post = $post;

        $this->helpers = $helpers;

        $this->taxonomy = $taxonomy;

        $this->userRole = $userRole;
    }

    public function posts(Request $request, $post_type = null)
    {

        /**
         * Check role
         */
        $this->userRole->authorizeRoles(Auth::guard($this->guard)->user(), 'edit_posts');

        if ($post_type === null):
            $post_type = 'post';
        endif;

        $input = $request->all();

        $post_status = null;

        if (isset($input['post_status'])):
            $post_status = $input['post_status'];
        endif;

        if (isset($this->config['post_types'][$post_type])):
            $option = $this->config['post_types'][$post_type];
        else:
            return abort(404);
        endif;

        if ($post_status === null):
            $posts = $this->post->type($post_type)->not_trash()->orderBy('ID', 'DESC')->paginate(20);
        elseif ($post_status === 'publish'):
            $posts = $this->post->type($post_type)->status('publish')->orderBy('ID', 'DESC')->paginate(20);
        elseif ($post_status === 'draft'):
            $posts = $this->post->type($post_type)->status('draft')->orderBy('ID', 'DESC')->paginate(20);
        elseif ($post_status === 'pending'):
            $posts = $this->post->type($post_type)->status('pending')->orderBy('ID', 'DESC')->paginate(20);
        elseif ($post_status === 'trash'):
            $posts = $this->post->type($post_type)->status('trash')->orderBy('ID', 'DESC')->paginate(20);
        endif;

        $posts_count = [
            'all' => $this->post->type($post_type)->not_trash()->count(),
            'publish' => $this->post->type($post_type)->status('publish')->count(),
            'draft' => $this->post->type($post_type)->status('draft')->count(),
            'pending' => $this->post->type($post_type)->status('pending')->count(),
            'trash' => $this->post->type($post_type)->status('trash')->count(),
        ];

        $taxonomies = $this->getTaxonomies($post_type);

        return view('post.posts', compact('posts', 'option', 'taxonomies', 'post_type', 'post_status', 'posts_count'));
    }

    public function new(Request $request, $post_type = null)
    {
        /**
         * Check role
         */
        $this->userRole->authorizeRoles(Auth::guard($this->guard)->user(), 'edit_posts');

        if ($post_type === null):
            $post_type = 'post';
        endif;

        if (!isset($this->config['post_types'][$post_type])):
            return abort(404);
        endif;

        $option = $this->config['post_types'][$post_type];

        $taxonomies = $this->getTaxonomies($post_type);

        if ($request->getMethod() == 'GET'):
            return view('post.editor', compact('option', 'taxonomies'));
        endif;

        $input = $request->all();

        /**
         * Validation
         */
        $validator = Validator::make($input, [
            'post_title' => 'required:posts,post_title',
        ],
            [
                'post_title.required' => 'Vui lòng nhập tên ' . $option['name'],
            ]
        );

        if ($validator->fails()):
            return redirect()->back()->withErrors($validator);
        endif;

        $this->post = new Post();
        $this->post->post_author = Auth::guard($this->guard)->user()->ID;
        $this->post->post_title = $input['post_title'];
        if ($input['post_content'] !== null):
            $this->post->post_content = $input['post_content'];
        endif;
        $this->post->post_name = $this->helpers->slugGenerator($input['post_title']);
        $this->post->post_type = $post_type;
        $this->post->post_status = $input['post_status'];
        if (!isset($input['taxonomies'])):
            $input['taxonomies'] = [];
        endif;
        if ($this->post->save()):
            $this->post->saveMeta('thumbnail_id', $input['featured_image']);
            $this->post->taxonomies()->attach($input['taxonomies']);
            return redirect()->route('edit-post', $this->post->ID)->with('success', 'Thêm ' . $option['name'] . ' thành công');
        else:
            return redirect()->back()->with('error', 'Đã có lỗi xảy ra');
        endif;
    }

    public function edit(Request $request, $ID)
    {
        $post = null;

        /**
         * Check role
         */
        $this->userRole->authorizeRoles(Auth::guard($this->guard)->user(), 'edit_posts');

        if ($this->post->find($ID)):
            $post = $this->post->find($ID);
        else:
            return abort(404);
        endif;

        if (!isset($this->config['post_types'][$post->post_type])):
            return abort(404);
        endif;

        $option = $this->config['post_types'][$post->post_type];

        $taxonomies = $this->getTaxonomies($post->post_type);

        if ($request->getMethod() == 'GET'):
            return view('post.editor', compact('option', 'taxonomies', 'post'));
        endif;

        $input = $request->all();

        $post->post_title = $input['post_title'];
        $post->post_status = $input['post_status'];
        if ($input['post_content'] !== null):
            $post->post_content = $input['post_content'];
        endif;
        if (!isset($input['taxonomies'])):
            $input['taxonomies'] = [];
        endif;
        if ($post->save()):
            $post->saveMeta('thumbnail_id', $input['featured_image']);
            $post->taxonomies()->sync($input['taxonomies']);
            return redirect()->back()->with('success', $option['name'] . ' đã được cập nhật');
        else:
            return redirect()->back()->with('error', 'Đã có lỗi xảy ra');
        endif;
    }

    public function update_post_status($ID, $post_status)
    {
        if ($this->post->find($ID)):
            $post = $this->post->find($ID);
            $option = $this->config['post_types'][$post->post_type];

            if ($post_status === 'delete'):
                $post->meta()->delete();
                if ($post->delete()):
                    return redirect()->back()->with('success', $option['name'] . ' đã được xoá.');
                endif;
            endif;

            $post->post_status = $post_status;


            if ($post->save()):
                return redirect()->back()->with('success', 'Đã chuyển 1 ' . $option['name'] . ' vào Thùng rác.');
            else:
                return redirect()->back()->with('error', 'Đã có lỗi xảy ra');
            endif;
        else:
            return abort(404);
        endif;
    }

    public function getTaxonomies($post_type)
    {
        $taxonomies = [];
        $option = $this->config['post_types'][$post_type];
        if (isset($option['taxonomies']) && !empty($option['taxonomies'])):
            foreach ($option['taxonomies'] as $taxonomy):
                if (isset($this->config['taxonomies'][$taxonomy])):
                    $taxonomies[$taxonomy] = $this->config['taxonomies'][$taxonomy];
                endif;
            endforeach;
        endif;
        return $taxonomies;
    }
}
