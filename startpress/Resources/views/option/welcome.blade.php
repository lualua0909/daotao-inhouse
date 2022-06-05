@extends('dashboard.app')
@section('title', 'Welcome')
@section('content')
    <form method="post">
        <div class="row">
            <div class="col-lg-5">
                <div class="card card-light">
                    <div class="card-body">
                        <div class="form-group">
                            <label for="welcome_title">Tiêu đề</label>
                            <input type="text" class="form-control" id="welcome_title" name="welcome_title"
                                   value="{{isset($welcome_object->meta->welcome_title) ? $welcome_object->meta->welcome_title : ''}}">
                        </div>
                        <div class="form-group">
                            <label for="welcome_desc">Mô tả</label>
                            <textarea class="form-control" id="welcome_desc" name="welcome_desc"
                                      rows="5">{{isset($welcome_object->meta->welcome_desc) ? $welcome_object->meta->welcome_desc : ''}}</textarea>
                        </div>
                        <div class="form-group">
                            <label for="welcome_url">Liên kết</label>
                            <input type="text" class="form-control" id="welcome_url" name="welcome_url"
                                   value="{{isset($welcome_object->meta->welcome_url) ? $welcome_object->meta->welcome_url : ''}}">
                        </div>
                        <div class="form-group">
                            <label for="welcome_img">Hình ảnh</label>
                            <input type="hidden" class="form-control" id="welcome_img" name="welcome_img"
                                   value="{{isset($welcome_object->meta->welcome_img) ? $welcome_object->meta->welcome_img : ''}}">
                            <div id="welcome_img_preview">
                                @if(isset($welcome_object->meta->welcome_img) &&  $welcome_object->meta->welcome_img != '')
                                    <div class="gallery-item">
                                        <span class="remove"><i class="fas fa-minus-circle"></i></span>
                                        <div class="attachment-preview">
                                            <div class="thumbnail">
                                                <img alt=""
                                                     src="{{StartPress::getAttachmentBuilder()->get_attachment_url($welcome_object->meta->welcome_img)}}"/>
                                            </div>
                                        </div>
                                    </div>
                                @endif
                            </div>
                            <button data-toggle="modal" type="button"
                                    class="btn btn-block btn-info select-images" data-target="#media-modal">Chọn ảnh
                            </button>
                        </div>
                    </div>
                    <div class="card-footer">
                        <button type="submit" class="btn btn-info float-right">Lưu cài đặt</button>
                    </div>
                </div>
            </div>
        </div>
        @if($welcome_object)
            <input type="hidden" class="form-control" id="welcome_id" name="welcome_id" value="{{$welcome_object->ID}}">
        @endif
        {{ csrf_field() }}
    </form>
    @include('upload.media-modal')
@endsection

@section('script')
    <script>
        let media_modal = $('.media-modal');
        $('#media-select-button').on('click', function () {
            $('#welcome_img').val(media_modal.find('#attachment_ID').val());
            $('#welcome_img_preview').html('').append(
                '<div class="gallery-item">' +
                '<span class="remove"><i class="fas fa-minus-circle"></i></span>' +
                '<div class="attachment-preview">' +
                '<div class="thumbnail">' +
                '<img alt="' + media_modal.find('#attachment_alt').val() + '" src="' + media_modal.find('#attachment-link').val() + '"/>' +
                '</div>' +
                '</div>' +
                '</div>'
            );
        });
        $(document).on("click", ".gallery-item .remove", function () {
            $('#welcome_img').val('');
            $(this).parent().remove();
        });
    </script>
@endsection
