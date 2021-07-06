{{--继承父模板--}}
@extends('view/app')

@section('head')
    <form method="post" action="enter">
        {{--  {{csrf_field()}}--}}
        @csrf
        用户：<input type="text" name="username"><br>
        密码：<input type="text" name="password"><br>
        <button type="submit">提交</button>
    </form>
        {{--保留父模板的的内容--}}
        @parent
    {{--stop结束标签--}}


    @stop()

@section('content')
    我不是，大家是最帅的
    {{--@yield 父模板信息不回保留--}}
    @parent
@endsection()

