<?php

$time = time();
$appId = '';
$appSecret = '';
$mdt = md5(md5('appId=' . $appId . '&time=' . $time) . '&appSecret=' . $appSecret);

var_dump($mdt);
