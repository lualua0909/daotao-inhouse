<?php

namespace StartPress\Core\Models;

use StartPress\Core\Model;

class Form extends Model
{
    /**
     * @var string
     */
    protected $table = 'contact_form';

    /**
     * @var string
     */
    protected $primaryKey = 'ID';

    /**
     * @var bool
     */
    public $timestamps = false;
}
