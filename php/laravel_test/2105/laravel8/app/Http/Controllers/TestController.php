<?php

namespace App\Http\Controllers;

use App\Contracts\Db;
use Illuminate\Http\Request;

class TestController extends Controller
{
    public function index()
    {
        dump(app()->make(Db::class)->select());
    }
}
