<?php
/**
 * Created by PhpStorm.
 * User: Winner
 * Date: 2018/12/17 0017
 * Time: 21:00
 */
Route::get('db',function (){
    dd(config());
});
//配置连接
Route::get('con','DbController@index');
//curd操作
Route::get('test','DbController@test');
Route::get('trans','DbController@trans');
//查询构造器
Route::get('get','DbController@get');