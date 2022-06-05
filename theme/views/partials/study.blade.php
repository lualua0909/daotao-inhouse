<section id="chuong-trinh-dao-tao" class="study-wrapper">
    <div class="container">
        @if($study_programs)
        @php
            $row = 0;
        @endphp
        @foreach($study_programs as $study_program)
            @php
                $row++;
            @endphp
            @if($row >3)
            @php
                $row = 1;
            @endphp
            @endif
            <div class="study-item">
                <div class="study-heading wow bounceInUp">
                    <h2 class="study-title study-title-style-{{$row}}">
                        <mark>{!! isset($study_program->meta->study_program_title) ? $study_program->meta->study_program_title : '' !!}</mark>
                    </h2>
                </div>
                <div class="study-content wow bounceInUp">
                    <div class="study-box">
                        <div class="box-content">
                            <div class="content-wrap">
                                {!! isset($study_program->meta->study_program_content) ? $study_program->meta->study_program_content : '' !!}
                                <div class="button-wrap">
                                    <a href="{{isset($study_program->meta->study_program_url) ? $study_program->meta->study_program_url : ''}}"
                                       class="action-button">ĐĂNG KÝ NHẬN ĐÀO TẠO</a>
                                </div>
                            </div>
                        </div>
                        <div class="box-image">
                            <div class="images-slideshow">
                                @if($study_program->meta->study_program_gallery && unserialize($study_program->meta->study_program_gallery))
                                    @foreach(unserialize($study_program->meta->study_program_gallery) as $img_ID)
                                        <div class="image-box">
                                            <img
                                                src="{{StartPress::getAttachmentBuilder()->get_attachment_url($img_ID)}}"
                                                alt="Khoá học">
                                        </div>
                                    @endforeach
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        @endforeach
        @endif
    </div>
</section>
