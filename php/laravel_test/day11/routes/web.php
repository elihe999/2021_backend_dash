<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('hello',['uses' => 'HelloController@index']);
Route::get('hello1','Hello1@index');
//分层控制器  命令空间来找到文件
Route::get('admin1','Admin\AdminController@two');

Route::namespace('Admin')->group(function (){
    Route::get('admin1','AdminController@index');
});
// 单一控制器
Route::get('slip','Only\SilpController');
Route::get('slipindex','Only\SilpController@index');
//资源控制器
Route::resource('user','Api\UserController');
//资源访问限制
//允许指定方法访问
Route::resource('user1','Api\UserController')->only([
    'index','store'
]);
//不允许指定方法访问
Route::resource('user2','Api\UserController')->except([
    'index','store'
]);

//验证器
Route::any('login','Admin\LoginController@login');
//
Route::any('error','Admin\LoginController@error');
//
Route::any('enter','Admin\LoginController@enter');

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
