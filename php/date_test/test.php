<?php

$time = '2022-05-19 17:51:46';
$now = time();
$check = strtotime($time);
var_dump($now);
var_dump($check);
if ($now >= $check) {
    echo 1;
    return true;
}
echo 0;
return false;
