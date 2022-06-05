@extends('dashboard.app')
@section('title', 'Footer')
@section('content')
    <form method="post">
        <div class="row">
            <div class="col-lg-5">
                <div class="card card-light">
                    <div class="card-body">
                        <div class="form-group">
                            <label for="footer_desc">Mô tả</label>
                            <textarea class="form-control" id="footer_desc"
                                      name="footer_desc">{{isset($footer_object->meta->footer_desc) ? $footer_object->meta->footer_desc : ''}}</textarea>
                        </div>
                        <div class="form-group">
                            <label for="footer_facebook">Facebook</label>
                            <input type="text" class="form-control" id="footer_facebook" name="footer_facebook"
                                   value="{{isset($footer_object->meta->footer_facebook) ? $footer_object->meta->footer_facebook : ''}}">
                        </div>
                        <div class="form-group">
                            <label for="footer_zalo">Zalo</label>
                            <input type="text" class="form-control" id="footer_zalo" name="footer_zalo"
                                   value="{{isset($footer_object->meta->footer_zalo) ? $footer_object->meta->footer_zalo : ''}}">
                        </div>
                        <div class="form-group">
                            <label for="footer_youtube">Youtube</label>
                            <input type="text" class="form-control" id="footer_youtube" name="footer_youtube"
                                   value="{{isset($footer_object->meta->footer_youtube) ? $footer_object->meta->footer_youtube : ''}}">
                        </div>
                        <div class="form-group">
                            <label for="footer_address">Địa chỉ</label>
                            <input type="text" class="form-control" id="footer_address" name="footer_address"
                                   value="{{isset($footer_object->meta->footer_address) ? $footer_object->meta->footer_address : ''}}">
                        </div>
                        <div class="form-group">
                            <label for="footer_email">Email</label>
                            <input type="text" class="form-control" id="footer_email" name="footer_email"
                                   value="{{isset($footer_object->meta->footer_email) ? $footer_object->meta->footer_email : ''}}">
                        </div>
                        <div class="form-group">
                            <label for="footer_phone">Số điện thoại</label>
                            <input type="text" class="form-control" id="footer_phone" name="footer_phone"
                                   value="{{isset($footer_object->meta->footer_phone) ? $footer_object->meta->footer_phone : ''}}">
                        </div>
                    </div>
                    <div class="card-footer">
                        <button type="submit" class="btn btn-info float-right">Lưu cài đặt</button>
                    </div>
                </div>
            </div>
        </div>
        @if(isset($footer_object))
            <input type="hidden" class="form-control" id="footer_id" name="footer_id" value="{{$footer_object->ID}}">
        @endif
        {{ csrf_field() }}
    </form>
@endsection
