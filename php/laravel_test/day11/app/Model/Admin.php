<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
//引入软删除内库
use Illuminate\Database\Eloquent\SoftDeletes;
class Admin extends Model
{
    use SoftDeletes;
    protected $table = 'admin';
    //关闭自动更新时间字段
    public $timestamps = false;
    //设置表名id
    protected $primaryKey = 'id';
    //允许操作的属性  字段白名单
    protected $fillable = ['name','email'];
    //不允许操作属性  字段黑名单
    protected $guarded = ['password'];

}
