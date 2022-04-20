<?php
$a = time();
echo "time:".$a."\n";
$text = "";
$stream = fopen('./test2', 'r+');
while (!feof($stream)) {
	$text = fgets($stream, 10);
	echo $text."--------\n";
}
print_r('text:'.$text."\n");
fclose($stream);
echo (time() - $a)."\n";

echo "-----------------------\n";

$a = time();
echo "time:".$a."\n";
$stream = fopen('./test2', 'r+');
while (!feof($stream)) {
	$text = fgets($stream, 1024000);
	echo $text;
}
fclose($stream);
echo "text:".$text."\n";

echo time() - $a;




#fsafafa
#-------
#------:q

