<form method="post" action="enter">
    {{--  {{csrf_field()}}--}}
    用户：<input type="text" name="username"><br>
    密码：<input type="text" name="password"><br>
    <button type="submit">提交</button>
</form>
--------------------------------------<br>
@if ($errors->any())
   <div class="alert alert-danger">
    <ul>
        @foreach ($errors->messages() as $key => $error)
            <li>{{$key}} -->> {{$error[0]}}</li>
        @endforeach
    </ul>
    </div>
    @endif
<?php dd($errors)?>