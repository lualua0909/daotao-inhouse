<?php

namespace StartPress\Core\Providers;

use Illuminate\Foundation\Support\Providers\RouteServiceProvider as ServiceProvider;
use StartPress\Core\Foundation\Asset\AssetManager;
use StartPress\Core\Foundation\Asset\StartPressAssetManager;


class AssetServiceProvider extends ServiceProvider
{
    /**
     * Register the service provider.
     * @return void
     */
    public function register()
    {
        $this->bindAssetClasses();
    }

    /**
     * Bind classes related to assets
     */
    private function bindAssetClasses()
    {
        $this->app->singleton(AssetManager::class, function () {
            return new StartPressAssetManager();
        });
    }
}
