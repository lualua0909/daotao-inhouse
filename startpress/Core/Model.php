<?php

namespace StartPress\Core;

use Illuminate\Database\Eloquent\Model as Eloquent;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Support\Str;

class Model extends Eloquent
{
    public function belongsTo($related, $foreignKey = null, $otherKey = null, $relation = null): BelongsTo
    {
        if (is_null($relation)) {
            list(, $caller) = debug_backtrace(DEBUG_BACKTRACE_IGNORE_ARGS, 2);
            $relation = $caller['function'];
        }

        if (is_null($foreignKey)) {
            $foreignKey = Str::snake($relation) . '_id';
        }

        $instance = $this->setInstanceConnection(
            new $related()
        );

        $query = $instance->newQuery();

        $otherKey = $otherKey ?: $instance->getKeyName();

        return new BelongsTo($query, $this, $foreignKey, $otherKey, $relation);
    }

    protected function setInstanceConnection($instance)
    {
        return $instance->setConnection(
            $instance instanceof self ?
                $this->getConnection()->getName() :
                $instance->getConnection()->getName()
        );
    }
}
