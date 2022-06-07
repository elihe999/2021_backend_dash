<?php

$hfp = fopen('./test2', 'r+');
$ofp = fopen('./test3', 'wb+');

$a = fread($hfp, 1);
$i = 1;
while($i < 4089856) {
	fwrite($ofp, $a);
	$i++;
}
fclose($hfp);
fclose($ofp);
var_dump(filesize('./test3'));

