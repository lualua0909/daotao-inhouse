<?php

namespace StartPress\Core\Models\Meta;

use Exception;
use StartPress\Core\Model;
use StartPress\Core\Models\Collection\MetaCollection;

abstract class Meta extends Model
{
    /**
     * @var string
     */
    protected $primaryKey = 'meta_id';

    /**
     * @var bool
     */
    public $timestamps = false;

    /**
     * @return mixed
     */
    public function getValueAttribute()
    {
        try {
            $value = unserialize($this->meta_value);

            return $value === false && $this->meta_value !== false ?
                $this->meta_value :
                $value;
        } catch (Exception $ex) {
            return $this->meta_value;
        }
    }

    public function newCollection(array $models = []): MetaCollection
    {
        return new MetaCollection($models);
    }
}
