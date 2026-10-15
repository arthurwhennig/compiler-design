define i64 @equal_llvm(i64 %a, i64 %b) {
    %c = icmp eq i64 %a, %b
    br i1 %c, label %one, label %zero
one:
    ret i64 1
zero:
    ret i64 0
}
