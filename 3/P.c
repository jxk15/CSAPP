#include<stdio.h>

long Q(long a)
{
    a += 10;
    printf("%ld\n", a);
    return a;
}

long P(long x, long y)
{
    long u = Q(y);
    long v = Q(x);
    return u + v;
}

int main()
{
    printf("%ld\n", P(3, 7));
    return 0;
}