# Eloquent

<https://laravelacademy.org/post/21546>

## CURD

### Delete


```php
namespace App\Model;
use Illuminate\Database\Eloquent\Model;
class Admin extends Model
{
    protected $table = 'admin';
    $data = Admin::find(1)->delete();
    dump($data);
}
```

```php
namespace App\Model;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
```


10>软删除
		软删除后，并未真正删除，在模型上设置一个 'deleted_at' 字段(就是我们平常的isshow = 0，添加一个状态位)
		1)启用软删除
			1.使用 'Illuminate\Database\Eloquent\SoftDeletes'，并添加 'deleted_at' 到 $dates 属性
				use Illuminate\Database\Eloquent\Model;
				class Flight extends Model{
				    use SoftDeletes;
				    protected $dates = ['deleted_at'];
				}
			2.数据表中，创建 'deleted_at' 字段。Laravel Schema构建器包含一个帮助函数来创建该列：
				Schema::table('flights', function ($table) {
				    $table->softDeletes();
				});
			3.当调用模型的delete方法时，deleted_at列将被设置为当前日期和时间，并且，当查询一个使用软删除的模型时，被软删除的模型将会自动从查询结果中排除。
		2)判断给定模型实例是否被软删除
			trashed()
				if($flight->trashed()){ }
		3)查询数据，包含被软删除的模型：
			withTrashed()
				$flights = App\Flight::withTrashed()->where('account_id', 1)->get();
		4)只获取软删除模型
			onlyTrashed()
				$flights = App\Flight::onlyTrashed()->where('airline_id', 1)->get();
		5)恢复软删除模型
			restore()
				App\Flight::withTrashed()->where('airline_id', 1)->restore();	// 快速恢复多个模型
		6)永久删除模型
```
 forceDelete()
 $flight->forceDelete();
```

## allow

php\laravel_test\day9\app\Model\Admin.php
```
<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
//引入软删除内库
use Illuminate\Database\Eloquent\SoftDeletes;
class Admin extends Model
{
    use SoftDeletes;
    protected $table = 'admin';
    //关闭自动更新时间字段
    public $timestamps = false;
    //设置表名id
    protected $primaryKey = 'id';
    //允许操作的属性  字段白名单
    protected $fillable = ['name','email'];
    //不允许操作属性  字段黑名单
    protected $guarded = ['password'];

}
```