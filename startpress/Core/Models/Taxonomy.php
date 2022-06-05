<?php

namespace StartPress\Core\Models;

use StartPress\Core\Model;
use StartPress\Core\Models\Builder\TaxonomyBuilder;
use StartPress\Core\Models\Meta\TermMeta;

class Taxonomy extends Model
{
    /**
     * @var string
     */
    protected $table = 'term_taxonomy';

    /**
     * @var string
     */
    protected $primaryKey = 'term_taxonomy_id';

    /**
     * @var bool
     */
    public $timestamps = false;

    /**
     * @var array
     */
    protected $with = ['term'];

    public function meta()
    {
        return $this->hasMany(TermMeta::class, 'term_id');
    }

    public function term()
    {
        return $this->belongsTo(Term::class, 'term_id');
    }

    public function parent()
    {
        return $this->belongsTo(Taxonomy::class, 'parent');
    }

    public function posts()
    {
        return $this->belongsToMany(
            Post::class,
            'term_relationships',
            'term_taxonomy_id',
            'object_id'
        );
    }

    public function newEloquentBuilder($query)
    {
        return new TaxonomyBuilder($query);
    }

    public function newQuery()
    {
        return isset($this->taxonomy) && $this->taxonomy ?
            parent::newQuery()->where('taxonomy', $this->taxonomy) :
            parent::newQuery();
    }

    public function __get($key)
    {
        if (!isset($this->$key)) {
            if (isset($this->term->$key)) {
                return $this->term->$key;
            }
        }

        return parent::__get($key);
    }
}
