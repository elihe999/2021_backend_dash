# 粘包

```php
$server->set([
  'open_length_check'     => true,
  'package_max_length'    => 1 * 1024 * 1024 ,
  'package_length_type'   => 'n',
  'package_length_offset' => 0,
  'package_body_offset'   => 2
]);

```