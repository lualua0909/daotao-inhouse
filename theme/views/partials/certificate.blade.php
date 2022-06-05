<section id="ifa-section-8" class="certificate-wrapper">
    <div class="container">
        <div class="certificate-box">
            <div class="box-content wow slideInLeft">
                <div class="content-wrap">
                    <h3 class="box-title">{{isset($certificate_object->meta->certificate_title) ? $certificate_object->meta->certificate_title : ''}}</h3>
                    <div class="desc">
                        <p>{{isset($certificate_object->meta->certificate_content) ? $certificate_object->meta->certificate_content : ''}}</p>
                    </div>
                    <div class="button-wrap">
                        <a href="{{isset($certificate_object->meta->certificate_url) ? $certificate_object->meta->certificate_url : ''}}"
                           class="action-button">Tư vấn ngay</a>
                    </div>
                </div>
            </div>
            <div class="box-image wow slideInRight">
                <div class="images-slideshow">
                    @if(isset($certificate_slider) && $certificate_slider)
                        @foreach($certificate_slider as $slide)
                            <div class="image-box">
                                <div class="content-wrapper">
                                    <h4>{{$slide->meta->slide_desc}}</h4>
                                </div>
                                @if(isset($slide->meta->slide_img) &&  $slide->meta->slide_img != '')
                                    <img alt="{{$slide->meta->slide_desc}}"
                                         src="{{StartPress::getAttachmentBuilder()->get_attachment_url($slide->meta->slide_img)}}"/>
                                @endif
                            </div>
                        @endforeach
                    @endif
                </div>
            </div>
        </div>
    </div>
</section>
