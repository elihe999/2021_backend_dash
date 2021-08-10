@foreach($name as $value)

    <li>{{$value['id']}}</li>
    <li>{{$value['name']}}</li>
    <li>{{$value['money']}}</li>
    {{--下标0开始--}}
    <li>{{$loop->index}}</li>
    {{--下标1开始--}}
    <li>{{$loop->iteration}}</li>

    @endforeach
{{--包含子视图--}}

@include('view.index',['name'=>'hello'])
@includeIf('view.index1',['name'=>'hello'])