<?php

namespace App\Models;

use App\Events\ProductSaved;
use App\Events\UserSaved;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Product extends Model
{
    use SoftDeletes;
    use HasFactory;
    //表名的设置 不是必须 但是laravel会默认给模型相关表加复数s  products
//    protected $table = 'products';
    //主键设置
//    protected $primaryKey = "u_id";
    //主键的类型
//    protected $keyType = "string";
    //主键是否自增
//    public $incrementing = false;
    //自动时间戳
//    public $timestamps = false;
    //自定义时间戳字段名
//    const CREATED_AT = 'create_time';
//    const UPDATED_AT = 'update_time';
    //时间戳格式设置
//    protected $dateFormat = 'U';
    //自定义数据库连接
//    protected $connection = "strasky";
//字段默认值的设置
    protected $attributes = [
        'on_sale' => 1
    ];

    //白名单
    protected $fillable = [
        'title', 'description', 'image', 'on_sale',
        'rating', 'sold_count', 'review_count', 'price'
    ];

    //禁止操作的字段
    protected $guarded = [];

    //字段类型转换
    protected $casts = [
      'on_sale' => 'boolean'
    ];

    public function getOnSaleAttribute($on_sale)
    {
        if ($on_sale == 0){
            return "下架";
        }
        if ($on_sale == 1){
            return "上架";
        }
    }

    public function setOnSaleAttribute($on_sale)
    {
        if ($on_sale == "下架"){
            $this->attributes["on_sale"] = 0;
        }
        if ($on_sale == "上架"){
            $this->attributes["on_sale"] = 1;
        }
    }

    public $dispatchesEvents = [
        'saved' => ProductSaved::class
    ];

    public function skus()
    {
        return $this->hasMany(ProductSku::class);
    }
}
