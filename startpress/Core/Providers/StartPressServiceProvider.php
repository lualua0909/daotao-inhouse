<?php

namespace StartPress\Core\Providers;

use Illuminate\Foundation\Support\Providers\RouteServiceProvider as ServiceProvider;

class StartPressServiceProvider extends ServiceProvider
{
    public function register()
    {
        $this->app->register(CoreServiceProvider::class);
    }
}
