define i64 @sum_abs_llvm(i64* %arr, i64 %n) {
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
    %curr_i = load i64, i64* %i
    %curr_s = load i64, i64* %s
    %curr_p = getelementptr i64, i64* %arr, i64 %curr_i
    %curr_el = load i64, i64* %curr_p
    %curr_lt = icmp slt i64 %curr_el, 0
    br i1 %curr_lt, label %sub, label %add
add:
    %next_s1 = add nsw i64 %curr_s, %curr_el
    store i64 %next_s1, i64* %s
    br label %merge
sub:
    %next_s2 = sub nsw i64 %curr_s, %curr_el
    store i64 %next_s2, i64* %s
    br label %merge
merge:
    %next_i = add nsw i64 %curr_i, 1
    store i64 %next_i, i64* %i
    br label %cond
exit:
    %final_s = load i64, i64* %s
    ret i64 %final_s
}
