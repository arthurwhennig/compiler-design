declare void @print(i64, i64)

define void @swap_args_llvm(i64 %a, i64 %b){
    call void @print(i64 %b, i64 %a)
    ret void
}

define void @swap_args_llvm_ptr(i64* %a, i64* %b){
    %a_val = load i64, i64* %a
    %b_val = load i64, i64* %b
    call void @print(i64 %b_val, i64 %a_val)
    ret void
}
