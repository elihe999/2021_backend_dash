<?php

$a = date_parse_from_format('H:i:s', '2022-12-12 12:12:12');
var_dump(isset($a['errors']));
$b = date_parse_from_format('H:i:s', '12:12:00');
$c = date_parse_from_format('H:i:s', '12:12:12');
$e = strtotime('12:12:00');
$f = strtotime('12:12:12');
var_dump($e);
var_dump($f);
#var_dump($b);
#var_dump($c);
#var_dump($b-$c);
