$(function () {
    let attachment_details_modal = $('#attachment-details-modal');
    let attachments = $('.attachments');
    let page = 1;
    jQuery.extend({
        getMedia: function (page) {
            var result = null;
            $.ajax({
                url: ajax_url_get_media + '?page=' + page,
                type: 'GET',
                data: {
                    "_token": $('meta[name="_token"]').attr('content')
                },
                dataType: 'JSON',
                async: false,
                success: function (data) {
                    result = data;
                    if (data['data']) {
                        data['data'].forEach(function (attachment) {
                            attachments.append(
                                '<li class="attachment" data-id="' + attachment['ID'] + '">' +
                                '<div class="attachment-preview">' +
                                '<div class="thumbnail">' +
                                '<img src="' + attachment['url'] + '" alt="">' +
                                '</div>' +
                                '</div>' +
                                '</li>'
                            );
                        });
                    }
                    let attachment = attachments.find('.attachment');
                    setTimeout(function () {
                        attachment.height(attachment.width());
                    }, 200);
                }
            });
            return result;
        }
    });

    var first_page = $.getMedia(1)['data'];
    var allMedia = first_page;
    $(window).scroll(function () {
        if ($(window).scrollTop() == $(document).height() - $(window).height()) {
            page++;
            allMedia = allMedia.concat($.getMedia(page)['data']);
        }
    });

    $(document).on('click', '.attachment', function () {
        let ID = $(this).attr('data-id');
        let attachment = allMedia.filter(obj => {
            return obj.ID === parseInt(ID)
        });
        attachment_details_modal.find('.attachment-preview-wrap img').attr('src', attachment[0]['url']);
        attachment_details_modal.find('#author').val(attachment[0]['author']);
        attachment_details_modal.find('#attachment-link').val(attachment[0]['url']);
        attachment_details_modal.find('#attachment_alt').val(attachment[0]['alt']);
        attachment_details_modal.find('#attachment_title').val(attachment[0]['name']);
        attachment_details_modal.find('#attachment_caption').val(attachment[0]['caption']);
        attachment_details_modal.find('#attachment_description').val(attachment[0]['description']);
        attachment_details_modal.find('#attachment_ID').val(ID);
        attachment_details_modal.find('.attachment-details-wrap .attachment-info').html('');
        attachment_details_modal.find('.attachment-details-wrap .attachment-info').append(
            '<li>' +
            '<span>T??n t???p tin:</span> ' + attachment[0]['name'] +
            '</li>' +
            '<li>' +
            '<span>Lo???i t???p tin:</span> ' + attachment[0]['type'] +
            '</li>' +
            '<li>' +
            '<span>???? t???i l??n v??o l??c:</span> ' + attachment[0]['uploaded'] +
            '</li>' +
            '<li>' +
            '<span>Dung l?????ng t???p:</span> ' + attachment[0]['file_size'] +
            '</li>' +
            '<li>' +
            '<span>K??ch th?????c:</span> ' + attachment[0]['dimensions'] +
            '</li>'
        );
        attachment_details_modal.modal('show');
    });

    $('#attachment_alt, #attachment_title, #attachment_caption, #attachment_description').on('change', function () {
        $.ajax({
            url: edit_attachment,
            type: 'POST',
            data: {
                "_token": $('meta[name="_token"]').attr('content'),
                "attachment_id": $('#attachment_ID').val(),
                "alt": $('#attachment_alt').val(),
                "title": $('#attachment_title').val(),
                "caption": $('#attachment_caption').val(),
                "description": $('#attachment_description').val(),
            },
            dataType: 'JSON',
            success: function (data) {
                if (data['success'] === true) {
                    toastr.success('T???p tin ???? ???????c c???p nh???t.');
                } else {
                    toastr.warning('???? c?? l???i x???y ra.');
                }
            }
        });
    });

    $('#delete-attachment-button').on('click', function () {
        if (confirm('B???n s??? xo?? v??nh vi???n m???c n??y kh???i trang web c???a b???n.\nH??nh ?????ng n??y kh??ng th??? ho??n t??c.\nClick v??o "Hu???" ????? d???ng l???i, ho???c "OK" ????? xo??.')) {
            let attachment_id = $('#attachment_ID').val();
            $.ajax({
                url: delete_attachment,
                type: 'POST',
                data: {
                    "_token": $('meta[name="_token"]').attr('content'),
                    "attachment_id": attachment_id
                },
                dataType: 'JSON',
                success: function (data) {
                    if (data['success'] === true) {
                        attachment_details_modal.modal('hide');
                        toastr.success('T???p tin ???? ???????c xo??.');
                        setTimeout(
                            function () {
                                location.reload();
                            }, 500);
                    } else {
                        toastr.warning('???? c?? l???i x???y ra.');
                    }
                }
            });
        }
    });
});
