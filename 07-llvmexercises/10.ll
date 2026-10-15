%struct.S1 = type { i64, i64 }
%struct.S2 = type { i64, i64, i64 }

define %struct.S1 @return_S1_llvm() {
  %slot = alloca %struct.S1
  %a.addr = getelementptr %struct.S1, %struct.S1* %slot, i64 0, i32 0
  %b.addr = getelementptr %struct.S1, %struct.S1* %slot, i64 0, i32 1
  store i64 1, i64* %a.addr
  store i64 2, i64* %b.addr
  %s1 = load %struct.S1, %struct.S1* %slot
  ret %struct.S1 %s1
}

define void @return_S2_llvm(%struct.S2* %s) {
  %a.addr = getelementptr %struct.S2, %struct.S2* %s, i64 0, i32 0
  %b.addr = getelementptr %struct.S2, %struct.S2* %s, i64 0, i32 1
  %c.addr = getelementptr %struct.S2, %struct.S2* %s, i64 0, i32 2
  store i64 3, i64* %a.addr
  store i64 4, i64* %b.addr
  store i64 5, i64* %c.addr
  ret void
}
