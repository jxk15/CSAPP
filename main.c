#include<stdio.h>

void multstore(long, long, long *);

long mult2(long a, long b, long c, long d, long e, long f, long g, long h)
{
	long s = a * b * c * d * e * f * g * h;
	return s;
}
long add(long a, long b, long c, long d, long e, long f, long g)
{
	long s = a * b * c * d * e * f * g;
	return s;
}

int main()
{
	long d, c;
	// multstore(2, 3, &d);
	// printf("2 * 3 -> %ld\n", d);
	// long a = add(1, 2, 3, 4, 5, 6, 7);
	// printf("%ld\n", a);

	long s = mult2(1, 2, 3, 4, 5, 6, 7, 8);
	printf("%ld\n", s);

	long a = add(1, 2, 3, 4, 5, 6, 7);
	printf("%ld\n", a);
	d = 10, c = 11;
	printf("%ld %ld\n", d, c);
	return 0;
}



