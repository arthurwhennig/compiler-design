%struct.S = type { i64, i64 }


@bias = external global %struct.S

define %struct.S @sum_arr_llvm(%struct.S* %s, i64 %n)  {
entry:
  %0 = icmp sgt i64 %n, 0
  %a_bias_addr = getelementptr %struct.S, %struct.S* @bias, i32 0, i32 0
  %b_bias_addr = getelementptr %struct.S, %struct.S* @bias, i32 0, i32 1
  %a_bias = load i64, i64* %a_bias_addr
  %b_bias = load i64, i64* %b_bias_addr

  br i1 %0, label %loop, label %exit

loop:
  %i = phi i64 [ %i_next, %loop ], [ 0, %entry ]
  %sum_a = phi i64 [ %sum_a_next, %loop ], [ 0, %entry ]
  %sum_b = phi i64 [ %sum_b_next, %loop ], [ 0, %entry ]

  %a_addr = getelementptr %struct.S, %struct.S* %s, i64 %i, i32 0
  %b_addr = getelementptr %struct.S, %struct.S* %s, i64 %i, i32 1

  %a = load i64, i64* %a_addr
  %b = load i64, i64* %b_addr

  %a_plus_bias = add i64 %a, %a_bias
  %b_plus_bias = add i64 %b, %b_bias

  %sum_a_next = add i64 %sum_a, %a_plus_bias
  %sum_b_next = add i64 %sum_b, %b_plus_bias

  %i_next = add i64 %i, 1

  %cond = icmp eq i64 %i_next, %n
  br i1 %cond, label %exit, label %loop

exit:
  %final_a = phi i64 [ 0, %entry ], [ %sum_a_next, %loop ]
  %final_b = phi i64 [ 0, %entry ], [ %sum_b_next, %loop ]
  %retval_addr = alloca %struct.S
  %retval_a = getelementptr %struct.S, %struct.S* %retval_addr, i32 0, i32 0
  %retval_b = getelementptr %struct.S, %struct.S* %retval_addr, i32 0, i32 1

  store i64 %final_a, i64* %retval_a
  store i64 %final_b, i64* %retval_b

  %retval = load %struct.S, %struct.S* %retval_addr
  ret %struct.S %retval
}
