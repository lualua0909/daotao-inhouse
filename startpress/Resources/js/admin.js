$(function () {

    //Initialize Select2 Elements
    $('.select2').select2()

    $('#new-taxonomy').validate({
        rules: {
            name: {
                required: true
            }
        },
        messages: {
            name: {
                required: "Không được bỏ trống",
            }
        },
        errorElement: 'span',
        errorPlacement: function (error, element) {
            error.addClass('invalid-feedback');
            element.closest('.form-group').append(error);
        },
        highlight: function (element, errorClass, validClass) {
            $(element).addClass('is-invalid');
        },
        unhighlight: function (element, errorClass, validClass) {
            $(element).removeClass('is-invalid');
        }
    });

    $('#newUser').validate({
        rules: {
            user_login: {
                required: true
            },
            email: {
                required: true,
                email: true,
            },
            user_pass: {
                required: true,
                minlength: 8
            }
        },
        messages: {
            user_login: {
                required: "Tên người dùng là bắt buộc",
            },
            email: {
                required: "Email là bắt buộc",
                email: "Email không hợp lệ"
            },
            user_pass: {
                required: "Mật khẩu là bắt buộc",
                minlength: "Mật khẩu tối thiểu 8 ký tự"
            }
        },
        errorElement: 'span',
        errorPlacement: function (error, element) {
            error.addClass('invalid-feedback');
            element.closest('.col-sm-7').append(error);
        },
        highlight: function (element, errorClass, validClass) {
            $(element).addClass('is-invalid');
        },
        unhighlight: function (element, errorClass, validClass) {
            $(element).removeClass('is-invalid');
        }
    });

    $('#editUser').validate({
        rules: {
            email: {
                required: true,
                email: true,
            },
            user_pass: {
                minlength: 8
            }
        },
        messages: {
            email: {
                required: "Email là bắt buộc",
                email: "Email không hợp lệ"
            },
            user_pass: {
                minlength: "Mật khẩu tối thiểu 8 ký tự"
            }
        },
        errorElement: 'span',
        errorPlacement: function (error, element) {
            error.addClass('invalid-feedback');
            element.closest('.col-sm-7').append(error);
        },
        highlight: function (element, errorClass, validClass) {
            $(element).addClass('is-invalid');
        },
        unhighlight: function (element, errorClass, validClass) {
            $(element).removeClass('is-invalid');
        }
    });

    function mediaSetSize() {
        let attachment = $('li.attachment');
        attachment.height(attachment.width());
    }

    mediaSetSize();
    $(window).on('resize', function () {
        mediaSetSize();
    });
});
