@extends('layouts.master')
@section('title', $post->post_title . " – " . $site_info['site_name'])
@section('content')
    @include('partials.single')
@endsection
