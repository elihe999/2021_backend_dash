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
Route::get('db',[\App\Http\Controllers\DbController::class,'index']);
Route::get('builder',[\App\Http\Controllers\DbController::class,'builder']);
Route::get('query',[\App\Http\Controllers\DbController::class,'query']);
Route::get('join',[\App\Http\Controllers\DbController::class,'join']);
Route::get('begin',[\App\Http\Controllers\DbController::class,'begin']);

#模型

Route::get('index',[\App\Http\Controllers\ProductController::class,'index']);
Route::get('soft',[\App\Http\Controllers\ProductController::class,'soft']);
Route::get('sag',[\App\Http\Controllers\ProductController::class,'sag']);
Route::get('event',[\App\Http\Controllers\ProductController::class,'event']);
Route::get('elo',[\App\Http\Controllers\ProductController::class,'elo']);


//-----------------------------------表单验证-----------------------------------------------------
Route::any('cookie',[\App\Http\Controllers\CookieController::class,'index']);
Route::any('session',[\App\Http\Controllers\CookieController::class,'session']);
//Route::any('vali',[\App\Http\Controllers\CookieController::class,'vali'])->name('vali');
Route::any('view',[\App\Http\Controllers\CookieController::class,'view']);

Route::post('productAdd',[\App\Http\Controllers\ProductController::class,'productAdd'])->name("productAdd");