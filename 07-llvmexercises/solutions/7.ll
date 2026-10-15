define i64 @sum_abs_llvm(i64* %arr, i64 %n) {
entry:
    %exitcond = icmp eq i64 0, %n
    br i1 %exitcond, label %exit, label %loop

loop:
    %i = phi i64 [0, %entry], [%i_next, %nonnegative]
    %sum = phi i64 [0, %entry], [%sum_next, %nonnegative]
    %addr = getelementptr i64, i64* %arr, i64 %i
    %v = load i64, i64* %addr
    %gez = icmp sge i64 %v, 0
    br i1 %gez, label %nonnegative, label %negative

negative:
    %negated = sub i64 0, %v
    br label %nonnegative

nonnegative:
    %val = phi i64 [%v, %loop], [%negated, %negative]
    %sum_next = add i64 %val, %sum
    %i_next =  add i64 1, %i
    %loop_again = icmp slt i64 %i_next, %n
    br i1 %loop_again, label %loop, label %exit


exit:
    %ret_val = phi i64 [0, %entry], [%sum_next, %nonnegative]
    ret i64 %ret_val

}
