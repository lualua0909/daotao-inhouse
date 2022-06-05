@if($welcome_object)
    <section id="gioi-thieu" class="welcome-wrapper"
             style="background-image: url({{$site_info['site_url']}}/public/startpress/theme/assets/images/welcome-background.png)">
        <div class="container">
            <div class="row flex-row-reverse">
                <div class="col-xl-7 img-col wow slideInRight">
                    <div class="img-wrapper">
                        @if(isset($welcome_object->meta->welcome_img) &&  $welcome_object->meta->welcome_img != '')
                            <img src="{{StartPress::getAttachmentBuilder()->get_attachment_url($welcome_object->meta->welcome_img)}}"
                                 alt="{!! isset($welcome_object->meta->welcome_title) ? $welcome_object->meta->welcome_title : '' !!}">
                        @endif
                    </div>
                </div>
                <div class="col-xl-5 wow slideInLeft">
                    <h2 class="sec-title">{!! isset($welcome_object->meta->welcome_title) ? $welcome_object->meta->welcome_title : '' !!}</h2>
                    <div class="desc">
                        <p>{{isset($welcome_object->meta->welcome_desc) ? $welcome_object->meta->welcome_desc : ''}}</p>
                    </div>
                    <div class="button-wrapper">
                        <a href="{{isset($welcome_object->meta->welcome_url) ? $welcome_object->meta->welcome_url : ''}}"
                           class="button-effect">Tư vấn ngay</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endif
