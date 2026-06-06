module {



  hw.module private @registers_reg_array_index_RegArray(in %clk : !seq.clock, in %rst : i1, out x : i8) {
    %c-65281_i32 = hw.constant -65281 : i32
    %c0_i8 = hw.constant 0 : i8
    %c8_i8 = hw.constant 8 : i8
    %c7_i8 = hw.constant 7 : i8
    %false = hw.constant false
    %c0_i31 = hw.constant 0 : i31
    %0 = comb.concat %c0_i31, %false : i31, i1
    %a = seq.compreg %13, %clk : i32  
    %c-1_i3 = hw.constant -1 : i3
    %c0_i5 = hw.constant 0 : i5
    %1 = comb.concat %c0_i5, %c-1_i3 : i5, i3
    %c0_i24 = hw.constant 0 : i24
    %2 = comb.concat %c0_i24, %1 : i24, i8
    %3 = comb.extract %a from 8 : (i32) -> i24
    %4 = comb.concat %3, %c0_i8 : i24, i8
    %5 = comb.or %4, %2 : i32
    %c-8_i4 = hw.constant -8 : i4
    %c0_i4 = hw.constant 0 : i4
    %6 = comb.concat %c0_i4, %c-8_i4 : i4, i4
    %c0_i24_0 = hw.constant 0 : i24
    %7 = comb.concat %c0_i24_0, %6 : i24, i8
    %8 = comb.extract %7 from 0 : (i32) -> i24
    %9 = comb.concat %8, %c0_i8 : i24, i8
    %10 = comb.and %5, %c-65281_i32 : i32
    %11 = comb.or %10, %9 : i32
    %12 = comb.extract %a from 8 : (i32) -> i8
    %13 = comb.mux %rst, %0, %11 : i32
    hw.output %12 : i8
  }
  hw.module @RegArrayIndex_Harness(in %clk : !seq.clock, in %rst : i1, in %o_poke_val : i8, in %o_poke_en : i1, out o : i8) {
    %RegArray_inst_10_1.x = hw.instance "RegArray_inst_10_1" sym @RegArray_inst_10_1 @registers_reg_array_index_RegArray(clk: %clk: !seq.clock, rst: %rst: i1) -> (x: i8)
    hw.output %RegArray_inst_10_1.x : i8
  }
  func.func @entry() {
    %c-8_i4 = hw.constant -8 : i4
    %true = hw.constant true
    %false = hw.constant false
    %0 = seq.const_clock high
    %1 = seq.const_clock low
    arc.sim.instantiate @RegArrayIndex_Harness as %arg0 {
      arc.sim.set_input %arg0, "o_poke_en" = %false : i1, !arc.sim.instance<@RegArrayIndex_Harness>
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@RegArrayIndex_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@RegArrayIndex_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@RegArrayIndex_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@RegArrayIndex_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@RegArrayIndex_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@RegArrayIndex_Harness>
      arc.sim.set_input %arg0, "rst" = %false : i1, !arc.sim.instance<@RegArrayIndex_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@RegArrayIndex_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@RegArrayIndex_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@RegArrayIndex_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@RegArrayIndex_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@RegArrayIndex_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@RegArrayIndex_Harness>
      %2 = arc.sim.get_port %arg0, "o" : i8, !arc.sim.instance<@RegArrayIndex_Harness>
      arc.sim.emit "o", %2 : i8
      %3 = arc.sim.get_port %arg0, "o" : i8, !arc.sim.instance<@RegArrayIndex_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22o\22}", %3 : i8
      %c0_i4 = hw.constant 0 : i4
      %4 = comb.concat %c0_i4, %c-8_i4 : i4, i4
      %false_0 = hw.constant false
      %5 = comb.concat %false_0, %3 : i1, i8
      %false_1 = hw.constant false
      %6 = comb.concat %false_1, %4 : i1, i8
      %7 = comb.icmp eq %5, %6 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22a[1] is 8\22, \22line\22: 14, \22column\22: 12, \22condition\22: \22o == 8 as u8\22, \22scope\22: \22RegArrayIndex\22}", %7 : i1
    }
    return
  }
}