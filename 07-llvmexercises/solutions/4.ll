;define i64 @sum_llvm(i64 %n){
;    %sum = alloca i64
;    %i = alloca i64
;    store i64 0, i64* %sum
;    store i64 0, i64* %i
;    br label %loop_header
;
;loop_header:
;    %i_val = load i64, i64* %i
;    %cond = icmp slt i64 %i_val, %n
;    br i1 %cond, label %loop_body, label %loop_exit
;
;loop_body:
;    %i_val1 = load i64, i64* %i
;    %sum_val1 = load i64, i64* %sum
;    %i_val_inc = add i64 %i_val1, 1
;    %sum_val_inc = add i64 %sum_val1, %i_val1
;    store i64 %i_val_inc, i64* %i
;    store i64 %sum_val_inc, i64* %sum
;    br label %loop_header
;
;loop_exit:
;    %sum_ret = load i64, i64* %sum
;    ret i64 %sum_ret
;}

define i64 @sum_llvm(i64 %n){
entry:
    %cmp = icmp sle i64 %n, 0
    br i1 %cmp, label %exit, label %loop_header

loop:
    %i = phi i64 [0, %entry], [%i_inc, %loop_body]
    %sum = phi i64 [0, %entry], [%sum_val_inc, %loop]
    %sum_val_inc = add i64 %sum, %i
    %i_inc = add i64 %i, 1

    %cmp1 = icmp slt i64 %i_inc, %n
    br i1 %cmp, label %loop, label %exit

exit:
    %sum_final = phi i64 [0, %entry], [%sum_val_inc, %loop]
    ret i64 %sum_final
}
