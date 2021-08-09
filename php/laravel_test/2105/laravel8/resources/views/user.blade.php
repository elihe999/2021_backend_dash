快速验证
<form action="{{ url('productAdd') }}" method="post">
    @csrf
    <input type="text" name="title" value=""><br/>
    <input type="text" name="image" value=""><br/>
    <input type="text" name="price" value=""><br/>
    <input type="text" name="description" value=""><br/>
    <input type="submit" value="ok"><br/>
</form>

异常显示
@if($errors->any())
    @foreach($errors->all() as $error)
        <li>{{$error}}</li>
    @endforeach
@endif