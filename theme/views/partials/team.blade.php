<section id="chuyen-gia" class="team-wrapper">
    <div class="container">
        <div class="row flex-row-reverse">
            <div class="col-lg-6 wow slideInRight">
                <div class="section-heading">
                    <h2 class="section-title-style-2">{!! isset($member_object->meta->member_object_title) ? $member_object->meta->member_object_title : '' !!}</h2>
                    <p class="subtitle">
                        {{isset($member_object->meta->member_object_desc) ? $member_object->meta->member_object_desc : ''}}
                    </p>
                    <div class="button-wrapper">
                        <a href="{{isset($member_object->meta->member_object_url) ? $member_object->meta->member_object_url : ''}}" class="button-effect">Tư vấn ngay</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 wow slideInLeft">
                <div class="member-carousel">
                    @if(isset($members) && $members)
                        @foreach($members as $member)
                            <div class="member-item">
                                <div class="member-card">
                                    <div class="avatar">
                                        @if(isset($member->meta->member_img) &&  $member->meta->member_img != '')
                                            <img src="{{StartPress::getAttachmentBuilder()->get_attachment_url($member->meta->member_img)}}"
                                                alt="{{$member->meta->member_name}}">
                                        @endif
                                    </div>
                                    <div class="info">
                                        <h3 class="name">{{$member->meta->member_name}}</h3>
                                        <p>{{$member->meta->member_desc}}</p>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    @endif
                </div>
            </div>
        </div>
    </div>
</section>
