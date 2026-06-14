module {



  hw.module @TestAddOneWidth_Harness(in %clk : !seq.clock, in %rst : i1, in %a_poke_val : i8, in %a_poke_en : i1, in %b_poke_val : i9, in %b_poke_en : i1, out a : i8, out b : i9) {
    %c100_i8 = hw.constant 100 : i8
    %AddOneWidth_inst_11_1.y = hw.instance "AddOneWidth_inst_11_1" sym @AddOneWidth_inst_11_1 @regression_brackets_complex_carrier_math_AddOneWidth_8(clk: %clk: !seq.clock, rst: %rst: i1, x: %0: i8) -> (y: i9)
    %0 = comb.mux %a_poke_en, %a_poke_val, %c100_i8 : i8
    %1 = comb.mux %b_poke_en, %b_poke_val, %AddOneWidth_inst_11_1.y : i9
    hw.output %0, %1 : i8, i9
  }
  hw.module private @regression_brackets_complex_carrier_math_AddOneWidth_8(in %clk : !seq.clock, in %rst : i1, in %x : i8, out y : i9) {
    %false = hw.constant false
    %0 = comb.concat %false, %x : i1, i8
    hw.output %0 : i9
  }
  func.func @entry() {
    %c100_i9 = hw.constant 100 : i9
    %true = hw.constant true
    %false = hw.constant false
    %0 = seq.const_clock high
    %1 = seq.const_clock low
    arc.sim.instantiate @TestAddOneWidth_Harness as %arg0 {
      arc.sim.set_input %arg0, "a_poke_en" = %false : i1, !arc.sim.instance<@TestAddOneWidth_Harness>
      arc.sim.set_input %arg0, "b_poke_en" = %false : i1, !arc.sim.instance<@TestAddOneWidth_Harness>
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@TestAddOneWidth_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestAddOneWidth_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestAddOneWidth_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestAddOneWidth_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestAddOneWidth_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestAddOneWidth_Harness>
      arc.sim.set_input %arg0, "rst" = %false : i1, !arc.sim.instance<@TestAddOneWidth_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestAddOneWidth_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestAddOneWidth_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestAddOneWidth_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestAddOneWidth_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestAddOneWidth_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestAddOneWidth_Harness>
      %2 = arc.sim.get_port %arg0, "a" : i8, !arc.sim.instance<@TestAddOneWidth_Harness>
      arc.sim.emit "a", %2 : i8
      %3 = arc.sim.get_port %arg0, "b" : i9, !arc.sim.instance<@TestAddOneWidth_Harness>
      arc.sim.emit "b", %3 : i9
      %4 = arc.sim.get_port %arg0, "b" : i9, !arc.sim.instance<@TestAddOneWidth_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22b\22}", %4 : i9
      %5 = comb.concat %false, %4 : i1, i9
      %6 = comb.concat %false, %c100_i9 : i1, i9
      %7 = comb.icmp eq %5, %6 : i10
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22W+1 carrier math\22, \22line\22: 16, \22column\22: 12, \22condition\22: \22b == 100 as u9\22, \22scope\22: \22TestAddOneWidth\22}", %7 : i1
    }
    return
  }
}