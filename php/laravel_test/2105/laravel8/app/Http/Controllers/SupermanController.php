<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Factory\SupermanFactory;

class SupermanController extends Controller
{
    public $power;

    public function __construct(array $modules)
    {
//        $this->power = array(
//            new FlyServices(1000,24),
//            new FlyServices(1000,24),
//            new FlyServices(1000,24),
//            new FlyServices(1000,24),
//        );
//        $factory = new SupermanFactory;
//        $factory->makeModule('fly',[1000,24]);
//        $factory->makeModule('fly',[1000,24]);
//        $factory->makeModule('fly',[1000,24]);
//        $factory->makeModule('fly',[1000,24]);
//        $factory->makeModule('fly',[1000,24]);
//        foreach ($modules as $name => $moduleOpeion){
//            $this->power[] = $factory->makeModule($name,$moduleOpeion);
//        }

        $this->power = app('power');
    }
}
