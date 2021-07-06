<form method="post" action="enter">
    {{--  {{csrf_field()}}--}}
    @csrf
    用户：<input type="text" name="username"><br>
    密码：<input type="text" name="password"><br>
    <button type="submit">提交</button>
</form>