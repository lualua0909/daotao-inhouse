<section id="ifa-section-2" class="why-us-wrapper">
    <div class="container">
        <div class="row">
            <div class="col-xl-6 wow slideInLeft">
                <div class="section-heading">
                    <h2 class="section-title-style-2">{!! isset($why_object->meta->why_object_title) ? $why_object->meta->why_object_title : '' !!}</h2>
                    <p class="subtitle">
                        {{isset($why_object->meta->why_object_desc) ? $why_object->meta->why_object_desc : ''}}
                    </p>
                </div>
                <div class="why-us-img-wrapper">
                    <div class="why-us-img">
                        @if(isset($why_object->meta->why_object_img) &&  $why_object->meta->why_object_img != '')
                            <img
                                alt="{!! isset($why_object->meta->why_object_title) ? $why_object->meta->why_object_title : '' !!}"
                                src="{{StartPress::getAttachmentBuilder()->get_attachment_url($why_object->meta->why_object_img)}}"/>
                        @endif
                    </div>
                </div>
            </div>
            <div class="col-xl-6 wow slideInRight">
                <div class="row">
                    @if(isset($whys) && $whys)
                        @foreach($whys as $why)
                            <div class="col-lg-6">
                                <div class="why-us-card">
                                    <p class="number">{{$why->meta->why_number}}</p>
                                    <h3 class="card-title">{{$why->meta->why_name}}</h3>
                                    <p class="card-content">{{$why->meta->why_desc}}</p>
                                </div>
                            </div>
                        @endforeach
                    @endif`
                </div>
            </div>
        </div>
    </div>
</section>
