<?php

$a = [
	array(
		"a" => 1,
		"b" => 2
	)
];
var_dump($a);

foreach ($a as $key => $value) {
	var_dump($key);
	var_dump($value);
}
