@extends('dashboard.app')
@section('title', 'Menu')
@section('content')
    @if((int)$menu_id !== 0 || count($menus) > 0)
        <form action="{{route('menus')}}" method="get">
            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group">
                        @if($menus)
                            <div class="row align-items-center">
                                <div class="col-xl-3">
                                    <label class="mb-0" for="select-menu-to-edit">Chọn menu để sửa:</label>
                                </div>
                                <div class="col-xl-5">
                                    <select class="form-control" id="select-menu-to-edit" name="menu">
                                        @foreach($menus as $m)
                                            <option
                                                value="{{$m->term_id}}" {{ (int)$menu_id === (int)$m->term_id ? 'selected': ''}}>{{$m->term->name}}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="col-xl-1">
                                    <button type="submit" class="btn btn-info">Chọn</button>
                                </div>
                                <div class="col-xl-3">
                                    <a type="button" class="btn btn-default" href="{{route('menus', 'menu=0')}}">Tạo
                                        menu
                                        mới</a>
                                </div>
                            </div>
                        @endif
                    </div>
                </div>
            </div>
        </form>
    @endif
    <div class="row">
        <div class="col-lg-3">
            <h5 class="mt-4 mb-2">Thêm liên kết</h5>
            <div id="accordion" class="meta-box">
                <div class="card card-light">
                    <div class="card-header">
                        <h4 class="card-title w-100">
                            <a class="d-block w-100" data-toggle="collapse" href="#collapseOne" aria-expanded="true">
                                Liên kết tự tạo
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="collapse show" data-parent="#accordion" style="">
                        <div class="card-body">
                            <div class="form-group">
                                <label for="custom-menu-item-url">URL</label>
                                <input type="text" class="form-control" id="custom-menu-item-url"
                                       name="custom-menu-item-url">
                            </div>
                            <div class="form-group">
                                <label for="custom-menu-item-name">Tên đường dẫn</label>
                                <input type="text" class="form-control" id="custom-menu-item-name"
                                       name="custom-menu-item-name">
                            </div>
                            <div class="form-group mb-0 text-right">
                                <button type="button" class="btn btn-info capitalize-first-letter"
                                        id="submit-custom-link">
                                    Thêm vào menu
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-9">
            <h5 class="mt-4 mb-2">Cấu trúc menu</h5>
            <div class="card card-light">
                <form action="" method="post">
                    <div class="card-header">
                        <div class="row align-items-center">
                            <div class="col-xl-1">
                                <label for="menu-name" class="w-100 font-weight-normal mb-0">Tên menu</label>
                            </div>
                            <div class="col-xl-3">
                                <input type="text" class="form-control" id="menu-name" name="menu-name"
                                       value="{{ isset($menu->term->name) ? $menu->term->name : '' }}">
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="dd" id="menu-sortable">
                            <ul class="dd-list first-menu">
                                {!! StartPress::getMenuEditorBuilder()->menuItemsStructure($menu_items) !!}
                            </ul>
                        </div>
                        <hr>
                        <h5 class="mt-4 mb-2">Thiếp lập menu</h5>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-xl-2">
                                    <h6>Hiển thị vị trí</h6>
                                </div>
                                <div class="col-xl-10">
                                    <div class="form-group">
                                        @if($menu_locations)
                                            @foreach($menu_locations as $slug => $name)
                                                <div class="form-check">
                                                    <input class="form-check-input" name="menu-locations[{{$slug}}]"
                                                           type="checkbox" value="{{(int)$menu_id}}"
                                                        {{isset($menu_locations_db[$slug]) && (int)$menu_locations_db[$slug] === (int)$menu_id ? 'checked': ''}}>
                                                    <label class="form-check-label">{{$name}}</label>
                                                </div>
                                            @endforeach
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" name="serialize" id="serialize" value="">
                    <div class="card-footer">
                        @if((int)$menu_id !== 0)
                            <button type="button" class="btn btn-danger" id="menu-delete-button">Xoá menu</button>
                        @endif
                        <button type="submit"
                                class="btn btn-info float-right">{{ (int)$menu_id === 0 ? 'Tạo menu': 'Lưu menu'}}</button>
                    </div>
                    {{ csrf_field() }}
                </form>
            </div>
        </div>
    </div>
@endsection
@section('script')
    <script>
        $(function () {
            let mav_menu = $('#menu-sortable');
            let serialize = $('#serialize');
            let menu_current = {{$menu_id}};

            if (menu_current === 0) {
                let meta_box = $('.meta-box');
                meta_box.addClass('meta-box-disabled');
                meta_box.find('input').attr('disabled', 'disabled');
                meta_box.find('button').attr('disabled', 'disabled');
            }

            mav_menu.nestable({
                listNodeName: 'ul',
                group: 1
            });

            mav_menu.on('change', function () {
                serialize.val(JSON.stringify(mav_menu.nestable('serialize')));
            });

            $('#submit-custom-link').on('click', function () {
                let item_url = $('#custom-menu-item-url');
                let item_name = $('#custom-menu-item-name');
                $.ajax({
                    url: "{{route('add-menu-item')}}",
                    type: 'POST',
                    data: {
                        "_token": "{{ csrf_token() }}",
                        "item_name": item_name.val(),
                        "item_url": item_url.val()
                    },
                    dataType: 'JSON',
                    success: function (menu_item) {
                        mav_menu.find('.first-menu').append(
                            '<li class="dd-item" data-id="' + menu_item['item_ID'] + '">' +
                            '<div class="dd-handle">' + menu_item['item_name'] + '</div>' +
                            '<div class="menu-item-content">' +
                            '<a class="menu-item-collapse-button collapsed" data-toggle="collapse" href="#collapse-menu-item-' + menu_item['item_ID'] + '" aria-expanded="true">' + menu_item['item_name'] + '</a>' +
                            '<div id="collapse-menu-item-' + menu_item['item_ID'] + '" class="collapse" data-parent="#menu-sortable" style="">' +
                            '<div class="content-wrap">' +
                            '<div class="form-group">' +
                            '<label for="custom-menu-item-url">URL</label>' +
                            '<input type="text" class="form-control" id="custom-menu-item-url-' + menu_item['item_ID'] + '" name="custom-menu-item-url[' + menu_item['item_ID'] + ']" value="' + menu_item['item_url'] + '">' +
                            '</div>' +
                            '<div class="form-group">' +
                            '<label for="custom-menu-item-name">Tên đường dẫn</label>' +
                            '<input type="text" class="form-control" id="custom-menu-item-name-' + menu_item['item_ID'] + '" name="custom-menu-item-name[' + menu_item['item_ID'] + ']" value="' + menu_item['item_name'] + '">' +
                            '</div>' +
                            '<div class="form-group">' +
                            '<div class="form-check">' +
                            '<input class="form-check-input" id="custom-menu-item-target-' + menu_item['item_ID'] + '" name="custom-menu-item-target[' + menu_item['item_ID'] + ']" type="checkbox" value="_blank">' +
                            '<label class="form-check-label">Mở liên kết trong 1 thẻ mới</label>' +
                            '</div>' +
                            '</div>' +
                            '<div class="form-group mb-0 text-right">' +
                            '<button type="button" class="btn btn-info capitalize-first-letter" id="submit-custom-link">Xoá bỏ</button>' +
                            '</div>' +
                            '</div>' +
                            '</div>' +
                            '</div>' +
                            '</li>'
                        );
                        serialize.val(JSON.stringify(mav_menu.nestable('serialize')));
                        item_url.val("");
                        item_name.val("");
                    },
                });
            });

            $('#menu-delete-button').on('click', function () {
                if (confirm('Bạn sẽ xoá vĩnh viễn mục này khỏi trang web của bạn.\nHành động này không thể hoàn tác.\nClick vào "Huỷ" để dừng lại, hoặc "OK" để xoá.')) {
                    $.ajax({
                        url: "{{route('delete-menu', $menu_id)}}",
                        type: 'POST',
                        data: {
                            "_token": "{{ csrf_token() }}",
                        },
                        dataType: 'JSON',
                        success: function (response) {
                            if (response['success'] === true) {
                                toastr.success(response['name'] + ' đã được xoá');
                                setTimeout(
                                    function () {
                                        window.location.href = '{{route('menus')}}';
                                    }, 500);
                            }
                        }
                    });
                }
            });
        });
    </script>
@endsection
