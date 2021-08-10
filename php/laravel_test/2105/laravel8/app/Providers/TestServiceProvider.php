<?php

namespace App\Providers;

use App\Contracts\Db;
use App\Services\DbContarct;
use App\Services\SelectContracts;
use Illuminate\Support\ServiceProvider;
use App\Services\HelloWorld;

class TestServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->bind('hello',HelloWorld::class);
        $this->app->bind(Db::class,SelectContracts::class);
//        $this->app->bind(Db::class,DbContarct::class);
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}
