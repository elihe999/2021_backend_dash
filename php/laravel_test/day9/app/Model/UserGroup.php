<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class UserGroup extends Model
{
    //
    //设置表名
    protected $table = 'user_group';
    //设置表主键
    protected $primaryKey = 'group_id';
}
