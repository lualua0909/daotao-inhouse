<?php

namespace StartPress\Core\Models\Meta;

use StartPress\Core\Models\Attachment;

class ThumbnailMeta extends PostMeta
{
    /**
     * @var array
     */
    protected $with = ['attachment'];

    public function attachment()
    {
        return $this->belongsTo(Attachment::class, 'meta_value');
    }
}
