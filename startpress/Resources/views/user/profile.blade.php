@extends('dashboard.app')
@section('title', 'Hồ sơ')
@section('content')
    @if($user)
        <div class="row">
            <div class="col-5">
                <form id="editUser" class="form-horizontal" method="post" action="">
                    <h4 class="mb-2 mt-4">Tên</h4>
                    <div class="form-group row">
                        <label for="user_login" class="col-sm-5 col-form-label">Tên người dùng (bắt
                            buộc)</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="user_login"
                                   value="{{$user->user_login}}"
                                   disabled>
                            <span class="info">Tài khoản không thể thay đổi.</span>
                        </div>
                    </div>
                    @if($currentUser->ID != $user->ID)
                        <div class="form-group row">
                            <label for="role" class="col-sm-5 col-form-label">Vai trò</label>
                            <div class="col-sm-7">
                                <select class="form-control" id="role" name="role">
                                    @if($capabilities)
                                        @foreach($capabilities as $slug => $name)
                                            <option @if(key(unserialize($user->meta->capabilities)) === $slug)
                                                    {{ 'selected' }}
                                                    @endif value="{{$slug}}">
                                                {{$name}}
                                            </option>
                                        @endforeach
                                    @endif
                                </select>
                            </div>
                        </div>
                    @endif
                    <div class="form-group row">
                        <label for="first_name" class="col-sm-5 col-form-label">Tên</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="first_name" name="first_name"
                                   value="{{$user->meta->first_name}}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="last_name" class="col-sm-5 col-form-label">Họ</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="last_name" name="last_name"
                                   value="{{$user->meta->last_name}}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="display_name" class="col-sm-5 col-form-label">Tên hiển thị (bắt
                            buộc)</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="display_name" name="display_name"
                                   value="{{$user->display_name}}">
                        </div>
                    </div>
                    <h4 class="mb-2 mt-4">Thông tin liên hệ</h4>
                    <div class="form-group row">
                        <label for="email" class="col-sm-5 col-form-label">Email (bắt buộc)</label>
                        <div class="col-sm-7">
                            <input type="email" class="form-control" id="email" name="email"
                                   value="{{$user->user_email}}">
                        </div>
                    </div>
                    <h4 class="mb-2 mt-4">Quản lý tài khoản</h4>
                    <div class="form-group row">
                        <label for="user_pass" class="col-sm-5 col-form-label">Mật khẩu mới</label>
                        <div class="col-sm-7">
                            <input type="password" class="form-control" id="user_pass" name="user_pass">
                        </div>
                    </div>
                    {{ csrf_field() }}
                    <button type="submit" class="btn btn-info">Cập nhật hồ sơ</button>
                </form>
            </div>
        </div>
    @endif
@endsection
