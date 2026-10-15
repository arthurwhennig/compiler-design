;define i64 @sign_llvm(i64 %a){
;    %pos = icmp sgt i64 %a, 0
;    br i1 %pos, label %positive, label %else
;positive:
;    ret i64 1
;else:
;    %neg = icmp slt i64 %a, 0
;    br i1 %neg, label %negative, label %zero
;negative:
;    ret i64 -1
;zero:
;    ret i64 0
;}

define i64 @sign_llvm(i64 %a){
entry:
    %pos = icmp sgt i64 %a, 0
    br i1 %pos, label %ret, label %else
else:
    %neg = icmp slt i64 %a, 0
    br i1 %neg, label %ret, label %zero
zero:
    br label %ret
ret:
    %v = phi i64 [1, %entry], [-1, %else], [0, %zero]
    ret i64 %v
}
