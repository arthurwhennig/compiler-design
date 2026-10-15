long sum_abs(long *arr, long n){
    long sum = 0l;
    for (long i = 0l; i < n; ++i) {
        if (arr[i] >= 0l)
            sum += arr[i];
        else 
            sum -= arr[i];
    }
    return sum;
}


long sum_abs_llvm(long *arr, long n);


int main(int argc, char *argv[]){
    long arr[5] = {1l, -2l, 3l, -4l, 5l};
    __builtin_printf("sum_abs:      %ld\n", sum_abs(arr, 5l));
    __builtin_printf("sum_abs_llvm: %ld\n", sum_abs_llvm(arr, 5l));
    return 0;
}
