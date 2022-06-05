<?php

namespace StartPress\Core\Providers;

use Illuminate\Foundation\Support\Providers\RouteServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\View;

class ViewServiceProvider extends ServiceProvider
{
    protected $getFinder;
    protected $app;

    public function __construct($app)
    {
        $this->getFinder = View::getFinder();
        $this->app = $app;
        parent::__construct($app);
    }

    public function register()
    {
        $this->registerViewFinder();
    }

    public function registerViewFinder()
    {
        $this->getFinder->prependLocation($this->app['config']['core']['admin-views']);
        $this->getFinder->prependLocation($this->app['config']['core']['theme-views']);
    }
}
