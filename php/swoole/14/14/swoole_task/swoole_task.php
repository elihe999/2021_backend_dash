<?php
/**
 * Created by PhpStorm.
 * User: Sixstar-Peter
 * Date: 2019/2/19
 * Time: 21:37
 */

//tcp协议
$server=new Swoole\Server("0.0.0.0",9000);   //创建server对象

$server->set([
    'worker_num'        => 1, //设置进程
    'task_worker_num'   => 1,  //task进程数
]);
//消息发送过来
$server->on('receive',function (swoole_server $server, int $fd, int $reactor_id, string $data){
    $server->task(7);
    $server->send($fd , 1);
});
//ontask事件回调
$server->on('task',function (swoole_server $server,$task_id,$form_id,$data){
    echo "接受到信息\n";
    var_dump($server->worker_id);
    $server->sendMessage("Task数据", 2);// 0 ~ (worker_num + task_worker_num - 1)
    $server->finish("执行完毕");
});
$server->on('finish',function ($server,$task_id,$data){
});
$server->on('PipeMessage',function (swoole_server $server,  $src_worker_id, $message){
    echo "\n接收到数据\n";
    var_dump($message);
});

//服务器开启
$server->start();
