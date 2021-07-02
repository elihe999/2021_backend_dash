<?php

namespace App\Http\Controllers;
//直接导入Request基类
//use Illuminate\Http\Request;
//门面调用
//use Illuminate\Support\Facades\Request;
//门面别名
use Request;
use Cookie;

class requestController extends Controller
{
    //
    public function index(Request $request) {
        //助手函数引入请求对象
        request();
        //获取所有all
        //获取单个   input : 请求参数+传输数据   post+get
        // 获取单个  query 获取请求参数          get
        //请求字符串的处理   空格   ''转化null
      dd($request->input('winner'));

    }
    public function indexFacade(Request $request) {
        dd($request::input('password'));
        # dd($request::query('winner'));
    }
    public function setcookie() {
        //设置是不能成功
      //$name = cookie('set','winner',60);
        //设置cookie 需要从响应来设置
      return response()->cookie('cookie','setwinner',60);
    }
    public function getCookie() {
        //请求获取
       //return request()->cookie('cookie');
        //门面类
        return Cookie::get('cookie');
    }
    public function delcookie() {
        $coo = Cookie::forget('cookie');
        return response('')->cookie($coo);
    }
    //操作session
    public function setsession() {
       //设置session  通过请求类
        //return request()->session()->put('name','winner');
        //助手函数  通过数组来设置
     // session(['name1'=>'winner1','list'=>'45465']);
        //获取所有session
        //$data = request()->session()->all();dd($data);

        //获取单个指名session
       //return  session('name5','4564566');
       //删除session  一个forget    多个flush
       return request()->session()->get('list');
    }
}
