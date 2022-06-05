jQuery(function ($) {
    try {


        window.onscroll = function () {
            is_sticky();
        };
        let header_bottom = $('.header-bottom');
        let header_top = $('.header-top');
        let sticky = header_bottom.offset().top;
        let sticky_2 = header_top.offset().top;

        function is_sticky() {
            if (window.pageYOffset > (sticky + 130)) {
                header_bottom.addClass("animated fadeInDown nav-fixed");
            } else {
                header_bottom.removeClass("animated fadeInDown nav-fixed");
            }

            if (window.pageYOffset > (sticky_2 + 130)) {
                header_top.addClass("animated fadeInDown nav-fixed");
            } else {
                header_top.removeClass("animated fadeInDown nav-fixed");
            }
        }

        new Mmenu("#primary-menu", {
            "pageScroll": true,
            extensions: ["shadow-panels", "fx-panels-slide-100", "border-none", "fullscreen", "position-right"],
            navbars: {
                content: ["prev", "close"]
            },
            setSelected: true,
            searchfield: {
                panel: true
            }
        }, {});

        $('.images-slideshow').slick({
            dots: false,
            arrows: true,
        });

        $('.member-carousel').slick({
            dots: false,
            arrows: true,
            slidesToShow: 2,
            slidesToScroll: 1,
            autoplay: true,
            autoplaySpeed: 3000
        });

        $('.event-carousel').slick({
            dots: false,
            arrows: true,
            slidesToShow: 3,
            slidesToScroll: 1,
            autoplay: true,
            autoplaySpeed: 3000,
            responsive: [
                {
                    breakpoint: 992,
                    settings: {
                        slidesToShow: 2,
                    }
                },
                {
                    breakpoint: 768,
                    settings: {
                        slidesToShow: 1,
                    }
                }
            ]
        });

        $('.partner-carousel-init').slick({
            dots: false,
            arrows: false,
            slidesToShow: 8,
            slidesToScroll: 4,
            autoplay: true,
            autoplaySpeed: 3000,
            responsive: [
                {
                    breakpoint: 1600,
                    settings: {
                        slidesToShow: 8,
                        slidesToScroll: 4,
                    }
                },
                {
                    breakpoint: 1200,
                    settings: {
                        slidesToShow: 4,
                        slidesToScroll: 4,
                    }
                },
            ]
        });

        $('#contact-form').validate({
            rules: {
                company: {
                    required: true
                },
                email: {
                    required: true,
                    email: true,
                },
                full_name: {
                    required: true,
                },
                phone: {
                    required: true,
                }
            },
            messages: {
                company: {
                    required: "Tên công ty là bắt buộc",
                },
                email: {
                    required: "Email là bắt buộc",
                    email: "Email không hợp lệ"
                },
                full_name: {
                    required: "Họ và tên là bắt buộc",
                },
                phone: {
                    required: "Họ và tên là bắt buộc",
                }
            },
            errorElement: 'span',
            errorPlacement: function (error, element) {
                error.addClass('invalid-feedback');
                element.closest('.input-container').append(error);
            },
            highlight: function (element, errorClass, validClass) {
                $(element).addClass('is-invalid');
            },
            unhighlight: function (element, errorClass, validClass) {
                $(element).removeClass('is-invalid');
            },
            submitHandler: function (form) {
                let $inputs = $('#contact-form :input');
                let values = {};
                $inputs.each(function () {
                    values[this.name] = $(this).val();
                });
                $.ajax({
                    url: form_ajax,
                    type: 'POST',
                    data: {
                        "_token": $('meta[name="_token"]').attr('content'),
                        "form-data": values
                    },
                    dataType: 'JSON',
                    success: function (data) {
                        if (data['success'] === true) {
                            $inputs.each(function () {
                                $(this).val('');
                            });
                            toastr.success('Gửi thành công');
                        } else {
                            toastr.success('Đã có lỗi');
                        }
                    }
                });
                event.preventDefault();
            }
        });

        $('#floating-contact-form').validate({
            rules: {
                company_2_1: {
                    required: true
                },
                email_2_4: {
                    required: true,
                    email: true,
                },
                full_name_2_2: {
                    required: true,
                },
                phone_2_3: {
                    required: true,
                }
            },
            messages: {
                company_2_1: {
                    required: "Tên công ty là bắt buộc",
                },
                email_2_4: {
                    required: "Email là bắt buộc",
                    email: "Email không hợp lệ"
                },
                full_name_2_2: {
                    required: "Họ và tên là bắt buộc",
                },
                phone_2_3: {
                    required: "Họ và tên là bắt buộc",
                }
            },
            errorElement: 'span',
            errorPlacement: function (error, element) {
                error.addClass('invalid-feedback');
                element.closest('.input-container').append(error);
            },
            highlight: function (element, errorClass, validClass) {
                $(element).addClass('is-invalid');
            },
            unhighlight: function (element, errorClass, validClass) {
                $(element).removeClass('is-invalid');
            },
            submitHandler: function (form) {
                let $inputs = $('#floating-contact-form :input');
                let values = {};
                $inputs.each(function () {
                    values[this.name] = $(this).val();
                });
                $.ajax({
                    url: form_ajax,
                    type: 'POST',
                    data: {
                        "_token": $('meta[name="_token"]').attr('content'),
                        "form-data-2": values
                    },
                    dataType: 'JSON',
                    success: function (data) {
                        if (data['success'] === true) {
                            $inputs.each(function () {
                                $(this).val('');
                            });
                            toastr.success('Gửi thành công');
                        } else {
                            toastr.success('Đã có lỗi');
                        }
                    }
                });
                event.preventDefault();
            }
        });

        $('#scrollToContact').on('click', function () {
            $('html, body').animate({
                scrollTop: $("#lien-he").offset().top
            }, 1000);
        });

        $('#toggleContactForm').on('click', function () {
            $('.floating-form-wrapper').toggleClass('show');
        });

        $('.primary-menu ul li a').on('click', function () {
            let href = $(this).attr("href");
            if (href.charAt(0) === '#') {
                $('html, body').animate({
                    scrollTop: $(href).offset().top
                }, 1000);
            }
        });

        $(document).mouseup(function (e) {
            let container = $(".adminActions");
            let adminToggle = $('input[name="adminToggle"]');
            let floating_form_wrapper = $('.floating-form-wrapper');

            // if the target of the click isn't the container nor a descendant of the container
            if (!container.is(e.target) && container.has(e.target).length === 0) {
                adminToggle.prop('checked', false);
                floating_form_wrapper.removeClass('show');
            }
        });

    } catch (e) {
        //console.log(e);
    }
});

new WOW().init();
