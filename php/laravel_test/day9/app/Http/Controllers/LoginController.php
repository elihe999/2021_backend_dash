<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class LoginController extends Controller
{
    public function index(Request $request) {
        if ($request->method() == 'POST') {
            return 'username:'.$request->input('username').'password：'.$request->input('password');
        }
    }
}
