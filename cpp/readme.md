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