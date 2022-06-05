@extends('dashboard.app')
@section('title', 'Entries')
@section('content')
    <div class="row">
        <div class="col-12">
            <div class="card">
                <!-- /.card-header -->
                <div class="card-body table-responsive p-0">
                    <table class="table table-hover text-nowrap table-middle">
                        <thead>
                        <tr>
                            <th>Tên công ty</th>
                            <th>Email</th>
                            <th>Họ và tên</th>
                            <th>Số điện thoại</th>
                            <th>Ghi chú</th>
                        </tr>
                        </thead>
                        <tbody>
                        @if($entries->count() > 0)
                            @foreach($entries as $entry)
                                <tr>
                                    <td>{{$entry->company}}
                                        <br>
                                        <ul class="row-actions">
                                            <li class="delete">
                                                <a href="{{route('delete-entry', $entry->ID)}}">Xóa vĩnh viễn</a>
                                            </li>
                                        </ul>
                                    </td>
                                    <td>{{$entry->email}}</td>
                                    <td>{{$entry->full_name}}</td>
                                    <td>{{$entry->phone}}</td>
                                    <td>{{$entry->note}}</td>
                                </tr>
                            @endforeach
                        @else
                            <tr>
                                <td colspan="100%" class="capitalize-first-letter">Chưa có liên hệ</td>
                            </tr>
                        @endif
                        </tbody>
                    </table>
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->
            {{ $entries->links('pagination.pagination') }}
        </div>
    </div>
@endsection
