<?php

return [
    /*
    |--------------------------------------------------------------------------
    | Define which assets will be available through the asset manager
    |--------------------------------------------------------------------------
    */
    'assets' => [
        // css
        'css' => [
            'bootstrap' => ['local' => 'assets/lib/bootstrap/css/bootstrap.min.css'],
            'fontawesome' => ['local' => 'assets/lib/fontawesome/css/all.min.css'],
            'mmenu' => ['local' => 'assets/lib/mmenu/css/mmenu.css'],
            'slick' => ['local' => 'assets/lib/slick/slick.css'],
            'slick-theme' => ['local' => 'assets/lib/slick/slick-theme.css'],
            'wow' => ['local' => 'assets/lib/wow/animate.css'],
            'toastr' => ['local' => 'assets/lib/toastr/toastr.min.css'],
            'style' => ['local' => 'assets/css/style.css'],
        ],

        // js
        'js' => [
            'jquery' => ['local' => 'assets/lib/jquery/jquery-3.2.1.min.js'],
            'bootstrap' => ['local' => 'assets/lib/bootstrap/js/bootstrap.min.js', 'footer' => true],
            'mmenu' => ['local' => 'assets/lib/mmenu/js/mmenu.js', 'footer' => true],
            'slick' => ['local' => 'assets/lib/slick/slick.min.js', 'footer' => true],
            'wow' => ['local' => 'assets/lib/wow/wow.min.js', 'footer' => true],
            'toastr' => ['local' => 'assets/lib/toastr/toastr.min.js', 'footer' => true],
            'validate' => ['local' => 'assets/lib/jquery-validation/jquery.validate.min.js', 'footer' => true],
            'script' => ['local' => 'assets/js/script.js', 'footer' => true],
        ]
    ],

    /*
    |--------------------------------------------------------------------------
    | Register nav menus
    |--------------------------------------------------------------------------
    */
    'register_menus' => [
        'primary-menu' => 'Primary menu',
        'footer-menu' => 'Footer menu',
    ]
];
