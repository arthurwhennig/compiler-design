%struct.S1 = type { i64, i64 }
%struct.S2 = type { i64, i64, i64 }

define i64 @sum_all_members_S1_llvm(i64 %s0, i64 %s1) {
  %sum = add nsw i64 %s0, %s1
  ret i64 %sum
}

define i64 @sum_all_members_S2_llvm(%struct.S2* byval(%struct.S2) %s) {
  %a.addr = getelementptr %struct.S2, %struct.S2* %s, i64 0, i32 0
  %b.addr = getelementptr %struct.S2, %struct.S2* %s, i64 0, i32 1
  %c.addr = getelementptr %struct.S2, %struct.S2* %s, i64 0, i32 2
  %a = load i64, i64* %a.addr
  %b = load i64, i64* %b.addr
  %c = load i64, i64* %c.addr
  %sum1 = add nsw i64 %a, %b
  %sum2 = add nsw i64 %sum1, %c
  ret i64 %sum2
}

define i64 @sum_all_members_S2_ptr_llvm(%struct.S2* %s) {
  %a.addr = getelementptr %struct.S2, %struct.S2* %s, i32 0, i32 0
  %b.addr = getelementptr %struct.S2, %struct.S2* %s, i32 0, i32 1
  %c.addr = getelementptr %struct.S2, %struct.S2* %s, i32 0, i32 2
  %a = load i64, i64* %a.addr
  %b = load i64, i64* %b.addr
  %c = load i64, i64* %c.addr
  %sum1 = add nsw i64 %a, %b
  %sum2 = add nsw i64 %sum1, %c
  ret i64 %sum2
}
