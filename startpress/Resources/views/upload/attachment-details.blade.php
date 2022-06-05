<div class="modal fade attachment-details-modal" id="attachment-details-modal">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Attachment details</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="attachment-preview-wrap">
                            <img src="" alt="">
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="attachment-details-wrap">
                            <ul class="attachment-info">

                            </ul>
                            <hr>
                            <form id="editAttachment" class="form-horizontal" method="post" action="">
                                <div class="form-group row">
                                    <label for="attachment_alt" class="col-sm-4 col-form-label">Văn bản thay thế</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="attachment_alt" name="attachment_alt">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="attachment_title" class="col-sm-4 col-form-label">Tiêu đề</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="attachment_title" name="attachment_title">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="attachment_caption" class="col-sm-4 col-form-label">Chú thích</label>
                                    <div class="col-sm-8">
                                        <textarea class="form-control" rows="3" id="attachment_caption" name="attachment_caption"></textarea>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="attachment_description" class="col-sm-4 col-form-label">Mô tả</label>
                                    <div class="col-sm-8">
                                        <textarea class="form-control" rows="3" id="attachment_description" name="attachment_description"></textarea>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="author" class="col-sm-4 col-form-label">Tải lên bởi</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="author" disabled>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="attachment-link" class="col-sm-4 col-form-label">Địa chỉ file</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="attachment-link" readonly>
                                    </div>
                                </div>
                                <input type="hidden" id="attachment_ID">
                                {{ csrf_field() }}
                                <hr>
                                <div class="text-right">
                                    <a id="delete-attachment-button" class="btn btn-danger">Xoá vĩnh viễn</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
