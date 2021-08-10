<?php
/**
 * author:六星教育-星空老师
 */

namespace App\Services;


class FlyServices
{
    public $sudu;

    public $time;

    public function __construct($sudu,$time)
    {
        $this->time = $time;
        $this->sudu = $sudu;
    }
}