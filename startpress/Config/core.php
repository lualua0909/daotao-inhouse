<?php

return [
    /*
   |--------------------------------------------------------------------------
   | Location where your themes are located
   |--------------------------------------------------------------------------
   */
    'admin-views' => base_path() . '/startpress/Resources/views',
    'theme-views' => base_path() . '/theme/views',

    /*
    |--------------------------------------------------------------------------
    | Define which assets will be available through the asset manager
    |--------------------------------------------------------------------------
    */
    'admin-assets' => [
        // css
        'css' => [
            'google-fonts' => ['cdn' => 'https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback'],
            'fontawesome' => ['local' => 'lib/fontawesome-free/css/all.min.css'],
            'icheck-bootstrap' => ['local' => 'lib/icheck-bootstrap/icheck-bootstrap.min.css'],
            'dropzone' => ['local' => 'lib/dropzone/min/dropzone.min.css'],
            'toastr' => ['local' => 'lib/toastr/toastr.min.css'],
            'select2' => ['local' => 'lib/select2/css/select2.min.css'],
            'select2-bootstrap4-theme' => ['local' => 'lib/select2-bootstrap4-theme/select2-bootstrap4.min.css'],
            'adminlte' => ['local' => 'css/adminlte.min.css'],
            'admin' => ['local' => 'css/admin/admin.css'],
        ],

        // js
        'js' => [
            'jquery' => ['local' => 'lib/jquery/jquery.min.js', 'footer' => true],
            'bootstrap' => ['local' => 'lib/bootstrap/js/bootstrap.bundle.min.js', 'footer' => true],
            'validate' => ['local' => 'lib/jquery-validation/jquery.validate.min.js', 'footer' => true],
            'additional-methods' => ['local' => 'lib/jquery-validation/additional-methods.min.js', 'footer' => true],
            'dropzone' => ['local' => 'lib/dropzone/min/dropzone.min.js', 'footer' => true],
            'toastr' => ['local' => 'lib/toastr/toastr.min.js', 'footer' => true],
            'select2' => ['local' => 'lib/select2/js/select2.full.min.js', 'footer' => true],
            'nestable' => ['local' => 'lib/nestable/jquery.nestable.js', 'footer' => true],
            'adminlte' => ['local' => 'js/adminlte.min.js', 'footer' => true],
            'dropzone-config' => ['local' => 'js/dropzone.js', 'footer' => true, 'route' => ['edit-post', 'new-post', 'new-media', 'study-programs', 'welcome-settings', 'team-settings', 'partner-settings', 'certificate-settings', 'elearning-settings', 'why-settings']],
            'media-modal' => ['local' => 'js/media-modal.js', 'footer' => true, 'route' => ['edit-post', 'new-post', 'study-programs', 'welcome-settings', 'team-settings', 'partner-settings', 'certificate-settings', 'elearning-settings', 'why-settings']],
            'media' => ['local' => 'js/media.js', 'footer' => true, 'route' => ['media']],
            'editor' => ['local' => 'js/editor.js', 'footer' => true, 'route' => ['edit-post', 'new-post']],
            'tiny' => ['cdn' => 'https://cdn.tiny.cloud/1/gzm60eumr74koax1op2xrh1v1xuykxmh541h40be8nodgaa7/tinymce/5/tinymce.min.js', 'route' => ['edit-post', 'new-post', 'study-programs'], 'attributes' => ['referrerpolicy' => 'origin']],
            'tinymce' => ['local' => 'js/tinymce.js', 'route' => ['edit-post', 'new-post']],
            'admin' => ['local' => 'js/admin.js', 'footer' => true],
        ]
    ],

    /*
   |--------------------------------------------------------------------------
   | Define capabilities
   |--------------------------------------------------------------------------
   */
    'capabilities' => [
        'administrator' => 'Qu???n tr??? vi??n',
        'editor' => 'Bi??n t???p vi??n',
        'author' => 'T??c gi???',
        'contributor' => 'C???ng t??c vi??n',
        'subscriber' => 'Th??nh vi??n ????ng k??',
    ],

    /*
   |--------------------------------------------------------------------------
   | Define roles
   |--------------------------------------------------------------------------
   */
    'roles' => [
        'administrator' => [
            'name' => 'Qu???n tr??? vi??n',
            'capabilities' => [
                'list_users' => true,
                'create_users' => true,
                'edit_users' => true,
                'delete_users' => true,
                'upload_files' => true,
                'edit_files' => true,
                'manage_categories' => true,
                'edit_posts' => true,
                'edit_others_posts' => true,
                'edit_published_posts' => true,
                'publish_posts' => true,
                'delete_posts' => true,
                'delete_others_posts' => true,
                'delete_published_posts' => true,
                'delete_private_posts' => true,
                'edit_private_posts' => true,
                'read_private_posts' => true,
            ]
        ],
        'editor' => [
            'name' => 'Bi??n t???p vi??n',
            'capabilities' => [
                'upload_files' => true,
                'edit_files' => true,
                'manage_categories' => true,
                'edit_posts' => true,
                'edit_others_posts' => true,
                'edit_published_posts' => true,
                'publish_posts' => true,
                'delete_posts' => true,
                'delete_others_posts' => true,
                'delete_published_posts' => true,
                'delete_private_posts' => true,
                'edit_private_posts' => true,
                'read_private_posts' => true,
            ]
        ],
        'author' => [
            'name' => 'T??c gi???',
            'capabilities' => [
                'upload_files' => true,
                'edit_files' => true,
                'manage_categories' => true,
                'edit_posts' => true,
                'edit_others_posts' => true,
                'edit_published_posts' => true,
                'publish_posts' => true,
                'delete_posts' => true,
                'delete_others_posts' => true,
                'delete_published_posts' => true,
                'delete_private_posts' => true,
                'edit_private_posts' => true,
                'read_private_posts' => true,
            ]
        ],
        'contributor' => [
            'name' => 'C???ng t??c vi??n',
            'capabilities' => [

            ]
        ],
        'subscriber' => [
            'name' => 'Th??nh vi??n ????ng k??',
            'capabilities' => [

            ]
        ]
    ],

    /*
    |--------------------------------------------------------------------------
    | Define admin menu
    |--------------------------------------------------------------------------
    */
    'admin-menus' => [
        'dashboard' => [
            'id' => 'dashboard',
            'title' => 'B???ng tin',
            'route' => 'dashboard',
            'icon' => 'fas fa-tachometer-alt',
        ],
        'form' => [
            'id' => 'form',
            'title' => 'Form',
            'route' => 'form-entries',
            'icon' => 'fas fa-envelope-open-text',
        ],
        'post' => [
            'id' => 'post',
            'title' => 'B??i vi???t',
            'route' => ['posts', 'post'],
            'icon' => 'fas fa-feather-alt',
            'submenu' => [
                'post-all' => [
                    'title' => 'T???t c??? b??i vi???t',
                    'route' => ['posts', 'post'],
                    'icon' => 'far fa-circle',
                    'parent' => 'post'
                ],
                'post-new' => [
                    'title' => 'Vi???t b??i m???i',
                    'route' => ['new-post', 'post'],
                    'icon' => 'far fa-circle',
                    'parent' => 'post'
                ],
                'category' => [
                    'title' => 'Chuy??n m???c',
                    'route' => ['taxonomy', 'category'],
                    'icon' => 'far fa-circle',
                    'parent' => 'post'
                ],
                'post-tag' => [
                    'title' => 'Th???',
                    'route' => ['taxonomy', 'post_tag'],
                    'icon' => 'far fa-circle',
                    'parent' => 'post'
                ],
            ]
        ],
        'upload' => [
            'id' => 'upload',
            'title' => 'Th?? vi???n',
            'route' => 'media',
            'icon' => 'fas fa-photo-video',
            'submenu' => [
                'media-all' => [
                    'title' => 'Th?? vi???n',
                    'route' => 'media',
                    'icon' => 'far fa-circle',
                    'parent' => 'upload'
                ],
                'media-new' => [
                    'title' => 'T???i l??n',
                    'route' => 'new-media',
                    'icon' => 'far fa-circle',
                    'parent' => 'upload'
                ],
            ]
        ],
        'page' => [
            'id' => 'page',
            'title' => 'Trang',
            'route' => ['posts', 'page'],
            'icon' => 'fas fa-copy',
            'submenu' => [
                'page-all' => [
                    'title' => 'T???t c??? c??c trang',
                    'route' => ['posts', 'page'],
                    'icon' => 'far fa-circle',
                    'parent' => 'page'
                ],
                'page-new' => [
                    'title' => 'Th??m trang m???i',
                    'route' => ['new-post', 'page'],
                    'icon' => 'far fa-circle',
                    'parent' => 'page'
                ]
            ]
        ],
        'users' => [
            'id' => 'users',
            'title' => 'Th??nh vi??n',
            'route' => 'users',
            'icon' => 'fas fa-user',
            'submenu' => [
                'user-all' => [
                    'title' => 'T???t c??? ng?????i d??ng',
                    'route' => 'users',
                    'icon' => 'far fa-circle',
                    'parent' => 'users'
                ],
                'user-new' => [
                    'title' => 'Th??m m???i',
                    'route' => 'user-new',
                    'icon' => 'far fa-circle',
                    'parent' => 'users'
                ],
                'profile' => [
                    'title' => 'H??? s??',
                    'route' => 'profile',
                    'icon' => 'far fa-circle',
                    'parent' => 'users'
                ]
            ]
        ],
        'options' => [
            'id' => 'options',
            'title' => 'C??i ?????t',
            'route' => 'options-general',
            'icon' => 'fas fa-cogs',
            'submenu' => [
                'user-all' => [
                    'title' => 'T???ng quan',
                    'route' => 'options-general',
                    'icon' => 'far fa-circle',
                    'parent' => 'options'
                ],
                'menus' => [
                    'title' => 'Menu',
                    'route' => 'menus',
                    'icon' => 'far fa-circle',
                    'parent' => 'options'
                ],
            ]
        ],
        'theme-settings' => [
            'id' => 'theme-settings',
            'title' => 'C??i ?????t website',
            'route' => 'theme-settings',
            'icon' => 'fas fa-cogs',
            'submenu' => [
                'header' => [
                    'title' => 'Header',
                    'route' => 'header-settings',
                    'icon' => 'far fa-circle',
                    'parent' => 'theme-settings'
                ],
                'welcome' => [
                    'title' => 'Welcome',
                    'route' => 'welcome-settings',
                    'icon' => 'far fa-circle',
                    'parent' => 'theme-settings'
                ],
                'why' => [
                    'title' => 'V?? sao ch???n',
                    'route' => 'why-settings',
                    'icon' => 'far fa-circle',
                    'parent' => 'theme-settings'
                ],
                'team' => [
                    'title' => '?????i ng??',
                    'route' => 'team-settings',
                    'icon' => 'far fa-circle',
                    'parent' => 'theme-settings'
                ],
                'timeline' => [
                    'title' => 'Quy tr??nh',
                    'route' => 'timeline-settings',
                    'icon' => 'far fa-circle',
                    'parent' => 'theme-settings'
                ],
                'study-programs' => [
                    'title' => 'Ch????ng tr??nh ????o t???o',
                    'route' => 'study-programs',
                    'icon' => 'far fa-circle',
                    'parent' => 'theme-settings'
                ],
                'elearning' => [
                    'title' => 'Elearning',
                    'route' => 'elearning-settings',
                    'icon' => 'far fa-circle',
                    'parent' => 'theme-settings'
                ],
                'certificate' => [
                    'title' => 'Ch???ng ch???',
                    'route' => 'certificate-settings',
                    'icon' => 'far fa-circle',
                    'parent' => 'theme-settings'
                ],
                'partner' => [
                    'title' => '?????i t??c',
                    'route' => 'partner-settings',
                    'icon' => 'far fa-circle',
                    'parent' => 'theme-settings'
                ],
                'footer' => [
                    'title' => 'Footer',
                    'route' => 'footer-settings',
                    'icon' => 'far fa-circle',
                    'parent' => 'theme-settings'
                ],
            ]
        ],
    ],

    /*
    |--------------------------------------------------------------------------
    | Define image sizes
    |--------------------------------------------------------------------------
    */
    'image_sizes' => [
        'thumbnail' => [
            'width' => 150,
            'height' => 150
        ],
        'medium' => [
            'width' => 300,
            'height' => 300
        ],
        'large' => [
            'width' => 1024,
            'height' => 1024
        ]
    ],

    /*
    |--------------------------------------------------------------------------
    | Define taxonomy
    |--------------------------------------------------------------------------
    */
    'taxonomies' => [
        'category' => [
            'taxonomy' => 'category',
            'name' => 'Chuy??n m???c',
            'post_type' => 'post',
            'parent' => true
        ],
        'post_tag' => [
            'taxonomy' => 'post_tag',
            'name' => 'Th???',
            'post_type' => 'post',
            'parent' => false
        ]
    ],

    /*
    |--------------------------------------------------------------------------
    | Define taxonomy
    |--------------------------------------------------------------------------
    */
    'post_types' => [
        'post' => [
            'name' => 'B??i vi???t',
            'taxonomies' => ['category', 'post_tag'],
            'featured_image' => true,
        ],
        'page' => [
            'name' => 'Trang',
            'featured_image' => true,
        ]
    ],
];
