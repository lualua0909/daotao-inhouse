@extends('dashboard.app')
@section('title', 'Thư viện')
@section('content')
        <div class="media-wrap">
            <ul class="attachments">

            </ul>
        </div>
    @include('upload.attachment-details')
@endsection
