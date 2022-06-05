<div class="adminActions">
    <div class="floating-form-wrapper">
        <h3 class="form-title">Bạn vui lòng điền vào biểu mẫu dưới đây và chúng tôi sẽ liên hệ lại với bạn ngay khi có
            thể.</h3>
        <form id="floating-contact-form">
            <div class="form-body">
                <div class="input-container" id="input-container-2-1">
                    <label for="company-field-2-1" hidden>Tên công ty <span>*</span></label>
                    <input type="text" id="company-field-2-1" name="company_2_1" placeholder="Tên công ty*">
                </div>
                <div class="input-container" id="input-container-2-2">
                    <label for="full-name-2-2" hidden>Họ và tên <span>*</span></label>
                    <input type="text" id="full-name-2-2" name="full_name_2_2" placeholder="Họ tên*">
                </div>
                <div class="input-container" id="input-container-2-4">
                    <label for="email-field-2-4" hidden>Email <span>*</span></label>
                    <input type="text" id="email-field-2-4" name="email_2_4" placeholder="Email*">
                </div>
                <div class="input-container" id="input-container-2-3">
                    <label for="phone-field-2-3" hidden>Số điện thoại <span>*</span></label>
                    <input type="text" id="phone-field-2-3" name="phone_2_3" placeholder="SĐT*">
                </div>
                <div class="input-container" id="input-container-2-5">
                    <label for="note-field-2-5" hidden>Ghi chú <span>*</span></label>
                    <textarea id="note-field-2-5" name="note_2_5" rows="3" placeholder="Nội dung cần tư vấn"></textarea>
                </div>
            </div>
            <div class="form-footer">
                <button type="submit" class="button-effect">Gửi ngay</button>
            </div>
        </form>
    </div>
    <input type="checkbox" name="adminToggle" class="adminToggle"/>
    <a class="adminButton" href="#!"></a>
    <div class="adminButtons">

        <a class="button-call-desktop" href="javascript:;" title="" id="scrollToContact"><img
                src="{{$site_info['site_url']}}/public/startpress/theme/assets/images/action-button-1.png" alt="Gọi cho chúng tôi"></a>
        <a class="button-call-mobile"
           href="tel:{{isset($header_settings->meta->header_hotline) ? $header_settings->meta->header_hotline : ''}}"
           title="Gọi cho chúng tôi"><img
                src="{{$site_info['site_url']}}/public/startpress/theme/assets/images/action-button-1.png" alt="Gọi cho chúng tôi"></a>
        <a href="{{isset($header_settings->meta->header_zalo) ? $header_settings->meta->header_zalo : ''}}"
           title=""><img
                src="{{$site_info['site_url']}}/public/startpress/theme/assets/images/action-button-2.png" alt="Chat với chúng tôi qua Zalo"></a>
        <a href="javascript:;" title="" id="toggleContactForm"><img
                src="{{$site_info['site_url']}}/public/startpress/theme/assets/images/action-button-3.png" alt="Liên hệ với chúng tôi"></a>
        <a href="{{isset($header_settings->meta->header_facebook) ? $header_settings->meta->header_facebook : ''}}"
           title=""><img
                src="{{$site_info['site_url']}}/public/startpress/theme/assets/images/action-button-4.png" alt="Facebook"></a>
    </div>
</div>
