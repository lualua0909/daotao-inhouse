<?php

namespace StartPress\Core\Helpers;

use Illuminate\Support\HtmlString;

class MenuEditorBuilder
{
    public function menuItemsStructure($menu_items, $parent = 0)
    {
        $items = '';
        if ($menu_items):
            foreach ($menu_items as $item):
                if ((int)$item->meta->menu_item_parent === $parent):
                    $target_checked = '';
                    if (isset($item->meta->menu_item_target) && $item->meta->menu_item_target === '_blank'):
                        $target_checked = 'checked';
                    endif;
                    $items .= $this->toHtmlString(
                        '<li class="dd-item" data-id="' . $item->ID . '">' .
                        '<div class="dd-handle">' . $item->post_title . '</div>' .
                        '<div class="menu-item-content">' .
                        '<a class="menu-item-collapse-button collapsed" data-toggle="collapse" href="#collapse-menu-item-' . $item->ID . '" aria-expanded="true">' . $item->post_title . '</a>' .
                        '<div id="collapse-menu-item-' . $item->ID . '" class="collapse" data-parent="#menu-sortable" style="">' .
                        '<div class="content-wrap">' .
                        '<div class="form-group">' .
                        '<label for="custom-menu-item-url">URL</label>' .
                        '<input type="text" class="form-control" id="custom-menu-item-url-' . $item->ID . '" name="custom-menu-item-url[' . $item->ID . ']" value="' . $item->meta->menu_item_url . '">' .
                        '</div>' .
                        '<div class="form-group">' .
                        '<label for="custom-menu-item-name">Tên đường dẫn</label>' .
                        '<input type="text" class="form-control" id="custom-menu-item-name-' . $item->ID . '" name="custom-menu-item-name[' . $item->ID . ']" value="' . $item->post_title . '">' .
                        '</div>' .
                        '<div class="form-group">' .
                        '<div class="form-check">' .
                        '<input class="form-check-input" id="custom-menu-item-target-' . $item->ID . '" name="custom-menu-item-target[' . $item->ID . ']" type="checkbox" ' . $target_checked . ' value="_blank">' .
                        '<label class="form-check-label">Mở liên kết trong 1 thẻ mới</label>' .
                        '</div>' .
                        '</div>' .
                        '<div class="form-group mb-0 text-right">' .
                        '<button type="button" class="btn btn-info capitalize-first-letter" id="submit-custom-link-' . $item->ID . '">Xoá bỏ</button>' .
                        '</div>' .
                        '</div>' .
                        '</div>' .
                        '</div>' .
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
        $open_list = $this->toHtmlString('<ul class="dd-list">');
        $close_list = $this->toHtmlString('</ul>');
        if ($menu_items):
            foreach ($menu_items as $item):
                if ((int)$item->meta->menu_item_parent === $parent):
                    $target_checked = '';
                    if (isset($item->meta->menu_item_target) && $item->meta->menu_item_target === '_blank'):
                        $target_checked = 'checked';
                    endif;
                    $items .= $this->toHtmlString(
                        $open_list .
                        '<li class="dd-item" data-id="' . $item->ID . '">' .
                        '<div class="dd-handle">' . $item->post_title . '</div>' .
                        '<div class="menu-item-content">' .
                        '<a class="menu-item-collapse-button collapsed" data-toggle="collapse" href="#collapse-menu-item-' . $item->ID . '" aria-expanded="true">' . $item->post_title . '</a>' .
                        '<div id="collapse-menu-item-' . $item->ID . '" class="collapse" data-parent="#menu-sortable" style="">' .
                        '<div class="content-wrap">' .
                        '<div class="form-group">' .
                        '<label for="custom-menu-item-url">URL</label>' .
                        '<input type="text" class="form-control" id="custom-menu-item-url-' . $item->ID . '" name="custom-menu-item-url[' . $item->ID . ']" value="' . $item->meta->menu_item_url . '">' .
                        '</div>' .
                        '<div class="form-group">' .
                        '<label for="custom-menu-item-name">Tên đường dẫn</label>' .
                        '<input type="text" class="form-control" id="custom-menu-item-name-' . $item->ID . '" name="custom-menu-item-name[' . $item->ID . ']" value="' . $item->post_title . '">' .
                        '</div>' .
                        '<div class="form-group">' .
                        '<div class="form-check">' .
                        '<input class="form-check-input" id="custom-menu-item-target-' . $item->ID . '" name="custom-menu-item-target[' . $item->ID . ']" type="checkbox" ' . $target_checked . ' value="_blank">' .
                        '<label class="form-check-label">Mở liên kết trong 1 thẻ mới</label>' .
                        '</div>' .
                        '</div>' .
                        '<div class="form-group mb-0 text-right">' .
                        '<button type="button" class="btn btn-info capitalize-first-letter" id="submit-custom-link-' . $item->ID . '">Xoá bỏ</button>' .
                        '</div>' .
                        '</div>' .
                        '</div>' .
                        '</div>' .
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
