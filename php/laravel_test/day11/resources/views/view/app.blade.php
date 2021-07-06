<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">



        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet" type="text/css">

        <!-- Styles -->
    <title> laravel5.7 @yield('title','Winner')</title>
    </head>
    <body>
        @section('head')
                父模板不要结束我们模板布局
            @show()
        <div>
            {{--yield 小部分的修改内容 --}}
            @yield('content','winner老师最帅')
        </div>
        {{-- 模板声明主体部分
        show结尾：给子模板继承使用
        --}}
        @section('bottom')
        @show()
    </body>
</html>
