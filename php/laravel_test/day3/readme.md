# day3

路由解析

## context

## 2 artisan 命令

php artisan make:controller LoginController

Illuminate\Console\Command

修改的地方：

1. extend GeneratorCommand
2. 


### stub

**模版**

[Issue]: 文件名称不存在。

```php
protected $signature = 'make:service';
```

[Solution]: 添加 {name}

> 自定义创建时是需要文件名的

```php
protected $signature = 'make:service {name}';
```

## 3 路由流程

index.php->加载bootstrap/App.php->初始化Application->请求路由-管道->中间件组（过滤）->路由表检测->检查用户访问是否匹配->进入控制器，完成方法/完成请求->控制器组/(中间件组[前置后置])处理数据->视图渲染或返回数据

## 4 路由基础使用

mapApi和mapWeb,

app/Http/Kernel.php

protected $middlewareGroup = function()

可以先注释掉\App\Http\Midderware\VerifyCsrToken功能，以查看效果，
\App\Http\Midderware\VerifyCsrToken::class 会保护非Get类的请求。

```php
// Laravel
Route::get('/', function() {
	return "hello world";
})
```
Route里可以是闭包，也可以是指定的*控制器*。

常用Get Post Put Delete Patch。

> \App\Http\Midderware\VerifyCsrToken 会保护非Get类的请求

```php
class LoginController

Route::get('/', 'order\Login')
```

### laravel中控制器的创建和使用

```shell
php artisan make:controller TestController
```

*TestController*
*app\Http\Controllers\TestController.php*
```php
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class TestController extends Controller
{
    // add index()
    public function index()
    {
        return "This is app\index";
    }
}

```

*route\web.php*

```php
<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('test', 'TestController@index');

Route::get('hello', function() {
	return "hello world";
});
```

### result

http://laratest.test/hello
>hello world

http://laratest.test/test
>This is app\index
---

$middleware：全局中间件，要对所有的请求要做一些处理的时候，就适合定义在该属性内。（比如统计请求次数这些）
$middlewareGroups：中间件组，比如我们项目有api请求和web的请求的时候，就要把两种类型的请求中间件分离开来，这时候就需要我们中间件组。
$routeMiddleware：路由中间件，有些个别的请求，我们需要执行特别的中间件时，就适合定义在这属性里面。

### reference

<https://laravel-china.org/topics/7392/laravel-three-middleware-functions>

## 5 参数与别名

```php
Route::get('hello/{name}', function($name) {
	return "hello $name";
});
```

>参数名字可以不一样,类似占位符。

```php
Route::get('hello/{name}/{test}', function($eli, $name) {
	return "hello $eli -- $name and other guess";
});
```

>http://laratest.test/hello/a/b
\> hello a -- b and other guess


>非强制使用？但是要加默认值
```php
Route::get('hello/{name}/{id?}', function($eli, $name = 'default') {
	return "hello $eli -- $name and other guess";
});
```
>http://laratest.test/hello/a
\> hello a -- default and other guess


>where 具体指定类型，使用正则或者数组进行多个传递

```php
Route::get('hello/{name}/{name11}', function ($name, $shineyork = 'shineyork') {
    return $shineyork. '  --  '.$name;
})->where([
    'name' => '[A-Za-z]',
    'name11' => '[A-Za-z]',
])->where('id', '[A-Za-z]')->name('hello');
```

参数校验一般用校验类

### 路由别名

```php
Route::get('test', 'TestController@index')->name('index.req');

Route::get('/', function () {
    return route('index.req');
});

```

>访问/就会到test。因为test使用name('index.req')声明了别名。

## 6 路由分组 以及 灵活

```php
Route::prefix('admin')->namespace('Admin')->group( function()
{   // 在 "App\Http\Controllers\Admin" 命名空间下的控制器
    Route::middleware(['auth'])->group(function()
    {
        Route::prefix('auth')->group(function()
        {
            Route::get('userinfo', function()
            {
                return '查询用户的信息';
            });
        });
    });
    Route::prefix('login')->group(function()
    {
        Route::get('login', 'LoginController@login');
        Route::get('verify', 'LoginController@verify');
    });
});
```

命名空间

