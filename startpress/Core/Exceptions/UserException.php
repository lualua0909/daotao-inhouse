<?php

namespace StartPress\Core\Exceptions;

use Exception;

class UserException extends Exception
{
    public function report()
    {

    }

    public function render($request)
    {
dd( response());
    }
}
