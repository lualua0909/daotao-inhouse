@extends('dashboard.app')
@section('title', 'Cài đặt tổng quan')
@section('content')
    <div class="row">
        <div class="col-5">
            <form id="newUser" class="form-horizontal" method="post" action="{{route('options-general')}}">
                <div class="form-group row">
                    <label for="site_name" class="col-sm-5 col-form-label">Tên Website</label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" id="site_name" name="site_name"
                               value="{{ isset($options['site_name']) ? $options['site_name'] : '' }}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="site_description" class="col-sm-5 col-form-label">Khẩu hiệu</label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" id="site_description" name="site_description"
                               value="{{ isset($options['site_description']) ? $options['site_description'] : '' }}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="site_url" class="col-sm-5 col-form-label">Địa chỉ trang web</label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" id="site_url" name="site_url"
                               value="{{ isset($options['site_url']) ? $options['site_url'] : '' }}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="posts_per_page" class="col-sm-5 col-form-label">Số bài viết hiển thị</label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" id="posts_per_page" name="posts_per_page"
                               value="{{ isset($options['posts_per_page']) ? $options['posts_per_page'] : '' }}">
                    </div>
                </div>
                {{ csrf_field() }}
                <button type="submit" class="btn btn-info">Lưu cài đặt</button>
            </form>
        </div>
    </div>
@endsection
