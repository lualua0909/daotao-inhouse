@extends('dashboard.app')
@section('title', 'Elearning')
@section('content')
    <form method="post">
        <div class="row">
            <div class="col-lg-5">
                <div class="card card-light">
                    <div class="card-body">
                        <div class="form-group">
                            <label for="elearning_object_title">Tiêu đề</label>
                            <input type="text" class="form-control" id="elearning_object_title" name="elearning_object_title"
                                   value="{{isset($elearning_object->meta->elearning_object_title) ? $elearning_object->meta->elearning_object_title : ''}}">
                        </div>
                        <div class="form-group">
                            <label for="elearning_content">Mô tả</label>
                            <textarea class="form-control" id="elearning_object_desc"
                                      name="elearning_object_desc">{{isset($elearning_object->meta->elearning_object_desc) ? $elearning_object->meta->elearning_object_desc : ''}}</textarea>
                        </div>
                        <div class="dd" id="elearnings">
                            <ul class="dd-list elearnings-list">
                                @if(isset($elearnings) && $elearnings)
                                    @foreach($elearnings as $elearning)
                                        <li class="dd-item" data-id="{{$elearning->ID}}">
                                            <span class="remove"><i class="fas fa-minus-circle"></i></span>
                                            <div class="dd-handle"></div>
                                            <div class="menu-item-content">
                                                <a class="menu-item-collapse-button collapsed" data-toggle="collapse"
                                                   href="#collapse-menu-item-{{$elearning->ID}}"
                                                   aria-expanded="true">{{$elearning->ID}}</a>
                                                <div id="collapse-menu-item-{{$elearning->ID}}"
                                                     class="collapse show" data-parent="#elearnings" style="">
                                                    <div class="content-wrap">
                                                        <div class="form-group">
                                                            <label for="elearning-name[{{$elearning->ID}}]">Tên</label>
                                                            <input type="text" class="form-control"
                                                                   id="elearning-name[{{$elearning->ID}}]"
                                                                   name="elearning-name[{{$elearning->ID}}]"
                                                                   value="{{$elearning->meta->elearning_name}}">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="elearning-url[{{$elearning->ID}}]">Liên kết</label>
                                                            <input type="text" class="form-control"
                                                                   id="elearning-url[{{$elearning->ID}}]"
                                                                   name="elearning-url[{{$elearning->ID}}]"
                                                                   value="{{$elearning->meta->elearning_url}}">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="elearning_img">Hình ảnh</label>
                                                            <div id="img-preview-{{$elearning->ID}}" class="img-preview">
                                                                @if(isset($elearning->meta->elearning_img) &&  $elearning->meta->elearning_img != '')
                                                                    <div class="gallery-item">
                                                                        <input type="hidden" class="form-control"
                                                                               id="elearning-img[{{$elearning->ID}}]"
                                                                               name="elearning-img[{{$elearning->ID}}]"
                                                                               value="{{$elearning->meta->elearning_img}}">
                                                                        <span class="remove"><i
                                                                                class="fas fa-minus-circle"></i></span>
                                                                        <div class="attachment-preview">
                                                                            <div class="thumbnail">
                                                                                <img alt=""
                                                                                     src="{{StartPress::getAttachmentBuilder()->get_attachment_url($elearning->meta->elearning_img)}}"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                @endif
                                                            </div>
                                                            <button data-toggle="modal" type="button"
                                                                    class="btn btn-block btn-info select-images"
                                                                    data-target="#media-modal"
                                                                    data-object="{{$elearning->ID}}">Chọn
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
                        <button type="button" class="btn btn-success float-right" id="add-elearning">Thêm dòng
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <input type="hidden" name="serialize" id="serialize" value="">
        @if(isset($elearning_object))
            <input type="hidden" class="form-control" id="elearning_object_id" name="elearning_object_id" value="{{$elearning_object->ID}}">
        @endif
        {{ csrf_field() }}
    </form>
    @include('upload.media-modal')
@endsection

@section('script')
    <script>
        let elearnings = $('#elearnings');
        let media_modal = $('.media-modal');
        let object;
        let serialize = $('#serialize');
        $(document).on("click", ".select-images", function () {
            object = $(this).attr('data-object');
        });
        elearnings.nestable({
            listNodeName: 'ul',
            group: 1,
            maxDepth: 1
        });
        serialize.val(JSON.stringify(elearnings.nestable('serialize')));
        elearnings.on('change', function () {
            serialize.val(JSON.stringify(elearnings.nestable('serialize')));
        });

        $(document).on("click", ".remove", function () {
            $(this).parent().remove();
        });

        $(document).on("click", ".dd-item .remove", function () {
            let id = $(this).parent().attr('data-id');
            let item = $(this).parent();
            $.ajax({
                url: "{{route('delete-elearning')}}",
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

        $('#media-select-button').on('click', function () {
            let img_preview = $('#img-preview-' + object);
            img_preview.html('');
            img_preview.append(
                '<div class="gallery-item">' +
                '<input type="hidden" class="form-control" id="elearning-img[' + object + ']" name="elearning-img[' + object + ']" value="' + media_modal.find('#attachment_ID').val() + '">' +
                '<span class="remove"><i class="fas fa-minus-circle"></i></span>' +
                '<div class="attachment-preview">' +
                '<div class="thumbnail">' +
                '<img alt="' + media_modal.find('#attachment_alt').val() + '" src="' + media_modal.find('#attachment-link').val() + '"/>' +
                '</div>' +
                '</div>' +
                '</div>'
            );
        });
        $('#add-elearning').on('click', function () {
            $.ajax({
                url: "{{route('add-elearning')}}",
                type: 'POST',
                data: {
                    "_token": "{{ csrf_token() }}"
                },
                dataType: 'JSON',
                success: function (elearning) {
                    // console.log(study_program);
                    elearnings.find('.elearnings-list').append(
                        '<li class="dd-item" data-id="' + elearning['ID'] + '">' +
                        '<span class="remove"><i class="fas fa-minus-circle"></i></span>' +
                        '<div class="dd-handle"></div>' +
                        '<div class="menu-item-content">' +
                        '<a class="menu-item-collapse-button collapsed" data-toggle="collapse" href="#collapse-menu-item-' + elearning['ID'] + '" aria-expanded="true">' + elearning['ID'] + '</a>' +
                        '<div id="collapse-menu-item-' + elearning['ID'] + '" class="collapse show" data-parent="#elearnings" style="">' +
                        '<div class="content-wrap">' +
                        '<div class="form-group">' +
                        '<label for="elearning-name[' + elearning['ID'] + ']">Tên</label>' +
                        '<input type="text" class="form-control" id="elearning-name[' + elearning['ID'] + ']" name="elearning-name[' + elearning['ID'] + ']" value="">' +
                        '</div>' +
                        '<div class="form-group">' +
                        '<label for="elearning-url[' + elearning['ID'] + ']">Liên kết</label>' +
                        '<input type="text" class="form-control" id="elearning-url[' + elearning['ID'] + ']" name="elearning-url[' + elearning['ID'] + ']" value="">' +
                        '</div>' +
                        '<div class="form-group">' +
                        '<label for="welcome_img">Hình ảnh</label>' +
                        '<div id="img-preview-' + elearning['ID'] + '" class="img-preview"></div>' +
                        '<button data-toggle="modal" type="button" class="btn btn-block btn-info select-images" data-target="#media-modal" data-object="' + elearning['ID'] + '">Chọn ảnh</button>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</li>'
                    );
                    serialize.val(JSON.stringify(elearnings.nestable('serialize')));
                },
            });
        });
    </script>
@endsection
