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