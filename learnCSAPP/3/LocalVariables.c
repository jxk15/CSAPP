// 局部变量对齐测试
#include<stdio.h>
void f2()
{
    printf("here is f2()\n");
    long x1;
    int x2;
    short x3;
    char x4;
    printf("%p %p %p %p\n", &x1, &x2, &x3, &x4);
}
void f3()
{
    printf("here is f3()\n");
    long x1;
    short x2;
    int x3;
    char x4;
    printf("%p %p %p %p\n", &x1, &x2, &x3, &x4);
}
void f4()
{
    printf("here is f4()\n");
    char x1;
    int x2;
    long x3;
    short x4;
    printf("%p %p %p %p\n", &x1, &x2, &x3, &x4);
}

void f5()
{
    printf("here is f4()\n");
    char x1;
    printf("%p\n", &x1);
}
int main()
{
    f2();
    f3();
    f4();
    f5();
    return 0;
}