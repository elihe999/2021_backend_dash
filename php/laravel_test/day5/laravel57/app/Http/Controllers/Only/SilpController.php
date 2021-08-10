<?php

namespace App\Http\Controllers\Only;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class SilpController extends Controller
{
    /**
     * Handle the incoming request.
     *PHP mo
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function __invoke(Request $request)
    {
        //
        return 'this is SilpController';

    }
    public function index() {
        return 'index';
    }
}
