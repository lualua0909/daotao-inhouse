<div class="footer-wrapper">
    <div class="footer-top">
        <div class="container">
            <div class="footer-top-content">
                <div class="info-wrapper">
                    <div class="info-box">
                        <div class="icon">
                            <img src="{{$site_info['site_url']}}/public/startpress/theme/assets/images/location.png"
                                 alt="Địa chỉ">
                        </div>
                        <h4 class="box-title">Địa chỉ</h4>
                        <p class="box-content">{!! isset($footer_settings->meta->footer_address) ? $footer_settings->meta->footer_address : '' !!}</p>
                    </div>
                    <div class="info-box">
                        <div class="icon">
                            <img src="{{$site_info['site_url']}}/public/startpress/theme/assets/images/phone.png"
                                 alt="Số điện thoại">
                        </div>
                        <h4 class="box-title">Phone Number</h4>
                        <p class="box-content">{!! isset($footer_settings->meta->footer_phone) ? $footer_settings->meta->footer_phone : '' !!}</p>
                    </div>
                    <div class="info-box">
                        <div class="icon">
                            <img src="{{$site_info['site_url']}}/public/startpress/theme/assets/images/global.png"
                                 alt="Website">
                        </div>
                        <h4 class="box-title">Địa chỉ mail</h4>
                        <p class="box-content">{!! isset($footer_settings->meta->footer_email) ? $footer_settings->meta->footer_email : '' !!}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-bf-wrapper">
        <div class="footer-main">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-sm-6">
                        <div class="footer-widget footer-widget-1">
                            <div class="logo-wrapper">
                                <img
                                    src="{{$site_info['site_url']}}/public/startpress/theme/assets/images/footer-logo.png"
                                    alt="IFA">
                            </div>
                            <div class="desc">
                                <p>{{isset($footer_settings->meta->footer_desc) ? $footer_settings->meta->footer_desc : ''}}</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="footer-widget footer-widget-2">
                            <h5 class="widget-title">Tin nổi bật</h5>
                            <ul class="post-list">
                                @if($hot_news)
                                    @foreach($hot_news as $post)
                                        <li class="post-item">
                                            <div class="post-date">
                                                <span class="date">{{get_post_time('d/m', $post)}}</span>
                                                <span class="year">{{get_post_time('Y', $post)}}</span>
                                            </div>
                                            <h3 class="post-title">
                                                <a href="{{get_permalink($post)}}">{{ get_the_title($post) }}</a>
                                            </h3>
                                        </li>
                                    @endforeach
                                @endif
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="footer-widget footer-widget-3">
                            <h5 class="widget-title">Liên kết nhanh</h5>
                            {!! sp_menu(array(
                                 'theme_location' => 'footer-menu',
                                 'container' => '',
                                 'menu_class' => 'footer-links',
                             )) !!}
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="footer-widget footer-widget-4">
                            <h5 class="widget-title">Kết nối với chúng tôi</h5>
                            <h6 class="widget-subtitle">Kết nối với chúng tôi để được tư vấn</h6>
                            <ul class="social-list">
                                <li>
                                    <a href="{{isset($footer_settings->meta->footer_facebook) ? $footer_settings->meta->footer_facebook : ''}}" target="_blank">
                                        <img
                                            src="{{$site_info['site_url']}}/public/startpress/theme/assets/images/ft-fb.png"
                                            alt="Facebook">
                                    </a>
                                </li>
                                <li>
                                    <a href="{{isset($footer_settings->meta->footer_zalo) ? $footer_settings->meta->footer_zalo : ''}}" target="_blank">
                                        <img
                                            src="{{$site_info['site_url']}}/public/startpress/theme/assets/images/ft-zalo.png"
                                            alt="Zalo">
                                    </a>
                                </li>
                                <li>
                                    <a href="{{isset($footer_settings->meta->footer_youtube) ? $footer_settings->meta->footer_youtube : ''}}" target="_blank">
                                        <img
                                            src="{{$site_info['site_url']}}/public/startpress/theme/assets/images/ft-ytb.png"
                                            alt="Youtube">
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <div class="container">
                <div class="copyright-wrapper">
                    © Copyrights 2021 by IFA
                </div>
            </div>
        </div>
    </div>
</div>
