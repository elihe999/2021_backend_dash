<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


class TestController extends Controller
{
    //
    public function index()
    {
        return 'test - index';
    }
    public function test()
    {
        return view('test',['id'=>888]);
    }

    public function url()
    {
        $url = route('test.index',['id'=>888],false);
        return $url;
    }

    public function task()
    {
//    use Illuminate\Routing\Route; 引用错了类的问题
        //正确类是  //use Illuminate\Support\Facades\Route;
        echo Route::currentRouteAction();

    }
}
