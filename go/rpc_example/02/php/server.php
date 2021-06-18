<?php

$server = new Swoole\Server('127.0.0.1', 9500);

$server->on('connect', function ($server, $fd){
});

$server->on('receive', function ($server, $fd, $reactor_id, $data) {
    var_dump($data);
    $result = [
        "id" => 0,
        "result" => "hello i'm is swoole",
        "error" => null
    ];
    $server->send($fd, json_encode($result));
    $server->close($fd);
});

$server->on('close', function ($server, $fd) {
});

$server->start();
