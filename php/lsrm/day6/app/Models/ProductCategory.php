<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductCategory extends Model
{
    public $table = "product_categorys";
    public $fillable = ['*'];

    public function products()
    {
        return $this->hasMany(Product::class,'three_category_id');
    }
}
