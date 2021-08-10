<?php

use Illuminate\Support\Facades\Route;

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

// Route::get('/', function () {
//     return view('welcome');
// });

Route::get('test', 'TestController@index')->name('index.req');

Route::get('/', function () {
    return route('index.req');
});

Route::get('/req', function () {
    return 'Get请求';
});

# 获取指定路由别名的 URL 地址
Route::get('/req1', function () {
    // 返回指定别名 URL 地址
    return route('index.req');
});

Route::get('hello/{name}/{name11}', function ($name, $shineyork = 'shineyork') {
    return $shineyork. '  --  '.$name;
})->where([
    'name' => '[A-Za-z]',
    'name11' => '[A-Za-z]',
])->where('id', '[A-Za-z]');
