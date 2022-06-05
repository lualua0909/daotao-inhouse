@extends('dashboard.app')
@section('title', 'Chương trình đào tạo')
@section('content')
    <form method="post">
        <div class="row">
            <div class="col-lg-5">
                <div class="card card-light">
                    <div class="card-body">
                        <div class="dd" id="study-programs">
                            <ul class="dd-list study-programs-list">
                                @if(isset($study_programs) && $study_programs)
                                    @foreach($study_programs as $study_program)
                                        <li class="dd-item" data-id="{{$study_program->ID}}">
                                            <span class="remove"><i class="fas fa-minus-circle"></i></span>
                                            <div class="dd-handle"></div>
                                            <div class="menu-item-content">
                                                <a class="menu-item-collapse-button collapsed" data-toggle="collapse"
                                                   href="#collapse-menu-item-{{$study_program->ID}}"
                                                   aria-expanded="true">{{$study_program->ID}}</a>
                                                <div id="collapse-menu-item-{{$study_program->ID}}"
                                                     class="collapse show" data-parent="#study-programs" style="">
                                                    <div class="content-wrap">
                                                        <div class="form-group">
                                                            <label for="study-program-title">Tên chương trình</label>
                                                            <input type="text" class="form-control"
                                                                   id="study-program-title-{{$study_program->ID}}"
                                                                   name="study-program-title[{{$study_program->ID}}]"
                                                                   value="{{$study_program->meta->study_program_title}}">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="study-program-content">Nội dung</label>
                                                            <textarea
                                                                id="study-program-content-{{$study_program->ID}}"
                                                                class="study-program-content"
                                                                name="study-program-content[{{$study_program->ID}}]">{!! $study_program->meta->study_program_content !!}</textarea>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="study-program-url">Liên kết</label>
                                                            <input type="text" class="form-control"
                                                                   id="study-program-url-{{$study_program->ID}}"
                                                                   name="study-program-url[{{$study_program->ID}}]"
                                                                   value="{{$study_program->meta->study_program_url}}">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="study-program-gallery">Hình ảnh</label>
                                                            <div id="gallery-content-{{$study_program->ID}}"
                                                                 class="gallery-content">
                                                                @if($study_program->meta->study_program_gallery && unserialize($study_program->meta->study_program_gallery))
                                                                    @foreach(unserialize($study_program->meta->study_program_gallery) as $img_ID)
                                                                        <div class="gallery-item">
                                                                            <span class="remove"><i
                                                                                    class="fas fa-minus-circle"></i></span>
                                                                            <input type="hidden" class="form-control"
                                                                                   id="study-program-gallery"
                                                                                   name="study-program-gallery[{{$study_program->ID}}][{{$img_ID}}]"
                                                                                   value="{{$img_ID}}">
                                                                            <div class="attachment-preview">
                                                                                <div class="thumbnail">
                                                                                    <img alt=""
                                                                                         src="{{StartPress::getAttachmentBuilder()->get_attachment_url($img_ID)}}"/>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    @endforeach
                                                                @endif
                                                            </div>
                                                            <button data-toggle="modal" data-target="#media-modal"
                                                                    type="button"
                                                                    class="btn btn-block btn-info select-images"
                                                                    data-gallery="{{$study_program->ID}}">Chọn ảnh
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
                        <button type="button" class="btn btn-success float-right" id="add-study-program">Thêm dòng
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
        tinymce.init({
            selector: 'textarea.study-program-content',
            plugins: 'lists table',
            toolbar: 'lists table',
            toolbar_mode: 'floating',
            tinycomments_mode: 'embedded',
            tinycomments_author: 'Author name',
            height: 300,
        });

        $(function () {
            let study_programs = $('#study-programs');
            let serialize = $('#serialize');
            let media_modal = $('.media-modal');
            var gallery;

            study_programs.nestable({
                listNodeName: 'ul',
                group: 1,
                maxDepth: 1
            });

            $(document).on("click", ".select-images", function () {
                gallery = $(this).attr('data-gallery');
            });

            $(document).on("click", ".gallery-item .remove", function () {
                $(this).parent().remove();
            });

            $(document).on("click", ".dd-item .remove", function () {
                let id = $(this).parent().attr('data-id');
                let item = $(this).parent();
                $.ajax({
                    url: "{{route('delete-study-program')}}",
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
                let gallery_content = $('#gallery-content-' + gallery);
                gallery_content.append(
                    '<div class="gallery-item">' +
                    '<span class="remove"><i class="fas fa-minus-circle"></i></span>' +
                    '<input type="hidden" class="form-control" id="study-program-gallery" name="study-program-gallery[' + gallery + '][' + media_modal.find('#attachment_ID').val() + ']" value="' + media_modal.find('#attachment_ID').val() + '">' +
                    '<div class="attachment-preview">' +
                    '<div class="thumbnail">' +
                    '<img alt="' + media_modal.find('#attachment_alt').val() + '" src="' + media_modal.find('#attachment-link').val() + '"/>' +
                    '</div>' +
                    '</div>' +
                    '</div>'
                );
            });

            serialize.val(JSON.stringify(study_programs.nestable('serialize')));

            study_programs.on('change', function () {
                serialize.val(JSON.stringify(study_programs.nestable('serialize')));
            });

            $('#add-study-program').on('click', function () {
                $.ajax({
                    url: "{{route('add-study-program')}}",
                    type: 'POST',
                    data: {
                        "_token": "{{ csrf_token() }}"
                    },
                    dataType: 'JSON',
                    success: function (study_program) {
                        // console.log(study_program);
                        study_programs.find('.study-programs-list').append(
                            '<li class="dd-item" data-id="' + study_program['ID'] + '">' +
                            '<span class="remove"><i class="fas fa-minus-circle"></i></span>' +
                            '<div class="dd-handle"></div>' +
                            '<div class="menu-item-content">' +
                            '<a class="menu-item-collapse-button collapsed" data-toggle="collapse" href="#collapse-menu-item-' + study_program['ID'] + '" aria-expanded="true">' + study_program['ID'] + '</a>' +
                            '<div id="collapse-menu-item-' + study_program['ID'] + '" class="collapse show" data-parent="#study-programs" style="">' +
                            '<div class="content-wrap">' +
                            '<div class="form-group">' +
                            '<label for="study-program-title">Tên chương trình</label>' +
                            '<input type="text" class="form-control" id="study-program-title-' + study_program['ID'] + '" name="study-program-title[' + study_program['ID'] + ']" value="">' +
                            '</div>' +
                            '<div class="form-group">' +
                            '<label for="study-program-content">Nội dung</label>' +
                            '<textarea id="study-program-content-' + study_program['ID'] + '" class="study-program-content" name="study-program-content[' + study_program['ID'] + ']"></textarea>' +
                            '</div>' +
                            '<div class="form-group">' +
                            '<label for="study-program-url">Liên kết</label>' +
                            '<input type="text" class="form-control" id="study-program-url-' + study_program['ID'] + '" name="study-program-url[' + study_program['ID'] + ']" value="">' +
                            '</div>' +
                            '<div class="form-group">' +
                            '<label for="study-program-gallery">Hình ảnh</label>' +
                            '<div id="gallery-content-' + study_program['ID'] + '" class="gallery-content"></div>' +
                            '<button data-toggle="modal" data-target="#media-modal" type="button" class="btn btn-block btn-info select-images" data-gallery="' + study_program['ID'] + '">Chọn ảnh</button>' +
                            '</div>' +
                            '</div>' +
                            '</div>' +
                            '</div> ' +
                            '</li>'
                        );
                        serialize.val(JSON.stringify(study_programs.nestable('serialize')));
                        tinymce.init({
                            selector: 'textarea.study-program-content',
                            plugins: 'lists table',
                            toolbar: 'lists table',
                            toolbar_mode: 'floating',
                            tinycomments_mode: 'embedded',
                            tinycomments_author: 'Author name',
                            height: 300,
                        });
                    },
                });
            });
        });
    </script>
@endsection
