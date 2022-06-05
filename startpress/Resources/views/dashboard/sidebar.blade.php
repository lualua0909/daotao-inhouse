<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="https://startpress.net/"class="brand-link">
        <img src="{{ asset('startpress/core/img/admin-logo.png') }}" alt="StartPress Solutions Logo"
             class="brand-image">
        <span class="brand-text font-weight-light">StartPress Solutions</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                data-accordion="false">
                <!-- Add icons to the links using the .nav-icon class
                     with font-awesome or any other icon font library -->
                @if($adminMenus)
                    @foreach($adminMenus as $itemName => $itemOption)
                        {!! StartPress::getAdminMenuBuilder()->addMenu($itemName, $itemOption) !!}
                    @endforeach
                @endif
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>
