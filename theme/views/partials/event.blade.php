<section id="ifa-section-7" class="event-wrapper">
    <div class="container">
        <div class="section-heading wow bounceInUp">
            <h2 class="section-title-style-1">Sự kiện nổi bật</h2>
        </div>
    </div>
    <div class="event-carousel-wrapper wow bounceInUp">
        <div class="container">
            <div class="event-carousel">
                @if($posts)
                    @foreach($posts as $post)
                        <div class="event-box">
                            <div class="box-thumbnail">
                                <a href="{{get_permalink($post)}}">
                                    <img src="{{get_post_thumbnail_url($post)}}" alt="{{ get_the_title($post) }}">
                                </a>
                            </div>
                            <div class="box-content">
                                <h3 class="box-title"><a href="{{get_permalink($post)}}">{{ get_the_title($post) }}</a>
                                </h3>
                            </div>
                        </div>
                    @endforeach
                @endif
            </div>
        </div>
    </div>
</section>
