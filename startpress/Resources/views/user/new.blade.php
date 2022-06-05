@extends('dashboard.app')
@section('title', 'Thêm người dùng mới')
@section('content')
    <div class="row">
        <div class="col-5">
            <form id="newUser" class="form-horizontal" method="post" action="{{ route('user-new') }}">
                <div class="form-group row">
                    <label for="user_login" class="col-sm-5 col-form-label">Tên người dùng (bắt buộc)</label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" id="user_login" name="user_login">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="email" class="col-sm-5 col-form-label">Email (bắt buộc)</label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" id="email" name="email">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="first_name" class="col-sm-5 col-form-label">Tên</label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" id="first_name" name="first_name">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="last_name" class="col-sm-5 col-form-label">Họ</label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" id="last_name" name="last_name">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="user_pass" class="col-sm-5 col-form-label">Mật khẩu</label>
                    <div class="col-sm-7">
                        <input type="password" class="form-control" id="user_pass" name="user_pass">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="role" class="col-sm-5 col-form-label">Vài trò</label>
                    <div class="col-sm-7">
                        <select class="form-control" id="role" name="role">
                            @if($capabilities)
                                @foreach($capabilities as $slug => $name)
                                    <option value="{{$slug}}">{{$name}}</option>
                                @endforeach
                            @endif
                        </select>
                    </div>
                </div>
                {{ csrf_field() }}
                <button type="submit" class="btn btn-info">Thêm người dùng mới</button>
            </form>
        </div>
    </div>
@endsection
