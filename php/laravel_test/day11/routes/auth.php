<?php
/**
 * Created by PhpStorm.
 * User: Winner
 * Date: 2019/1/4 0004
 * Time: 21:02
 */
Route::get('auth','TestController@auth');
//自定义认证
Route::post('authentic','TestController@authentic');
//路由auth认证
Route::get('test','TestController@test')->middleware('auth')->name('test');
Route::get('test1','TestController@test')->name('test');
// HTTP认证
Route::get('basic','TestController@test')->middleware('auth.basic');
//加密openssl
Route::get('crypt','TestController@crypt')->name('crypt');

