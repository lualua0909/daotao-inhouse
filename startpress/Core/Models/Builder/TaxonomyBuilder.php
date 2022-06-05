<?php

namespace StartPress\Core\Models\Builder;

use Illuminate\Database\Eloquent\Builder;

class TaxonomyBuilder extends Builder
{

    public function name($name): TaxonomyBuilder
    {
        return $this->where('taxonomy', $name);
    }

    public function parent($term_id): TaxonomyBuilder
    {
        return $this->where('parent', $term_id);
    }

    public function category(): TaxonomyBuilder
    {
        return $this->where('taxonomy', 'category');
    }

    public function menu(): TaxonomyBuilder
    {
        return $this->where('taxonomy', 'nav_menu');
    }

    /**
     * @param null $slug
     * @return $this|Builder|TaxonomyBuilder
     */
    public function slug($slug = null)
    {
        if (!is_null($slug) && !empty($slug)) {
            return $this->whereHas('term', function ($query) use ($slug) {
                $query->where('slug', $slug);
            });
        }

        return $this;
    }

    /**
     * @param null $slug
     * @return $this|Builder|TaxonomyBuilder
     */
    public function term_slug($slug = null)
    {
        return $this->slug($slug);
    }
}
