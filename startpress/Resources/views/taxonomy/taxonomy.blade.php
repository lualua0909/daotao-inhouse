@extends('dashboard.app')
@section('title', $option['name'])
@section('content')
    <div class="row">
        <div class="col-lg-4">
            <h5 class="capitalize-first-letter">Thêm {{$option['name']}}</h5>
            <form method="post" action="" id="new-taxonomy">
                <div class="form-group">
                    <label for="name">Tên</label>
                    <input type="text" class="form-control" id="name" name="name">
                </div>
                <div class="form-group">
                    <label for="slug">Đường dẫn</label>
                    <input type="text" class="form-control" id="slug" name="slug">
                </div>
                @if($option['parent'] === true)
                    <div class="form-group">
                        <label for="parent">{{$option['name']}} cha</label>
                        <select class="form-control select2" id="parent" name="parent">
                            <option value="0">Trống</option>
                            @if($taxonomies)
                                @foreach(StartPress::getTaxonomyBuilder()->taxonomyRefactoring($taxonomies) as $taxonomy)
                                    <option value="{{$taxonomy['term_id']}}">{{$taxonomy['name']}}</option>
                                @endforeach
                            @endif
                        </select>
                    </div>
                @endif
                <div class="form-group">
                    <label for="description">Mô tả</label>
                    <textarea class="form-control" rows="3" id="description" name="description"></textarea>
                </div>
                {{ csrf_field() }}
                <input type="hidden" id="taxonomy" name="taxonomy" value="{{$option['taxonomy']}}">
                <button type="submit" class="btn btn-info capitalize-first-letter">
                    Thêm {{$option['name']}}
                </button>
            </form>
        </div>
        <div class="col-lg-8">
            <div class="card">
                <!-- /.card-header -->
                <div class="card-body table-responsive p-0">
                    <table class="table table-hover text-nowrap table-middle">
                        <thead>
                        <tr>
                            <th>Tên</th>
                            <th>Mô tả</th>
                            <th>Đường dẫn</th>
                            <th>Lượt</th>
                        </tr>
                        </thead>
                        <tbody>
                        @if($taxonomies_paginate)
                            @foreach(StartPress::getTaxonomyBuilder()->taxonomyRefactoring($taxonomies_paginate) as $taxonomy)
                                <tr>
                                    <td>
                                        <strong>{{$taxonomy['name'] }}</strong>
                                        <br>
                                        <ul class="row-actions">
                                            <li class="edit">
                                                <a href="{{route('edit-taxonomy', $taxonomy['term_id'])}}">Chỉnh sửa</a>
                                            </li>
                                            <li class="delete">
                                                <a href="javascript:" class="taxonomy-delete-button"
                                                   data-id="{{$taxonomy['term_id']}}"
                                                   data-route="{{route('edit-taxonomy', $taxonomy['term_id'])}}">Xoá</a>
                                            </li>
                                            <li class="view">
                                                <a href="{{ StartPress::getTaxonomyBuilder()->getCategoryLink($taxonomy['term_id']) }}">Xem</a>
                                            </li>
                                        </ul>
                                    </td>
                                    <td>{{$taxonomy['description']}}</td>
                                    <td>{{$taxonomy['slug']}}</td>
                                    <td>{{$taxonomy['count']}}</td>
                                </tr>
                            @endforeach
                        @else
                            <tr>
                                <td colspan="100%" class="capitalize-first-letter">Chưa có {{$option['name']}} nào được
                                    tạo.
                                </td>
                            </tr>
                        @endif
                        </tbody>
                    </table>
                </div>
                <!-- /.card-body -->
            </div>
            {{ $taxonomies_paginate->links('pagination.pagination') }}
        </div>
    </div>
@endsection
@section('script')
    <script>
        $(function () {
            let delete_button = $('.taxonomy-delete-button');
            delete_button.on('click', function () {
                if (confirm('Bạn sẽ xoá vĩnh viễn mục này khỏi trang web của bạn.\nHành động này không thể hoàn tác.\nClick vào "Huỷ" để dừng lại, hoặc "OK" để xoá.')) {
                    let term_id = $(this).attr('data-id');
                    let route = $(this).attr('data-route');
                    $.ajax({
                        url: route,
                        type: 'POST',
                        data: {
                            "_token": "{{ csrf_token() }}",
                            "taxonomy_ID": term_id,
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
