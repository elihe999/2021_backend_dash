<?php
$client = new Swoole\Client(SWOOLE_SOCK_TCP);

if (!$client->connect('127.0.0.1', 3333, -1)) {
    exit("connect failed. Error: {$client->errCode}\n");
}
// 需要注意这两是要作为一组，否则recv处于等待状态

// 短时间内发送多条数据

$context = "12fsfsdfsdf3";
$len = pack("n", strlen($context));
var_dump($len);
$send = $len . $context;
var_dump($send);
$client->send($send);

echo $client->recv();


$client->close();
