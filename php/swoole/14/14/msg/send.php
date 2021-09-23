<?php

$queue = msg_get_queue('1962960483');
// 父进程空间
msg_send($queue, 10, 3);
