@extends('dashboard.app')
@section('title', 'Vì sao chọn')
@section('content')
    <form method="post">
        <div class="row">
            <div class="col-lg-5">
                <div class="card card-light">
                    <div class="card-body">
                        <div class="form-group">
                            <label for="why_object_title">Tiêu đề</label>
                            <input type="text" class="form-control" id="why_object_title" name="why_object_title"
                                   value="{{isset($why_object->meta->why_object_title) ? $why_object->meta->why_object_title : ''}}">
                        </div>
                        <div class="form-group">
                            <label for="why_content">Mô tả</label>
                            <textarea class="form-control" id="why_object_desc"
                                      name="why_object_desc">{{isset($why_object->meta->why_object_desc) ? $why_object->meta->why_object_desc : ''}}</textarea>
                        </div>
                        <div class="form-group">
                            <label for="why_object_img">Hình ảnh</label>
                            <input type="hidden" class="form-control" id="why_object_img" name="why_object_img"
                                   value="{{isset($why_object->meta->why_object_img) ? $why_object->meta->why_object_img : ''}}">
                            <div id="welcome_img_preview">
                                @if(isset($why_object->meta->why_object_img) &&  $why_object->meta->why_object_img != '')
                                    <div class="gallery-item">
                                        <span class="remove"><i class="fas fa-minus-circle"></i></span>
                                        <div class="attachment-preview">
                                            <div class="thumbnail">
                                                <img alt=""
                                                     src="{{StartPress::getAttachmentBuilder()->get_attachment_url($why_object->meta->why_object_img)}}"/>
                                            </div>
                                        </div>
                                    </div>
                                @endif
                            </div>
                            <button data-toggle="modal" type="button"
                                    class="btn btn-block btn-info select-images" data-target="#media-modal">Chọn ảnh
                            </button>
                        </div>
                        <div class="dd" id="whys">
                            <ul class="dd-list whys-list">
                                @if(isset($whys) && $whys)
                                    @foreach($whys as $why)
                                        <li class="dd-item" data-id="{{$why->ID}}">
                                            <span class="remove"><i class="fas fa-minus-circle"></i></span>
                                            <div class="dd-handle"></div>
                                            <div class="menu-item-content">
                                                <a class="menu-item-collapse-button collapsed" data-toggle="collapse"
                                                   href="#collapse-menu-item-{{$why->ID}}"
                                                   aria-expanded="true">{{$why->ID}}</a>
                                                <div id="collapse-menu-item-{{$why->ID}}"
                                                     class="collapse show" data-parent="#whys" style="">
                                                    <div class="content-wrap">
                                                        <div class="form-group">
                                                            <label for="why-number[{{$why->ID}}]">Số liệu</label>
                                                            <input type="text" class="form-control"
                                                                   id="why-number[{{$why->ID}}]"
                                                                   name="why-number[{{$why->ID}}]"
                                                                   value="{{$why->meta->why_number}}">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="why-name[{{$why->ID}}]">Tiêu đề</label>
                                                            <input type="text" class="form-control"
                                                                   id="why-name[{{$why->ID}}]"
                                                                   name="why-name[{{$why->ID}}]"
                                                                   value="{{$why->meta->why_name}}">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="why-desc[{{$why->ID}}]">Mô tả</label>
                                                            <input type="text" class="form-control"
                                                                   id="why-desc[{{$why->ID}}]"
                                                                   name="why-desc[{{$why->ID}}]"
                                                                   value="{{$why->meta->why_desc}}">
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
                        <button type="button" class="btn btn-success float-right" id="add-why">Thêm dòng
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <input type="hidden" name="serialize" id="serialize" value="">
        @if(isset($why_object))
            <input type="hidden" class="form-control" id="why_object_id" name="why_object_id" value="{{$why_object->ID}}">
        @endif
        {{ csrf_field() }}
    </form>
    @include('upload.media-modal')
@endsection

@section('script')
    <script>
        let whys = $('#whys');
        let media_modal = $('.media-modal');
        let object;
        let serialize = $('#serialize');
        $(document).on("click", ".select-images", function () {
            object = $(this).attr('data-object');
        });
        whys.nestable({
            listNodeName: 'ul',
            group: 1,
            maxDepth: 1
        });
        serialize.val(JSON.stringify(whys.nestable('serialize')));
        whys.on('change', function () {
            serialize.val(JSON.stringify(whys.nestable('serialize')));
        });

        $(document).on("click", ".remove", function () {
            $(this).parent().remove();
        });

        $('#media-select-button').on('click', function () {
            $('#why_object_img').val(media_modal.find('#attachment_ID').val());
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

        $(document).on("click", ".dd-item .remove", function () {
            let id = $(this).parent().attr('data-id');
            let item = $(this).parent();
            $.ajax({
                url: "{{route('delete-why')}}",
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

        $('#add-why').on('click', function () {
            $.ajax({
                url: "{{route('add-why')}}",
                type: 'POST',
                data: {
                    "_token": "{{ csrf_token() }}"
                },
                dataType: 'JSON',
                success: function (why) {
                    // console.log(study_program);
                    whys.find('.whys-list').append(
                        '<li class="dd-item" data-id="' + why['ID'] + '">' +
                        '<span class="remove"><i class="fas fa-minus-circle"></i></span>' +
                        '<div class="dd-handle"></div>' +
                        '<div class="menu-item-content">' +
                        '<a class="menu-item-collapse-button collapsed" data-toggle="collapse" href="#collapse-menu-item-' + why['ID'] + '" aria-expanded="true">' + why['ID'] + '</a>' +
                        '<div id="collapse-menu-item-' + why['ID'] + '" class="collapse show" data-parent="#whys" style="">' +
                        '<div class="content-wrap">' +
                        '<div class="form-group">' +
                        '<label for="why-number[' + why['ID'] + ']">Số liệu</label>' +
                        '<input type="text" class="form-control" id="why-number[' + why['ID'] + ']" name="why-number[' + why['ID'] + ']" value="">' +
                        '</div>' +
                        '<div class="form-group">' +
                        '<label for="why-name[' + why['ID'] + ']">Tên</label>' +
                        '<input type="text" class="form-control" id="why-name[' + why['ID'] + ']" name="why-name[' + why['ID'] + ']" value="">' +
                        '</div>' +
                        '<div class="form-group">' +
                        '<label for="why-desc[' + why['ID'] + ']">Mô tả</label>' +
                        '<input type="text" class="form-control" id="why-desc[' + why['ID'] + ']" name="why-desc[' + why['ID'] + ']" value="">' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</li>'
                    );
                    serialize.val(JSON.stringify(whys.nestable('serialize')));
                },
            });
        });
    </script>
@endsection
