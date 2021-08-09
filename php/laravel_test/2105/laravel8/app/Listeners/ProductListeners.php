<?php

namespace App\Listeners;

use App\Events\ProductEvents;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;

class ProductListeners
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  ProductEvents  $event
     * @return void
     */
    public function handle(ProductEvents $event)
    {
        dump($event->info);
    }
}
