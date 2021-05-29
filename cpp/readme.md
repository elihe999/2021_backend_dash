# cpp

## Contact

* base
* stl
* OO object oriented
* GP Generic Programming
* ADT:abstract data type - PP:procedure programme
* 编译器


## stl

* Containers
* Algorithms
* Iterators

### Containers

#### 顺序容器

顺序容器有以下三种：可变长动态数组 vector、双端队列 deque、双向链表 list。


#### 关联容器

关联容器有以下四种：set、multiset、map、multimap。关联容器内的元素是排序的。插入元素时，容器会按一定的排序规则将元素放到适当的位置上，因此插入元素时不能指定位置。

### Iterators

1) 正向迭代器，定义方法如下：
容器类名::iterator  迭代器名;


2) 常量正向迭代器，定义方法如下：
容器类名::const_iterator  迭代器名;


3) 反向迭代器，定义方法如下：
容器类名::reverse_iterator  迭代器名;


4) 常量反向迭代器，定义方法如下：
容器类名::const_reverse_iterator  迭代器名;


### Algorithms

* 非更易型算法（nomodifying algorithm）
* 更易型算法（modifying algorithm）
* 移除型算法（removing algorithm）
* 变序型算法（mutating algorithm）
* 排序算法（sorting algorithm）
* 已排序区间算法（sorted-range algorithm）
* 数值算法（numeric algorithm）


## c++11

CPP11新特性

### nullptr常量

C++中NULL仅仅是define NULL 0的一个宏定义，因此，有时候会产生歧义
比如f（char*）和f（int），参数传NULL的话到底该调用哪个？
事实上，在VS下测试这样的函数重载会优先调用f（int），但是f（char *）也是正确的，因此C++引入nullptr来避免这个问题
nullptr是一个空指针，可以被转换成其他任意指针的类型

### auto类型指示符

让编译器替我们去分析表达式所属的类型，直接推导
尤其是STL中map的迭代器这种很长的类型，适合用auto
decltype类型指示符
从表达式的类型推断出要定义的变量的类型，跟表达式的类型也就是参数类型紧密相关
delctype (f()) sum = x; 并不实际调用函数f()，只是使用f()的返回值当做sum的类型
delctype (i) sum = x;和delctype ((i)) sum = x; 其中i为int类型，前面的为int类型，后面的为int&引用

### 范围for语句

多与auto配合使用
```cpp
string str("somthing");
for(auto i:str) //对于str中的每个字符，i类型为char
    cout << c << endl;

for(auto &i:str) //对于若要改变每个字符的值，需要加引用
    cout << c << endl;
```

### 定义双层vector
vector<vector<int>>(m, vector<int>(n, 0)) 创建m行n列的二维数组，全部初始化为0
lambda表达式
用于实现匿名函数，匿名函数只有函数体，没有函数名
[capture list] (params list) mutable exception-> return type {function body};  //1
[capture list] (params list) -> return type {function body};  //1 省略mutable，表示const不可修改
[capture list] (params list) {function body};		//2 省略返回类型，按照函数体返回值决定返回类型
[capture list] {function body};		//3 省略参数列表，无参函数
参数
capture list：捕获外部变量列表
params list：形参列表
mutable指示符：用来说用是否可以修改捕获的变量
exception：异常设定
return type：返回类型
function body：函数体
//示例
sort(vec.begin(), vec.end(), [](int a, int b)->bool{return a < b})

### 参数捕获方式

值捕获(传参)、引用捕获（传引用）、隐式捕获（传=，函数体直接使用变量））。

### 智能指针

shared_ptr
weak_ptr
unique_ptr

### 右值引用

左值引用，必须引用左值 int a = 0; int &b = a;
右值引用可以引用结果 int && i = 0

### 仿函数

定义
仿函数(functor)又称之为函数对象（function object），其实就是重载了operator()操作符的struct或class，是一个能行使函数功能的类
它使一个类的使用看上去像一个函数，这个类就有了类似函数的行为，就是一个仿函数类。
