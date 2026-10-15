define i64 @equal_llvm(i64 %a, i64 %b){
    %c = icmp eq i64 %a, %b
    %d = zext i1 %c to i64
    ret i64 %d
}
