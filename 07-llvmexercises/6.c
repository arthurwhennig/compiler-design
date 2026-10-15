long sum_arr_llvm(long *arr, long n);
long sum_arr(long *arr, long n)
{
    long sum = 0;
    for (long i = 0; i < n; i++)
    {
        sum += arr[i];
    }
    return sum;
}

int main()
{
    long arr[] = {1, 2, 3, 4, 5};
    __builtin_printf("array: {%ld, %ld, %ld, %ld, %ld}\n",
                     arr[0], arr[1], arr[2], arr[3], arr[4]);
    __builtin_printf("sum_arr(arr, 5)     = %ld\n", sum_arr(arr, 5));
    __builtin_printf("sum_arr_llvm(arr, 5) = %ld\n", sum_arr_llvm(arr, 5));
}
