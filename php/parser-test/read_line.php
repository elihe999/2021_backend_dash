<?php

    $pure_sql = [];
$sql = "select * from test;
   -- ￥dfafaf
drop table test;	
";
    // 多行注释标记
    $comment = false;

    // 按行分割，兼容多个平台
    $sql = str_replace(["\r\n", "\r"], "\n", $sql);

    $sql = explode("\n", trim($sql));


    // 循环处理每一行
    foreach ($sql as $key => $line) {
        // 跳过空行
        if ($line == '') {
            continue;
        }

        // 跳过以#或者--开头的单行注释
        if (preg_match("/^(#|--)/", trim($line))) {
            continue;
        }

        // 跳过以/**/包裹起来的单行注释
        if (preg_match("/^\/\*(.*?)\*\//", $line)) {
            continue;
        }

        // 多行注释开始
        if (substr($line, 0, 2) == '/*') {
            $comment = true;
            continue;
        }

        // 多行注释结束
        if (substr($line, -2) == '*/') {
            $comment = false;
            continue;
        }

        // 多行注释没有结束，继续跳过
        if ($comment) {
            continue;
        }

        if ($line == 'BEGIN;' || $line =='COMMIT;') {
            continue;
        }
        // sql语句
        array_push($pure_sql, $line);
    }

    print_r($pure_sql);
    return $pure_sql;
