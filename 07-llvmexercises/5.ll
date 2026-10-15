define void @swap_llvm(i64* %a, i64* %b) {
    %a_val = load i64, i64* %a
    %b_val = load i64, i64* %b
    store i64 %a_val, i64* %b
    store i64 %b_val, i64* %a
    ret void
}
