<?php
$ip = '192.168.10.26';
$user = 'eli';
$passwd = '123';
$port = 21;
$timeout = 20;
$conn = ftp_connect($ip, $port, $timeout);
ftp_login($conn, $user, $passwd);
$mode = FTP_ASCII;
$local_file = './test';
$push_file = 'test';
$flag = ftp_put($conn, $push_file, $local_file, $mode);
// 检查 结果
if (!$flag) {
    return false;
}
$size = @ftp_size($conn, $push_file);
if ($size === 0) {
    echo false;
} else {
    echo true;
}

