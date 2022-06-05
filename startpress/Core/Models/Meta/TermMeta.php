<?php

namespace StartPress\Core\Models\Meta;

use StartPress\Core\Models\Term;

class TermMeta extends Meta
{
    /** @var string */
    protected $table = 'termmeta';

    /** @var string */
    protected $primaryKey = 'meta_id';

    /** @var array */
    protected $fillable = ['meta_key', 'meta_value', 'term_id'];

    public function term()
    {
        return $this->belongsTo(Term::class);
    }
}
