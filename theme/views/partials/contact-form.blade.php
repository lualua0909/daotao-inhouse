<section id="lien-he" class="contact-form-wrapper">
    <div class="container">
        <div class="section-heading wow bounceInUp">
            <h2 class="section-title-style-1">Liên hệ chúng tôi</h2>
        </div>
        <div class="form-wrapper wow bounceInUp">
            <form id="contact-form">
                <div class="form-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="input-container" id="input-container-1-1">
                                <label for="company-field">Tên công ty <span>*</span></label>
                                <input type="text" id="company-field" name="company" placeholder="Tên">
                            </div>
                            <div class="input-container" id="input-container-1-2">
                                <label for="full_name-field">Họ và tên <span>*</span></label>
                                <input type="text" id="full_name-field" name="full_name" placeholder="Họ tên">
                            </div>
                            <div class="input-container" id="input-container-1-3">
                                <label for="phone-field">Số điện thoại <span>*</span></label>
                                <input type="text" id="phone-field" name="phone" placeholder="SĐT">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="input-container" id="input-container-1-4">
                                <label for="email-field">Email <span>*</span></label>
                                <input type="text" id="email-field" name="email" placeholder="Email">
                            </div>
                            <div class="input-container" id="input-container-1-5">
                                <label for="note-field">Ghi chú <span>*</span></label>
                                <textarea id="note-field" name="note" rows="3" placeholder="Ghi chú"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-footer">
                    <button type="submit">Gửi ngay <span class="icon"><img src="{{$site_info['site_url']}}/public/startpress/theme/assets/images/button-arrow.png" alt=""></span></button>
                </div>
            </form>
        </div>
        <div class="call-wrapper wow bounceInUp">
            <a href="tel:{{isset($header_settings->meta->header_hotline) ? $header_settings->meta->header_hotline : ''}}" class="call-button">
                <span class="phone-number">{{isset($header_settings->meta->header_hotline) ? $header_settings->meta->header_hotline : ''}}</span>
                <span class="icon"><img src="{{$site_info['site_url']}}/public/startpress/theme/assets/images/phone-icon.png" alt="Gọi cho chúng tôi"></span>
            </a>
        </div>
    </div>
</section>
