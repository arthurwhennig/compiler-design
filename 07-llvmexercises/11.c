struct S{
    long a;
    long b;
};


struct S bias;

struct S sum_arr(struct S* arr, long n){
    long sum_a = 0;
    long sum_b = 0;
    for (long i = 0 ; i< n; i++){
        sum_a += arr[i].a + bias.a;
        sum_b += arr[i].b + bias.b;
    }
    return (struct S){sum_a, sum_b};
}


struct S sum_arr_llvm(struct S* arr, long n);

int main() {
    bias = (struct S){3, 5};
    struct S arr[4] = {{1, 2}, {3, 4}, {5, 6}, {7, 8}};
    struct S sum1 = sum_arr(arr, 4);
    struct S sum2 = sum_arr_llvm(arr, 4);
    __builtin_printf("sum_arr:      %ld %ld\n", sum1.a, sum1.b);
    __builtin_printf("sum_arr_llvm: %ld %ld\n", sum2.a, sum2.b);
}
