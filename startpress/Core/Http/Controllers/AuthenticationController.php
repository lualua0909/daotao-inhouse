<?php

namespace StartPress\Core\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use StartPress\Core\Helpers\UserRole;

class AuthenticationController extends Controller
{
    use AuthenticatesUsers;

    protected $guard = 'admin';

    protected $userRole;

    public function __construct(UserRole $userRole)
    {
        $this->userRole = $userRole;
    }

    /**
     * Get the login username to be used by the controller.
     *
     * @return string
     */
    public function username(): string
    {
        return 'user_login';
    }

    public function login(Request $request)
    {
        if ($request->getMethod() == 'GET'):
            if (Auth::guard($this->guard)->check()):
                return redirect()->route('dashboard');
            else:
                return view('login.login');
            endif;
        endif;

        $input = $request->all();
        $rememberMe = false;
        $fieldType = filter_var($request->user_login, FILTER_VALIDATE_EMAIL) ? 'user_email' : 'user_login';
        $credentials = array($fieldType => $input['user_login'], 'password' => $input['password']);

        if ($request->input('remember_me')):
            $rememberMe = true;
        endif;

        if (Auth::guard($this->guard)->attempt($credentials, $rememberMe)):
            $this->userRole->authorizeDashboard(Auth::guard($this->guard)->user());
            return redirect()->route('dashboard');
        else:
            return redirect()->route('login')->with('error', 'Thông tin đăng nhập không chính xác');
        endif;
    }

    public function logout()
    {
        Auth::guard($this->guard)->logout();
        return redirect()->route('login');
    }
}
