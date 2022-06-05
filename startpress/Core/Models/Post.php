<?php

namespace StartPress\Core\Models;

use StartPress\Core\Model;
use StartPress\Core\Models\Concerns\MetaFields;
use StartPress\Core\Models\Builder\PostBuilder;
use StartPress\Core\Models\Meta\ThumbnailMeta;

class Post extends Model
{
    use MetaFields;

    const CREATED_AT = 'post_date';
    const UPDATED_AT = 'post_modified';

    /**
     * @var string
     */
    protected $table = 'posts';

    /**
     * @var string
     */
    protected $primaryKey = 'ID';

    /**
     * @var array
     */
    protected $dates = ['post_date', 'post_modified'];

    /**
     * @var array
     */
    protected $with = ['meta'];


    /**
     * @var array
     */
    protected static $postTypes = [];

    /**
     * @var array
     */
    protected $fillable = [
        'post_content',
        'post_title',
        'post_excerpt',
        'post_type',
    ];

    public function author()
    {
        return $this->belongsTo(User::class, 'post_author');
    }

    public function newEloquentBuilder($query): PostBuilder
    {
        return new PostBuilder($query);
    }

    public function thumbnail()
    {
        return $this->hasOne(ThumbnailMeta::class, 'post_id')
            ->where('meta_key', 'thumbnail_id');
    }

    public function taxonomies()
    {
        return $this->belongsToMany(
            Taxonomy::class,
            'term_relationships',
            'object_id',
            'term_taxonomy_id'
        );
    }
}
