<?php

namespace StartPress\Core\Models;

use StartPress\Core\Model;
use Exception;

class Option extends Model
{
    /**
     * @var string
     */
    protected $table = 'options';

    /**
     * @var string
     */
    protected $primaryKey = 'option_id';

    /**
     * @var bool
     */
    public $timestamps = false;

    /**
     * @var array
     */
    protected $fillable = [
        'option_name',
        'option_value'
    ];

    public function users()
    {
        return $this->hasOne(User::class);
    }

    public function getValueAttribute()
    {
        try {
            $value = unserialize($this->option_value);

            return $value === false && $this->option_value !== false ?
                $this->option_value :
                $value;
        } catch (Exception $ex) {
            return $this->option_value;
        }
    }

    public static function add($key, $value)
    {
        return static::create([
            'option_name' => $key,
            'option_value' => is_array($value) ? serialize($value) : $value,
        ]);
    }

    public function saveOption($key, $value = null)
    {
        if (is_array($key)) {
            foreach ($key as $k => $v) {
                $this->saveOneOption($k, $v);
            }
            return true;
        }

        return $this->saveOneOption($key, $value);
    }

    public function saveOneOption($name, $value)
    {
        $option = self::where('option_name', $name)->firstOrNew(['option_name' => $name]);
        return $option->fill(['option_value' => is_array($value) ? serialize($value) : $value])->save();
    }

    public static function get($name)
    {
        if ($option = self::where('option_name', $name)->first()) {
            return $option->value;
        }

        return null;
    }

    public static function getAll()
    {
        return static::asArray();
    }

    public static function asArray($keys = [])
    {
        $query = static::query();

        if (!empty($keys)) {
            $query->whereIn('option_name', $keys);
        }

        return $query->get()
            ->pluck('value', 'option_name')
            ->toArray();
    }

    public function toArray()
    {
        if ($this instanceof Option) {
            return [$this->option_name => $this->value];
        }

        return parent::toArray();
    }
}
