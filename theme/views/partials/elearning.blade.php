<section id="chuong-trinh-elearning" class="elearning-wrapper">
    <div class="container">
        <div class="section-heading wow slideInLeft">
            <h2 class="section-title-style-2">{!! isset($elearning_object->meta->elearning_object_title) ? $elearning_object->meta->elearning_object_title : '' !!}</h2>
            <p class="subtitle">
                {{isset($elearning_object->meta->elearning_object_desc) ? $elearning_object->meta->elearning_object_desc : ''}}
            </p>
        </div>
    </div>
    @if(isset($elearnings) && $elearnings)
    <div class="elearning-carousel-wrapper">
        <div class="elearning-carousel">
            @foreach($elearnings as $i => $elearning)
                <div class="box-wrapper wow bounceInUp" data-wow-delay="0.{{$i}}s">
                    <div class="elearning-box">
                        <div class="box-img">
                            <a href="{{$elearning->meta->elearning_url}}" title="{{$elearning->meta->elearning_name}}">
                                @if(isset($elearning->meta->elearning_img) &&  $elearning->meta->elearning_img != '')
                                    <img src="{{StartPress::getAttachmentBuilder()->get_attachment_url($elearning->meta->elearning_img)}}"
                                         alt="{{$elearning->meta->elearning_name}}">
                                @endif
                            </a>
                        </div>
                        <div class="box-content">
                            <h3 class="box-title"><a href="{{$elearning->meta->elearning_url}}" title="{{$elearning->meta->elearning_name}}">{{$elearning->meta->elearning_name}}</a></h3>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
    @endif
</section>
