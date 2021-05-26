# php

## check list

- array
- object
- function

## function

匿名函数和箭头函数都是 Closure 类的实现。箭头函数是 PHP 7.4 的新语法，是一种更简洁的 匿名函数 写法。

### 可变函数

PHP 支持可变函数的概念。这意味着如果一个变量名后有圆括号，PHP 将寻找与变量的值同名的函数，并且尝试执行它。可变函数可以用来实现包括回调函数，函数表在内的一些用途。

可变函数不能用于例如 echo，print，unset()，isset()，empty()，include，require 以及类似的语言结构。需要使用自己的包装函数来将这些结构用作可变函数。

## class and object
### object

要创建一个新的对象 object，使用 new 语句实例化一个类：

```php
<?php
class foo
{
    function do_foo()
    {
        echo "Doing foo."; 
    }
}

$bar = new foo;
$bar->do_foo();
?>
```

```php
<?php
class Car
{
  var $color;
  function __construct($color="green") {
    $this->color = $color;
  }
  function what_color() {
    return $this->color;
  }
}
?>
```

#### 转换为对象

如果将一个对象转换成对象，它将不会有任何变化。如果其它任何类型的值被转换成对象，将会创建一个内置类 stdClass 的实例。如果该值为 null，则新的实例为空。 array 转换成 object 将使键名成为属性名并具有相对应的值。注意：在这个例子里， 使用 PHP 7.2.0 之前的版本，数字键只能通过迭代访问。

```php
<?php
$obj = (object) array('1' => 'foo');
var_dump(isset($obj->{'1'})); // PHP 7.2.0 后输出 'bool(true)'，之前版本会输出 'bool(false)' 
var_dump(key($obj)); // PHP 7.2.0 后输出 'string(1) "1"'，之前版本输出  'int(1)' 
?>
// 对于其他值，会包含进成员变量名 scalar。
```
```php
<?php
$obj = (object) 'ciao';
echo $obj->scalar;  // outputs 'ciao'
?>
```

#### object to array

```php

//PHP stdClass Object转array  
function object_array($array) {  
    if(is_object($array)) {  
        $array = (array)$array;  
    } 
    if(is_array($array)) {
        foreach($array as $key=>$value) {  
            $array[$key] = object_array($value);  
        }  
    }  
    return $array;  
}
```

```php
$array = json_decode(json_encode(simplexml_load_string($xmlString)),TRUE);
```
```php
function object2array_pre(&$object) {
    if (is_object($object)) {
        $arr = (array)($object);
    } else {
        $arr = &$object;
    }
    if (is_array($arr)) {
        foreach($arr as $varName => $varValue){
            $arr[$varName] = $this->object2array($varValue);
        }
    }
    return $arr;
}
```

```php
function object2array(&$object) {
    $object =  json_decode( json_encode( $object),true);
    return  $object;
}
```

### class

#### new

要创建一个类的实例，必须使用 new 关键字。当创建新对象时该对象总是被赋值，除非该对象定义了 构造函数 并且在出错时抛出了一个 异常。类应在被实例化之前定义（某些情况下则必须这样）。

如果在 new 之后跟着的是一个包含有类名的字符串 string，则该类的一个实例被创建。如果该类属于一个命名空间，则必须使用其完整名称。

**示例 #8 类属性被赋值为匿名函数时的调用示例**

```php
<?php
class Foo
{
    public $bar;

    public function __construct() {
        $this->bar = function() {
            return 42;
        };
    }
}

$obj = new Foo();

echo ($obj->bar)(), PHP_EOL;
```

#### extends

#### ::class
关键词 class 也可用于类名的解析。使用 ClassName::class 可以获取包含类 ClassName 的完全限定名称。这对使用了 命名空间 的类尤其有用。

示例 #14 类名的解析

```php
<?php
namespace NS {
    class ClassName {
    }

    echo ClassName::class;
}
?>
```
> 输出 NS\ClassName
## Issue

1) Fatal error: Class declarations may not be nested in

类里面声明类


