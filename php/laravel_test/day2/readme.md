# Begin

Laravel 5.7:

- Openssl
- PHP > 7.1.3

## Install

[golaravel](http://www.golaravel.com/download/)
[Laragon](https://laragon.org/)

1) 脚手架安装：快速搭建包。声明各个包关系

```cmd
composer global require "laravel/installer"
laravel new laravel-project
```

*项目名laravel-project*

2) composer install

```cmd
composer create-project laravel/laravel laravel-composer
```

*项目名laravel-composer*

### artisan

Artisan 是 Laravel 中自带的命令行工具的名称。它提供了一些对您的应用开发有帮助的命令。它是由强大的 Symfony Console 组件驱动的。为了查看所有可用的 Artisan 的命令，您可以使用 list 命令来列出它们：

*安装后目录下有artisan文件*

php artisan xx

#### artisan tinker



### composer

下载 Composer
安装前请务必确保已经正确安装了 PHP。打开命令行窗口并执行 php -v 查看是否正确输出版本号。

打开命令行并依次执行下列命令安装最新版本的 Composer：

```
php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');"
```

```
php composer-setup.php
```

```
php -r "unlink('composer-setup.php');"
```

执行第一条命令下载下来的 composer-setup.php 脚本将简单地检测 php.ini 中的参数设置，如果某些参数未正确设置则会给出警告；然后下载最新版本的 composer.phar 文件到当前目录。

上述 3 条命令的作用依次是：

下载安装脚本 － composer-setup.php － 到当前目录。
执行安装过程。
删除安装脚本。

https://docs.phpcomposer.com/03-cli.html

#### 安装参数

* --prefer-source: 下载包的方式有两种： source 和 dist。对于稳定版本 composer 将默认使用 dist 方式。而 * source 表示版本控制源 。如果 --prefer-source 是被启用的，composer 将从 source 安装（如果有的话）。如果想要使用一个 bugfix 到你的项目，这是非常有用的。并且可以直接从本地的版本库直接获取依赖关系。
* --prefer-dist: 与 --prefer-source 相反，composer 将尽可能的从 dist 获取，这将大幅度的加快在 build * servers 上的安装。这也是一个回避 git 问题的途径，如果你不清楚如何正确的设置。
* --dry-run: 如果你只是想演示而并非实际安装一个包，你可以运行 --dry-run 命令，它将模拟安装并显示将会发生什么。
* --dev: 安装 require-dev 字段中列出的包（这是一个默认值）。
* --no-dev: 跳过 require-dev 字段中列出的包。
* --no-scripts: 跳过 composer.json 文件中定义的脚本。
* --no-plugins: 关闭 plugins。
* --no-progress: 移除进度信息，这可以避免一些不处理换行的终端或脚本出现混乱的显示。
* --optimize-autoloader (-o): 转换 PSR-0/4 autoloading 到 classmap 可以获得更快的加载支持。特别是在生产环境* 下建议这么做，但由于运行需要一些时间，因此并没有作为默认值。

## PSR

> PSR-4: 支持composer自动加载的规范，是基于psr-1的补充。

## Laravel

### structure

**app**
> 包含了站点的controllers（控制器），models（模型），views（视图）和assets（资源）。这些是网站运行的主要代码，你会将你大部分的时间花在这些上面。

**bootstrap**
> 用来存放系统启动时需要的文件，这些文件会被如index.php这样的文件调用。

**public**
> 这个文件夹是唯一外界可以看到的，是必须指向你web服务器的目录。它含有laravel框架核心的引导文件index.php，这个目录也可用来存放任何可以公开的静态资源，如css，Javascript，images等。

css/ svg/ img/

**vendor**
> 用来存放所有的第三方代码，在一个典型的Laravel应用程序，这包括Laravel源代码及其相关，并含有额外的预包装功能的插件。

server.php: 用于测试

/app/config/

> 配置应用程序的运行时规则、 数据库、 session等等。包含大量的用来更改框架的各个方面的配置文件。大部分的配置文件中返回的选项关联PHP数组。

/app/config/app.php

> 各种应用程序级设置，即时区、 区域设置（语言环境）、 调试模式和独特的加密密钥。

/app/config/auth.php

> 控制在应用程序中如何进行身份验证，即身份验证驱动程序。

/app/config/cache.php

> 如果应用程序利用缓存来加快响应时间，要在此配置该功能。

/app/config/compile.php

> 在此处可以指定一些额外类，去包含由‘artisan optimize’命令声称的编译文件。这些应该是被包括在基本上每个请求到应用程序中的类。

/app/config/database.php

> 包含数据库的相关配置信息，即默认数据库引擎和连接信息。

/app/config/mail.php

> 为电子邮件发件引擎的配置文件，即 SMTP 服务器，From:标头

/app/config/session.php

> 控制Laravel怎样管理用户sessions,即session driver, session lifetime。

/app/config/view.php

> 模板系统的杂项配置。

/app/controllers

> 包含用于提供基本的逻辑、 数据模型交互以及加载应用程序的视图文件的控制器类。

/app/database/migrations/

> 包含一些 PHP 类，允许 Laravel更新当前数据库的架构并同时保持所有版本的数据库的同步。迁移文件是使用Artisan工具生成的。

/app/database/seeds/

> 包含允许Artisan工具用关系数据来填充数据库表的 PHP 文件。

/app/lang/

> PHP 文件，其中包含使应用程序易于本地化的字符串的数组。默认情况下目录包含英语语言的分页和表单验证的语言行。

/app/models/

> 模型是代表应用程序的信息（数据）和操作数据的规则的一些类。在大多数情况下，数据库中的每个表将对应应用中的一个模型。应用程序业务逻辑的大部分将集中在模型中。

/app/start/

> 包含与Artisan工具以及全球和本地上下文相关的自定义设置。

/app/storage/

> 该目录存储Laravel各种服务的临时文件，如session, cache,  compiled view templates。这个目录在web服务器上必须是可以写入的。该目录由Laravel维护，我们可以不关心。

/app/tests/

> 该文件夹给你提供了一个方便的位置，用来做单元测试。如果你使用PHPUnit，你可以使用Artisan工具一次执行所有的测试。

/app/views/

> 该文件夹包含了控制器或者路由使用的HTML模版。请注意，这个文件夹下你只能放置模版文件。其他的静态资源文件如css, javascript和images文件应该放在/public文件夹下。

/app/routes.php

> 这是您的应用程序的路由文件，其中包含路由规则，告诉 Laravel 如何将传入的请求连接到路由处理的闭包函数、 控制器和操作。该文件还包含几个事件声明，包括错误页的，可以用于定义视图的composers。

/app/filters.php

> 此文件包含各种应用程序和路由筛选方法，用来改变您的应用程序的结果。Laravel 具有访问控制和 XSS 保护的一些预定义筛选器。

### 运行方式

1) web 服务器
2) 内置web 服务器：artisan serve

### Laravel的生命周期：

1、执行composer自动加载
2、引入laravel的应用实例与基础应用相关注册
3、创建http的中级与服务请求解析



### 执行流程

> 3

1. url地址路由匹配
2. 