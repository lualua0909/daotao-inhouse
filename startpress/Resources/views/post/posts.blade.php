@extends('dashboard.app')
@section('title', $option['name'])
@section('content')
    <div class="row">
        <div class="col-12">
            <a type="button" href="{{route('new-post', $post_type)}}" class="btn btn-info mb-2 capitalize-first-letter">Thêm {{$option['name']}}
                mới</a>
            <ul class="post-status">
                <li class="{{ $post_status === null ? 'active' : '' }}">
                    <a href="{{route('posts', $post_type)}}">Tất cả</a> <span>({{$posts_count['all']}})</span>
                </li>
                @if($posts_count['publish'] !== 0)
                    <li class="{{ $post_status === 'publish' ? 'active' : '' }}">
                        <a href="{{route('posts', $post_type.'?post_status=publish')}}">Đã xuất bản</a> <span>({{$posts_count['publish']}})</span>
                    </li>
                @endif
                @if($posts_count['draft'] !== 0)
                    <li class="{{ $post_status === 'draft' ? 'active' : '' }}">
                        <a href="{{route('posts', $post_type.'?post_status=draft')}}">Bản nháp</a> <span>({{$posts_count['draft']}})</span>
                    </li>
                @endif
                @if($posts_count['pending'] !== 0)
                    <li class="{{ $post_status === 'pending' ? 'active' : '' }}">
                        <a href="{{route('posts', $post_type.'?post_status=pending')}}">Chờ duyệt</a> <span>({{$posts_count['pending']}})</span>
                    </li>
                @endif
                @if($posts_count['trash'] !== 0)
                    <li class="{{ $post_status === 'trash' ? 'active' : '' }}">
                        <a href="{{route('posts', $post_type.'?post_status=trash')}}">Thùng rác</a> <span>({{$posts_count['trash']}})</span>
                    </li>
                @endif
            </ul>
            <div class="card">
                <!-- /.card-header -->
                <div class="card-body table-responsive p-0">
                    <table class="table table-hover text-nowrap table-middle">
                        <thead>
                        <tr>
                            <th>Tiêu đề</th>
                            <th>Tác giả</th>
                            @if($taxonomies)
                                @foreach($taxonomies as $taxonomy)
                                    <th>{{$taxonomy['name']}}</th>
                                @endforeach
                            @endif
                            <th>Bình luận</th>
                            <th>Thời gian</th>
                        </tr>
                        </thead>
                        <tbody>
                        @if($posts->count() > 0)
                            @foreach($posts as $post)
                                <tr>
                                    <td>
                                        @if($post_status !== null || $post_status === 'publish')
                                            <strong>
                                                <a href="{{route('edit-post', $post->ID)}}">{{$post->post_title}}</a>
                                            </strong>
                                        @else
                                            <strong>
                                                <a href="{{route('edit-post', $post->ID)}}">{{$post->post_title}}</a>
                                                @if($post->post_status == 'draft')
                                                    <span class="post-status"> - Bản nháp</span>
                                                @elseif($post->post_status == 'pending')
                                                    <span class="post-status"> - Chờ duyệt</span>
                                                @endif
                                            </strong>
                                        @endif
                                        <br>
                                        <ul class="row-actions">
                                            @if($post->post_status != 'trash')
                                                <li class="edit">
                                                    <a href="{{route('edit-post', $post->ID)}}">Chỉnh sửa</a>
                                                </li>
                                                <li class="delete">
                                                    <a href="{{route('update-post-status',[ $post->ID, 'trash'])}}">Thùng
                                                        rác</a>
                                                </li>
                                                <li class="view">
                                                    <a href="{{$site_info['site_url'] . '/' . $post->post_name}}">Xem</a>
                                                </li>
                                            @else
                                                <li class="edit">
                                                    <a href="{{route('update-post-status',[ $post->ID, 'draft'])}}">Phục
                                                        hồi</a>
                                                </li>
                                                <li class="delete">
                                                    <a href="{{route('update-post-status',[ $post->ID, 'delete'])}}">Xóa vĩnh viễn</a>
                                                </li>
                                            @endif
                                        </ul>
                                    </td>
                                    <td><a href="">{{$post->author->display_name}}</a></td>
                                    @if($taxonomies)
                                        @foreach($taxonomies as $taxonomy)
                                            <td class="{{$taxonomy['taxonomy']}} taxonomy-list">
                                                @if($post->taxonomies)
                                                    @foreach($post->taxonomies as $post_taxonomy)
                                                        @if($post_taxonomy->taxonomy === $taxonomy['taxonomy'])
                                                            <a href="">{{$post_taxonomy->term->name}}</a>
                                                        @endif
                                                    @endforeach
                                                @endif
                                            </td>
                                        @endforeach
                                    @endif
                                    <td>null</td>
                                    <td>{!! date('d/m/Y h:i', strtotime($post->post_date)) !!}</td>
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
            <!-- /.card -->
            {{ $posts->links('pagination.pagination') }}
        </div>
    </div>
@endsection
