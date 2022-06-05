<?php

namespace StartPress\Core\Providers;

use Illuminate\Foundation\AliasLoader;
use Illuminate\Foundation\Support\Providers\RouteServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\View;
use StartPress\Core\Models\Option;

class CoreServiceProvider extends ServiceProvider
{

    /**
     * @var Option
     */
    protected $option;

    public function __construct($app)
    {
        parent::__construct($app);
        $this->option = new Option();
    }

    /**
     * Booting the package.
     */
    public function boot()
    {
        app()->singleton('site_info', function () {
            return [
                'site_name' => $this->option->get('site_name'),
                'site_description' => $this->option->get('site_description'),
                'site_url' => $this->option->get('site_url'),
                'menu_locations' => $this->option->get('menu_locations')
            ];
        });

        View::composer('*', function ($view) {
            $view->with('site_info', [
                'site_name' => $this->option->get('site_name'),
                'site_description' => $this->option->get('site_description'),
                'site_url' => $this->option->get('site_url')
            ]);
        });
    }

    /**
     * Register all modules.
     */
    public function register()
    {
        /**
         *
         */
        $loader = AliasLoader::getInstance();

        /**
         *
         */
        $this->mergeConfigFrom(base_path() . '/startpress/Config/core.php', 'core');

        /**
         *
         */
        $this->mergeConfigFrom(base_path() . '/theme/config.php', 'theme');

        /**
         *
         */
        $this->app->register(RoutingServiceProvider::class);

        /**
         *
         */
        $this->app->register(ViewServiceProvider::class);

        /**
         *
         */
        $this->app->register(AssetServiceProvider::class);

        /**
         *
         */
        $loader->alias('StartPress', 'StartPress\Core\Facades\StartPressFacade');

        /**
         *
         */
        require_once(base_path() . '/startpress/Includes/ThemeHelpers.php');
    }
}
