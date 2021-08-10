<?php
/**
 * author:六星教育-星空老师
 */

namespace App\Facades\Services;

use App\Services\HelloWorld;
use Illuminate\Support\Facades\Facade;

class HelloWorldFacades extends Facade
{
    public static function getFacadeAccessor()
    {
        return 'hello';
    }
}