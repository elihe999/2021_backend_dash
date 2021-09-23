## 局部变量

在事件回调函数返回后，所有局部对象和变量会全部回收，不需要unset。如果变量是一个资源类型，那么对应的资源也会被PHP底层释放。

```php
function test()
{
    $a = new Object;
    $b = fopen('/data/t.log', 'r+');
    $c = new swoole_client(SWOOLE_SYNC);
    $d = new swoole_client(SWOOLE_SYNC);
    global $e;
    $e['client'] = $d;
}
```

$a, $b, $c 都是局部变量，当此函数return时，这3个变量会立即释放，对应的内存会立即释放，打开的IO资源文件句柄会立即关闭。
$d 也是局部变量，但是return前将它保存到了全局变量$e，所以不会释放。当执行unset($e['client'])时，并且没有任何其他PHP变量仍然在引用$d变量，那么$d就会被释放。

## 全局变量

在PHP中，有3类全局变量。

使用global关键词声明的变量
使用static关键词声明的类静态变量、函数静态变量
PHP的超全局变量，包括$_GET、$_POST、$GLOBALS等
全局变量和对象，类静态变量，保存在Server对象上的变量不会被释放。需要程序员自行处理这些变量和对象的销毁工作。

```php
class Test
{
    static $array = array();
    static $string = '';
}

function onReceive($serv, $fd, $reactorId, $data)
{
    Test::$array[] = $fd;
    Test::$string .= $data;
}
```

在事件回调函数中需要特别注意非局部变量的array类型值，某些操作如 TestClass::$array[] = "string" 可能会造成内存泄漏，严重时可能发生爆内存，必要时应当注意清理大数组。

在事件回调函数中，非局部变量的字符串进行拼接操作是必须小心内存泄漏，如 TestClass::$string .= $data，可能会有内存泄漏，严重时可能发生爆内存。

## 解决方法

同步阻塞并且请求响应式无状态的Server程序可以设置max_request和task_max_request，当Worker进程/Task进程结束运行时或达到任务上限后进程自动退出。该进程的所有变量/对象/资源均会被释放回收。
程序内在onClose或设置定时器及时使用unset清理变量，回收资源

## 异步客户端

Swoole提供的异步客户端与普通的PHP变量不同，异步客户端在发起connect时底层会增加一次引用计数，在连接close时会减少引用计数。

包括swoole_client、swoole_mysql、swoole_redis、swoole_http_client

```php
function test()
{
    $client = new swoole_client(SWOOLE_TCP | SWOOLE_ASYNC);
    $client->on("connect", function($cli) {
        $cli->send("hello world\n");
    });
    $client->on("receive", function($cli, $data){
        echo "Received: ".$data."\n";
        $cli->close();
    });
    $client->on("error", function($cli){
        echo "Connect failed\n";
    });
    $client->on("close", function($cli){
        echo "Connection close\n";
    });
    $client->connect('127.0.0.1', 9501);
    return;
}
```

$client是局部变量，常规情况下return时会销毁。
但这个$client是异步客户端在执行connect时swoole引擎底层会增加一次引用计数，因此return时并不会销毁。
该客户端执行onReceive回调函数时进行了close或者服务器端主动关闭连接触发onClose，这时底层会减少引用计数，$client才会被销毁。
