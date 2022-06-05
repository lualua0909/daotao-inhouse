@extends('layouts.master')
@section('title', $taxonomy->term->name . " – " . $site_info['site_name'])
@section('content')
    @include('partials.archive')
@endsection
