@extends('dashboard.app')
@section('title', 'Đối tác')
@section('content')
    <form method="post">
        <div class="row">
            <div class="col-lg-5">
                <div class="card card-light">
                    <div class="card-body">
                        <div class="dd" id="partners">
                            <ul class="dd-list partners-list">
                                @if(isset($partners) && $partners)
                                    @foreach($partners as $partner)
                                        <li class="dd-item" data-id="{{$partner->ID}}">
                                            <span class="remove"><i class="fas fa-minus-circle"></i></span>
                                            <div class="dd-handle"></div>
                                            <div class="menu-item-content">
                                                <a class="menu-item-collapse-button collapsed" data-toggle="collapse"
                                                   href="#collapse-menu-item-{{$partner->ID}}"
                                                   aria-expanded="true">{{$partner->ID}}</a>
                                                <div id="collapse-menu-item-{{$partner->ID}}"
                                                     class="collapse show" data-parent="#partners" style="">
                                                    <div class="content-wrap">
                                                        <div class="form-group">
                                                            <label for="partner-name[{{$partner->ID}}]">Tên</label>
                                                            <input type="text" class="form-control"
                                                                   id="partner-name[{{$partner->ID}}]"
                                                                   name="partner-name[{{$partner->ID}}]"
                                                                   value="{{$partner->meta->partner_name}}">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="partner-url[{{$partner->ID}}]">Liên kết</label>
                                                            <input type="text" class="form-control"
                                                                   id="partner-url[{{$partner->ID}}]"
                                                                   name="partner-url[{{$partner->ID}}]"
                                                                   value="{{$partner->meta->partner_url}}">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="partner_img">Hình ảnh</label>
                                                            <div id="img-preview-{{$partner->ID}}" class="img-preview">
                                                                @if(isset($partner->meta->partner_img) &&  $partner->meta->partner_img != '')
                                                                    <div class="gallery-item">
                                                                        <input type="hidden" class="form-control"
                                                                               id="partner-img[{{$partner->ID}}]"
                                                                               name="partner-img[{{$partner->ID}}]"
                                                                               value="{{$partner->meta->partner_img}}">
                                                                        <span class="remove"><i
                                                                                class="fas fa-minus-circle"></i></span>
                                                                        <div class="attachment-preview">
                                                                            <div class="thumbnail">
                                                                                <img alt=""
                                                                                     src="{{StartPress::getAttachmentBuilder()->get_attachment_url($partner->meta->partner_img)}}"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                @endif
                                                            </div>
                                                            <button data-toggle="modal" type="button"
                                                                    class="btn btn-block btn-info select-images"
                                                                    data-target="#media-modal"
                                                                    data-object="{{$partner->ID}}">Chọn
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
                        <button type="button" class="btn btn-success float-right" id="add-partner">Thêm dòng
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <input type="hidden" name="serialize" id="serialize" value="">
        {{ csrf_field() }}
    </form>
    @include('upload.media-modal')
@endsection

@section('script')
    <script>
        let partners = $('#partners');
        let media_modal = $('.media-modal');
        let object;
        let serialize = $('#serialize');
        $(document).on("click", ".select-images", function () {
            object = $(this).attr('data-object');
        });
        partners.nestable({
            listNodeName: 'ul',
            group: 1,
            maxDepth: 1
        });
        serialize.val(JSON.stringify(partners.nestable('serialize')));
        serialize.on('change', function () {
            serialize.val(JSON.stringify(serialize.nestable('serialize')));
        });

        $(document).on("click", ".remove", function () {
            $(this).parent().remove();
        });

        $(document).on("click", ".dd-item .remove", function () {
            let id = $(this).parent().attr('data-id');
            let item = $(this).parent();
            $.ajax({
                url: "{{route('delete-partner')}}",
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
                '<input type="hidden" class="form-control" id="partner-img[' + object + ']" name="partner-img[' + object + ']" value="' + media_modal.find('#attachment_ID').val() + '">' +
                '<span class="remove"><i class="fas fa-minus-circle"></i></span>' +
                '<div class="attachment-preview">' +
                '<div class="thumbnail">' +
                '<img alt="' + media_modal.find('#attachment_alt').val() + '" src="' + media_modal.find('#attachment-link').val() + '"/>' +
                '</div>' +
                '</div>' +
                '</div>'
            );
        });
        $('#add-partner').on('click', function () {
            $.ajax({
                url: "{{route('add-partner')}}",
                type: 'POST',
                data: {
                    "_token": "{{ csrf_token() }}"
                },
                dataType: 'JSON',
                success: function (partner) {
                    // console.log(study_program);
                    partners.find('.partners-list').append(
                        '<li class="dd-item" data-id="' + partner['ID'] + '">' +
                        '<span class="remove"><i class="fas fa-minus-circle"></i></span>' +
                        '<div class="dd-handle"></div>' +
                        '<div class="menu-item-content">' +
                        '<a class="menu-item-collapse-button collapsed" data-toggle="collapse" href="#collapse-menu-item-' + partner['ID'] + '" aria-expanded="true">' + partner['ID'] + '</a>' +
                        '<div id="collapse-menu-item-' + partner['ID'] + '" class="collapse show" data-parent="#partners" style="">' +
                        '<div class="content-wrap">' +
                        '<div class="form-group">' +
                        '<label for="partner-name[' + partner['ID'] + ']">Tên</label>' +
                        '<input type="text" class="form-control" id="partner-name[' + partner['ID'] + ']" name="partner-name[' + partner['ID'] + ']" value="">' +
                        '</div>' +
                        '<div class="form-group">' +
                        '<label for="partner-url[' + partner['ID'] + ']">Liên kết</label>' +
                        '<input type="text" class="form-control" id="partner-url[' + partner['ID'] + ']" name="partner-url[' + partner['ID'] + ']" value="">' +
                        '</div>' +
                        '<div class="form-group">' +
                        '<label for="welcome_img">Hình ảnh</label>' +
                        '<div id="img-preview-' + partner['ID'] + '" class="img-preview"></div>' +
                        '<button data-toggle="modal" type="button" class="btn btn-block btn-info select-images" data-target="#media-modal" data-object="' + partner['ID'] + '">Chọn ảnh</button>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</li>'
                    );
                    serialize.val(JSON.stringify(partners.nestable('serialize')));
                },
            });
        });
    </script>
@endsection
