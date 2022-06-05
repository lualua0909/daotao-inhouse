<?php

namespace StartPress\Core\Helpers;

use Illuminate\Support\HtmlString;
use StartPress\Core\Models\Menu;

class MenuBuilder
{

    /**
     * @var Menu
     */
    protected $menu;

    public function __construct(Menu $menu)
    {
        $this->menu = $menu;
    }

    function get_menu($menu_id, $args = array())
    {
        $menu = $this->menu->find($menu_id);
        if ($menu):
            $menu_items = $menu->items;
        endif;
        //dd($menu->term->slug);

        $open_container_tag = '';
        $close_container_tag = '';
        $container_class = '';
        $container_id = '';
        $menu_class = '';

        if ($args['container'] !== ''):
            if ($args['container_class'] !== ''):
                $container_class = $this->toHtmlString('class="' . $args['container_class'] . '"');
            endif;
            if ($args['container_id'] !== ''):
                $container_id = $this->toHtmlString('id="' . $args['container_id'] . '"');
            endif;

            $open_container_tag = $this->toHtmlString('<' . $args['container'] . ' ' . $container_id . ' ' . $container_class . '>');
            $close_container_tag = $this->toHtmlString('</' . $args['container'] . '>');
        endif;

        if ($args['menu_class'] !== ''):
            $menu_class = $this->toHtmlString('class="' . $args['menu_class'] . '"');
        endif;
        if ($args['menu_id'] !== ''):
            $menu_id = $this->toHtmlString('id="' . $args['menu_id'] . '"');
        else:
            $menu_id = $this->toHtmlString('id="menu-' . $menu->term->slug . '"');
        endif;

        $open_menu_tag = $this->toHtmlString('<ul' . ' ' . $menu_class . ' ' . $menu_id . '>');
        $close_menu_tag = $this->toHtmlString('</ul>');

        return $open_container_tag .
            $open_menu_tag .
            $this->menuItemsStructure($menu_items) .
            $close_menu_tag .
            $close_container_tag;
    }

    public function menuItemsStructure($menu_items, $parent = 0)
    {
        $items = '';
        if ($menu_items):
            foreach ($menu_items as $item):
                $target = '';
                if ($item->meta->menu_item_target !== ''):
                    $target = $this->toHtmlString('target="' . $item->meta->menu_item_target . '"');
                endif;
                $item_type = $this->toHtmlString('menu-item-type-' . $item->meta->menu_item_type);
                if ((int)$item->meta->menu_item_parent === $parent):
                    $items .= $this->toHtmlString(
                        '<li id="menu-item-' . $item->ID . '" class="menu-item-' . $item->ID . ' ' . $item_type . '">' .
                        '<a href="' . $item->meta->menu_item_url . '" ' . $target . '>' . $item->post_title . '</a>' .
                        $this->menuChildItemsStructure($menu_items, $item->ID) .
                        '</li>'
                    );
                endif;
            endforeach;
        endif;
        return $items;
    }

    public function menuChildItemsStructure($menu_items, $parent = 0)
    {
        $items = '';
        $open_list = $this->toHtmlString('<ul class="sub-menu">');
        $close_list = $this->toHtmlString('</ul>');
        if ($menu_items):
            foreach ($menu_items as $item):
                if ((int)$item->meta->menu_item_parent === $parent):
                    $target = '';
                    if ($item->meta->menu_item_target !== ''):
                        $target = $this->toHtmlString('target="' . $item->meta->menu_item_target . '"');
                    endif;
                    $item_type = $this->toHtmlString('menu-item-type-' . $item->meta->menu_item_type);
                    $items .= $this->toHtmlString(
                        $open_list .
                        '<li id="menu-item-' . $item->ID . '" class="menu-item-' . $item->ID . ' ' . $item_type . '">' .
                        '<a href="' . $item->meta->menu_item_url . '" ' . $target . '>' . $item->post_title . '</a>' .
                        $this->menuChildItemsStructure($menu_items, $item->ID) .
                        '</li>' .
                        $close_list
                    );
                endif;
            endforeach;
        endif;
        return $items;
    }

    protected function toHtmlString($html): HtmlString
    {
        return new HtmlString($html);
    }
}
