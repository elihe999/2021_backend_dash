# const

## 含义

const含义
常类型是指使用类型修饰符const说明的类型，常类型的变量或对象的值是不能被更新的。

## 作用

可以定义常量
const int a=100;
类型检查

const定义的变量只有类型为整数或枚举，且以常量表达式初始化时才能作为常量表达式。
其他情况下它只是一个 const 限定的变量，不要将与常量混淆。
防止修改，起保护作用，增加程序健壮性

```
void f(const int i){
    i++; //error!
}
```

可以节省空间，避免不必要的内存分配

const定义常量从汇编的角度来看，只是给出了对应的内存地址，而不是像#define一样给出的是立即数。
const定义的常量在程序运行过程中只有一份拷贝，而#define定义的常量在内存中有若干个拷贝。

## const对象默认为文件局部变量

注意：非const变量默认为extern。要使const变量能够在其他文件中访问，必须在文件中显式地指定它为extern。

未被const修饰的变量在不同文件的访问
```cpp
// file1.cpp
int ext
// file2.cpp
#include<iostream>

extern int ext;
int main(){
    std::cout<<(ext+10)<<std::endl;
}
```
const常量在不同文件的访问
```cpp
//extern_file1.cpp
extern const int ext=12;
//extern_file2.cpp
#include<iostream>
extern const int ext;
int main(){
    std::cout<<ext<<std::endl;
}
```
> 小结：
> 可以发现未被const修饰的变量不需要extern显式声明！而const常量需要显式声明extern，并且需要做初始化！因为常量在定义后就不能被修改，所以定义时必须初始化。

## 定义常量

```cpp
const int b = 10;
b = 0; // error: assignment of read-only variable ‘b’
const string s = "helloworld";
const int i,j=0 // error: uninitialized const ‘i’
```

上述有两个错误：

- b 为常量，不可更改！
- i 为常量，必须进行初始化！(因为常量在定义后就不能被修改，所以定义时必须初始化。)

## 指针与const

与指针相关的const有四种：

```cpp
const char * a; //指向const对象的指针或者说指向常量的指针。
char const * a; //同上
char * const a; //指向类型对象的const指针。或者说常指针、const指针。
const char * const a; //指向const对象的const指针。
```

小结：
如果const位于*的左侧，则const就是用来修饰指针所指向的变量，即指针指向为常量；
如果const位于*的右侧，const就是修饰指针本身，即指针本身是常量。

具体使用如下：

（1） 指向常量的指针
const int *ptr;
*ptr = 10; //error
ptr是一个指向int类型const对象的指针，const定义的是int类型，也就是ptr所指向的对象类型，而不是ptr本身，所以ptr可以不用赋初始值。但是不能通过ptr去修改所指对象的值。

除此之外，也不能使用void*指针保存const对象的地址，必须使用const void*类型的指针保存const对象的地址。

const int p = 10;
const void * vp = &p;
void *vp = &p; //error
另外一个重点是：允许把非const对象的地址赋给指向const对象的指针。

将非const对象的地址赋给const对象的指针:

const int *ptr;
int val = 3;
ptr = &val; //ok
我们不能通过ptr指针来修改val的值，即使它指向的是非const对象!

我们不能使用指向const对象的指针修改基础对象，然而如果该指针指向了非const对象，可用其他方式修改其所指的对象。可以修改const指针所指向的值的，但是不能通过const对象指针来进行而已！如下修改：

```cpp
int *ptr1 = &val;
*ptr1=4;
cout<<*ptr<<endl;
```

小结：
1.对于指向常量的指针，不能通过指针来修改对象的值。
2.不能使用void*指针保存const对象的地址，必须使用const void*类型的指针保存const对象的地址。
3.允许把非const对象的地址赋值给const对象的指针，如果要修改指针所指向的对象值，必须通过其他方式修改，不能直接通过当前指针直接修改。

（2） 常指针

const指针必须进行初始化，且const指针的值不能修改。

```cpp
#include<iostream>
using namespace std;
int main(){

    int num=0;
    int * const ptr=&num; //const指针必须初始化！且const指针的值不能修改
    int * t = &num;
    *t = 1;
    cout<<*ptr<<endl;
}
```

上述修改ptr指针所指向的值，可以通过非const指针来修改。

最后，当把一个const常量的地址赋值给ptr时候，由于ptr指向的是一个变量，而不是const常量，所以会报错，出现：const int* -> int *错误！

```cpp
#include<iostream>
using namespace std;
int main(){
    const int num=0;
    int * const ptr=&num; //error! const int* -> int*
    cout<<*ptr<<endl;
}
```

上述若改为 const int *ptr或者改为const int *const ptr，都可以正常！

（3）指向常量的常指针

理解完前两种情况，下面这个情况就比较好理解了：

const int p = 3;
const int * const ptr = &p; 
ptr是一个const指针，然后指向了一个int 类型的const对象。