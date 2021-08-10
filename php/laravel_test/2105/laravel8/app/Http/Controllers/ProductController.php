<?php

namespace App\Http\Controllers;

use App\Events\ProductEvents;
use App\Models\Activity;
use App\Models\Product;
use App\Models\User;
use App\Models\UserInfo;
use Illuminate\Http\Request;
use App\Http\Requests\ProductRequest;

class ProductController extends Controller
{
    public function index()
    {
//        $data = [
//          'title' => '王者荣耀',
//          'image' => 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg',
//          'price' => 111.00,
//          'description' => ''
//        ];
//        Product::create($data);
        #save方式新增数据
//        $product = new Product();
//        $product->title = "华为电脑";
//        $product->image = 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg';
//        $product->price = 222.00;
//        $product->description = '';
//        $product->save();
        #修改
//        $product = Product::find(1);
//        $product->title = '111';
//        $product->save();

        #删除
//        $product = Product::where("id",'>',14)->delete();
//        $product->delete();
        #根据主键删除数据
//        Product::destroy(1);
//        Product::destroy([1,2,3,4,5]);
    }

    public function soft()
    {
//        $product = Product::find(2);
//        $product->delete();
//        Product::destroy(2);

//        $product = Product::find(3);
//        $product->forceDelete();
        #查询软删除数据
//        $product = Product::onlyTrashed()->get();
//        #查询所有的数据
//        $product = Product::withTrashed()->get();
//        dump($product);
        #恢复软删除的数据
        Product::onlyTrashed()->where('id',2)->restore();
    }

    public function sag()
    {
//        $product = Product::find(2);
//        $on_sale = $product->on_sale;
//        dump($on_sale);

//        $product = Product::find(2);
//        $product->on_sale = "下架";
//        $product->save();
    }

    public function event()
    {
        //用于触发事件
//        event(new ProductEvents("this is product controller"));

        $data = [
          'title' => '王者荣耀',
          'image' => 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg',
          'price' => 111.00,
          'description' => ''
        ];
        Product::create($data);
    }

    public function elo()
    {
        #一对一
//        $user = User::find(1)->userinfo;
//        dump($user);

        #预加载
        #不使用预加载查询三条user 并查询userinfo
//        $user = User::take(3)->get();
//        foreach ($user as $item){
//            dump($item->userinfo);
//        }
        #使用预加载的查询
//        $user = User::with('userinfo')->take(3)->get();
//        dump($user);

//        $user = User::select("*")->with(['userinfo' => function($query){
//            $query->where("id",1);
//        }])->take(3)->get();
//        dump($user);

        #反向关联
//        $userinfo = UserInfo::find(1);
//        dump($userinfo->user);

        #一对多关联
//        $product = Product::find(2);
//        $product->skus->title = "";
//        dump($product->skus);
        #一对多修改
//        $product = Product::find(6);
//        $product->skus()->update([
//            "title" => 4444
//        ]);
//        dump($product);
        #一对多删除
//        $product = Product::find(6);
//        $product->delete();
//        $product->skus()->delete();
//        dump($product);

        #多对多
//        $data = Activity::with('hasVenue')->find(1);
//        dump($data);

        return category();
    }

//    public function productAdd(ProductRequest $request)
//    {
//        $data = [
//            'title' => $request->input("title"),
//            'image' => $request->input("image"),
//            'price' => $request->input("price"),
//            'description' => $request->input("description")
//        ];
//        Product::create($data);
//    }
}
