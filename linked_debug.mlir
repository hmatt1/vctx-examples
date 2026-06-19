module {



  hw.module private @regression_brackets_nested_generic_double_call_RootNested(in %clk : !seq.clock, in %rst : i1, in %x : i8, out y : i8) {
    %UsesWidth_inst_13_1.y = hw.instance "UsesWidth_inst_13_1" sym @UsesWidth_inst_13_1 @regression_brackets_nested_generic_double_call_UsesWidth_8(clk: %clk: !seq.clock, rst: %rst: i1, x: %x: i8) -> (y: i8)
    hw.output %UsesWidth_inst_13_1.y : i8
  }
  hw.module private @regression_brackets_nested_generic_double_call_UsesWidth_8(in %clk : !seq.clock, in %rst : i1, in %x : i8, out y : i8) {
    %false = hw.constant false
    %0 = comb.concat %false, %x : i1, i8
    %false_0 = hw.constant false
    %1 = comb.concat %false_0, %x : i1, i8
    %2 = comb.add %0, %1 : i9
    %3 = comb.extract %2 from 0 : (i9) -> i8
    hw.output %3 : i8
  }
  hw.module @SimNestedGenericDouble_Harness(in %clk : !seq.clock, in %rst : i1, in %x_poke_val : i8, in %x_poke_en : i1, in %y_poke_val : i8, in %y_poke_en : i1, out x : i8, out y : i8) {
    %c7_i8 = hw.constant 7 : i8
    %RootNested_inst_17_1.y = hw.instance "RootNested_inst_17_1" sym @RootNested_inst_17_1 @regression_brackets_nested_generic_double_call_RootNested(clk: %clk: !seq.clock, rst: %rst: i1, x: %0: i8) -> (y: i8)
    %0 = comb.mux %x_poke_en, %x_poke_val, %c7_i8 : i8
    %1 = comb.mux %y_poke_en, %y_poke_val, %RootNested_inst_17_1.y : i8
    hw.output %0, %1 : i8, i8
  }
  func.func @entry() {
    %c14_i8 = hw.constant 14 : i8
    %c7_i8 = hw.constant 7 : i8
    %true = hw.constant true
    %false = hw.constant false
    %0 = seq.const_clock high
    %1 = seq.const_clock low
    arc.sim.instantiate @SimNestedGenericDouble_Harness as %arg0 {
      arc.sim.set_input %arg0, "x_poke_en" = %false : i1, !arc.sim.instance<@SimNestedGenericDouble_Harness>
      arc.sim.set_input %arg0, "y_poke_en" = %false : i1, !arc.sim.instance<@SimNestedGenericDouble_Harness>
      arc.sim.set_input %arg0, "x_poke_val" = %c7_i8 : i8, !arc.sim.instance<@SimNestedGenericDouble_Harness>
      arc.sim.set_input %arg0, "x_poke_en" = %true : i1, !arc.sim.instance<@SimNestedGenericDouble_Harness>
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@SimNestedGenericDouble_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@SimNestedGenericDouble_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@SimNestedGenericDouble_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@SimNestedGenericDouble_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@SimNestedGenericDouble_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@SimNestedGenericDouble_Harness>
      arc.sim.set_input %arg0, "rst" = %false : i1, !arc.sim.instance<@SimNestedGenericDouble_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@SimNestedGenericDouble_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@SimNestedGenericDouble_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@SimNestedGenericDouble_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@SimNestedGenericDouble_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@SimNestedGenericDouble_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@SimNestedGenericDouble_Harness>
      %2 = arc.sim.get_port %arg0, "x" : i8, !arc.sim.instance<@SimNestedGenericDouble_Harness>
      arc.sim.emit "x", %2 : i8
      %3 = arc.sim.get_port %arg0, "y" : i8, !arc.sim.instance<@SimNestedGenericDouble_Harness>
      arc.sim.emit "y", %3 : i8
      %4 = arc.sim.get_port %arg0, "y" : i8, !arc.sim.instance<@SimNestedGenericDouble_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22y\22}", %4 : i8
      %5 = comb.concat %false, %4 : i1, i8
      %6 = comb.concat %false, %c14_i8 : i1, i8
      %7 = comb.icmp eq %5, %6 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22UsesWidth<8> doubles via double_uW<8>\22, \22line\22: 22, \22column\22: 12, \22condition\22: \22y == 14 as u8\22, \22scope\22: \22SimNestedGenericDouble\22}", %7 : i1
    }
    return
  }
}