<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use  Illuminate\Support\Facades\Schema;
use DB;
class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Schema::defaultStringlength(191);
        /*
    //sql的监听
        DB::listen(function ($query){
            //查看sql语句
         //   echo $query->sql;
            //查看错误码
           // var_dump($query->bindings);
            //执行时间
          echo   $query->time;
        });*/

    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}
