# php

## check list

- array
- object
- function


### object

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