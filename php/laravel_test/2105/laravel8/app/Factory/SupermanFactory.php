<?php
/**
 * author:六星教育-星空老师
 */

namespace App\Factory;


use App\Services\FlyServices;

class SupermanFactory
{
    public function makeModule($name,$options)
    {
        switch ($name){
            case 'fly':
                return new FlyServices($options[0],$options[1]);
        }
    }
}