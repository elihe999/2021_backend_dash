<?php
namespace App\Model;

use Illuminate\Database\Eloquent\Model;
class Users extends Model
{
    //设置表名
    protected $table = 'user';
    //设置表主键
    protected $primaryKey = 'uid';
    //多对多。查询用户所在用户组
    public function userGroup() {
        //参数1 关联模型
        //参数2 中间表
        //参数3 指定中间表进行关联本地模型的字段
        //参数4 指定中间表进行关联 关联模型的字段
        //参数5 指定本地模型关联中间表的字段
        //参数6 指定关联模型关联中间表的字段
        return $this->belongsToMany(UserGroup::class,'user_role','role_id','group_id_array','role_id','group_id');
    }

    //用户与角色的关联
    public function userRole() {
        //第一个关联模型
        //第二参数是  关模模型的关联字段
        //第三个参数  本地模型关联的字段
        return $this->hasOne(UserRole::class,'role_id','role_id');
    }
}
