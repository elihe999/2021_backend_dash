<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DbController extends Controller
{
    public function index()
    {
        # 原生sql
        # 1.1 查询
//        $sql = "select * from userinfo where id = 1";
//        $user = DB::select($sql);
//        dd($user);
        # 防止sql注入
//        $sql = "select * from userinfo where id = ?";
//        $user = DB::select($sql,[1]);
//        dd($user);
//        #新增
//        $sql = "insert into userinfo(username,age,sex,status)values(?,?,?,?)";
//        $user = DB::insert($sql,["hello Wolrd 2",111,1,0]);
//        dd($user);
//
//        # 1.3 修改
//        $sql = "update userinfo set username = ? where age = ?";
//        $user = DB::insert($sql,['hellokitty', 200]);
//        dump($user);
//
//        # 1.4 删除
//        $sql = "delete from userinfo where id = ?";
//        $user = DB::insert($sql,[5]);
//        dump($user);
    }

    public function builder()
    {
        # 2。1 新增
//        $data = [
//            'name' => '唐僧',
//            'email' => 'tangseng@qq.com',
//            'password' => 'tangseng'
//        ];
        #2.1 批量新增
//        $data = [
//            ['name' => '孙悟空','email' => 'sunwukong@qq.com', 'password' => 'sunwukong'],
//            ['name' => '猪八戒','email' => 'zhubajie@qq.com', 'password' => 'zhubajie'],
//            ['name' => '沙和尚','email' => 'sahhes@qq.com', 'password' => 'sahhes'],
//        ];
//
//        $user = DB::table('users')->insert($data);

        #2.1 批量新增
//        $data = [
//            'name' => '佛祖'
//        ];
//
//        $user = DB::table('users')->where('id',1)->update($data);
//        dump($user);

//        $user = DB::table('users')->where('id',4)->delete();
//        dump($user);

        #清空表
//        $user = DB::table('users')->truncate();
    }

    /**
     * author:六星教育-星空老师
     * 聚合查询语句
     */
    public function query()
    {
//        $user = DB::table('users')->where('id','>',3)->get('name');
//        $user = DB::table('users')->get();
//        dump($user);

//        $user = DB::table('users')->where('id',1)->first();
//        $user = DB::table('users')->find(2);
//        $user = DB::table('users')->value('name');
//        $user = DB::table('users')->pluck('name');
//        dump($user);

//        $user = DB::table('users')->count();
//        $id = DB::table('users')->max('id');
//        dump($id);
    }

    public function join()
    {
        #普通连接的查询
//        $id = DB::table('users')
//            ->where('name','孙悟空')
//            ->value('id');
//        $class= DB::table('user_addresses')
//            ->where('user_id',$id)
//            ->pluck('contact_name');
//        dump($class);

//        $user_addresss = DB::table('users')
//            ->join('user_addresses','users.id','=','user_addresses.user_id')
//            ->where('users.name','孙悟空')
//            ->select('contact_name')
//            ->get();
//        dump($user_addresss);

//        $user_addresss = DB::table('users')
//            ->rightJoin('user_addresses','users.id','=','user_addresses.user_id')
//            ->where('users.name','孙悟空')
//            ->select('contact_name')
//            ->get();
//        dump($user_addresss);

//        $user = DB::table('users')->where('name','孙悟空')
////            ->select(['id','name','password']);
////        $user_addresses = DB::table('user_addresses')
////            ->joinSub($user,'user',function ($join){
////                $join->on('user.id','=','user_addresses.user_id');
////            })->select('contact_name')->get();
////        dump($user_addresses);
///
/// //        # 4.3 union
//        $user1 = DB::table('users')->where('id',1)->select();
//        $user2 = DB::table('users')->where('id',2)->select();
//
//        $users = DB::table($user1,'user1')
//            ->union($user2)
//            ->get();
//        dump($users);
    }

    public function begin()
    {
        $user = \DB::transaction(function (){
            DB::table('users')->where("id",1)->update(["name" => '佛祖']);
            $user = DB::table('users')->where('id',1)->first();
            DB::table('userss')->where('id',2)->delete();
            return $user;
        });
        dump($user);
    }

}
