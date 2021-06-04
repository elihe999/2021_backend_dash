<?php

namespace App\Http\Controllers\Order;

use Request;
use App\Http\Controllers\Controller;

class LoginController extends Controller
{
    public function index()
    {
        return Request::input('name');
        // return $request->name;
        //  return 'this is app http index index';
    }

    public function demo()
    {
        return 'this is app http index index';
    }

    public function demo1()
    {
        return 'this is app http index index';
    }
}
