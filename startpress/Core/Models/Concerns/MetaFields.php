<?php

namespace StartPress\Core\Models\Concerns;

use UnexpectedValueException;

trait MetaFields
{
    protected $builtInClasses = [
        \StartPress\Core\Models\User::class => \StartPress\Core\Models\Meta\UserMeta::class,
        \StartPress\Core\Models\Post::class => \StartPress\Core\Models\Meta\PostMeta::class,
    ];


    public function fields()
    {
        return $this->meta();
    }

    public function meta()
    {
        return $this->hasMany($this->getMetaClass(), $this->getMetaForeignKey());
    }

    protected function getMetaClass(): string
    {
        foreach ($this->builtInClasses as $model => $meta) {
            if ($this instanceof $model) {
                return $meta;
            }
        }

        throw new UnexpectedValueException(sprintf(
            '%s must extends one of Corcel built-in models: Comment, Post, Term or User.',
            static::class
        ));
    }

    protected function getMetaForeignKey(): string
    {
        foreach ($this->builtInClasses as $model => $meta) {
            if ($this instanceof $model) {
                return sprintf('%s_id', strtolower(class_basename($model)));
            }
        }

        throw new UnexpectedValueException(sprintf(
            '%s must extends one of Corcel built-in models: Comment, Post, Term or User.',
            static::class
        ));
    }

    public function saveMeta($key, $value = null)
    {
        if (is_array($key)) {
            foreach ($key as $k => $v) {
                $this->saveOneMeta($k, $v);
            }
            $this->load('meta');

            return true;
        }

        return $this->saveOneMeta($key, $value);
    }

    private function saveOneMeta($key, $value)
    {
        $meta = $this->meta()->where('meta_key', $key)
            ->firstOrNew(['meta_key' => $key]);

        $result = $meta->fill(['meta_value' => $value])->save();
        $this->load('meta');

        return $result;
    }
}
