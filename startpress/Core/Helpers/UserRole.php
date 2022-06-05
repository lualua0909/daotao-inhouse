<?php

namespace StartPress\Core\Helpers;

use Illuminate\Support\Facades\Auth;
use StartPress\Core\Models\Option;

class UserRole
{
    /**
     * @var Option
     */
    protected $option;

    /**
     * UserRole constructor.
     * @param Option $option
     */
    public function __construct(Option $option)
    {
        $this->option = $option;
    }

    /**
     * @param $user
     * @param $role
     * @return mixed|void
     */
    public function authorizeRoles($user, $role)
    {
        $capabilities = $user->meta->{'capabilities'};

        $userRoles = $this->option->get('user_roles');

        $userCapabilities = $userRoles[key(unserialize($capabilities))]['capabilities'];

        if (isset($userCapabilities[$role]) && $userCapabilities[$role] === true) {
            return $userCapabilities;
        } else {
            return abort(401, 'This action is unauthorized.');
        }
    }

    /**
     * @param $user
     */
    public function authorizeDashboard($user)
    {
        $capabilities = $user->meta->{'capabilities'};
        $userCapabilities = key(unserialize($capabilities));
        if ($userCapabilities !== 'subscriber'):
            return $capabilities;
        else:
            Auth::guard('admin')->logout();
            return abort(401, 'This action is unauthorized.');
        endif;
    }

    /**
     * @param $role
     * @return mixed
     */
    public function roleName($role)
    {
        $userRoles = $this->option->get('user_roles');
        return $userRoles[$role]['name'];
    }
}
