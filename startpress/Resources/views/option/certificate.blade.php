@extends('dashboard.app')
@section('title', 'Chứng chỉ')
@section('content')
    <form method="post">
        <div class="row">
            <div class="col-lg-5">
                <div class="card card-light">
                    <div class="card-body">
                        <div class="form-group">
                            <label for="certificate_title">Tiêu đề</label>
                            <input type="text" class="form-control" id="certificate_title" name="certificate_title"
                                   value="{{isset($certificate_object->meta->certificate_title) ? $certificate_object->meta->certificate_title : ''}}">
                        </div>
                        <div class="form-group">
                            <label for="certificate_url">Liên kết</label>
                            <input type="text" class="form-control" id="certificate_url" name="certificate_url"
                                   value="{{isset($certificate_object->meta->certificate_url) ? $certificate_object->meta->certificate_url : ''}}">
                        </div>
                        <div class="form-group">
                            <label for="certificate_content">Nội dung</label>
                            <textarea class="form-control" id="certificate_content"
                                      name="certificate_content">{{isset($certificate_object->meta->certificate_content) ? $certificate_object->meta->certificate_content : ''}}</textarea>
                        </div>
                        <div class="dd" id="certificate_slider">
                            <ul class="dd-list certificate_slider-list">
                                @if(isset($certificate_slider) && $certificate_slider)
                                    @foreach($certificate_slider as $slide)
                                        <li class="dd-item" data-id="{{$slide->ID}}">
                                            <span class="remove"><i class="fas fa-minus-circle"></i></span>
                                            <div class="dd-handle"></div>
                                            <div class="menu-item-content">
                                                <a class="menu-item-collapse-button collapsed" data-toggle="collapse"
                                                   href="#collapse-menu-item-{{$slide->ID}}"
                                                   aria-expanded="true">{{$slide->ID}}</a>
                                                <div id="collapse-menu-item-{{$slide->ID}}"
                                                     class="collapse show" data-parent="#certificate_slider" style="">
                                                    <div class="content-wrap">
                                                        <div class="form-group">
                                                            <label for="slide-desc[{{$slide->ID}}]">Mô tả</label>
                                                            <textarea type="text" class="form-control"
                                                                      id="slide-desc[{{$slide->ID}}]"
                                                                      name="slide-desc[{{$slide->ID}}]"
                                                                      rows="3">{{$slide->meta->slide_desc}}</textarea>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="welcome_img">Hình ảnh</label>
                                                            <div id="img-preview-{{$slide->ID}}" class="img-preview">
                                                                @if(isset($slide->meta->slide_img) &&  $slide->meta->slide_img != '')
                                                                    <div class="gallery-item">
                                                                        <input type="hidden" class="form-control"
                                                                               id="slide-img[{{$slide->ID}}]"
                                                                               name="slide-img[{{$slide->ID}}]"
                                                                               value="{{$slide->meta->slide_img}}">
                                                                        <span class="remove"><i
                                                                                class="fas fa-minus-circle"></i></span>
                                                                        <div class="attachment-preview">
                                                                            <div class="thumbnail">
                                                                                <img alt=""
                                                                                     src="{{StartPress::getAttachmentBuilder()->get_attachment_url($slide->meta->slide_img)}}"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                @endif
                                                            </div>
                                                            <button data-toggle="modal" type="button"
                                                                    class="btn btn-block btn-info select-images"
                                                                    data-target="#media-modal"
                                                                    data-object="{{$slide->ID}}">Chọn
                                                                ảnh
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    @endforeach
                                @endif
                            </ul>
                        </div>
                    </div>
                    <div class="card-footer">
                        <button type="submit" class="btn btn-info">Lưu cài đặt</button>
                        <button type="button" class="btn btn-success float-right" id="add-slide">Thêm dòng
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <input type="hidden" name="serialize" id="serialize" value="">
        @if(isset($certificate_object))
            <input type="hidden" class="form-control" id="certificate_id" name="certificate_id" value="{{$certificate_object->ID}}">
        @endif
        {{ csrf_field() }}
    </form>
    @include('upload.media-modal')
@endsection
@section('script')
    <script>
        $(function () {
            let certificate_slider = $('#certificate_slider');
            let object;
            let media_modal = $('.media-modal');
            let serialize = $('#serialize');
            let gallery;

            $(document).on("click", ".select-images", function () {
                gallery = $(this).attr('data-gallery');
            });
            $(document).on("click", ".gallery-item .remove", function () {
                $(this).parent().remove();
            });

            certificate_slider.nestable({
                listNodeName: 'ul',
                group: 1,
                maxDepth: 1
            });

            $(document).on("click", ".select-images", function () {
                object = $(this).attr('data-object');
            });

            serialize.val(JSON.stringify(certificate_slider.nestable('serialize')));

            certificate_slider.on('change', function () {
                serialize.val(JSON.stringify(certificate_slider.nestable('serialize')));
            });

            $('#media-select-button').on('click', function () {
                let img_preview = $('#img-preview-' + object);
                img_preview.html('');
                img_preview.append(
                    '<div class="gallery-item">' +
                    '<input type="hidden" class="form-control" id="slide-img[' + object + ']" name="slide-img[' + object + ']" value="' + media_modal.find('#attachment_ID').val() + '">' +
                    '<span class="remove"><i class="fas fa-minus-circle"></i></span>' +
                    '<div class="attachment-preview">' +
                    '<div class="thumbnail">' +
                    '<img alt="' + media_modal.find('#attachment_alt').val() + '" src="' + media_modal.find('#attachment-link').val() + '"/>' +
                    '</div>' +
                    '</div>' +
                    '</div>'
                );
            });

            $(document).on("click", ".remove", function () {
                $(this).parent().remove();
            });

            $(document).on("click", ".dd-item .remove", function () {
                let id = $(this).parent().attr('data-id');
                let item = $(this).parent();
                $.ajax({
                    url: "{{route('delete-slide')}}",
                    type: 'POST',
                    data: {
                        "_token": "{{ csrf_token() }}",
                        "id": id,
                    },
                    dataType: 'JSON',
                    success: function (response) {
                        if (response['success'] === true) {
                            item.remove();
                        }
                    },
                });
            });

            $('#add-slide').on('click', function () {
                $.ajax({
                    url: "{{route('add-slide')}}",
                    type: 'POST',
                    data: {
                        "_token": "{{ csrf_token() }}"
                    },
                    dataType: 'JSON',
                    success: function (slide) {
                        // console.log(study_program);
                        certificate_slider.find('.certificate_slider-list').append(
                            '<li class="dd-item" data-id="' + slide['ID'] + '">' +
                            '<span class="remove"><i class="fas fa-minus-circle"></i></span>' +
                            '<div class="dd-handle"></div>' +
                            '<div class="menu-item-content">' +
                            '<a class="menu-item-collapse-button collapsed" data-toggle="collapse" href="#collapse-menu-item-' + slide['ID'] + '" aria-expanded="true">' + slide['ID'] + '</a>' +
                            '<div id="collapse-menu-item-' + slide['ID'] + '" class="collapse show" data-parent="#slides" style="">' +
                            '<div class="content-wrap">' +
                            '<div class="form-group">' +
                            '<label for="slide-desc[' + slide['ID'] + ']">Mô tả</label>' +
                            '<textarea type="text" class="form-control" id="slide-desc[' + slide['ID'] + ']" name="slide-desc[' + slide['ID'] + ']" rows="3"></textarea>' +
                            '</div>' +
                            '<div class="form-group">' +
                            '<label for="welcome_img">Hình ảnh</label>' +
                            '<div id="img-preview-' + slide['ID'] + '" class="img-preview"></div>' +
                            '<button data-toggle="modal" type="button" class="btn btn-block btn-info select-images" data-target="#media-modal" data-object="' + slide['ID'] + '">Chọn ảnh</button>' +
                            '</div>' +
                            '</div>' +
                            '</div>' +
                            '</div>' +
                            '</li>'
                        );
                        serialize.val(JSON.stringify(certificate_slider.nestable('serialize')));
                    },
                });
            });

        });
    </script>
@endsection
