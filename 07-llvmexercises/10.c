struct S1 {
    long a;
    long b;
};
struct S2 {
    long a;
    long b;
    long c;
};

struct S1 return_S1() {
    struct S1 s = {1, 2};
    return s;
}

struct S2 return_S2() {
    struct S2 s = {3, 4, 5};
    return s;
}

struct S1 return_S1_llvm();
struct S2 return_S2_llvm();

int main() {
    struct S1 s1 = return_S1();
    struct S1 s1_llvm = return_S1_llvm();
    __builtin_printf("return_S1:     %ld %ld\n", s1.a, s1.b);
    __builtin_printf("return_S1_llvm: %ld %ld\n", s1_llvm.a, s1_llvm.b);

    struct S2 s2 = return_S2();
    struct S2 s2_llvm = return_S2_llvm();
    __builtin_printf("return_S2:     %ld %ld %ld\n", s2.a, s2.b, s2.c);
    __builtin_printf("return_S2_llvm: %ld %ld %ld\n", s2_llvm.a, s2_llvm.b,
                     s2_llvm.c);
}
