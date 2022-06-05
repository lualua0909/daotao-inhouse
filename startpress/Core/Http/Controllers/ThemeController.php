<?php

namespace StartPress\Core\Http\Controllers;

use App\Http\Controllers\Controller;
use ChrisKonnertz\OpenGraph\OpenGraph;
use Illuminate\Config\Repository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use StartPress\Core\Exceptions\UserException;
use StartPress\Core\Models\Option;
use StartPress\Core\Models\Post;
use StartPress\Core\Models\Taxonomy;
use StartPress\Core\Models\Term;
use Spatie\SchemaOrg\Schema;

class ThemeController extends Controller
{
    /**
     * @var Option
     */
    protected $option;

    /**
     * @var Post
     */
    protected $post;

    /**
     * @var Taxonomy
     */
    protected $taxonomy;

    /**
     * @var Repository
     */
    protected $config;

    protected $site_info;

    protected $openGraph;

    public function __construct(Option $option, Post $post, Taxonomy $taxonomy, Repository $config, OpenGraph $openGraph)
    {
        $this->option = $option;

        $this->post = $post;

        $this->taxonomy = $taxonomy;

        $this->openGraph = $openGraph;

        $this->config = $config->get('core');

        $this->site_info = [
            'site_name' => $this->option->get('site_name'),
            'site_description' => $this->option->get('site_description'),
        ];
        $header_object = $this->post->type('header')->first();
        $footer_object = $this->post->type('footer')->first();
        $posts = $this->post->type('post')->status('publish')->orderBy('ID', 'DESC')->paginate(2);
        $localBusiness = Schema::localBusiness()
            ->name($this->option->get('site_name'))
            ->email('info@training@ifa.edu.vn')
            ->contactPoint(Schema::contactPoint()->areaServed('Worldwide'));
        $schema = $localBusiness->toScript();
        $openGraphTags = $this->openGraph->title($this->option->get('site_name'))
            ->type('article')
            ->image(asset('/public/startpress/theme/assets/images/header-logo.png'))
            ->description($this->option->get('site_description'))
            ->url();
        View::share('hot_news', $posts);
        View::share('header_settings', $header_object);
        View::share('footer_settings', $footer_object);
        View::share('schema', $schema);
        View::share('openGraphTags', $openGraphTags);
    }

    public function index(Request $request, $slug = null)
    {
        $site_info = $this->site_info;
        if ($slug):

            $slug = explode('/', $slug);

            $first_parameter = reset($slug);

            $last_parameter = end($slug);

            if ($first_parameter === $last_parameter):
                $post = $this->post->slug($first_parameter)->first();
                if (!$post):
                    return abort(404);
                else:
                    $post_type = $post->post_type;
                    if ($post_type === 'post'):
                        $view = 'single';
                    elseif ($post_type === 'page'):
                        $view = 'page';
                    else:
                        $view = 'single-' . $post_type;
                    endif;
                    if (view()->exists('layouts.' . $view)):
                        return view('layouts.' . $view, compact('site_info', 'post'));
                    else:
                        return view('layouts.single', compact('site_info', 'post'));
                    endif;
                endif;
            else:
                if (isset($this->config['taxonomies'][$first_parameter])):
                    $option = $this->config['taxonomies'][$first_parameter];
                    $post_type = $option['post_type'];
                    $taxonomy = $this->taxonomy->name($first_parameter)->term_slug($last_parameter)->first();
                    $posts = $this->post->type($post_type)->status('publish')->orderBy('ID', 'DESC')->paginate($this->option->get('posts_per_page'));
                    if ($post_type === 'post'):
                        $view = 'archive';
                    else:
                        $view = 'archive-' . $post_type;
                    endif;
                    if (view()->exists('layouts.' . $view)):
                        return view('layouts.' . $view, compact('site_info', 'taxonomy', 'posts'));
                    else:
                        return view('layouts.archive', compact('site_info', 'taxonomy', 'posts'));
                    endif;
                else:
                    return abort(404);
                endif;
            endif;
        else:
            $posts = $this->post->type('post')->status('publish')->orderBy('ID', 'DESC')->paginate($this->option->get('posts_per_page'));
            $study_programs = $this->post->type('study_program')->status('publish')->orderBy('menu_order')->get();
            $welcome_object = $this->post->type('welcome')->first();
            $members = $this->post->type('member')->status('publish')->orderBy('menu_order')->get();
            $member_object = $this->post->type('member_object')->first();
            $partners = $this->post->type('partner')->status('publish')->orderBy('menu_order')->get();
            $certificate_object = $this->post->type('certificate')->first();
            $certificate_slider = $this->post->type('certificate_slider')->status('publish')->orderBy('menu_order')->get();
            $elearnings = $this->post->type('elearning')->status('publish')->orderBy('menu_order')->get();
            $elearning_object = $this->post->type('elearning_object')->first();
            $timelines = $this->post->type('timeline')->status('publish')->orderBy('menu_order')->get();
            $timeline_object = $this->post->type('timeline_object')->first();
            $whys = $this->post->type('why')->status('publish')->orderBy('menu_order')->get();
            $why_object = $this->post->type('why_object')->first();
            $whys_2 = $this->post->type('why_2')->status('publish')->orderBy('menu_order')->get();
            $why_2_object = $this->post->type('why_2_object')->first();
            return view('layouts.index', compact('site_info', 'posts', 'study_programs', 'welcome_object', 'members', 'member_object', 'partners', 'certificate_object', 'certificate_slider', 'elearnings', 'elearning_object', 'timelines', 'timeline_object', 'whys', 'why_object', 'whys_2', 'why_2_object'));
        endif;
    }
}
