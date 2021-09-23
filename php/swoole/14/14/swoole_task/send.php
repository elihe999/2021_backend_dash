<?php
$serv = new Swoole\Server("0.0.0.0", 9501);
$serv->set(array(
    'worker_num' => 2,
    'task_worker_num' => 2,
));
$serv->on('pipeMessage', function($serv, $src_worker_id, $data) {
    echo "#{$serv->worker_id} message from #$src_worker_id: $data\n";
});
$serv->on('task', function ($serv, $task_id, $reactor_id, $data){
    $serv->sendMessage("hello task process", 1);
});
$serv->on('finish', function ($serv, $fd, $reactor_id){

});
$serv->on('receive', function (swoole_server $serv, $fd, $reactor_id, $data) {
  $serv->task(7);
  $serv->send($fd , 1);
});

$serv->start();
