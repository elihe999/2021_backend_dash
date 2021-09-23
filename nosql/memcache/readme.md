# memcache

## Install for php

Step 1.
$ sudo apt-get install memcached
Step 2.
$ sudo apt-get install php5-memcached
Step 3.
$ sudo /etc/init.d/apache2 restart


> php7

$ sudo apt-get install memcached
$ sudo apt-get install php-memcached
$ sudo apachectl graceful


## PHP Memcache 扩展安装

PHP Memcache 扩展包下载地址：http://pecl.php.net/package/memcache，你可以下载最新稳定包(stable)。

wget http://pecl.php.net/get/memcache-2.2.7.tgz               
tar -zxvf memcache-2.2.7.tgz
cd memcache-2.2.7
/usr/local/php/bin/phpize
./configure --with-php-config=/usr/local/php/bin/php-config
make && make install
注意：/usr/local/php/ 为php的安装路径，需要根据你安装的实际目录调整。

安装成功后会显示你的memcache.so扩展的位置，比如我的：

Installing shared extensions:     /usr/local/php/lib/php/extensions/no-debug-non-zts-20090626/
最后我们需要把这个扩展添加到php中，打开你的php.ini文件在最后添加以下内容：

[Memcache]
extension_dir = "/usr/local/php/lib/php/extensions/no-debug-non-zts-20090626/"
extension = memcache.so
添加完后 重新启动php,我使用的是nginx+php-fpm进程所以命令如下：

kill -USR2 `cat /usr/local/php/var/run/php-fpm.pid`
如果是apache的使用以下命令:

/usr/local/apache2/bin/apachectl restart
检查安装结果

/usr/local/php/bin/php -m | grep memcache
安装成功会输出：memcache。

或者通过浏览器访问 phpinfo() 函数来查看

## PHP 使用

```php
<?php
$memcache = new Memcache;             //创建一个memcache对象
$memcache->connect('localhost', 11211) or die ("Could not connect"); //连接Memcached服务器
$memcache->set('key', 'test');        //设置一个变量到内存中，名称是key 值是test
$get_value = $memcache->get('key');   //从内存中取出key的值
echo $get_value;
?>
```

## 调优

和内存优化相关的参数大致有三个，分别是

1、chunk大小的增长因子(Growth Factor)，

2、chunk大小的初始值

3、slab page的大小




一、Growth Factor
Growth Factor的值决定了chunk的大小按怎样的倍数进行增长，memcached在启动时可以通过-f参数指定 Growth Factor值， 就可以在某种程度上控制slab之间的差异。默认值为1.25。



我们使用下面命令
memcached -u cai -m 10 -f 3 -p 9991 -vvv



输出下面结果：


slab class   1: chunk size        96 perslab   10922

slab class   2: chunk size       288 perslab    3640

slab class   3: chunk size       864 perslab    1213

slab class   4: chunk size      2592 perslab     404

slab class   5: chunk size      7776 perslab     134

slab class   6: chunk size     23328 perslab      44

slab class   7: chunk size     69984 perslab      14

slab class   8: chunk size    209952 perslab       4

slab class   9: chunk size   1048576 perslab       1



可见，从96字节的组开始，组的大小依次增大为原来的3倍。 这样设置的问题是，slab之间的差别比较大，有些情况下就相当浪费内存。 因此，为尽量减少内存浪费，追加了growth factor这个选项。在使用memcached时，或是直接使用默认值进行部署时， 最好是重新计算一下数据的预期平均长度，调整growth factor， 以获得最恰当的设置，避免内存的大量浪费。



注意：每个slab class 默认1MB。。所以96*10922=1MB；288*3640=1MB；864*1213=1MB






二、chunk大小的初始值
64位机情况下，默认memcached把slab分为42类（class1～class42），在class 1中，chunk的默认大小为96字节，由于一个slab的大小是固定的1048576字节（1M），因此在class1中最多可以有10922个chunk：10922×96 + 64 = 1048576。在class1中，剩余的64字节因为不够一个chunk的大小（96byte），因此会被浪费掉。每类chunk的大小有一定的计算公式的，假定i代表分类，class i的计算公式如下：


chunk size(class i) :  (default_size+item_size)*f^(i-1)+ CHUNK_ALIGN_BYTES


default_size: 默认大小为48字节,也就是memcached默认的key+value的大小为48字节，可以通过-n参数来调节其大小；
item_size: item结构体的长度，固定为48字节。default_size大小为48字节，item_size为48，因此class1的chunk大小为48+48=96字节；
CHUNK_ALIGN_BYTES是一个修正值，用来保证chunk的大小是某个值的整数倍。
下面使用-n参数将chunk的初始值大小设置为80字节：



$ memcached -n 80 -vv
1.
输出：



slab class   1: chunk size       128 perslab    8192 
slab class   2: chunk size       160 perslab    6553 
slab class   3: chunk size       200 perslab    5242 
slab class   4: chunk size       256 perslab    4096 
slab class   5: chunk size       320 perslab    3276 
slab class   6: chunk size       400 perslab    2621 
slab class   7: chunk size       504 perslab    2080 
slab class   8: chunk size       632 perslab    1659 
slab class   9: chunk size       792 perslab    1323 
slab class  10: chunk size       992 perslab    1057
slab class  11: chunk size      1240 perslab     845

可以看见class1的chunk大小为：80+48字节，根据具体的业务预估缓存数据的最小值以便设置memcache的chunk初始值，避免内存浪费。





三、page大小
memcache默认的page大小是1M，所以不能存入大小超过1M的数据，但一旦需要存入大数据时可以使用-I参数来设置page的值，比如我将page值设为0.5M（不推荐将page值设置为超过1M）：


$ memcached -I 524288 -vv
1.
输出：

slab class   1: chunk size        96 perslab    5461 
slab class   2: chunk size       120 perslab    4369
slab class   3: chunk size       152 perslab    3449
slab class   4: chunk size       192 perslab    2730
slab class   5: chunk size       240 perslab    2184
slab class   6: chunk size       304 perslab    1724
slab class   7: chunk size       384 perslab    1365
slab class   8: chunk size       480 perslab    1092
slab class   9: chunk size       600 perslab     873 

以上介绍了memcache内存配置的三个参数，根据业务灵活的配置能大大的提高内存使用率。



======================

