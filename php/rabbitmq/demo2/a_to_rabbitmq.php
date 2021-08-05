<?php
/*
 * 该文件的作用说明：
 * 把数据从mysql里面读取出来
 * 然后存入rabbitmq
 * */



/*加载所需类包*/
use PhpAmqpLib\Connection\AMQPStreamConnection;
use PhpAmqpLib\Exchange\AMQPExchangeType;
use PhpAmqpLib\Message\AMQPMessage;
include('../config/config.php');


createOrder();


function createOrder($i)
{
    /* $data是从mysql查出的数据 */
    $data = $_POST['order_info'];
    //$data = ['id'=>1, 'name'=>'san_mao','goods_id'=>3,'goods_name'=>'自动喂饭机','phone'=>15111222285];

    $data_json = json_encode($data);

    $exchange = 'router';
    $queue = 'msgs';

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

    $messageBody = $data_json;
    $message = new AMQPMessage($messageBody, array('content_type' => 'text/plain', 'delivery_mode' => AMQPMessage::DELIVERY_MODE_PERSISTENT));
    $channel->basic_publish($message, $exchange);

    $channel->close();
    $connection->close();

    return 'Process '.$i.'Succ';
}