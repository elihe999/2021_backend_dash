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

Route::get('/', function () {
    return view('welcome');
});

//Route::post('test', function () {
//    return 'test route';
//});

//Route::any('test', function () {
//    return 'test route';
//});

//Route::match(['get','post'],'test', function () {
//    return 'test route';
//});



//Route::match(['get','post'],'hello', function () {
//    return 'hello laravel8';
//});

//Route::redirect('master', 'zoe',301);
//Route::get('zoe', function () {
//    return 'hello zoe';
//});

//Route::permanentRedirect('master', 'zoe');


//Route::get('zoe/{id}/{name?}', function ($id,$name='jace') {
//    return 'hello zoe'.$id.'-'.$name;
//})->where(['name'=>'[a-z]+']);
//
//Route::get('zed/{id}',function ($id){
//    return 'hello zed'.$id;
//});

//Route::get('index',[\App\Http\Controllers\TestController::class,'index']);
//Route::get('index',['App\Http\Controllers\TestController','index']);
//
//Route::get('test',function (){
//
//    echo \App\Http\Controllers\TestController::class;
//
//    echo '\App\Http\Controllers\TestController';
//
//});

//Route::view('test','test',['id'=>10]);


//Route::get('test', function () {
//    return view('test',['id'=>100]);
//});

//Route::get('test',['App\Http\Controllers\TestController','test']);

//Route::get('name', function () {
//    return '路由命名-will';
//})->name('rename');
//
////使用路由命名重定向
//Route::get('will', function () {
//    return redirect()->route('rename');
//});

//使用路由命名重定向 带参数
//Route::get('name/{id}', function ($id) {
//    return '路由命名-will'.$id;
//})->name('rename');
//
//
//Route::get('will/{id}', function ($id) {
//    return redirect()->route('rename',['id'=>$id]);
//});

//使用路由命名 为指定路由生产URL

//Route::get('index/{id}',['App\Http\Controllers\TestController','index'])->name('test.index');
//
//Route::get('test/url',['App\Http\Controllers\TestController','url']);

//回退路由
//Route::fallback(function (){
//    return redirect('/');
//});

//Route::fallback(function (){
//    return view('404');
//});

//
//Route::prefix('api')->get('index',['App\Http\Controllers\TestController','index']);
//
//
//Route::prefix('api')->get('zoe',function (){
//    return 'hello zoe';
//});

//Route::group(['prefix'=>'api','middleware'=>['first'],'domain'=>'xxx.com'],function (){
//
//    Route::get('index',['App\Http\Controllers\TestController','index']);
//
//    Route::get('zoe',function (){
//        return 'hello zoe';
//    });
//
//});


//路由名称前缀
//
//Route::name('admin.')->group(function (){
//        Route::get('users',function (){
//        return 'user路由 路由名称前缀admin - URI';
//    })->name('re_users');
//
//    Route::get('students',function (){
//        return 'students路由 路由名称前缀admin';
//    })->name('re_students');
//
//});

//
//Route::get('test',function (){
////    return redirect()->route('admin.re_users');
////    echo route('admin.re_students');
//
////    return redirect('users');
//   // return redirect()->to('students');
//
//});

//查看当前路由信息
Route::get('info',function (){

//    dump(Route::current()->uri);
//    dump(Route::current()->action);
//    echo Route::currentRouteName();
    echo Route::currentRouteAction();

})->name('info.rename');

Route::get('task',['App\Http\Controllers\TestController','task']);
