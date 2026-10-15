%struct.S = type { i64, i64 }


@bias = external global %struct.S

define %struct.S @sum_arr_llvm(%struct.S* %s, i64 %n) {
	%rets.addr = alloca %struct.S
	%s_a.addr = getelementptr %struct.S, %struct.S* %rets.addr, i64 0, i32 0
	%s_b.addr = getelementptr %struct.S, %struct.S* %rets.addr, i64 0, i32 1
    %i.addr = alloca i64
    store i64 0, i64* %s_a.addr
	store i64 0, i64* %s_b.addr
    store i64 0, i64* %i.addr
	%a_bias.addr = getelementptr %struct.S, %struct.S* @bias, i64 0, i32 0
	%b_bias.addr = getelementptr %struct.S, %struct.S* @bias, i64 0, i32 1
	%a_bias = load i64, i64* %a_bias.addr
	%b_bias = load i64, i64* %b_bias.addr
    br label %cond
cond:
    %curr = load i64, i64* %i.addr
    %lt = icmp slt i64 %curr, %n
    br i1 %lt, label %body, label %exit
body:
    %curr_i = load i64, i64* %i.addr
    %curr_a.addr = getelementptr %struct.S, %struct.S* %s, i64 %curr_i, i32 0
	%curr_b.addr = getelementptr %struct.S, %struct.S* %s, i64 %curr_i, i32 1
	%curr_a = load i64, i64* %curr_a.addr
	%curr_b = load i64, i64* %curr_b.addr
	%curr_s_a = load i64, i64* %s_a.addr
	%curr_s_b = load i64, i64* %s_b.addr
    %add_s_a = add nsw i64 %curr_s_a, %curr_a
	%add_s_b = add nsw i64 %curr_s_b, %curr_b
	%next_s_a = add nsw i64 %add_s_a, %a_bias
	%next_s_b = add nsw i64 %add_s_b, %b_bias
    %next_i = add nsw i64 %curr_i, 1
    store i64 %next_s_a, i64* %s_a.addr
	store i64 %next_s_b, i64* %s_b.addr
    store i64 %next_i, i64* %i.addr
    br label %cond
exit:
  	%rets = load %struct.S, %struct.S* %rets.addr
  	ret %struct.S %rets
}
