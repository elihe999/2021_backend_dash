<?php
/*
 * 该文件的作用说明：
 * 把数据从rabbitmq里面读取出来
 * 然后发送给第三方
 * 然后改变自己数据库的状态
 * */


/*加载所需类包*/
use PhpAmqpLib\Connection\AMQPStreamConnection;
use PhpAmqpLib\Exchange\AMQPExchangeType;
use PhpAmqpLib\Message\AMQPMessage;
include('../config/config.php');

/*从rabbitmq将数据取出*/
getFromRabbitMQ();

/*从rabbitmq将数据取出*/
function getFromRabbitMQ(){
    $exchange = 'router';
    $queue = 'msgs';
    $consumerTag = 'consumer';

    $connection = new AMQPStreamConnection(HOST, PORT, USER, PASS, VHOST);
    $channel = $connection->channel();

    /*
        The following code is the same both in the consumer and the producer.
        In this way we are sure we always have a queue to consume from and an
        exchange where to publish messages.
    */

    /*
        name: $queue
        passive: false
        durable: true // the queue will survive server restarts
        exclusive: false // the queue can be accessed in other channels
        auto_delete: false //the queue won't be deleted once the channel is closed.
    */
    $channel->queue_declare($queue, false, true, false, false);

    /*
        name: $exchange
        type: direct
        passive: false
        durable: true // the exchange will survive server restarts
        auto_delete: false //the exchange won't be deleted once the channel is closed.
    */

    $channel->exchange_declare($exchange, AMQPExchangeType::DIRECT, false, true, false);

    $channel->queue_bind($queue, $exchange);

    /*
        queue: Queue from where to get the messages
        consumer_tag: Consumer identifier
        no_local: Don't receive messages published by this consumer.
        no_ack: If set to true, automatic acknowledgement mode will be used by this consumer. See https://www.rabbitmq.com/confirms.html for details.
        exclusive: Request exclusive consumer access, meaning only this consumer can access the queue
        nowait:
        callback: A PHP Callback
    */

    $channel->basic_consume($queue, $consumerTag, false, false, false, false, 'process_message');

    /**
     * @param \PhpAmqpLib\Channel\AMQPChannel $channel
     * @param \PhpAmqpLib\Connection\AbstractConnection $connection
     */
    function shutdown($channel, $connection)
    {
        $channel->close();
        $connection->close();
    }

    register_shutdown_function('shutdown', $channel, $connection);

// Loop as long as the channel has callbacks registered
    while ($channel ->is_consuming()) {
        $channel->wait();
    }
}


/**
 * @param \PhpAmqpLib\Message\AMQPMessage $message
 * 接收到rabbitmq消息（消息放在$message里面）后，进行一系列逻辑处理
 */
function process_message($message)
{
    echo "\n--------\n";
    echo $message->body;
    echo "\n--------\n";

    /*从rabbitmq里面取出json数据*/
    $data_json = $message->body;

    /*把json数据编译后，放入$data变量，
    $data变量是个数组x*/
    $data = json_decode($data_json);

    /*数据发送个第三方*/
    send_to_third($data);

    /*处理mysql数据*/
    changeMysqlStatus($data);

    /*告诉rabbitmq已经处理完毕了*/
    $message->ack();
}


/*把数据发送给第三方*/
function send_to_third($data_json){
    //这里写发送给第三方的具体逻辑
}


/*改变数据库状态*/
function changeMysqlStatus($data_json){
    //这里写修改mysql数据库的具体逻辑
}


