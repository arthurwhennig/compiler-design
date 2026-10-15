long add_llvm(long a, long b);
long add(long a, long b) { return a + b; }

int main() {
    __builtin_printf("add(1,2)      = %ld\n", add(1, 2));
    __builtin_printf("add_llvm(1,2)  = %ld\n", add_llvm(1, 2));
    __builtin_printf("add(-2,3)     = %ld\n", add(-2, 3));
    __builtin_printf("add_llvm(-2,3) = %ld\n", add_llvm(-2, 3));
}
