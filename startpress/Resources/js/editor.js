$(function () {
    $('#insert-media-button').on('click', function () {
        media_insert = 'insert-post';
    });

    $('#featured-image-select-button').on('click', function () {
        media_insert = 'featured-image';
    });

    $('#featured-image-delete-button').on('click', function () {
        $('.featured-image-preview').find('img').attr('src', '');
        $('#featured_image').removeAttr('value');
    });
});
