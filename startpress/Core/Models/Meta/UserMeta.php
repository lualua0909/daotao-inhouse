<?php

namespace StartPress\Core\Models\Meta;

use StartPress\Core\Models\User;

class UserMeta extends Meta
{
    /**
     * @var string
     */
    protected $table = 'usermeta';

    /**
     * @var string
     */
    protected $primaryKey = 'umeta_id';

    /**
     * @var array
     */
    protected $fillable = ['meta_key', 'meta_value', 'user_id'];

    public function user(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(User::class);
    }
}
