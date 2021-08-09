<?php

namespace App\Providers;

use App\Http\Controllers\TestController;
use App\Services\FlyServices;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
//        foreach (glob(app_path('Helpers').'/*.php') as $file){
//            require_once $file;
//        }
//        $this->app->bind('test',function (){
//            return new TestController();
//        });
//
//        $this->app->bind('power',function (){
//            $power = array(
//                new FlyServices(1000,24)
//            );
//            return $power;
//        });

        $this->app->singleton('ttt',TestController::class);
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        DB::listen(function ($query){
            dump($query->sql."   time:".$query->time);
        });
        Schema::defaultStringLength(200);
//        dump(app("hello")->hello());
    }
}
