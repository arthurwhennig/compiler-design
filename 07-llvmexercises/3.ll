define i64 @sign_llvm(i64 %a) {
    %lt = icmp slt i64 %a, 0
    br i1 %lt, label %less, label %else
less:
    ret i64 -1
else:
    %gt = icmp sgt i64 %a, 0
    br i1 %gt, label %greater, label %equal
greater:
    ret i64 1
equal:
    ret i64 0
}
