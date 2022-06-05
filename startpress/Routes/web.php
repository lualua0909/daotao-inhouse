<?php

use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\URL;
use StartPress\Core\Http\Controllers\AdminController;
use StartPress\Core\Http\Controllers\CertificateController;
use StartPress\Core\Http\Controllers\ElearningController;
use StartPress\Core\Http\Controllers\FooterController;
use StartPress\Core\Http\Controllers\FormController;
use StartPress\Core\Http\Controllers\HeaderController;
use StartPress\Core\Http\Controllers\MenusController;
use StartPress\Core\Http\Controllers\OptionController;
use StartPress\Core\Http\Controllers\PartnerController;
use StartPress\Core\Http\Controllers\PostController;
use StartPress\Core\Http\Controllers\StudyProgramsController;
use StartPress\Core\Http\Controllers\TaxonomyController;
use StartPress\Core\Http\Controllers\TeamController;
use StartPress\Core\Http\Controllers\ThemeController;
use StartPress\Core\Http\Controllers\TimelineController;
use StartPress\Core\Http\Controllers\UploadController;
use StartPress\Core\Http\Controllers\UserController;
use StartPress\Core\Http\Controllers\AuthenticationController;
use StartPress\Core\Http\Controllers\WelcomeController;
use StartPress\Core\Http\Controllers\Why2Controller;
use StartPress\Core\Http\Controllers\WhyController;

/**
 * Admin route group
 */
Route::group(['prefix' => 'admin', 'middleware' => 'auth:admin'], function () {
    Route::get('/', [AdminController::class, 'index'])->name('dashboard');

    Route::get('/form-entries', [FormController::class, 'index'])->name('form-entries');

    Route::get('/delete-entry/{id}', [FormController::class, 'delete_entry'])->name('delete-entry');

    /**
     * User route
     */
    Route::group(['prefix' => 'user'], function () {
        Route::get('/all', [UserController::class, 'users'])->name('users');
        Route::match(['get', 'post'], '/new', [UserController::class, 'new'])->name('user-new');
        Route::match(['get', 'post'], '/profile', [UserController::class, 'profile'])->name('profile');
        Route::match(['get', 'post'], '/edit-user/{userID}', [UserController::class, 'profile'])->name('edit-user');
    });

    /**
     * Upload route
     */
    Route::group(['prefix' => 'upload'], function () {
        Route::get('/media', [UploadController::class, 'media'])->name('media');
        Route::match(['get', 'post'], '/new', [UploadController::class, 'new'])->name('new-media');
        Route::post('/attachment-details', [UploadController::class, 'attachmentDetails'])->name('attachment-details');
        Route::post('/edit-attachment', [UploadController::class, 'editAttachment'])->name('edit-attachment');
        Route::post('/delete-attachment', [UploadController::class, 'deleteAttachment'])->name('delete-attachment');
        Route::get('/get-media-from-ajax', [UploadController::class, 'mediaAjax'])->name('get-media-from-ajax');
    });

    /**
     * Taxonomy route
     */

    Route::group(['prefix' => 'taxonomy'], function () {
        Route::match(['get', 'post'], '/{taxonomy}', [TaxonomyController::class, 'taxonomy'])->name('taxonomy');
        Route::match(['get', 'post'], '/edit/{taxonomy_ID}', [TaxonomyController::class, 'editTaxonomy'])->name('edit-taxonomy');
        Route::post('/ajax-create/{taxonomy}', [TaxonomyController::class, 'addNewTaxonomyAjax'])->name('taxonomy-ajax');
    });

    /**
     * Post route
     */
    Route::group(['prefix' => 'post'], function () {
        Route::get('/{post_type}', [PostController::class, 'posts'])->name('posts');
        Route::match(['get', 'post'], '/new/{post_type}', [PostController::class, 'new'])->name('new-post');
        Route::match(['get', 'post'], '/edit/{ID}', [PostController::class, 'edit'])->name('edit-post');
        Route::get('/update-post-status/{ID}/{post_status}', [PostController::class, 'update_post_status'])->name('update-post-status');
    });

    /**
     * Option route
     */
    Route::group(['prefix' => 'options'], function () {
        Route::match(['get', 'post'], '/general', [OptionController::class, 'general'])->name('options-general');
        Route::match(['get', 'post'], '/menus', [MenusController::class, 'menus'])->name('menus');
        Route::post('/add-menu-item', [MenusController::class, 'menu_item'])->name('add-menu-item');
        Route::post('/delete-menu/{menu_id}', [MenusController::class, 'delete_menu'])->name('delete-menu');
        Route::match(['get', 'post'], '/theme-settings', [OptionController::class, 'general'])->name('theme-settings');
        Route::match(['get', 'post'], '/study-programs', [StudyProgramsController::class, 'index'])->name('study-programs');
        Route::post('/add-study-program', [StudyProgramsController::class, 'addStudyProgram'])->name('add-study-program');
        Route::post('/delete-study-program', [StudyProgramsController::class, 'deleteStudyProgram'])->name('delete-study-program');

        Route::match(['get', 'post'], '/welcome', [WelcomeController::class, 'index'])->name('welcome-settings');

        Route::match(['get', 'post'], '/team', [TeamController::class, 'index'])->name('team-settings');
        Route::post('/add-member', [TeamController::class, 'addMember'])->name('add-member');
        Route::post('/delete-member', [TeamController::class, 'deleteMember'])->name('delete-member');

        Route::match(['get', 'post'], '/header', [HeaderController::class, 'index'])->name('header-settings');

        Route::match(['get', 'post'], '/footer', [FooterController::class, 'index'])->name('footer-settings');

        Route::match(['get', 'post'], '/partner', [PartnerController::class, 'index'])->name('partner-settings');

        Route::post('/add-partner', [PartnerController::class, 'addPartner'])->name('add-partner');
        Route::post('/delete-partner', [PartnerController::class, 'deletePartner'])->name('delete-partner');

        Route::match(['get', 'post'], '/certificate', [CertificateController::class, 'index'])->name('certificate-settings');

        Route::post('/add-slide', [CertificateController::class, 'addSlide'])->name('add-slide');
        Route::post('/delete-slide', [CertificateController::class, 'deleteSlide'])->name('delete-slide');
//
//        Route::match(['get', 'post'], '/elearning', [ElearningController::class, 'index'])->name('elearning-settings');
//
//        Route::post('/add-elearning', [ElearningController::class, 'addElearning'])->name('add-elearning');
//        Route::post('/delete-elearning', [ElearningController::class, 'deleteElearning'])->name('delete-elearning');

        Route::match(['get', 'post'], '/timeline', [TimelineController::class, 'index'])->name('timeline-settings');

        Route::post('/add-timeline', [TimelineController::class, 'addTimeline'])->name('add-timeline');
        Route::post('/delete-timeline', [TimelineController::class, 'deleteTimeline'])->name('delete-timeline');

        Route::match(['get', 'post'], '/why', [WhyController::class, 'index'])->name('why-settings');

        Route::post('/add-why', [WhyController::class, 'addWhy'])->name('add-why');
        Route::post('/delete-why', [WhyController::class, 'deleteWhy'])->name('delete-why');

        Route::match(['get', 'post'], '/elearning', [Why2Controller::class, 'index'])->name('elearning-settings');

        Route::post('/add-elearning', [Why2Controller::class, 'addWhy'])->name('add-elearning');
        Route::post('/delete-elearning', [Why2Controller::class, 'deleteWhy'])->name('delete-elearning');

    });
});

Route::post('/form-submit', [FormController::class, 'form_submit'])->name('form-submit');

Route::get('sitemap', function () {

    // create new sitemap object
    $sitemap = App::make("sitemap");

    // add items to the sitemap (url, date, priority, freq)
    $sitemap->add(URL::to('/'), '2021-04-18T07:53:54+00:00', '1.0', 'daily');

    // get all posts from db
    $posts = DB::table('posts')->where('post_type', 'post')->orWhere('post_type', 'page')->orderBy('post_date', 'desc')->get();

    // add every post to the sitemap
    foreach ($posts as $post) {
        $sitemap->add(get_permalink($post), $post->post_date, '0.6', 'daily');
    }

    // generate your sitemap (format, filename)
    $sitemap->store('xml', 'sitemap');
    // this will generate file mysitemap.xml to your public folder
});


/**
 * Login route
 */
Route::match(['get', 'post'], '/login', [AuthenticationController::class, 'login'])->name('login');

/**
 * Logout route
 */
Route::match('get', '/logout', [AuthenticationController::class, 'logout'])->name('logout');

/**
 * Theme route
 */
Route::get('/{slug?}', [ThemeController::class, 'index'])->name('home')->where('slug', '(.*)');

