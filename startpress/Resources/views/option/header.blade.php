@extends('dashboard.app')
@section('title', 'Header')
@section('content')
    <form method="post">
        <div class="row">
            <div class="col-lg-5">
                <div class="card card-light">
                    <div class="card-body">
                        <div class="form-group">
                            <label for="header_hotline">Hotline</label>
                            <input type="text" class="form-control" id="header_hotline" name="header_hotline"
                                   value="{{isset($header_object->meta->header_hotline) ? $header_object->meta->header_hotline : ''}}">
                        </div>
                        <div class="form-group">
                            <label for="header_facebook">Facebook</label>
                            <input type="text" class="form-control" id="header_facebook" name="header_facebook"
                                   value="{{isset($header_object->meta->header_facebook) ? $header_object->meta->header_facebook : ''}}">
                        </div>
                        <div class="form-group">
                            <label for="header_zalo">Zalo</label>
                            <input type="text" class="form-control" id="header_zalo" name="header_zalo"
                                   value="{{isset($header_object->meta->header_zalo) ? $header_object->meta->header_zalo : ''}}">
                        </div>
                        <div class="form-group">
                            <label for="header_youtube">Youtube</label>
                            <input type="text" class="form-control" id="header_youtube" name="header_youtube"
                                   value="{{isset($header_object->meta->header_youtube) ? $header_object->meta->header_youtube : ''}}">
                        </div>
                    </div>
                    <div class="card-footer">
                        <button type="submit" class="btn btn-info float-right">Lưu cài đặt</button>
                    </div>
                </div>
            </div>
        </div>
        @if(isset($header_object))
            <input type="hidden" class="form-control" id="header_id" name="header_id" value="{{$header_object->ID}}">
        @endif
        {{ csrf_field() }}
    </form>
@endsection
