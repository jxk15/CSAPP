#include<stdio.h>
struct A
{
    int a;
    char b;
    int c;
    char d;
};

struct B
{
    int a, b;
    char c, d;
};

int main()
{
    struct A a;
    struct B b;
    printf("%ld %ld\n", sizeof(a), sizeof(b));
    return 0;
}
