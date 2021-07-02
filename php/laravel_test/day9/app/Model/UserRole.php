<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class UserRole extends Model
{
    //设置表名
    protected $table = 'user_role';
    //设置表主键
    protected $primaryKey = 'role_id';

    //一对多
    public function roles() {
        return $this->hasMany(Users::class,'role_id','role_id');
    }

    //反向关联
    public function role() {

        return $this->belongsTo(Users::class,'role_id','role_id');
    }

}
