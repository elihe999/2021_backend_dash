<?php
/**
 * Created by PhpStorm.
 * User: Winner
 * Date: 2018/12/12 0012
 * Time: 20:10
 */
Route::get('request',function (){
    return view('request/login');
});
Route::get('requestjs',function (){
    return view('request/js');
});

Route::post('hello_from','LoginController@index');
//不做csrf令牌校验
Route::post('requestNocsrf/1111','LoginController@index');
//js通过csrf保护
//request请求对象
Route::get('requestName','requestController@index');
Route::post('indexFacade','requestController@indexFacade');
//响应数据默认按照json格式
Route::get('winner',function (){
    return ['456','winner','hello'];
});
Route::get('status',function (){
    return response('hello winner',500)
        ->header('Content-type','text/html');
});
//下载文件
Route::get('download',function (){
    return response('下载文件',200)
        ->header('Content-type','application/download');
});
Route::get('download1',function (){
    return response()->download(public_path('svg\timg.jpg'),'测试文件.jpg');
});
//文件查看
Route::get('file',function (){
    return response()->file(public_path('svg\timg.jpg'));
});
//响应接送数据
Route::get('json',function (){
    return response()->json(['winner']);
});
//重定向
Route::get('return',function (){
   # return redirect('file');
    return redirect()->away('http://www.baidu.com');
});
//cookie
Route::get('cookie','requestController@setcookie');
Route::get('getcookie','requestController@getcookie');
Route::get('delcookie','requestController@delcookie');
Route::get('setsession','requestController@setsession');




