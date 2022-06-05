@extends('dashboard.app')
@if(isset($post))
    @section('title', 'Chỉnh sửa ' . $option['name'])
@else
    @section('title', 'Thêm ' . $option['name'])
@endif
@section('content')
    <form method="post">
        <div class="row">
            <div class="col-lg-9">
                <div class="form-group">
                    <label hidden for="post_title">Tiêu đề {{$option['name']}}</label>
                    <input type="text" class="form-control" id="post_title" name="post_title"
                           placeholder="Tiêu đề bài viết" value="{{ isset($post) ? $post->post_title : '' }}">
                </div>
                <button type="button" id="insert-media-button" data-toggle="modal" data-target="#media-modal"
                        class="btn btn-info mb-2"><i class="fas fa-photo-video"></i>
                    Thêm media
                </button>
                <label hidden for="post_content">Nội dung bài viết</label>
                <textarea id="post_content" name="post_content">{{ isset($post) ? $post->post_content : '' }}</textarea>
            </div>
            <div class="col-lg-3">
                <div class="card card-light">
                    <div class="card-header">
                        <h3 class="card-title">Đăng</h3>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <label for="post_status">Trạng thái</label>
                            <select class="custom-select" id="post_status" name="post_status">
                                <option
                                    value="publish" {{ isset($post->post_status) && $post->post_status === 'publish' ? 'selected' : '' }}>
                                    Đã xuất bản
                                </option>
                                <option
                                    value="pending" {{ isset($post->post_status) && $post->post_status === 'pending' ? 'selected' : '' }}>
                                    Chờ duyệt
                                </option>
                                <option
                                    value="draft" {{ isset($post->post_status) && $post->post_status === 'draft' ? 'selected' : '' }}>
                                    Bản nháp
                                </option>
                            </select>
                        </div>
                    </div>
                    <div class="card-footer text-right">
                        <button type="submit" class="btn btn-info">{{ isset($post) ? 'Cập nhật' : 'Đăng' }}</button>
                    </div>
                </div>
                <?php
                $post_taxomonies = [];
                if (isset($post)):
                    $post_taxomonies = $post->taxonomies;
                endif;
                ?>
                @if($taxonomies)
                    @foreach($taxonomies as $taxonomy)
                        @if(isset($taxonomy['parent']) && $taxonomy['parent'] === true)
                            <div class="card card-light">
                                <div class="card-header">
                                    <h3 class="card-title">{{$taxonomy['name']}}</h3>
                                </div>
                                <div class="card-body">
                                    {{StartPress::getTaxonomyBuilder()->structuredTaxonomy($taxonomy['taxonomy'], $post_taxomonies)}}
                                    <hr>
                                    <button data-toggle="modal" data-target="#add_new_{{$taxonomy['taxonomy']}}_modal"
                                            type="button" class="btn btn-block btn-info btn-xs capitalize-first-letter">
                                        Thêm {{$taxonomy['name']}}</button>
                                </div>
                            </div>
                        @else
                            <div class="card card-light">
                                <div class="card-header">
                                    <h3 class="card-title">{{$taxonomy['name']}}</h3>
                                </div>
                                <div class="card-body">
                                    {{StartPress::getTaxonomyBuilder()->structuredTaxonomySelect($taxonomy['taxonomy'], $taxonomy['name'], $post_taxomonies)}}
                                    <hr>
                                    <button data-toggle="modal" data-target="#add_new_{{$taxonomy['taxonomy']}}_modal"
                                            type="button" class="btn btn-block btn-info btn-xs capitalize-first-letter">
                                        Thêm {{$taxonomy['name']}}</button>
                                </div>
                            </div>
                        @endif
                    @endforeach
                @endif
                @if(isset($option['featured_image']) && $option['featured_image']=== true)
                    <div class="card card-light">
                        <div class="card-header">
                            <h3 class="card-title">Ảnh đại diện</h3>
                        </div>
                        <div class="card-body">
                            <div class="featured-image-preview">
                                <img
                                    src="{{isset($post->thumbnail->attachment) ? asset('contents/uploads/'.$post->thumbnail->attachment->meta->attached_file) : ''}}"
                                    alt="">
                            </div>
                            <div class="row">
                                <div class="col-6">
                                    <button id="featured-image-select-button" data-toggle="modal"
                                            data-target="#media-modal" type="button"
                                            class="btn btn-block btn-info btn-xs">Chọn ảnh
                                    </button>
                                </div>
                                <div class="col-6">
                                    <a id="featured-image-delete-button" type="button"
                                       class="btn btn-block btn-outline-info btn-xs">Gỡ ảnh</a>
                                </div>
                            </div>
                        </div>
                    </div>
                @endif
            </div>
        </div>
        <input type="hidden" id="featured_image" name="featured_image"
               value="{{isset($post->thumbnail) ? $post->thumbnail->meta_value : ''}}">
        {{ csrf_field() }}
    </form>
    @if($taxonomies)
        @foreach($taxonomies as $taxonomy)
            {!! StartPress::getTaxonomyBuilder()->addNewTaxonomy($taxonomy['taxonomy'], $taxonomy['name'], $taxonomy['parent']) !!}
        @endforeach
    @endif
    @include('upload.media-modal')
@endsection
@section('script')
    @if($taxonomies)
        @foreach($taxonomies as $taxonomy)
            <script>
                $(function () {
                    $('#add_new_{{$taxonomy['taxonomy']}}_button').on('click', function () {
                        let taxonomy = '{{$taxonomy['taxonomy']}}';
                        let title = $('#{{$taxonomy['taxonomy']}}_title');
                        let parent = $('#{{$taxonomy['taxonomy']}}_parent');
                        $.ajax({
                            url: "{{route('taxonomy-ajax', $taxonomy['taxonomy'])}}",
                            type: 'POST',
                            data: {
                                "_token": "{{ csrf_token() }}",
                                "taxonomy": taxonomy,
                                "name": title.val(),
                                "parent": parent.val(),
                            },
                            dataType: 'JSON',
                            success: function (data) {
                                if (data['error'] === 'required') {
                                    toastr.success('Tên ' + data['name'] + ' là bắt buộc');
                                } else if (data['error'] === 'unique') {
                                    toastr.success(data['name'] + ' Đã được sử dụng');
                                } else {
                                    $('#add_new_{{$taxonomy['taxonomy']}}_modal').modal('hide');
                                    toastr.success('Thêm ' + data['name'] + ' thành công');
                                    title.val('');
                                    parent.val('');
                                    if (data['success'] === true) {
                                        let taxonomy = data['taxonomy'];
                                        let term = data['term'];
                                        let select2_id = "#select2_" + taxonomy['taxonomy'];
                                        let select2_parent_id = "#" + taxonomy['taxonomy'] + '_parent';
                                        let check_list_id = '#' + taxonomy['taxonomy'] + "_check_list";
                                        console.log(select2_parent_id);
                                        $(select2_id).append("<option value='" + term['term_id'] + "' selected>" + term['name'] + "</option>");
                                        $(select2_parent_id).append("<option value='" + term['term_id'] + "'>" + term['name'] + "</option>");
                                        $(select2_id).trigger('change');
                                        $(select2_parent_id).trigger('change');
                                        if (taxonomy['parent'] === '0' || taxonomy['parent'] === 0) {
                                            $(check_list_id).append(
                                                '<div class="checkbox-item" id="checkbox-item-' + term['term_id'] + '">' +
                                                '<div class="form-check">' +
                                                '<input class="form-check-input" type="checkbox" name="taxonomies[]" value="' + term['term_id'] + '" checked>' +
                                                '<label class="form-check-label">' + term['name'] + '</label>' +
                                                '</div>' +
                                                '</div>'
                                            );
                                        } else {
                                            let parent_item_has_child = $('#checkbox-item-' + taxonomy['parent'] + ' .children');
                                            let parent_item = $('#checkbox-item-' + taxonomy['parent']);
                                            let check_box_item = '<div class="checkbox-item" id="checkbox-item-' + term['term_id'] + '">' +
                                                '<div class="form-check">' +
                                                '<input class="form-check-input" type="checkbox" name="taxonomies[]" value="' + term['term_id'] + '" checked>' +
                                                '<label class="form-check-label">' + term['name'] + '</label>' +
                                                '</div>' +
                                                '</div>';
                                            if (parent_item_has_child.length) {
                                                parent_item_has_child.append(check_box_item);
                                            } else {
                                                parent_item.append(
                                                    '<div class="children">' + check_box_item + '</div>'
                                                );
                                            }
                                        }
                                    }
                                }
                            },
                        });
                    });
                });
            </script>
        @endforeach
    @endif
@endsection
