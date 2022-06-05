<?php

namespace StartPress\Core\Models\Builder;

use Illuminate\Database\Eloquent\Builder;

class PostBuilder extends Builder
{
    /**
     * @param $type
     * @return PostBuilder
     */
    public function type($type): PostBuilder
    {
        return $this->where('post_type', $type);
    }

    /**
     * @param $status
     * @return PostBuilder
     */
    public function status($status): PostBuilder
    {
        return $this->where('post_status', $status);
    }

    /**
     * @return PostBuilder
     */
    public function not_trash(): PostBuilder
    {
        return $this->where('post_status', '!=', 'trash');
    }

    /**
     * @param string $slug
     * @return PostBuilder
     */
    public function slug($slug): PostBuilder
    {
        return $this->where('post_name', $slug);
    }
}
