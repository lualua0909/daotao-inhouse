<?php

namespace StartPress\Core\Facades;

use Illuminate\Support\Facades\Facade;
use StartPress\Core\Helpers\Helpers;

/**
 * Class StartPressFacade
 */
class StartPressFacade extends Facade
{
    /**
     * @return string
     */
    protected static function getFacadeAccessor(): string
    {
        return Helpers::class;
    }
}
