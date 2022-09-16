int var_prod_ele(long n, int A[n][n],
                    int B[n][n],
                    long i, long k) {
    // n %rdi
    // A %rsi
    // B %rdx
    // i %rcx
    // k %r8
    long j;
    int result = 0;
    for (j = 0; j < n; j++)
        result += A[i][j] * B[j][k];
    return result;
}

/*
%rax 并不总是存储返回值，
在本例中就作为了循环变量，
使用 %r10d 临时存储结果，
在return前把%r10d的值赋给%rax
*/