@extends('dashboard.app')
@section('title', 'Đội ngũ')
@section('content')
    <form method="post">
        <div class="row">
            <div class="col-lg-5">
                <div class="card card-light">
                    <div class="card-body">
                        <div class="form-group">
                            <label for="member_object_title">Tiêu đề</label>
                            <input type="text" class="form-control" id="member_object_title" name="member_object_title"
                                   value="{{isset($member_object->meta->member_object_title) ? $member_object->meta->member_object_title : ''}}">
                        </div>
                        <div class="form-group">
                            <label for="member_content">Mô tả</label>
                            <textarea class="form-control" id="member_object_desc"
                                      name="member_object_desc">{{isset($member_object->meta->member_object_desc) ? $member_object->meta->member_object_desc : ''}}</textarea>
                        </div>
                        <div class="form-group">
                            <label for="member_object_url">Liên kết</label>
                            <input type="text" class="form-control" id="member_object_url" name="member_object_url"
                                   value="{{isset($member_object->meta->member_object_url) ? $member_object->meta->member_object_url : ''}}">
                        </div>
                        <div class="dd" id="members">
                            <ul class="dd-list members-list">
                                @if(isset($members) && $members)
                                    @foreach($members as $member)
                                        <li class="dd-item" data-id="{{$member->ID}}">
                                            <span class="remove"><i class="fas fa-minus-circle"></i></span>
                                            <div class="dd-handle"></div>
                                            <div class="menu-item-content">
                                                <a class="menu-item-collapse-button collapsed" data-toggle="collapse"
                                                   href="#collapse-menu-item-{{$member->ID}}"
                                                   aria-expanded="true">{{$member->ID}}</a>
                                                <div id="collapse-menu-item-{{$member->ID}}"
                                                     class="collapse show" data-parent="#members" style="">
                                                    <div class="content-wrap">
                                                        <div class="form-group">
                                                            <label for="member-name[{{$member->ID}}]">Tên</label>
                                                            <input type="text" class="form-control"
                                                                   id="member-name[{{$member->ID}}]"
                                                                   name="member-name[{{$member->ID}}]"
                                                                   value="{{$member->meta->member_name}}">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="member-desc[{{$member->ID}}]">Mô tả</label>
                                                            <textarea type="text" class="form-control"
                                                                      id="member-desc[{{$member->ID}}]"
                                                                      name="member-desc[{{$member->ID}}]"
                                                                      rows="3">{{$member->meta->member_desc}}</textarea>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="welcome_img">Hình ảnh</label>
                                                            <div id="img-preview-{{$member->ID}}" class="img-preview">
                                                                @if(isset($member->meta->member_img) &&  $member->meta->member_img != '')
                                                                    <div class="gallery-item">
                                                                        <input type="hidden" class="form-control"
                                                                               id="member-img[{{$member->ID}}]"
                                                                               name="member-img[{{$member->ID}}]"
                                                                               value="{{$member->meta->member_img}}">
                                                                        <span class="remove"><i
                                                                                class="fas fa-minus-circle"></i></span>
                                                                        <div class="attachment-preview">
                                                                            <div class="thumbnail">
                                                                                <img alt=""
                                                                                     src="{{StartPress::getAttachmentBuilder()->get_attachment_url($member->meta->member_img)}}"/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                @endif
                                                            </div>
                                                            <button data-toggle="modal" type="button"
                                                                    class="btn btn-block btn-info select-images"
                                                                    data-target="#media-modal"
                                                                    data-object="{{$member->ID}}">Chọn
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
                        <button type="button" class="btn btn-success float-right" id="add-member">Thêm dòng
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <input type="hidden" name="serialize" id="serialize" value="">
        @if(isset($member_object))
            <input type="hidden" class="form-control" id="member_object_id" name="member_object_id" value="{{$member_object->ID}}">
        @endif
        {{ csrf_field() }}
    </form>
    @include('upload.media-modal')
@endsection

@section('script')
    <script>
        let members = $('#members');
        let object;
        let media_modal = $('.media-modal');
        let serialize = $('#serialize');

        members.nestable({
            listNodeName: 'ul',
            group: 1,
            maxDepth: 1
        });

        $(document).on("click", ".select-images", function () {
            object = $(this).attr('data-object');
        });

        serialize.val(JSON.stringify(members.nestable('serialize')));

        members.on('change', function () {
            serialize.val(JSON.stringify(members.nestable('serialize')));
        });

        $('#media-select-button').on('click', function () {
            let img_preview = $('#img-preview-' + object);
            img_preview.html('');
            img_preview.append(
                '<div class="gallery-item">' +
                '<input type="hidden" class="form-control" id="member-img[' + object + ']" name="member-img[' + object + ']" value="' + media_modal.find('#attachment_ID').val() + '">' +
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
                url: "{{route('delete-member')}}",
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

        $('#add-member').on('click', function () {
            $.ajax({
                url: "{{route('add-member')}}",
                type: 'POST',
                data: {
                    "_token": "{{ csrf_token() }}"
                },
                dataType: 'JSON',
                success: function (member) {
                    // console.log(study_program);
                    members.find('.members-list').append(
                        '<li class="dd-item" data-id="' + member['ID'] + '">' +
                        '<span class="remove"><i class="fas fa-minus-circle"></i></span>' +
                        '<div class="dd-handle"></div>' +
                        '<div class="menu-item-content">' +
                        '<a class="menu-item-collapse-button collapsed" data-toggle="collapse" href="#collapse-menu-item-' + member['ID'] + '" aria-expanded="true">' + member['ID'] + '</a>' +
                        '<div id="collapse-menu-item-' + member['ID'] + '" class="collapse show" data-parent="#members" style="">' +
                        '<div class="content-wrap">' +
                        '<div class="form-group">' +
                        '<label for="member-name[' + member['ID'] + ']">Tên</label>' +
                        '<input type="text" class="form-control" id="member-name[' + member['ID'] + ']" name="member-name[' + member['ID'] + ']" value="">' +
                        '</div>' +
                        '<div class="form-group">' +
                        '<label for="member-desc[' + member['ID'] + ']">Mô tả</label>' +
                        '<textarea type="text" class="form-control" id="member-desc[' + member['ID'] + ']" name="member-desc[' + member['ID'] + ']" rows="3"></textarea>' +
                        '</div>' +
                        '<div class="form-group">' +
                        '<label for="welcome_img">Hình ảnh</label>' +
                        '<div id="img-preview-' + member['ID'] + '" class="img-preview"></div>' +
                        '<button data-toggle="modal" type="button" class="btn btn-block btn-info select-images" data-target="#media-modal" data-object="' + member['ID'] + '">Chọn ảnh</button>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</li>'
                    );
                    serialize.val(JSON.stringify(members.nestable('serialize')));
                },
            });
        });

    </script>
@endsection
