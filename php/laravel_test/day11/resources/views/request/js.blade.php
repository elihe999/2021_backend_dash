<!-- js 加入meta-->
<meta name="csrf-token" content="{{ csrf_token() }}">

<script type="text/javascript" src=" {{URL::asset('js/jquery-3.3.1.min.js')}}"></script>
<script type="text/javascript">
        $(function(){
            $.ajax({
                'url':'hello_from',
                'data':{
                    'username':'winner',
                },
                headers:{
                    "X-CSRF-TOKEN":$('meta[name="csrf-token"]').attr('content'),
                },
                'type':'post',
                success:function ($msg) {
                    alert($msg);
                }
            })
        });

</script>