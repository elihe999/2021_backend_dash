<?php
/**
 * Created by PhpStorm.
 * User: Winner
 * Date: 2018/12/15 0015
 * Time: 21:53
 */
//view方法传参
Route::get('view',function (){
    return view('view.index',['name'=>'winner']);
});
//with方法传参
Route::get('test','TestController@index');
//模板继承
Route::get('child',function (){
    return view('child');
});
//卡槽与组件
Route::get('Components',function (){
    return view('Components');
});
//流程控制语句
Route::get('for',function (){
    return view('view.for',['name'=>[
        '0'=>['id'=>1,'name'=>'多兰剑','money'=>450],
        '1'=>['id'=>2,'name'=>'春哥甲','money'=>3200],
        '2'=>['id'=>3,'name'=>'无尽之刃','money'=>7800],
        '3'=>['id'=>4,'name'=>'草鞋','money'=>350],
    ]]);
});
