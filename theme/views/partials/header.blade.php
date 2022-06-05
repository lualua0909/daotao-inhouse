<div class="header-wrapper">
    <div class="header-top">
        <div class="container">
            <div class="header-top-container">
                <div class="logo-wrapper">
                    @if(request()->is('/'))
                        <h1>
                            <a href="{{$site_info['site_url']}}" title="{{$site_info['site_name']}}"><img
                                    src="{{$site_info['site_url']}}/public/startpress/theme/assets/images/header-logo.png"
                                    alt="{{$site_info['site_name']}}"></a>
                        </h1>
                    @else:
                    <a href="{{$site_info['site_url']}}" title="{{$site_info['site_name']}}"><img
                            src="{{$site_info['site_url']}}/public/startpress/theme/assets/images/header-logo.png"
                            alt="{{$site_info['site_name']}}"></a>
                    @endif
                </div>
                <div class="info-wrapper">
                    <p class="hotline">
                        Hotline:
                        <a href="tel:{{isset($header_settings->meta->header_hotline) ? $header_settings->meta->header_hotline : ''}}">{{isset($header_settings->meta->header_hotline) ? $header_settings->meta->header_hotline : ''}}</a>
                    </p>
                    <ul class="social-list">
                        <li>
                            <a href="{{isset($header_settings->meta->header_facebook) ? $header_settings->meta->header_facebook : ''}}"
                               target="_blank"><img
                                    src="{{$site_info['site_url']}}/public/startpress/theme/assets/images/facebook.png"
                                    alt="Facebook"></a>
                        </li>
                        <li>
                            <a href="{{isset($header_settings->meta->header_zalo) ? $header_settings->meta->header_zalo : ''}}"
                               target="_blank"><img
                                    src="{{$site_info['site_url']}}/public/startpress/theme/assets/images/zalo.png"
                                    alt="Zalo"></a></li>
                        <li>
                            <a href="{{isset($header_settings->meta->header_youtube) ? $header_settings->meta->header_youtube : ''}}"
                               target="_blank"><img
                                    src="{{$site_info['site_url']}}/public/startpress/theme/assets/images/youtube.png"
                                    alt="Youtube"></a>
                        </li>
                        <li>
                            <a href="tel:{{isset($header_settings->meta->header_hotline) ? $header_settings->meta->header_hotline : ''}}"><img
                                    src="{{$site_info['site_url']}}/public/startpress/theme/assets/images/call.png"
                                    alt="Số điện thoại"></a></li>
                        <li class="mobile-menu">
                            <a href="#primary-menu"><img
                                    src="{{$site_info['site_url']}}/public/startpress/theme/assets/images/mobile-menu.png"
                                    alt="Open menu"></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="header-bottom">
        <div class="container">
            {!! sp_menu(array(
                 'theme_location' => 'primary-menu',
                 'container' => 'div',
                 'container_class' => 'primary-menu',
             )) !!}
            {!! sp_menu(array(
                 'theme_location' => 'primary-menu',
                 'container' => 'div',
                 'container_class' => 'primary-mmenu',
                 'container_id' => 'primary-menu'
             )) !!}
        </div>
    </div>
</div>
