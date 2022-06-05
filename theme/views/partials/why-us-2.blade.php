<section id="chuong-trinh-elearning" class="why-us-wrapper why-us-2-wrapper">
    <div class="container">
        <div class="row">
            <div class="col-xl-6 wow slideInLeft">
                <div class="section-heading">
                    <h2 class="section-title-style-2">{!! isset($why_2_object->meta->why_2_object_title) ? $why_2_object->meta->why_2_object_title : '' !!}</h2>
                    <p class="subtitle">
                        {{isset($why_2_object->meta->why_2_object_desc) ? $why_2_object->meta->why_2_object_desc : ''}}
                    </p>
                </div>
                <div class="why-us-img-wrapper">
                    <div class="why-us-img">
                        <h3 class="img-title">{{isset($why_2_object->meta->why_2_object_text_1) ? $why_2_object->meta->why_2_object_text_1 : ''}}</h3>
                        <div class="img-content">
                            <p>{{isset($why_2_object->meta->why_2_object_text_2) ? $why_2_object->meta->why_2_object_text_2 : ''}}</p>
                        </div>
                        @if(isset($why_2_object->meta->why_2_object_img) &&  $why_2_object->meta->why_2_object_img != '')
                            <img
                                alt="{!! isset($why_2_object->meta->why_2_object_title) ? $why_2_object->meta->why_2_object_title : '' !!}"
                                src="{{StartPress::getAttachmentBuilder()->get_attachment_url($why_2_object->meta->why_2_object_img)}}"/>
                        @endif
                    </div>
                </div>
            </div>
            <div class="col-xl-6 wow slideInRight">
                <div class="row">
                    @if(isset($whys_2) && $whys_2)
                        @foreach($whys_2 as $why)
                            <div class="col-lg-6">
                                <div class="why-us-card">
                                    @if(isset($why->meta->why_img) &&  $why->meta->why_img != '')
                                        <div class="icon">
                                            <img alt=""
                                                 src="{{StartPress::getAttachmentBuilder()->get_attachment_url($why->meta->why_img)}}"/>
                                        </div>
                                    @endif
                                    <h3 class="card-title">{{$why->meta->why_2_name}}</h3>
                                    <p class="card-content">{{$why->meta->why_2_desc}}</p>
                                </div>
                            </div>
                        @endforeach
                    @endif`
                </div>
            </div>
        </div>
        <div class="button-wrap">
            <a href="#lien-he" class="action-button">Đăng ký nhận tư vấn</a>
        </div>
    </div>
</section>
