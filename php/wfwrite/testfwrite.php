<?php

$fp = fopen("./testest", "w");
fwrite($fp, utf8_encode('1'));
fwrite($fp, '1');
fwrite($fp, '1');
fwrite($fp, '1');
fwrite($fp, '1');
fclose($fp);
