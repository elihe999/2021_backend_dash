<?php
/**
 * author:六星教育-星空老师
 */

namespace App\Services;


use App\Contracts\Db;

class DbContarct implements Db
{
    public function select()
    {
        // TODO: Implement select() method.
        return "this is select";
    }

    public function insert()
    {
        // TODO: Implement insert() method.
        return "this is insert";
    }
}