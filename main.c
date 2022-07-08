#include<stdio.h>
#include<sys/utsname.h>

int main(){
    printf("hello world\n");
    struct utsname name;
    uname(&name);
    printf("Len: %d\n",_UTSNAME_SYSNAME_LENGTH);
    printf("sysname: %s\nnodename: %s\n,version: %s\n"
                    ,name.sysname
                    ,name.nodename
                    ,name.version);
    return 0;
}
