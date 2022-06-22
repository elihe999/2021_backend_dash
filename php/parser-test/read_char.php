<?php

$str = "SELECT * FROM a where a=1 and b='换行';";
$chars = preg_split('//', $str, -1, PREG_SPLIT_NO_EMPTY);
print_r($chars);

echo '===================';

function str_split_unicode($str, $l = 0) {
    if ($l > 0) {
    $ret = array();
        $len = mb_strlen($str, "UTF-8");
        for ($i = 0; $i < $len; $i += $l) {
            $ret[] = mb_substr($str, $i, $l, "UTF-8");
        }
        return $ret;
    }
    return preg_split("//u", $str, -1, PREG_SPLIT_NO_EMPTY);
}

print_r(str_split_unicode($str));
