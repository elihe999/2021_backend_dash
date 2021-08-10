
<div class="alert alert-danger">
    {{--定义多个卡槽，你你需要自定义名称。同时需要在组件全部匹配到卡槽--}}

    <div class="alert-title">{{ $title }}</div>
    <div class="alert-title">{{ $test }}</div>
    {{ $slot }}
    {{--组件传参--}}
    {{$winner}}
</div>
<script>
    {{--json_encode--}}
    var json = @json(['winner','pack','peter']);
    console.log(json);
</script>
