long sum_llvm(long n);
long sum(long n) {
    long s = 0;
    for (long i = 0; i < n; i++)
        s += i;
    return s;
}

int main() {
    __builtin_printf("sum(5)       = %ld\n", sum(5));
    __builtin_printf("sum_llvm(5)   = %ld\n", sum_llvm(5));
    __builtin_printf("sum(10)      = %ld\n", sum(10));
    __builtin_printf("sum_llvm(10)  = %ld\n", sum_llvm(10));
}
