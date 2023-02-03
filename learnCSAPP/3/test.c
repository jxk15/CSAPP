// 对栈上的数据的指针进行类型转换，并修改数据的值
// 观察栈指针的值、各函数的栈帧
#include <stdio.h>

typedef unsigned char *byte_pointer;

void show_long(byte_pointer start)
{
    int i;
    for (i = 0; i < 8; i++)
        printf("%.2x", start[i]);
    puts("");
}
void add1(long *x)
{
    *x += 0x1122334455667788;
    // *x += 0x1;  // 指令为 addq，由指针类型决定
}

void test1()
{
    int x = 1;
    show_long((byte_pointer)&x);
    add1((long *)&x);
    show_long((byte_pointer)&x);
}

void test2()
{
    int x = 1;
    show_long((byte_pointer)&x);
}

void test3()
{
    int x = 1;
    add1((long *)&x);
}

int main()
{
    test1();
    test2();
    test3();
    return 0;
}