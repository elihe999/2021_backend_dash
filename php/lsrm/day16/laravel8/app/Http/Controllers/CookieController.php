<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\Validator;

class CookieController extends Controller
{
    public function index(Request $request)
    {
//        return response("设置Cookie")->cookie('name','starsky');
//        $key = $request->cookie('name');
//        dump($key);

//        Cookie::queue('age',100);
//        dump(Cookie::get('age'));

        #删除
//        dump(Cookie::get('age'));
//        $cookie = Cookie::forget('age');
//        return response("删除 Cookie")->withCookie($cookie);
//        dump(Cookie::get('age'));

//        return response("设置Cookie")->cookie('age',100,0.25);
        dump(Cookie::get('age'));
    }

    public function session()
    {
        # 2. session
        # 2.1 写入
//        request()->session()->put('name','王老五');
//        session()->put('age',100);
//        session(["sex" => "男"]);
//        $name= session('name');
//        $age = session('age');
//        $sex = session('sex');
//        dump("名字：".$name."   年龄：".$age."   性别：".$sex);

        #添加数组
//        session()->put(["user" => ["name" => "钻石王老五","age" => 18]]);
//        session()->put("user.sex","男");
//        session()->put("user.status",1);
////        session()->push("user.status",1);本质也是在调用put
//        dump(session('user'));

//        session()->flash('hello','world');
//        dump(session('hello'));
        #获取所有session
//        dump(session()->all());
//        session()->put('add',null);
//        $value = session()->exists('add');
//        dump($value);

        #删除
//        session()->forget('add');
//        dump(session()->all());
//        session()->forget(['user','age']);
//        dump(session()->all());
//        session()->flush();//删除所有的数据
//        dump(session()->all());
    }

//    public function vali(Request $request)
//    {
//        $validate = Validator::make(\request()->all(),[
//           'username' => 'required',
//            'password' => 'required',
//        ]);
//
//        if ($validate->fails()){
//            return $validate->errors();
//        }
//        return '通过验证';
//    }
//
    public function view()
    {
        return view('user');
    }
}
