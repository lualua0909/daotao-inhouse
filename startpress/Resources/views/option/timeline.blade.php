@extends('dashboard.app')
@section('title', 'Quy trình')
@section('content')
    <form method="post">
        <div class="row">
            <div class="col-lg-5">
                <div class="card card-light">
                    <div class="card-body">
                        <div class="form-group">
                            <label for="timeline_object_title">Tiêu đề</label>
                            <input type="text" class="form-control" id="timeline_object_title" name="timeline_object_title"
                                   value="{{isset($timeline_object->meta->timeline_object_title) ? $timeline_object->meta->timeline_object_title : ''}}">
                        </div>
                        <div class="form-group">
                            <label for="timeline_content">Mô tả</label>
                            <textarea class="form-control" id="timeline_object_desc"
                                      name="timeline_object_desc">{{isset($timeline_object->meta->timeline_object_desc) ? $timeline_object->meta->timeline_object_desc : ''}}</textarea>
                        </div>
                        <div class="dd" id="timelines">
                            <ul class="dd-list timelines-list">
                                @if(isset($timelines) && $timelines)
                                    @foreach($timelines as $timeline)
                                        <li class="dd-item" data-id="{{$timeline->ID}}">
                                            <span class="remove"><i class="fas fa-minus-circle"></i></span>
                                            <div class="dd-handle"></div>
                                            <div class="menu-item-content">
                                                <a class="menu-item-collapse-button collapsed" data-toggle="collapse"
                                                   href="#collapse-menu-item-{{$timeline->ID}}"
                                                   aria-expanded="true">{{$timeline->ID}}</a>
                                                <div id="collapse-menu-item-{{$timeline->ID}}"
                                                     class="collapse show" data-parent="#timelines" style="">
                                                    <div class="content-wrap">
                                                        <div class="form-group">
                                                            <label for="timeline-name[{{$timeline->ID}}]">Tiêu đề</label>
                                                            <input type="text" class="form-control"
                                                                   id="timeline-name[{{$timeline->ID}}]"
                                                                   name="timeline-name[{{$timeline->ID}}]"
                                                                   value="{{$timeline->meta->timeline_name}}">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="timeline-desc[{{$timeline->ID}}]">Mô tả</label>
                                                            <textarea rows="5" class="form-control"
                                                                      id="timeline-desc[{{$timeline->ID}}]"
                                                                      name="timeline-desc[{{$timeline->ID}}]">{{$timeline->meta->timeline_desc}}</textarea>
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
                        <button type="button" class="btn btn-success float-right" id="add-timeline">Thêm dòng
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <input type="hidden" name="serialize" id="serialize" value="">
        @if(isset($timeline_object))
            <input type="hidden" class="form-control" id="timeline_object_id" name="timeline_object_id" value="{{$timeline_object->ID}}">
        @endif
        {{ csrf_field() }}
    </form>
    @include('upload.media-modal')
@endsection

@section('script')
    <script>
        let timelines = $('#timelines');
        let media_modal = $('.media-modal');
        let object;
        let serialize = $('#serialize');
        $(document).on("click", ".select-images", function () {
            object = $(this).attr('data-object');
        });
        timelines.nestable({
            listNodeName: 'ul',
            group: 1,
            maxDepth: 1
        });
        serialize.val(JSON.stringify(timelines.nestable('serialize')));
        timelines.on('change', function () {
            serialize.val(JSON.stringify(timelines.nestable('serialize')));
        });

        $(document).on("click", ".remove", function () {
            $(this).parent().remove();
        });

        $(document).on("click", ".dd-item .remove", function () {
            let id = $(this).parent().attr('data-id');
            let item = $(this).parent();
            $.ajax({
                url: "{{route('delete-timeline')}}",
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

        $('#add-timeline').on('click', function () {
            $.ajax({
                url: "{{route('add-timeline')}}",
                type: 'POST',
                data: {
                    "_token": "{{ csrf_token() }}"
                },
                dataType: 'JSON',
                success: function (timeline) {
                    // console.log(study_program);
                    timelines.find('.timelines-list').append(
                        '<li class="dd-item" data-id="' + timeline['ID'] + '">' +
                        '<span class="remove"><i class="fas fa-minus-circle"></i></span>' +
                        '<div class="dd-handle"></div>' +
                        '<div class="menu-item-content">' +
                        '<a class="menu-item-collapse-button collapsed" data-toggle="collapse" href="#collapse-menu-item-' + timeline['ID'] + '" aria-expanded="true">' + timeline['ID'] + '</a>' +
                        '<div id="collapse-menu-item-' + timeline['ID'] + '" class="collapse show" data-parent="#timelines" style="">' +
                        '<div class="content-wrap">' +
                        '<div class="form-group">' +
                        '<label for="timeline-name[' + timeline['ID'] + ']">Tên</label>' +
                        '<input type="text" class="form-control" id="timeline-name[' + timeline['ID'] + ']" name="timeline-name[' + timeline['ID'] + ']" value="">' +
                        '</div>' +
                        '<div class="form-group">' +
                        '<label for="timeline-desc[' + timeline['ID'] + ']">Mô tả</label>' +
                        '<textarea rows="5" class="form-control" id="timeline-desc[' + timeline['ID'] + ']" name="timeline-desc[' + timeline['ID'] + ']"></textarea>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</li>'
                    );
                    serialize.val(JSON.stringify(timelines.nestable('serialize')));
                },
            });
        });
    </script>
@endsection
