#include<stdio.h>
void test(int a, int b){
// cmp between var and imm----------------------
	// if(-3 <= a) a = a + 1;
	// else printf("3333\n");
	// a >= -3
	// cmpl $-3, %edi
	// jl .L7
	// ret

	// if(-3 >= a) a = a + 1;
	// else printf("3333\n");
	// a < -2
	// cmpl $-2, %edi
	// jge .L7
	// ret

	// if(a >= -3) a = a + 1;
	// else printf("3333\n");
	// a >= -3
	// cmpl $-3, %edi
	// jl .L7
	// ret

	// if (a <= -3) a = a + 1;
	// else printf("3333\n");
	// a < -2
	// cmpl $-2, %edi
	// jge .L7
	// ret

// cmp between var and var-------------------------
	// if(b <= a) a = a + 1;
	// else printf("3333\n");
	// cmpl	%edi, %esi

	if(a >= b) a = a + 1;
	else printf("3333\n");
	// cmpl %esi, %edi
}
