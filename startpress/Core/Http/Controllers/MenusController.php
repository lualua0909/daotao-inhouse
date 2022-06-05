<?php

namespace StartPress\Core\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Config\Repository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use StartPress\Core\Helpers\Helpers;
use StartPress\Core\Models\Menu;
use StartPress\Core\Models\MenuItem;
use StartPress\Core\Models\Option;
use StartPress\Core\Models\Post;
use StartPress\Core\Models\Taxonomy;
use StartPress\Core\Models\Term;

class MenusController extends Controller
{
    /**
     * @var Post
     */
    protected $post;

    /**
     * @var Repository
     */
    protected $config;

    /**
     * @var array|mixed
     */
    protected $register_menus;

    /**
     * @var string
     */
    protected $guard = 'admin';

    /**
     * @var Helpers
     */
    protected $helpers;

    /**
     * @var Taxonomy
     */
    protected $taxonomy;

    /**
     * @var Menu
     */
    protected $menu;

    /**
     * @var MenuItem
     */
    protected $menu_item;

    /**
     * @var Term
     */
    protected $term;

    /**
     * @var Option
     */
    protected $option;

    /**
     * @var int
     */
    protected $menu_order;

    public function __construct(Menu $menu, MenuItem $menu_item, Taxonomy $taxonomy, Term $term, Post $post, Option $option, Repository $config, Helpers $helpers)
    {
        $this->config = $config->get('theme');

        $this->register_menus = [];

        if (isset($this->config['register_menus'])):
            $this->register_menus = $this->config['register_menus'];
        endif;

        $this->taxonomy = $taxonomy;

        $this->menu = $menu;

        $this->menu_item = $menu_item;

        $this->term = $term;

        $this->post = $post;

        $this->helpers = $helpers;

        $this->option = $option;

        $this->menu_order = 1;
    }

    public function menus(Request $request)
    {
        /**
         * Request
         */
        $input = $request->all();

        /**
         * Get menu locations from database
         */
        $menu_locations_db = $this->option->get('menu_locations');

        if ($request->getMethod() == 'GET'):

            /**
             * Redirect
             */
            if (!isset($input['menu'])):
                $menu_object = $this->menu->first();
                if ($menu_object):
                    return redirect()->route('menus', 'menu=' . $menu_object->term_id);
                endif;
                return redirect()->route('menus', 'menu=0');
            endif;

            /**
             * Get menu locations from theme config
             */
            $menu_locations = $this->register_menus;

            /**
             * Current menu
             */
            $menu_id = $input['menu'];

            /**
             * Get menu from database
             */
            $menus = $this->menu->get();

            /**
             * Get menu object
             */
            $menu = $this->menu->find($menu_id);

            /**
             * Menu items
             */
            $menu_items = [];

            /**
             * Get menu items from database
             */
            if ($menu):
                $menu_items = $menu->items;
            endif;

            /**
             * Return view
             */
            return view('option.menus', compact('menu_locations', 'menu_locations_db', 'menu_id', 'menus', 'menu', 'menu_items'));

        endif;

        if (isset($input['menu']) && $input['menu'] === "0"):

            /**
             * Term
             */
            $this->term = new Term();

            /**
             * Taxonomy
             */
            $this->taxonomy = new Taxonomy();

            /**
             * Menu value
             */
            $this->term->name = $input['menu-name'];
            $this->term->slug = $this->helpers->slugGenerator($input['menu-name'], true);
            $this->taxonomy->taxonomy = 'nav_menu';

            /**
             * Menu creating
             */
            if ($this->term->save()):
                $this->term->taxonomy()->save($this->taxonomy);
                return redirect()->route('menus', 'menu=' . $this->term->term_id)->with('success', $input['menu-name'] . ' đã được tạo');
            else:
                return redirect()->back()->with('error', 'Đã có lỗi xảy ra');
            endif;

        endif;

        /**
         * Set menu locations into database
         */
        if (isset($input['menu-locations'])):
            if ($menu_locations_db):
                foreach ($input['menu-locations'] as $location_ip => $menu_ip):
                    $menu_locations_db[$location_ip] = $menu_ip;
                endforeach;
                $this->option->saveOneOption('menu_locations', $menu_locations_db);
            else:
                $this->option->saveOneOption('menu_locations', $input['menu-locations']);
            endif;
        else:
            if ($this->register_menus && $menu_locations_db):
                foreach ($this->register_menus as $key => $name):
                    if (($key = array_search($input['menu'], $menu_locations_db)) !== false) {
                        unset($menu_locations_db[$key]);
                    }
                endforeach;
            endif;
            $this->option->saveOneOption('menu_locations', $menu_locations_db);
        endif;

        /**
         *
         */
        $menu = $this->term->find($input['menu']);

        /**
         *
         */
        $menu->name = $input['menu-name'];

        /**
         *
         */
        if (isset($input['serialize'])):
            $menu_items = json_decode($input['serialize']);
            $this->menuItemsStructure($menu_items, $input['menu']);
        endif;

        /**
         *
         */
        $menu = $this->menu->find($input['menu']);
        $menu_items = $menu->items;
        if ($menu_items):
            foreach ($menu_items as $menu_item):
                if ($menu_item->status('draft')):
                    $menu_item->post_status = 'publish';
                    $menu_item->save();
                    $menu_item->saveMeta([
                        'menu_item_target' => '',
                    ]);
                endif;
                if (isset($input['custom-menu-item-target']) && $input['custom-menu-item-target']):
                    foreach ($input['custom-menu-item-target'] as $item => $item_target):
                        if ($menu_item->ID === $item):
                            $menu_item->saveMeta([
                                'menu_item_target' => $item_target,
                            ]);
                        endif;
                    endforeach;
                endif;
                if (isset($input['custom-menu-item-url']) && $input['custom-menu-item-url']):
                    foreach ($input['custom-menu-item-url'] as $item => $item_url):
                        if ($menu_item->ID === $item):
                            $menu_item->saveMeta([
                                'menu_item_url' => $item_url,
                            ]);
                        endif;
                    endforeach;
                endif;
                if (isset($input['custom-menu-item-name']) && $input['custom-menu-item-name']):
                    foreach ($input['custom-menu-item-name'] as $item => $item_name):
                        if ($menu_item->ID === $item):
                            $menu_item->post_title = $item_name;
                            $menu_item->save();
                        endif;
                    endforeach;
                endif;
            endforeach;
        endif;

        /**
         *
         */
        if ($menu->save()):
            return redirect()->route('menus', 'menu=' . $menu->term_id)->with('success', $input['menu-name'] . ' đã được cập nhật');
        else:
            return redirect()->back()->with('error', 'Đã có lỗi xảy ra');
        endif;
    }

    public function menuItemsStructure($serialize, $menu, $parent = 0)
    {
        if ($serialize):
            foreach ($serialize as $item):
                $this->menu_item = new MenuItem();
                $menu_item = $this->menu_item->find($item->id);
                $menu_item->taxonomies()->sync($menu);
                $menu_item->saveMeta('menu_item_parent', $parent);
                $menu_item->menu_order = $this->menu_order++;
                $menu_item->save();
                if (isset($item->children)):
                    $this->menuItemsStructure($item->children, $menu, $item->id);
                endif;
            endforeach;
        endif;
    }

    public function menu_item(Request $request)
    {
        $input = $request->all();
        $this->post = new Post();
        $this->post->post_author = Auth::guard($this->guard)->user()->ID;
        $this->post->post_title = $input['item_name'];
        $this->post->post_type = 'menu_item';
        $this->post->post_status = 'draft';
        $this->post->comment_status = 'closed';
        $this->post->ping_status = 'closed';
        if ($this->post->save()):
            $this->post->saveMeta([
                'menu_item_type' => 'custom',
                'menu_item_object' => 'custom',
                'menu_item_parent' => 0,
                'menu_item_object_id' => $this->post->ID,
                'menu_item_target' => '',
                'menu_item_url' => $input['item_url'],
            ]);
        endif;
        $item_name = $this->post->post_title;
        $item_url = $this->post->meta->menu_item_url;
        $item_ID = $this->post->ID;
        return response()->json([
            'item_name' => $item_name,
            'item_url' => $item_url,
            'item_ID' => $item_ID,
        ]);
    }

    public function delete_menu($menu_id)
    {
        $term = $this->term->find($menu_id);
        $taxonomy = $this->taxonomy->find($menu_id);
        if ($term):
            $menu_items = $taxonomy->posts()->get();
            if ($menu_items):
                foreach ($menu_items as $menu_item):
                    $menu_item->meta()->delete();
                endforeach;
            endif;

            if ($term->taxonomy()->delete() && $taxonomy->posts()->delete() && $term->delete()):
                return response()->json(['success' => true, 'name' => $term->name]);
            endif;
        endif;
    }
}
