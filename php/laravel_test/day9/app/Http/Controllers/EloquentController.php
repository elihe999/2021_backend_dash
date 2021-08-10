<?php
/**
 * Created by PhpStorm.
 * User: Winner
 * Date: 2018/12/21 0021
 * Time: 20:59
 */
namespace App\Http\Controllers;
use App\Model\Admin;
use App\Model\Users;
use App\Model\UserRole;
use App\Model\UserGroup;
class EloquentController extends Controller
{
    public function index()
    {
        //模型也可以按照查询构造器方式来操作
        //查询所有数据
       //dump(Admin::all());
        //查询指定id单条数据
        //dump(Admin::find(2));
        //first  返回结果集当中第一条数据
       #dump(Admin::first());
        //dump(Admin::where('name','=','winner')->first());
        //新增 save   Admin::insert
        /*$admin = new Admin();
        $admin->name = 'pews';
        $admin->email = 'wins@qq.com';
        $admin->remember_token = '9';
        $admin->role_id = '31';
        $bool = $admin->save();
        dd($bool);*/
        /*Admin::insert([
            'name' => '12',
            'email' => '454',
            'remember_token' => '83',
            'role_id' => '54345',
        ]);*/
        //修改
         /*$admin = Admin::find(5);
         $admin->name = "sixstar";
        $boll = $admin->save();
        var_dump($boll);*/
         //直接删除
         /*$admin = Admin::find(4)->delete();
         $bool = $admin->delete();
        dump($admin);*/
         //软删除
       /* $admin = Admin::find(3)->delete();
         dump($admin);*/
         //强制查询软删除数据 舍弃字deletd_at字段段的判断
        /*$admin = Admin::withTrashed()->find(3);
        dump($admin);*/
        //恢复数据
        #$admin = Admin::restore()->find(3);
        #$admin = Admin::withTrashed()->where('id',3)->restore();
        # $admin = Admin::withTrashed()->find(3)->restore();
        # var_dump($admin);
        //强删除
    /*    $bool = Admin::withTrashed()->find(3)->forceDelete();
        var_dump($bool);*/
        //批量操作 create()

        $data  = ['name'=>'php','email' => '1231313@qq.com','role_id' =>'78998','password' =>'4554654656'];
        $bool = Admin::create($data);
        dump($bool);

    }
    public function role() {
        //用户找角色
        /*$reuslt = Users::find(63)->userRole->toArray();
        dump($reuslt);*/
        //角色找用户 反向关联
       /* $reuslt = UserRole::find(2)->role->toArray();
       dump($reuslt);*/
       //一对多
      /*  $reuslt = UserRole::find(1)->roles->toArray();
        dump($reuslt);*/
      //查询当前用户所在组
        $data = Users::find(63)->userGroup->toArray();
        dump($data);
    }
}