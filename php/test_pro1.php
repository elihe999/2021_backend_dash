<?php

$outHandle = fopen('./test2', 'wb+');

for($i = 0; $i<10; $i++) {
    fwrite($outHandle, $i."_tsfdfadfasfafdasdfasdfasdfasdfassdfasdfadfasdfadfasfasdfasfagefbaba\n");
}
fclose($outHandle);
