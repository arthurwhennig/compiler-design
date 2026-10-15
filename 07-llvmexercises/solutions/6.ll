define i64 @sum_arr_llvm(i64* %arr, i64 %n) {
entry:
    %exitcond = icmp eq i64 %n, 0
    br i1 %exitcond, label %loopexit, label %loop

loop:
    %i = phi i64 [0, %entry], [%nexti, %loop]
    %sum = phi i64 [0, %entry], [%nextsum, %loop]
    %addr  = getelementptr i64, i64* %arr, i64 %i
    %v = load i64, i64* %addr
    %nextsum = add i64 %sum, %v
    %nexti = add i64 %i, 1
    %cond = icmp eq i64 %nexti, %n
    br i1 %cond, label %loopexit, label %loop

loopexit:
    %rv = phi i64 [0, %entry], [%nextsum, %loop]
    ret i64 %rv
}
