<section id="quy-trinh-dao-tao" class="timeline-wrapper">
    <div class="container">
        <div class="section-heading wow bounceInUp">
            <h2 class="section-title-style-2">{!! isset($timeline_object->meta->timeline_object_title) ? $timeline_object->meta->timeline_object_title : '' !!}</h2>
            <p class="subtitle">
                {{isset($timeline_object->meta->timeline_object_desc) ? $timeline_object->meta->timeline_object_desc : ''}}
            </p>
        </div>
        <div class="timeline-content">
            <div class="timeline-left">
                @if(isset($timelines) && $timelines)
                    @foreach($timelines as $row => $timeline)
                        @if($row %2 !== 0)
                            @continue
                        @endif
                        <div class="timeline-item wow bounceInUp" data-wow-delay="0.2s">
                            <div class="content">
                                <h3 class="title">{{$timeline->meta->timeline_name}}</h3>
                                <p class="desc">{{$timeline->meta->timeline_desc}}</p>
                            </div>
                        </div>
                    @endforeach
                @endif
            </div>
            <div class="timeline-center">

            </div>
            <div class="timeline-right">
                @if(isset($timelines) && $timelines)
                    @foreach($timelines as $row => $timeline)
                        @if($row %2 === 0)
                            @continue
                        @endif
                        <div class="timeline-item wow bounceInUp" data-wow-delay="0.2s">
                            <div class="content">
                                <h3 class="title">{{$timeline->meta->timeline_name}}</h3>
                                <p class="desc">{{$timeline->meta->timeline_desc}}</p>
                            </div>
                        </div>
                    @endforeach
                @endif
            </div>
        </div>
    </div>
</section>
