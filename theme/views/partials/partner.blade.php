@if(isset($partners) && $partners)
    <section id="ifa-section-10" class="partner-wrapper">
        <div class="partner-carousel-wrapper wow slideInLeft">
            <div class="container-fluid">
                <div class="partner-carousel-init">
                    @foreach($partners as $partner)
                        <div class="partner-item">
                            <a href="{{$partner->meta->partner_url}}" title="{{$partner->meta->partner_name}}">
                                @if(isset($partner->meta->partner_img) &&  $partner->meta->partner_img != '')
                                    <img src="{{StartPress::getAttachmentBuilder()->get_attachment_url($partner->meta->partner_img)}}"
                                        alt="{{$partner->meta->partner_name}}">
                                @endif
                            </a>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </section>
@endif
