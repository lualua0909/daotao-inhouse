<?php

namespace StartPress\Core\Models\Meta;

use StartPress\Core\Models\Post;

class PostMeta extends Meta
{
    /**
     * @var string
     */
    protected $table = 'postmeta';

    /**
     * @var array
     */
    protected $fillable = ['meta_key', 'meta_value', 'post_id'];

    public function post(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(Post::class);
    }
}
