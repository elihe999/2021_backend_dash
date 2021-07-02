<?php

namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\LoginRequest;
use Illuminate\Http\Request;
use Session;
class LoginController extends Controller
{
    //
    public function login(Request $request) {
       /* if ($request->method() == 'POST') {
            //验证器
            $request->validate([
                'username' => 'required|max:16|min:6',
                'password' => 'required|max:16|min:12',
            ]);
            return '管理员登入成功';
        }else if (Session::get('errors')) {
            //输出结果
            return Session::get('errors');
        }*/

        return view('login');
    }
    //自定义验证器判断
    public function enter(LoginRequest $request) {
        return $request->validated();
    }
    public function error() {
        return '错误页面';
    }
}
