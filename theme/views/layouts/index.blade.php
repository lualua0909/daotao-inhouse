@extends('layouts.master')
@section('title', $site_info['site_name'] . " – " . $site_info['site_description'])
@section('content')
    @include('partials.welcome')
    @include('partials.why-us')
    @include('partials.team')
{{--    @include('partials.timeline')--}}
    @include('partials.procedure')
    @include('partials.study')
{{--    @include('partials.elearning')--}}
    @include('partials.why-us-2')
    @include('partials.event')
    @include('partials.certificate')
    @include('partials.contact-form')
    @include('partials.partner')
@endsection
