<?php

namespace StartPress\Core\Models;

use StartPress\Core\Model;

class Term extends Model
{
    /**
     * @var string
     */
    protected $table = 'terms';

    /**
     * @var string
     */
    protected $primaryKey = 'term_id';

    /**
     * @var bool
     */
    public $timestamps = false;

    public function taxonomy()
    {
        return $this->hasOne(Taxonomy::class, 'term_id');
    }
}
