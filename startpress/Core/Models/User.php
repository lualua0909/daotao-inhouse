<?php

namespace StartPress\Core\Models;

use Illuminate\Contracts\Auth\Authenticatable;
use Illuminate\Contracts\Auth\CanResetPassword;
use StartPress\Core\Model;
use StartPress\Core\Models\Concerns\MetaFields;

class User extends Model implements Authenticatable, CanResetPassword
{
    use MetaFields;

    const CREATED_AT = 'user_registered';
    const UPDATED_AT = null;

    /**
     * @var string
     */
    protected $table = 'users';

    /**
     * @var string
     */
    protected $primaryKey = 'ID';

    /**
     * @var array
     */
    protected $hidden = ['user_pass'];

    /**
     * @var array
     */
    protected $dates = ['user_registered'];

    /**
     * @var array
     */
    protected $with = ['meta'];

    /**
     * @var string
     */
    protected $guarded = 'admin';

    protected $fillable = [
        'user_login',
        'user_pass',
        'user_nicename',
        'user_email',
        'user_url',
        'user_registered',
        'user_activation_key',
        'display_name',
    ];

    public function posts()
    {
        return $this->hasMany(Post::class, 'post_author');
    }

    public function getAuthPassword()
    {
        return $this->user_pass;
    }

    public function getAuthIdentifierName()
    {
        return $this->primaryKey;
    }

    public function getAuthIdentifier()
    {
        return $this->attributes[$this->primaryKey];
    }

    public function getRememberToken()
    {
        $tokenName = $this->getRememberTokenName();
        return $this->meta->{$tokenName};
    }

    public function setRememberToken($value)
    {
        $tokenName = $this->getRememberTokenName();
        $this->saveMeta($tokenName, $value);
    }

    public function getRememberTokenName(): string
    {
        return 'remember_token';
    }

    public function getEmailForPasswordReset()
    {
        return $this->user_email;
    }

    public function sendPasswordResetNotification($token)
    {
        // TODO: Implement sendPasswordResetNotification() method.
    }
}
