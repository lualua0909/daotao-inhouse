@extends('dashboard.app')
@section('title', 'Thành viên')
@section('content')
    <div class="row">
        <div class="col-12">
            <div class="card">
                <!-- /.card-header -->
                <div class="card-body table-responsive p-0">
                    <table class="table table-hover text-nowrap table-middle">
                        <thead>
                        <tr>
                            <th>
                                Tên người dùng
                            </th>
                            <th>Tên</th>
                            <th>Email</th>
                            <th>Vai trò</th>
                        </tr>
                        </thead>
                        <tbody>
                        @if($users)
                            @foreach($users as $user)
                                <tr>
                                    <td>
                                        <img src="{{ asset('startpress/core/img/user1-128x128.jpg') }}"
                                             alt="User Avatar" class="img-size-50 mr-3 img-circle float-left">

                                        <strong>{{$user->user_login}}</strong>
                                        <br>
                                        <ul class="row-actions">
                                            <li class="edit">
                                                <a href="@if($currentUser->ID === $user->ID) {{route('profile')}} @else {{route('edit-user', $user->ID)}} @endif">Chỉnh sửa</a>
                                            </li>
                                            <li class="delete">
                                                <a href="">Xoá</a>
                                            </li>
                                            <li class="view">
                                                <a href="">Xem</a>
                                            </li>
                                        </ul>
                                    </td>
                                    <td>{{$user->display_name}}</td>
                                    <td>{{$user->user_email}}</td>
                                    <td>{!! StartPress::getUserRole()->roleName(key(unserialize($user->meta->capabilities))) !!}</td>
                                </tr>
                            @endforeach
                        @endif
                        </tbody>
                    </table>
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->
        </div>
    </div>
@endsection
