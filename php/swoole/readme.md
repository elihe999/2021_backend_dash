# io model

## context

[上下文](https://www.php.net/manual/zh/context.php)
stream_context_create

> PHP 提供了多种上下文选项和参数，可用于所有的文件系统或数据流封装协议。上下文（Context）由 stream_context_create() 创建。选项可通过 stream_context_set_option() 设置，参数可通过 stream_context_set_params() 设置。

## Swoole

### reload

Swoole 如何正确的重启服务
在日常开发中，修改了 PHP 代码后经常需要重启服务让代码生效，一台繁忙的后端服务器随时都在处理请求，如果管理员通过 kill 进程方式来终止 / 重启服务器程序，可能导致刚好代码执行到一半终止，没法保证整个业务逻辑的完整性。

Swoole 提供了柔性终止 / 重启的机制，管理员只需要向 Server 发送特定的信号或者调用 reload 方法，工作进程就可以结束，并重新拉起。具体请参考 reload()

但有几点要注意：

> 首先要注意新修改的代码必须要在 OnWorkerStart 事件中重新载入才会生效，比如某个类在 OnWorkerStart 之前就通过 composer 的 autoload 载入了就是不可以的。

> 其次 reload 还要配合这两个参数 max_wait_time 和 reload_async，设置了这两个参数之后就能实现异步安全重启。

如果没有此特性，Worker 进程收到重启信号或达到 max_request 时，会立即停止服务，这时 Worker 进程内可能仍然有事件监听，这些异步任务将会被丢弃。设置上述参数后会先创建新的 Worker，旧的 Worker 在完成所有事件之后自行退出，即 reload_async。

如果旧的 Worker 一直不退出，底层还增加了一个定时器，在约定的时间 (max_wait_time 秒) 内旧的 Worker 没有退出，底层会强行终止，并会产生一个 WARNING 报错。

示例：
```php
<?php
$serv = new Swoole\Server('0.0.0.0', 9501, SWOOLE_PROCESS);
$serv->set(array(
    'worker_num' => 1,
    'max_wait_time' => 60,
    'reload_async' => true,
));
$serv->on('receive', function (Swoole\Server $serv, $fd, $reactor_id, $data) {

    echo "[#" . $serv->worker_id . "]\tClient[$fd] receive data: $data\n";

    Swoole\Timer::tick(5000, function () {
        echo 'tick';
    });
});

$serv->start();
```
例如上面的代码，如果没有 reload_async 那么 onReceive 中创建的定时器将丢失，没有机会处理定时器中的回调函数。

------

## pid管理

### 文本记录pid

php\swoole\src\Helper.php

posix_kill函数

1. 记录pid
2. 结束相应pid

适用于命令行

### Signal 信号

注册信号
```php
pcntl_signal(int $signo, callback $handler, bool $restart_syscalls = true): bool
```

# 14

## Semaphore 函数

* msg_queue_exists
