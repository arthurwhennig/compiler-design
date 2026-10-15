define i64 @sum_llvm(i64 %n) {
    %s = alloca i64
    %i = alloca i64
    store i64 0, i64* %s
    store i64 0, i64* %i
    br label %cond
cond:
    %curr = load i64, i64* %i
    %lt = icmp slt i64 %curr, %n
    br i1 %lt, label %body, label %exit
body:
    %curr_s = load i64, i64* %s
    %curr_i = load i64, i64* %i
    %next_s = add nsw i64 %curr_i, %curr_s
    %next_i = add nsw i64 %curr_i, 1
    store i64 %next_s, i64* %s
    store i64 %next_i, i64* %i
    br label %cond
exit:
    %final_s = load i64, i64* %s
    ret i64 %final_s
}
