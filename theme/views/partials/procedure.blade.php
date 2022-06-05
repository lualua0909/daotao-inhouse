<section id="quy-trinh-dao-tao" class="procedure-wrapper"
         style="background-image: url({{asset('public/startpress/theme/assets/images/procedure-bg.png')}})">
    <div class="container">
        <div class="section-heading">
            <h2 class="section-title">{!! isset($timeline_object->meta->timeline_object_title) ? $timeline_object->meta->timeline_object_title : '' !!}</h2>
            <p class="subtitle">{{isset($timeline_object->meta->timeline_object_desc) ? $timeline_object->meta->timeline_object_desc : ''}}</p>
        </div>
        <div class="row flex-row-reverse">
            <div class="col-lg-5 d-flex align-items-center">
                <div class="procedure-img">
                    <img src="{{asset('public/startpress/theme/assets/images/procedure-img.png')}}" alt="{!! isset($timeline_object->meta->timeline_object_title) ? $timeline_object->meta->timeline_object_title : '' !!}">
                </div>
            </div>
            <div class="col-lg-7">
                <div class="procedure-content">
                    <ul>
                        @if(isset($timelines) && $timelines)
                            @foreach($timelines as $row => $timeline)
                                <li>
                            <span class="number">
                                {{++$row}}
                            </span>
                                    <div class="content">
                                        <h3 class="procedure-title">{{$timeline->meta->timeline_name}}</h3>
                                        <p class="procedure-desc">{{$timeline->meta->timeline_desc}}</p>
                                    </div>
                                </li>
                            @endforeach
                        @endif
                    </ul>
                </div>
            </div>
        </div>
        <div class="button-wrap">
            <a href="#lien-he" class="action-button">Tư vấn ngay</a>
        </div>
    </div>
</section>
