<?php

namespace App\Http\Controllers;
//直接导入Request基类
//use Illuminate\Http\Request;
//门面调用
//use Illuminate\Support\Facades\Request;
//门面别名
use DB;

class DbController extends Controller
{
    public function index() {
        //找到默认的配置
       # $result = DB::select('select * from goods');
        //指定配置连接
        $result = DB::connection('winner')->select('select * from goods');
        dd($result);
    }
    public function test() {
        //预处理sql
        //select参数：1、sql语句 2、预处理语句的值（数组传参）
       /* $result = DB::connection('winner')->select('select * from goods where id = ?', [3]);
        $result1 = DB::connection('winner')->select('select * from goods where id = :id', ['id'=>3]);*/
       //新增
        $result1 = DB::connection('winner')->select('insert into goods (`counts`,`goods_name`) value (?,?)', ['35','winner']);
        //修改

        //删除
        dd($result1);
    }

    public function trans() {
        //自动事务
           /* DB::transaction(function (){
                //修改
                $num = DB::update("update goods set goods_name = 'Macos' where id = :id",['id'=>1]);
                //删除
                $num1 = DB::delete('delete from goods where id = 7');
                var_dump($num,$num1);
                try{
                    if ($num > 0 && $num1 > 0) {
                        return '事务操作成功';
                    }else {
                        throw  new \Exception('事务操作失败');
                    }
                }catch (Exception $e){
                    return $e->getMessage();
                }

            });*/
            //手动事务
        DB::beginTransaction();
        //修改
        $num = DB::update("update goods set goods_name = 'Macos' where id = :id",['id'=>1]);
        //删除
        $num1 = DB::delete('delete from goods where id = 7');
        if ($num > 0 && $num1 > 0) {
            echo  '事务操作成功';
            //事务提交
            DB::commit();
        }else {
        //事务回滚
            echo '事务操作失败';
            DB::rollBack();
        }
    }
    public function get() {
        //查询所有的数据
        //查询构造器结果返回的是staClass对象
        /*$result  = DB::table('user_base')->get();
        //前端输出值
            foreach ($result as $val){
            echo $val->user_id;
            }*/
        //对象转化为数组
        //toArray 只是转化一维结果为数组
       /* $result  = DB::table('user_base')->get()
            ->map(function ($value){
            return (array)$value;
        })->toArray();
        var_dump($result);*/
       //指定字段查询 并去取重
        //  不要用*   不用全匹配去查询数据   where  1 = 1
            /*$result = DB::table('user_base')->select('user_name','user_email')->distinct()->get();
        var_dump($result);*/
   #where条件
        //1、可以指定条件查询，默认是=号
        /*$result = DB::table('user_base')->where('user_id','>',1)->get();
        $result1 = DB::table('user_base')->where('user_id',1)->get();*/
       //2、多个条件查询
        //注意：where 一维数组只能key==>value形式，默认是=     二维需要指明件
       /* $result = DB::table('user_base')->where([
            ['user_id','>=', '2'],
            'user_name' => 'linss',
        ])->get();
        var_dump($result);*/
       // 查询语句写原生条件需要用DB::raw
        /*$result = DB::table('user_base')->where(DB::raw("user_name = 'linss' OR user_id > 1"))->get();
        var_dump($result);*/
        //where  or条件
        /*//注意：Debugbar  调试不能用 dd打印
        $result = DB::table('user_base')->where('user_id','>', 3)->orWhere('user_name','winner')->get();
        dump($result);*/
        #分块操作(chunk)
            //chunk 参数：1、分块的大小 2、闭合函数
         /*$reuslt = DB::table('user_base')->orderBy('user_id')->chunk(2,function ($citys){
             var_dump($citys);
             //终止分块处理
            return false;
        });
         var_dump($reuslt);*/
        //联合查询（join==inner join）
            //参数：1、关联表的名称 2、查询表的条件字段 3、条件 （= ） 4、联合查询的字段
        //first 查询单条
       /* $resutl  = DB::table('user_base')->join('users','user_base.user_id','=', 'users.id')->first();
        var_dump($resutl);*/
       //联合查询闭包方式
        /*$data = DB::table('user_base')->join('users',function ($role){
            $role->on('user_base.user_id','=','users.id')->
                where('users.id',2);
        })->first();
        var_dump($data);*/
        //子查询
        /*$last = DB::table ('user_base')
            ->select ('user_id',DB::raw('user_email as email'))
            ->where ('user_id','<=','2')
            ->orderBy ('user_id','desc');
        //joinsub  子查询  参数：1、结果集 2、临时表别名 3、闭包函数
        $users = DB::table ('users')
            ->joinsub ($last, 'user_base2',function ($join){
                $join->on('users.id','=','user_base2.user_id');
            })->get();
        var_dump($users);*/
        //order group limit
        //排序:latest降序   oldest 升序  默认按照created_at日期时间排序
        //select * from `user_base` order by `user_id` asc
       /* $result = DB::table('user_base')
            ->oldest('user_id')->get();
        var_dump($result);*/
        //分组
       /* $result = DB::table('user_base')
            ->groupBy('user_status')
            ->get();
        var_dump($result);*/
       //限制结果集
        //limit 限制结果显示 offset  偏移量
        /* $result1 = DB::table('user_base')->offset(2)->limit(2)->get();
        //take 跳转指定数量   skip 偏移量
        $result = DB::table('user_base')->skip(2)->take(2)->get();
        var_dump($result,$result1);*/
        //修改数据
       /* $resurt = DB::table('user_base')->where('user_id',4)->update(['user_name'=>'小五老师']);
        var_dump($resurt);*/

















    }
}
