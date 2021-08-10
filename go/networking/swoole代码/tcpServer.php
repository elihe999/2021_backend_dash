<?php
$server = new Swoole\Server("0.0.0.0", 9503);

$server->set([
  'open_length_check'     => true,
  'package_max_length'    => 1 * 1024 * 1024 ,
  'package_length_type'   => 'n',
  'package_length_offset' => 0,
  'package_body_offset'   => 2
]);

$server->on('connect', function ($server, $fd){
});

// 监听数据接收事件
$server->on('receive', function ($serv, $fd, $from_id, $data) {
    // 接收客户端的想你想
    var_dump($data);
    echo "接收到".$fd."的信息\n";

    $serv->send($fd, "Server: ");
});

$server->on('close', function ($server, $fd) {
});

$server->start();
