define i64 @add_llvm(i64 %a, i64 %b) {
    %c = add nsw i64 %a, %b
    ret i64 %c
}
