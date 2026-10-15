struct S1 {
    long a;
    long b;
};
struct S2 {
    long a;
    long b;
    long c;
};

long sum_all_members_S1(struct S1 s) { return s.a + s.b; }
long sum_all_members_S2(struct S2 s) { return s.a + s.b + s.c; }
long sum_all_members_S2_ptr(struct S2 *s) { return s->a + s->b + s->c; }

long sum_all_members_S1_llvm(struct S1 s);
long sum_all_members_S2_llvm(struct S2 s);
long sum_all_members_S2_ptr_llvm(struct S2 *s);

int main() {
    struct S1 s1 = {1, 2};
    struct S2 s2 = {3, 4, 5};
    __builtin_printf("sum_all_members_S1:      %ld\n", sum_all_members_S1(s1));
    __builtin_printf("sum_all_members_S1_llvm: %ld\n",
                     sum_all_members_S1_llvm(s1));
    __builtin_printf("sum_all_members_S2:      %ld\n", sum_all_members_S2(s2));
    __builtin_printf("sum_all_members_S2_llvm: %ld\n",
                     sum_all_members_S2_llvm(s2));
    __builtin_printf("sum_all_members_S2_ptr:      %ld\n",
                     sum_all_members_S2_ptr(&s2));
    __builtin_printf("sum_all_members_S2_ptr_llvm: %ld\n",
                     sum_all_members_S2_ptr_llvm(&s2));

    /*struct S2 arr[3] = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};*/
    /*__builtin_printf("sum_all_members_S2_ptr_llvm: %ld\n",*/
                     /*sum_all_members_S2_ptr_llvm(arr));*/
}
