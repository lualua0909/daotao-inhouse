<?php

namespace StartPress\Core\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Config\Repository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use StartPress\Core\Helpers\UserRole;
use StartPress\Core\Models\User;

class UserController extends Controller
{
    /**
     * @var Repository
     */
    protected $config;

    /**
     * @var string
     */
    protected $guard = 'admin';

    /**
     * @var array
     */
    protected $capabilities = [];

    /**
     * @var UserRole
     */
    protected $userRole;

    /**
     * @var User
     */
    protected $user;

    /**
     * UserController constructor.
     * @param Repository $config
     * @param User $user
     * @param UserRole $userRole
     */
    public function __construct(Repository $config, User $user, UserRole $userRole)
    {
        $this->config = $config->get('core');

        $this->userRole = $userRole;

        $this->user = $user;

        $this->capabilities = $this->config['capabilities'];
    }

    public function users()
    {
        /**
         * Check role
         */
        $currentUser = Auth::guard($this->guard)->user();
        $this->userRole->authorizeRoles($currentUser, 'list_users');
        $users = $this->user->paginate(20);
        return view('user.users', compact('users', 'currentUser'));
    }

    public function new(Request $request)
    {
        /**
         * Check role
         */
        $this->userRole->authorizeRoles(Auth::guard($this->guard)->user(), 'create_users');

        /**
         * GET Method
         */
        if ($request->getMethod() == 'GET'):
            $capabilities = $this->capabilities;
            return view('user.new', compact('capabilities'));
        endif;

        $input = $request->all();

        /**
         * Validation
         */
        $validator = Validator::make($input, [
            'user_login' => 'required|unique:users,user_login',
            'email' => 'required|unique:users,user_email',
            'user_pass' => 'required',
        ],
            [
                'user_login.required' => 'Tên người dùng là bắt buộc',
                'user_login.unique' => 'Tên người dùng này đã được đăng ký. Vui lòng chọn một tên khác.',
                'email.required' => 'Email là bắt buộc',
                'email.unique' => 'Email này đã được đăng ký. Vui lòng chọn một Email khác.',
                'user_pass.unique' => 'Mật khẩu là bắt buộc',
            ]
        );

        if ($validator->fails()):
            return redirect()->route('user-new')->withErrors($validator);
        endif;

        /**
         * Add new user
         */
        $this->user = new User();
        $this->user->user_login = $input['user_login'];
        $this->user->user_pass = bcrypt($input['user_pass']);
        $this->user->user_nicename = $input['user_login'];
        $this->user->user_email = $input['email'];
        $this->user->display_name = $input['first_name'] . ' ' . $input['last_name'];

        if ($this->user->save()):

            /**
             * Add user meta capabilities
             */
            $role = array($input['role'] => true);
            $this->user->saveMeta('capabilities', serialize($role));

            /**
             * Add user meta first_name
             */
            if ($input['first_name']):
                $this->user->saveMeta('first_name', $input['first_name']);
            endif;

            /**
             * Add user meta first_name
             */
            if ($input['last_name']):
                $this->user->saveMeta('last_name', $input['last_name']);
            endif;

            return redirect()->route('users')->with('success', 'Thêm thành viên thành công');
        else:
            return redirect()->route('users')->with('error', 'Đã có lỗi xảy ra');
        endif;
    }

    public function profile(Request $request, $userID = null)
    {
        /**
         * Check role
         */
        $this->userRole->authorizeRoles(Auth::guard($this->guard)->user(), 'edit_users');

        /**
         * Get current user
         */
        $currentUser = Auth::guard($this->guard)->user();

        /**
         * capabilities
         */
        $capabilities = $this->capabilities;

        /**
         * Check edit other user or profile
         */
        if ($userID === null):
            $user = $currentUser;
        else:
            $user = $this->user->find($userID);
        endif;

        /**
         * GET Method
         */
        if ($request->getMethod() == 'GET'):
            return view('user.profile', compact('user', 'capabilities', 'currentUser'))->render();
        endif;


        $input = $request->all();
        $user->display_name = $input['display_name'];

        /**
         * Change email
         */
        if ($user->getOriginal('user_email') != $input['email']):

            $user->user_email = $input['email'];

            $validator = Validator::make($request->all(), [
                'email' => 'required|unique:users,user_email',
            ],
                [
                    'email.required' => 'Email là bắt buộc',
                    'email.unique' => 'Email này đã được đăng ký. Vui lòng chọn một Email khác.',
                ]
            );

            if ($validator->fails()) {
                return redirect()->back()->withErrors($validator);
            }

        endif;

        /**
         * Change password
         */
        if ($input['user_pass']):
            $user->user_pass = bcrypt($input['user_pass']);
        endif;

        /**
         * Change role
         */
        if ($currentUser->ID != $user->ID):
            $role = array($input['role'] => true);
            $user->saveMeta('capabilities', serialize($role));
        endif;

        /**
         * Add user meta first_name
         */
        if ($input['first_name']):
            $user->saveMeta('first_name', $input['first_name']);
        endif;

        /**
         * Add user meta first_name
         */
        if ($input['last_name']):
            $user->saveMeta('last_name', $input['last_name']);
        endif;

        if ($user->save()):
            return redirect()->back()->with('success', 'Thành viên đã được cập nhật.');
        else:
            return redirect()->back()->with('error', 'Đã có lỗi xảy ra.');
        endif;
    }
}
