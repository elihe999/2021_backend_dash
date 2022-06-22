<?php

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

$str = "selete * from a where a_1 = 1;";
$all_chars = str_split_unicode($str);

$default_char = ['select', 'all', 'where'];


