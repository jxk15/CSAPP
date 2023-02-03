#include<stdio.h>

int main()
{
    unsigned char a = 255;
    signed char b = -1;
    printf("%d %d\n", a, b);
    int c = 0x00112231;
    c = c << (-1);
    printf("%d\n", c);
    return 0;
}
