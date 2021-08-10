<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    public $table = "products";

    /**
     * @var array
     * author:六星教育-星空老师
     * 字段白名单
     */
    public $fillable = ["*"];

    public function category()
    {
        return $this->belongsTo(ProductCategory::class,'three_category_id');
    }
}
