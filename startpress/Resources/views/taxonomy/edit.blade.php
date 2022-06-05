@extends('dashboard.app')
@section('title', 'Chỉnh sửa '.$option['name'])
@section('content')
    <div class="row">
        <div class="col-lg-4">
            <h5 class="text-capitalize">Thêm {{$option['name']}}</h5>
            <form method="post" action="" id="new-taxonomy">
                <div class="form-group">
                    <label for="name">Tên</label>
                    <input type="text" class="form-control" id="name" name="name" value="{{$taxonomy->term->name}}">
                </div>
                <div class="form-group">
                    <label for="slug">Đường dẫn</label>
                    <input type="text" class="form-control" id="slug" name="slug" value="{{$taxonomy->term->slug}}">
                </div>
                @if($option['parent'] === true)
                    <div class="form-group">
                        <label for="parent">{{$option['name']}} cha</label>
                        <select class="form-control" id="parent" name="parent">
                            <option value="0">Trống</option>
                            @if($taxonomies)
                                @foreach($taxonomies as $tax)
                                    @if($tax['term_id'] === $taxonomy->term_id)
                                        @continue
                                    @endif
                                    <option
                                        value="{{$tax['term_id']}}" @if($taxonomy->parent === $tax['term_id']) {{'selected'}} @endif>{{$tax['name']}}</option>
                                @endforeach
                            @endif
                        </select>
                    </div>
                @endif
                <div class="form-group">
                    <label for="description">Mô tả</label>
                    <textarea class="form-control" rows="3" id="description"
                              name="description">{{$taxonomy->description}}</textarea>
                </div>
                {{ csrf_field() }}
                <button type="submit" class="btn btn-info text-capitalize">Cập nhật</button>
                <button id="taxonomy-delete-button" type="button" class="btn btn-danger text-capitalize">Xoá</button>
            </form>
        </div>
    </div>
@endsection
@section('script')
    <script>
        $(function () {
            let delete_button = $('#taxonomy-delete-button');
            delete_button.on('click', function () {
                if (confirm('Bạn sẽ xoá vĩnh viễn mục này khỏi trang web của bạn.\nHành động này không thể hoàn tác.\nClick vào "Huỷ" để dừng lại, hoặc "OK" để xoá.')) {
                    $.ajax({
                        url: "{{route('edit-taxonomy', $taxonomy->term_id)}}",
                        type: 'POST',
                        data: {
                            "_token": "{{ csrf_token() }}",
                            "taxonomy_ID": {{$taxonomy->term_id}},
                            "delete": true,
                        },
                        dataType: 'JSON',
                        success: function (data) {
                            if (data['success'] === true) {
                                toastr.success(data['name'] + ' đã được xoá.');
                                setTimeout(
                                    function () {
                                        window.location.href = data['route'];
                                    }, 500);
                            } else {
                                toastr.warning('Đã có lỗi xảy ra.');
                            }
                        }
                    });
                }
            });
        });
    </script>
@endsection
