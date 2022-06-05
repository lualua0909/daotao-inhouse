<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>StartPress CMS</title>
    {!! StartPress::adminHeaderScripts() !!}
</head>
<body class="hold-transition login-page">
<div class="login-box">
    <!-- /.login-logo -->
    <div class="card card-outline card-primary">
        <div class="card-header text-center">
            <a href="https://startpress.net/" class="h1"><b>StartPress</b>CMS</a>
        </div>
        <div class="card-body">
            @if (Session::has('error'))
                <p class="login-box-msg">{!! Session::get('error') !!}</p>
            @endif
            <form method="post" action="{{ route('login') }}">
                <div class="input-group mb-3">
                    <input type="text" name="user_login" class="form-control" placeholder="Tên người dùng hoặc Địa chỉ Email" value="">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-envelope"></span>
                        </div>
                    </div>
                </div>
                <div class="input-group mb-3">
                    <input type="password" name="password" class="form-control" placeholder="Mật khẩu" value="">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-lock"></span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-7">
                        <div class="icheck-primary">
                            <input type="checkbox" id="remember" name="remember_me">
                            <label for="remember">
                                Tự động đăng nhập
                            </label>
                        </div>
                    </div>
                    <!-- /.col -->
                    <div class="col-5">
                        <button type="submit" class="btn btn-primary btn-block">Đăng nhập</button>
                    </div>
                    <!-- /.col -->
                </div>
                {{ csrf_field() }}
            </form>
            <!-- /.social-auth-links -->

            <p class="mb-1">
                <a href="forgot-password.html">Bạn quên mật khẩu?</a>
            </p>
        </div>
        <!-- /.card-body -->
    </div>
    <!-- /.card -->
</div>
<!-- /.login-box -->
{!! StartPress::adminFooterScripts() !!}
</body>
</html>
