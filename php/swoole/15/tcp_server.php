<?php
// require 'index.php';
// $r = 1;

$serv = new Swoole\Server("0.0.0.0", 9000);

// 2. 注册事件
$serv->on('Start', function($serv){
    echo "启动swoole 监听的信息tcp:0.0.0.0:9000\n";
});

//监听连接进入事件
$serv->on('Connect', function ($serv, $fd) {
    include 'index.php';
    global $object; // 
    $object = new index();
    $object->r ++;
    echo "Client: Connect.\n";
});

//监听数据接收事件
$serv->on('Receive', function ($serv, $fd, $from_id, $data) {
    global $object;
    var_dump($object->r);
    $serv->send($fd, "Server: ".$data);
});

//监听连接关闭事件
$serv->on('Close', function ($serv, $fd) {
    echo "QQ离线.\n";
});

$serv->start(); // 阻塞与非阻塞
