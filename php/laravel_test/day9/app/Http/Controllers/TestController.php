<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class TestController extends Controller
{
    public function index() {
        return view('view.index')->with('name','winner');
/*
        return view('view.index')->with('name',[
            '0'=>['id'=>1,'name'=>'小明','age'=>36],
            '1'=>['id'=>2,'name'=>'小红','age'=>78],
            '2'=>['id'=>3,'name'=>'小牛','age'=>73],
            '3'=>['id'=>null,'name'=>'小牛','age'=>73],
        ]);*/
    }
}
