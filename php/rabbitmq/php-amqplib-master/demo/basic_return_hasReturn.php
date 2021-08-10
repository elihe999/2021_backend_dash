<?php

require_once __DIR__ . '/../vendor/autoload.php';

use PhpAmqpLib\Connection\AMQPStreamConnection;
use PhpAmqpLib\Exchange\AMQPExchangeType;
use PhpAmqpLib\Message\AMQPMessage;

$connection = new AMQPStreamConnection('localhost', 5672, 'guest', 'guest');
$channel = $connection->channel();


// declare  exchange but don`t bind any queue
$channel->exchange_declare('hidden_exchange', AMQPExchangeType::DIRECT);
$queue = 'queue_1';
$channel->queue_declare($queue, false, true, false, false);
$channel->queue_bind($queue, 'hidden_exchange','test');


$message = new AMQPMessage("Hello World!");


$wait = true;

$returnListener = function (
    $replyCode,
    $replyText,
    $exchange,
    $routingKey,
    $message
) use ($wait) {
    $GLOBALS['wait'] = false;

    echo "return: ",
    $replyCode, "\n",
    $replyText, "\n",
    $exchange, "\n",
    $routingKey, "\n",
    $message->body, "\n";
};

$channel->set_return_listener($returnListener);

echo " [x] Sent mandatory ... ";
$channel->basic_publish(
    $message,
    'hidden_exchange',
    'test1',
    true
);
echo " done.\n";

while ($wait) {
    $channel->wait(null, false, $timeout = 2);
}

$channel->close();
$connection->close();