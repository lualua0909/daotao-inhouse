<?php

namespace StartPress\Core\Helpers;

use Illuminate\Support\HtmlString;

class AdminMenuBuilder
{
    /**
     * @param $itemName
     * @param $itemOption
     * @return HtmlString
     */
    public function addMenu($itemName, $itemOption): HtmlString
    {
        $routeName = $this->getRouteName($itemOption['route']);
        $parameter = $this->getParameter($itemOption['route']);
        $arrowIcon = '';
        $activeClass = '';
        $activeParentClass = '';
        $openClass = '';
        $sub = '';

        if (route($routeName, $parameter) === url()->current()):
            $activeClass = 'active';
        endif;

        if (isset($itemOption['submenu']) && $itemOption['submenu']):
            $subItems = '';
            $arrowIcon = '<i class="fas fa-angle-left right"></i>';
            foreach ($itemOption['submenu'] as $subItemName => $subItemOption):
                $routeName = $this->getRouteName($subItemOption['route']);
                $parameter = $this->getParameter($subItemOption['route']);
                if (route($routeName, $parameter) === url()->current()):
                    if ($subItemOption['parent'] === $itemName):
                        $openClass = 'menu-open';
                        $activeParentClass = 'active';
                    endif;
                endif;
                $subItems .= $this->addMenu($subItemName, $subItemOption);
            endforeach;
            $sub = $this->toHtmlString(
                '<ul class="nav nav-treeview">' . $subItems . '</ul>'
            );
        endif;

        return $this->toHtmlString(
            '<li class="nav-item ' . $openClass . '">' .
            '<a href="' . route($routeName, $parameter) . '" class="nav-link ' . $activeParentClass . ' ' . $activeClass . '">' .
            '<i class="nav-icon ' . $itemOption['icon'] . '"></i>' .
            '<p>' . $itemOption['title'] . ' ' . $arrowIcon . '</p>' .
            '</a>' .
            $sub .
            '</li>'
        );
    }

    /**
     * @param $route
     * @return string
     */
    public function getParameter($route): string
    {
        $parameter = '';
        if (is_array($route)):
            $parameter = $route[1];
        endif;
        return $parameter;
    }

    /**
     * @param $route
     * @return mixed
     */
    public function getRouteName($route)
    {
        if (is_array($route)):
            $routeName = $route[0];
        else:
            $routeName = $route;
        endif;
        return $routeName;
    }

    /**
     * @param $html
     * @return HtmlString
     */
    protected function toHtmlString($html): HtmlString
    {
        return new HtmlString($html);
    }
}
