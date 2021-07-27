<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ProductCategory;
use App\Models\Product;

class ProductController extends Controller
{
    public function index(Request $request)
    {
        $builder = Product::query()->where('status',true);

        $category = ProductCategory::query()->whereIn('id',explode(',',$request->input('category_id')))->get();

        $builder->whereHas('category',function ($query) use ($category){
            foreach ($category as $item => $value){
                if ($item == 0){
                    $query->where('path','like',$value->path.$value->id.'-%');
                }else{
                    $query->Orwhere('path','like',$value->path.$value->id.'-%');
                }
            }
        });

        if ($order = $request->input('order','')){
            if (preg_match('/^(.+)_(asc|desc)$/',$order,$m)){
                if (in_array($m[1],['price','sold_count','review_count'])){
                    $builder->orderBy($m[1],$m[2]);
                }
            }
        }
        $products = $builder->paginate(10);
        return response()->json([
            "sql" => $products
        ]);
    }
}
