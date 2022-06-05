<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="_token" content="{{ csrf_token() }}">
    <title>@yield('title') ‹ {{$site_info['site_name']}} — StartPress</title>
    {!! StartPress::adminHeaderScripts() !!}
    <script type="text/javascript">
        var ajax_url_upload_media = '{{ route('new-media') }}',
            ajax_url_get_media = '{{ route('get-media-from-ajax') }}',
            edit_attachment = '{{ route('edit-attachment') }}',
            delete_attachment = '{{route('delete-attachment')}}',
            media_insert = '';
    </script>
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">

    <!-- Navbar -->
@include ('dashboard.navbar')
<!-- /.navbar -->

    <!-- Main Sidebar Container -->
{!! StartPress::adminSidebar() !!}

<!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="capitalize-first-letter">@yield('title')</h1>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    @if (Session::has('error'))
                        <div class="col-lg-12">
                            <div class="callout callout-danger capitalize-first-letter">
                                {!! Session::get('error') !!}
                            </div>
                        </div>
                    @endif
                    @if (Session::has('success'))
                        <div class="col-lg-12">
                            <div class="callout callout-info capitalize-first-letter">
                                {!! Session::get('success') !!}
                            </div>
                        </div>
                    @endif
                    @if($errors->all())
                        @foreach($errors->all() as $error)
                            <div class="col-12">
                                <div class="callout callout-danger capitalize-first-letter">
                                    {{ $error }}
                                </div>
                            </div>
                        @endforeach
                    @endif
                </div>
                @yield('content')
            </div>
        </section>
    </div>
    <!-- /.content-wrapper -->

    <!-- Control Sidebar -->
@include ('dashboard.control-sidebar')
<!-- /.control-sidebar -->

    <!-- Main Footer -->
    <footer class="main-footer">
        <!-- To the right -->
        <div class="float-right d-none d-sm-inline">
            Phiên bản 1.0
        </div>
        <!-- Default to the left -->
        <strong>Copyright &copy; 2021 <a href="https://startpress.net">StartPress Solution</a></strong>
    </footer>
</div>
{!! StartPress::adminFooterScripts() !!}
@yield('script')
</body>
</html>
