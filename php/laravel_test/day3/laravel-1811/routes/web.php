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
Route::get('logins', function(){
    return 's';
});
// 多请求
//  any 允许所有请求方式通过
//  match 允许规定范围类的请求
//  一个路由来完成所有控制器方法的执行

// 域名
// Route::any('{module}/{class}/{action}', function($module, $class, $action){
// //  return $module.' : module '.$class.' : class'.$action .': action';
//     $class =   'App\Http\Controllers\\'.ucfirst(strtolower($module)).'\\'.ucfirst(strtolower($class)).'Controller';
//     $classObject = new $class;
//     return call_user_func(array($classObject, $action));
//     // return call_user_func_array([$classObject, $action], $param);
// });

// Route::group(function()
// {
//     Route::get('/', function(){
//         return 'shineyork.tunnel.qydev.com';
//     });
//     Route::any('{module}-{class}-{action}',function($module, $class, $action){
//       $class =   'App\Http\Controllers\\'.ucfirst(strtolower($module)).'\\'.ucfirst(strtolower($class)).'Controller';
//         if(class_exists($class))
//         {
//             $classObject = new $class();
//             if(method_exists($classObject, $action)) return call_user_func(array($classObject, $action));
//         } else {
//             return $class.' connot find';
//         }
//     })->where(['module' => '[0-9a-z]+', 'class' => '[0-9a-z]+', 'action' => '[0-9a-z]+']);
// });
// 22：25
// 对于控制器解析主要是反射

// Route::get('login', 'order\LoginController@index');
// Route::get('order', 'order\OrderController@index');

// Route::group(['prefix' => 'order','namespace' => 'order',],function(){
//     Route::get('login', 'LoginController@index');
//     Route::get('order', 'OrderController@index');
// });

// 路由组 写法补充
// --------------------------------------------------------------
// Route::group(['prefix' => 'shop'], function()
// {
//     Route::group(['prefix' => 'goods'], function()
//     {
//         Route::get('goodsinfo', function()
//         {
//             return '查询商品的详细信息';
//         });
//         Route::get('cart', function()
//         {
//             return '查询购物车';
//         });
//     });
//     Route::get('index', function()
//     {
//         return '商城首页';
//     });
// });
// Route::prefix('admin')->namespace('Admin')->group( function()
// {   // 在 "App\Http\Controllers\Admin" 命名空间下的控制器
//     Route::middleware(['auth'])->group(function()
//     {
//         Route::prefix('auth')->group(function()
//         {
//             Route::get('userinfo', function()
//             {
//                 return '查询用户的信息';
//             });
//         });
//     });
//     Route::prefix('login')->group(function()
//     {
//         Route::get('login', 'LoginController@login');
//         Route::get('verify', 'LoginController@verify');
//     });
// });
// -------------------------------------------------------------------------------

// Route::prefix('order')->namespace('order')->group(function(){
//   Route::group(['middleware'=>'auth'], function (){
//       Route::get('login', 'LoginController@index');
//       Route::get('order', 'OrderController@index');
//   });
// });


// Route::get('order', 'order\LoginController@index')->name('order.index');
// Route::get('/', function () {
//     return route('order');
// });
// Route::

// 闭包， 控制器的方法位置
// Route::get('hello/{name}/{name11}', function ($name, $shineyork = 'shineyork') {
//     return $shineyork. '  --  '.$name;
// })->where([
//     'name' => '[A-Za-z]',
//     'name11' => '[A-Za-z]',
// ])->where('id', '[A-Za-z]')->name('hello.index');

// {:URL('shop/login/:action')}
// routes('hello');

// Route::delete('hello', function () {
//     return 'hello world routes';
// });

// 路由模型
Route::get('model/{user}', function(App\Models\Users\user $user)
{
    dd($user);
});
