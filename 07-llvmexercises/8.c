void print(long a, long b) { __builtin_printf("(%ld,%ld)\n", a, b); }

void swap_args(long a, long b) { print(b, a); }
void swap_args_llvm(long a, long b);

void swap_args_ptr(long *a, long *b) { print(*b, *a); }
void swap_args_llvm_ptr(long *a, long *b);

int main() {
    __builtin_printf("swap_args      (1,2): ");
    swap_args(1, 2);
    __builtin_printf("swap_args_llvm (1,2): ");
    swap_args_llvm(1, 2);
    long a = 3, b = 4;
    __builtin_printf("swap_args_ptr      (3,4): ");
    swap_args_ptr(&a, &b);
    __builtin_printf("swap_args_ptr_llvm (3,4): ");
    swap_args_llvm_ptr(&a, &b);
}
