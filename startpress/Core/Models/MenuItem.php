<?php

namespace StartPress\Core\Models;

use Illuminate\Support\Arr;

/**
 * Class MenuItem
 *
 * @package Corcel\Model
 * @author Junior Grossi <juniorgro@gmail.com>
 */
class MenuItem extends Post
{
    /**
     * @var string
     */
    protected $postType = 'menu_item';

    /**
     * @var array
     */
    protected $instanceRelations = [
        'post' => Post::class,
        'page' => Page::class,
        'custom' => CustomLink::class,
        'category' => Taxonomy::class,
    ];


    public function parent()
    {
        if ($className = $this->getClassName()) {
            return (new $className)->newQuery()
                ->find($this->meta->menu_item_parent);
        }

        return null;
    }

    public function instance()
    {
        if ($className = $this->getClassName()) {
            return (new $className)->newQuery()
                ->find($this->meta->menu_item_object_id);
        }

        return null;
    }

    /**
     * @return string
     */
    protected function getClassName()
    {
        return Arr::get(
            $this->instanceRelations,
            $this->meta->menu_item_object
        );
    }
}
