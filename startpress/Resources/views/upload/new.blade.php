@extends('dashboard.app')
@section('title', 'Tải lên')
@section('content')
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
                             role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
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
@endsection
