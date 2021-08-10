<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use phpDocumentor\Reflection\DocBlock\Tags\Var_;
use Hash;
class TestController extends Controller
{
    public function __construct()
    {

    }
    /*public function index() {
        return view('view.index')->with('name','winner');
/*
        return view('view.index')->with('name',[
            '0'=>['id'=>1,'name'=>'小明','age'=>36],
            '1'=>['id'=>2,'name'=>'小红','age'=>78],
            '2'=>['id'=>3,'name'=>'小牛','age'=>73],
            '3'=>['id'=>null,'name'=>'小牛','age'=>73],
        ]);*/
    //访问认证成功的用户
    public function auth() {
        //访问当前用户信息
            dump(Auth::user());
            //返回用户的id
        dump(Auth::id());
    }
    public function authentic(Request $request) {
        $crde = $request->only('email','password');
        dump($crde);  // curl  ob
        if (Auth::attempt($crde)) {
            //intended 重定向到指定url
            return redirect()->intended('view');
        }
    }
    public function test() {
        return '我是认证访问';
    }
    //http的请求认证
    public function basic() {
        dd('winner基础认证');
    }
    //加密
    public function crypt() {
        //加密
       /* $name = encrypt('winner');
        dump($name);
        //解密
        dump(decrypt($name));*/
        //Hash加密
        dump(Hash::make('winner'));
        //hash密码判断
        dump(Hash::check('winner',Hash::make('winner')));
    }

}
