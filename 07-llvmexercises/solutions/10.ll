%struct.S1 = type { i64, i64 }
%struct.S2 = type { i64, i64, i64 }

define %struct.S1 @return_S1_llvm() {
  %1 = alloca %struct.S1
  %2 = getelementptr %struct.S1, %struct.S1* %1, i32 0, i32 0
  store i64 1, i64* %2
  %3 = getelementptr %struct.S1, %struct.S1* %1, i32 0, i32 1
  store i64 2, i64* %3
  %4 = load %struct.S1, %struct.S1* %1
  ret %struct.S1 %4
}




define void @return_S2_llvm(%struct.S2* %s) {
  %1 = getelementptr %struct.S2, %struct.S2* %s, i32 0, i32 0
  store i64 3, i64* %1
  %2 = getelementptr %struct.S2, %struct.S2* %s, i32 0, i32 1
  store i64 4, i64* %2
  %3 = getelementptr %struct.S2, %struct.S2* %s, i32 0, i32 2
  store i64 5, i64* %3
  ret void

}
