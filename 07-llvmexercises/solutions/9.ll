%struct.S1 = type { i64, i64 }
%struct.S2 = type { i64, i64, i64 }

define i64 @sum_all_members_S1_llvm(i64 %s0, i64 %s1) {
  %1 = add i64 %s0, %s1
  ret i64 %1
}

define i64 @sum_all_members_S2_llvm(%struct.S2* byval(%struct.S2) %s) {
  %1 = getelementptr %struct.S2, %struct.S2* %s, i32 0, i32 0
  %2 = load i64, i64* %1
  %3 = getelementptr %struct.S2, %struct.S2* %s, i32 0, i32 1
  %4 = load i64, i64* %3
  %5 = add i64 %2, %4
  %6 = getelementptr %struct.S2, %struct.S2* %s, i32 0, i32 2
  %7 = load i64, i64* %6
  %8 = add i64 %5, %7
  ret i64 %8
}

define i64 @sum_all_members_S2_ptr_llvm(%struct.S2* %s) {
  %1 = getelementptr %struct.S2, %struct.S2* %s, i32 0, i32 0
  %2 = load i64, i64* %1
  %3 = getelementptr %struct.S2, %struct.S2* %s, i32 0, i32 1
  %4 = load i64, i64* %3
  %5 = add i64 %2, %4
  %6 = getelementptr %struct.S2, %struct.S2* %s, i32 0, i32 2
  %7 = load i64, i64* %6
  %8 = add i64 %5, %7
  ret i64 %8
}
