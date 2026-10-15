;define void @swap_llvm(ptr %a, ptr %b) {
define void @swap_llvm(i64* %a, i64* %b) {
entry:
    %a_val = load i64, i64* %a
    %b_val = load i64, i64* %b
    store i64 %b_val, i64* %a
    store i64 %a_val, i64* %b
    ret void
}
