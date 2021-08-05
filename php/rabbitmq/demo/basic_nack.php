<?php
/**
 * - Start this consumer in one window by calling: php demo/basic_nack.php
 * - Then on a separate window publish a message like this: php demo/amqp_publisher.php good
 *   that message should be "ack'ed"
 * - Then publish a message like this: php demo/amqp_publisher.php bad
 *   that message should be "nack'ed"
 */
include(__DIR__ . '/config.php');

use PhpAmqpLib\Connection\AMQPStreamConnection;
use PhpAmqpLib\Exchange\AMQPExchangeType;

$exchange = 'router';
$queue = 'msgs';
$consumerTag = 'consumer';

$connection = new AMQPStreamConnection(HOST, PORT, USER, PASS, VHOST);
$channel = $connection->channel();

$channel->queue_declare($queue, false, true, false, false);
$channel->exchange_declare($exchange, AMQPExchangeType::DIRECT, false, true, false);
$channel->queue_bind($queue, $exchange);

/**
 * @param \PhpAmqpLib\Message\AMQPMessage $message
 */
function process_message($message)
{
    /*
    if(插入成功){
        echo "将消息删除：";
        服务器死掉，相当于exit;
        $message->ack(true);
    }else if(插入失败){
        echo "将消息不要删除，等着下次消费";
        $message->nack(true);
    }*/

    if ($message->body == 'good') {
        $message->ack();
    } else {
        echo "成功收到消息，消息内容为：".$message->body ;
        echo "将消息打回,重回队列：";
        $message->nack(true);
    }

    // Send a message with the string "quit" to cancel the consumer.
    if ($message->body === 'quit') {
        $message->getChannel()->basic_cancel($message->getConsumerTag());
    }
}

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
while ($channel->is_consuming()) {
    $channel->wait();
}