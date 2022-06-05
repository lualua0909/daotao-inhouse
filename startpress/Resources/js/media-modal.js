$(function () {
    let attachments = $('.attachments');
    let page = 1;
    let attachment_details_wrap = $('.attachment-details-wrap');
    let media_modal = $('.media-modal');
    attachment_details_wrap.hide();
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

    attachments.on('scroll', function () {
        let div = $(this).get(0);
        if (div.scrollTop + div.clientHeight >= div.scrollHeight) {
            page++;
            allMedia = allMedia.concat($.getMedia(page)['data']);
        }
    });

    $('#select-media-tab').on('click', function () {
        let attachment = attachments.find('.attachment');
        setTimeout(function () {
            attachment.height(attachment.width());
        }, 200);
    });

    $(document).on('click', '.attachment', function () {
        let ID = $(this).attr('data-id');
        $('.attachment').removeClass('selected');
        $(this).addClass('selected');
        let attachment = allMedia.filter(obj => {
            return obj.ID === parseInt(ID)
        });
        attachment_details_wrap.find('.attachment-preview-wrap img').attr('src', attachment[0]['url']);
        attachment_details_wrap.find('#author').val(attachment[0]['author']);
        attachment_details_wrap.find('#attachment-link').val(attachment[0]['url']);
        attachment_details_wrap.find('#attachment_alt').val(attachment[0]['alt']);
        attachment_details_wrap.find('#attachment_title').val(attachment[0]['name']);
        attachment_details_wrap.find('#attachment_caption').val(attachment[0]['caption']);
        attachment_details_wrap.find('#attachment_description').val(attachment[0]['description']);
        attachment_details_wrap.find('#attachment_ID').val(ID);
        attachment_details_wrap.find('.attachment-info').html('');
        attachment_details_wrap.find('.attachment-info').append(
            '<li>' +
            '<span>Tên tập tin:</span> ' + attachment[0]['name'] +
            '</li>' +
            '<li>' +
            '<span>Loại tập tin:</span> ' + attachment[0]['type'] +
            '</li>' +
            '<li>' +
            '<span>Đã tải lên vào lúc:</span> ' + attachment[0]['uploaded'] +
            '</li>' +
            '<li>' +
            '<span>Dung lượng tệp:</span> ' + attachment[0]['file_size'] +
            '</li>' +
            '<li>' +
            '<span>Kích thước:</span> ' + attachment[0]['dimensions'] +
            '</li>'
        );
        attachment_details_wrap.show();
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
                    toastr.success('Tập tin đã được cập nhật.');
                } else {
                    toastr.warning('Đã có lỗi xảy ra.');
                }
            }
        });
    });

    media_modal.on('hidden.bs.modal', function () {
        $('.attachment').removeClass('selected');
        $('#attachment_ID').removeAttr('value');
        attachment_details_wrap.hide();
    });

    media_modal.on('shown.bs.modal', function () {
        let attachment = attachments.find('.attachment');
        setTimeout(function () {
            attachment.height(attachment.width());
        }, 200);
    });

    $('#media-select-button').on('click', function () {
        if (media_insert === 'insert-post') {
            tinymce.activeEditor.insertContent('<img alt="' + media_modal.find('#attachment_alt').val() + '" src="' + media_modal.find('#attachment-link').val() + '"/>');
        } else if (media_insert === 'featured-image') {
            $('.featured-image-preview').find('img').attr('src', media_modal.find('#attachment-link').val());
            $('#featured_image').val(media_modal.find('#attachment_ID').val());
        }
        media_modal.modal('hide');
    });
});
