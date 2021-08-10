# Blade

Blade on Laravel

## Flow control

```
@if (count($records) === 1)
    I have one record!
@elseif (count($records) > 1)
    I have multiple records!
@else
    I don't have any records!
@endif
```

```
@unless (Auth::check())
    You are not signed in.
@endunless
```

```
@isset($records)
    // $records is defined and is not null...
@endisset

@empty($records)
    // $records is "empty"...
@endempty
```

```
@for ($i = 0; $i < 10; $i++)
    The current value is {{ $i }}
@endfor

@foreach ($users as $user)
    <p>This is user {{ $user->id }}</p>
@endforeach

@forelse($users as $user)
    <li>{{ $user->name }}</li>
@empty
    <p>No users</p>
@endforelse

@while (true)
    <p>I'm looping forever.</p>
@endwhile
```

## @show 与 @stop

接下来再说说与 @section 对应的结束关键字，@show, @stop 有什么区别呢？（网上的部分文章，以及一些编辑器插件还会提示 @endsection, 这个在 4.0 版本中已经被移除，虽然向下兼容，但是不建议使用）。

@show 指的是执行到此处时将该 section 中的内容输出到页面，而 @stop 则只是进行内容解析，并且不再处理当前模板中后续对该section的处理，除非用 @override覆盖（详见下一部分）。通常来说，在首次定义某个 section 的时候，应该用 @show，而在替换它或者扩展它的时候，不应该用 @show，应该用 @stop。下面用例子说明：

```
{{-- layout.master --}}
<div id="zoneA">
@section('zoneA')
AAA
@show
</div>

<div id="zoneB">
@section('zoneB')
BBB
@stop
</div>

<div id="zoneC">
@section('zoneC')
CCC
@show
</div>
```


```
{{-- page.view --}}
@extends('layout.master')

@section('zoneA')
aaa
@stop

@section('zoneB')
bbb
@stop

@section('zoneC')
ccc
@show
```


