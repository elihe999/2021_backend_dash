<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;
use Illuminate\Support\Facades\Redis;


class IndexController extends Controller
{
    public function IndexHomeQueue(Request $request)
    {
        try{
            //1. 查询Redis有序集合
            $ProductSoldCountId = Redis::zrevrange("lmrs::index::product::queue",0,-1);
            if ($ProductSoldCountId == null or $ProductSoldCountId == ""){
                $ProductSoldCountData = Product::query()
                    ->select(['id','name','sold_count'])
                    ->orderBy('sold_count','desc')
                    ->limit(5)->get();

                Redis::pipeline(function ($redis) use ($ProductSoldCountData){
                    $redis->del("lmrs::index::product::queue");
                    foreach ($ProductSoldCountData as $item){
                        $redis->zadd("lmrs::index::product::queue",$item["sold_count"],$item["id"]);
                        $redis->set("lmrs::index::product::".$item["id"],serialize($item),"EX",86400);
                        $redis->expires("lmrs::index::product::queue",86400);
                    }
                });

//                foreach ($ProductSoldCountData as $item){
//                    Redis::zadd("lmrs::index::product::queue",$item["sold_count"],$item["id"]);
//                    Redis::set("lmrs::index::product::".$item["id"],serialize($item));
//                }
            }else{
                $ProductSoldCountData = [];
                foreach ($ProductSoldCountId as $item => $value){
                    $ProductSoldCountData[$item] = unserialize(Redis::get("lmrs::index::product::".$value));
                }
            }
        }catch (\Exception $exception){
            return response()->json([
                "data" => "系统异常，请稍后在尝试",
                "restful" => false
            ]);
        }
        return response()->json([
                "data" => $ProductSoldCountData,
                "restful" => true
        ]);

    }
}
