<?php

$struct = array();
$struct['force_suffix'] = '123';
$struct['file_prefix'] = '456';

$force_suffix = isset($struct['force_suffix']) ? $struct['force_suffix'] : null;
$file_prefix = isset($struct['file_prefix']) ? $struct['file_prefix'] : '';

if (!is_null($force_suffix)) {
    $postfix = $force_suffix;
}
$path = "/" . $file_prefix . "task_" . $postfix;
echo $path;
