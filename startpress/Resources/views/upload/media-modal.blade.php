<div class="modal fade media-modal" id="media-modal">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Thêm media</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <ul class="nav nav-tabs" id="media-tab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" id="upload-tab" data-toggle="pill" href="#media-upload" role="tab"
                           aria-controls="media-upload" aria-selected="true">Tải lên</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="select-media-tab" data-toggle="pill" href="#select-media" role="tab"
                           aria-controls="select-media" aria-selected="false">Media</a>
                    </li>
                </ul>
                <div class="tab-content" id="media-tabContent">
                    <div class="tab-pane fade show active" id="media-upload" role="tabpanel"
                         aria-labelledby="upload-tab">
                        <div class="row">
                            <div class="col-md-12">
                                <div id="actions" class="row">
                                    <div class="col-lg-6">
                                        <div class="btn-group w-100">
                                              <span class="btn btn-success col fileinput-button">
                                                <i class="fas fa-plus"></i>
                                                <span>Chọn tập tin</span>
                                              </span>
                                            <button type="submit" class="btn btn-primary col start">
                                                <i class="fas fa-upload"></i>
                                                <span>Tải lên</span>
                                            </button>
                                            <button type="reset" class="btn btn-warning col cancel">
                                                <i class="fas fa-times-circle"></i>
                                                <span>Huỷ</span>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 d-flex align-items-center">
                                        <div class="fileupload-process w-100">
                                            <div id="total-progress" class="progress progress-striped active"
                                                 role="progressbar" aria-valuemin="0" aria-valuemax="100"
                                                 aria-valuenow="0">
                                                <div class="progress-bar progress-bar-success" style="width:0%;"
                                                     data-dz-uploadprogress></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="table table-striped files" id="previews">
                                    <div id="template" class="row mt-2">
                                        <div class="col-auto">
                                            <span class="preview"><img src="data:," alt="" data-dz-thumbnail/></span>
                                        </div>
                                        <div class="col d-flex align-items-center">
                                            <p class="mb-0">
                                                <span class="lead" data-dz-name></span>
                                                (<span data-dz-size></span>)
                                            </p>
                                            <strong class="error text-danger" data-dz-errormessage></strong>
                                        </div>
                                        <div class="col-4 d-flex align-items-center">
                                            <div class="progress progress-striped active w-100" role="progressbar"
                                                 aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
                                                <div class="progress-bar progress-bar-success" style="width:0%;"
                                                     data-dz-uploadprogress></div>
                                            </div>
                                        </div>
                                        <div class="col-auto d-flex align-items-center">
                                            <div class="btn-group">
                                                <button class="btn btn-primary start">
                                                    <i class="fas fa-upload"></i>
                                                    <span>Tải lên</span>
                                                </button>
                                                <button data-dz-remove class="btn btn-warning cancel">
                                                    <i class="fas fa-times-circle"></i>
                                                    <span>Huỷ</span>
                                                </button>
                                                <button data-dz-remove class="btn btn-danger delete">
                                                    <i class="fas fa-trash"></i>
                                                    <span>Xoá</span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="select-media" role="tabpanel" aria-labelledby="select-media-tab">
                        <div class="row">
                            <div class="col-lg-9">
                                <div class="media-wrap">
                                    <ul class="attachments">

                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="attachment-details-wrap">
                                    <h5>Chi tiết tập tin</h5>
                                    <hr>
                                    <div class="attachment-preview-wrap">
                                        <img src="" alt="">
                                    </div>
                                    <hr>
                                    <ul class="attachment-info">

                                    </ul>
                                    <hr>
                                    <form id="editAttachment" class="form-horizontal" method="post" action="">
                                        <div class="form-group row">
                                            <label for="attachment_alt" class="col-sm-4 col-form-label">Văn bản thay
                                                thế</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" id="attachment_alt"
                                                       name="attachment_alt">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="attachment_title" class="col-sm-4 col-form-label">Tiêu đề</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" id="attachment_title"
                                                       name="attachment_title">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="attachment_caption" class="col-sm-4 col-form-label">Chú
                                                thích</label>
                                            <div class="col-sm-8">
                                            <textarea class="form-control" rows="3" id="attachment_caption"
                                                      name="attachment_caption"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="attachment_description" class="col-sm-4 col-form-label">Mô
                                                tả</label>
                                            <div class="col-sm-8">
                                            <textarea class="form-control" rows="3" id="attachment_description"
                                                      name="attachment_description"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="author" class="col-sm-4 col-form-label">Tải lên bởi</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" id="author" disabled>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="attachment-link" class="col-sm-4 col-form-label">Địa chỉ
                                                file</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" id="attachment-link" readonly>
                                            </div>
                                        </div>
                                        <input type="hidden" id="attachment_ID">
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="media-toolbar text-right">
                    <button type="button" class="btn btn-info" id="media-select-button">Chọn ảnh</button>
                </div>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
