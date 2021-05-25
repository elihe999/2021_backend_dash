# auto load

## 类的自动加载

```php
<?php
function __autoload($class_name) 
{
    require_once $class_name.'.php';
}
```

spl_autoload_register

```php
//声明一个自定义的加载类文件的函数
function _autoload($class_name){
    $file = './' . $class_name . '.class.php';
    $file = str_replace('\\','/',$file);
    if (file_exists($file)) {
        require_once($file);
    }
}
//注册自定义的加载函数，注册之后，自定义的加载函数就变成了自动加载的函数
spl_autoload_register('_autoload');
```
