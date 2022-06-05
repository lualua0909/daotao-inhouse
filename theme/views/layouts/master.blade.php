<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="_token" content="{{ csrf_token() }}">
    <meta name="description" content="{{$site_info['site_description']}}"/>
    <meta property="og:url" content="{{url()->current()}}">
    <meta name="twitter:card" content="summary_large_image"/>
    <meta name="twitter:description" content="{{$site_info['site_description']}}"/>
    <meta name="twitter:title" content="{{$site_info['site_name'] . '-' .$site_info['site_description']}}"/>
    <meta name="twitter:image" content="{{asset('/public/startpress/theme/assets/images/header-logo.png')}}"/>
    <link rel="canonical" href="{{url()->current()}}"/>
    <link rel="shortcut icon" href="{{asset('/public/startpress/theme/assets/images/favicon.png')}}">
    <title>@yield('title')</title>
    {!! StartPress::headerScripts() !!}
    <script type="text/javascript">
        var form_ajax = '{{ route('form-submit') }}'
    </script>

    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-7TRXENDE57"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', 'G-7TRXENDE57');
    </script>
    <!-- Facebook Pixel Code -->
    <script>
        !function(f,b,e,v,n,t,s)
        {if(f.fbq)return;n=f.fbq=function(){n.callMethod?
            n.callMethod.apply(n,arguments):n.queue.push(arguments)};
            if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
            n.queue=[];t=b.createElement(e);t.async=!0;
            t.src=v;s=b.getElementsByTagName(e)[0];
            s.parentNode.insertBefore(t,s)}(window, document,'script',
            'https://connect.facebook.net/en_US/fbevents.js');
        fbq('init', '207769844489795');
        fbq('track', 'PageView');
    </script>
    <noscript><img height="1" width="1" style="display:none"
                   src="https://www.facebook.com/tr?id=207769844489795&ev=PageView&noscript=1"
        /></noscript>
    <!-- End Facebook Pixel Code -->
    {!! $schema !!}
    {!! $openGraphTags->renderTags() !!}
</head>
<body class="adr">
<div class="site-container">
    <header class="site-header">
        @include('partials.header')
    </header>
    <div id="primary" class="content-area">
        <main id="main" class="site-main">
            <div class="content">
                @yield('content')
            </div><!-- .container -->
        </main><!-- #main -->
    </div><!-- #primary -->
    @include('partials.action-button')
    <footer class="site-footer">
        @include('partials.footer')
    </footer>
</div>
{!! StartPress::footerScripts() !!}
</body>
</html>
