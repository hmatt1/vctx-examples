module {



  hw.module private @intrinsics_is_comptime_HardwareComptime(in %clk : !seq.clock, in %rst : i1, out is_k_comptime : i1, out is_raw_literal_comptime : i1) {
    %true = hw.constant true
    hw.output %true, %true : i1, i1
  }
  hw.module @TestHardwareContext_Harness(in %clk : !seq.clock, in %rst : i1, in %k_ct_poke_val : i1, in %k_ct_poke_en : i1, in %lit_ct_poke_val : i1, in %lit_ct_poke_en : i1, out k_ct : i1, out lit_ct : i1) {
    %HardwareComptime_inst_20_1.is_k_comptime, %HardwareComptime_inst_20_1.is_raw_literal_comptime = hw.instance "HardwareComptime_inst_20_1" sym @HardwareComptime_inst_20_1 @intrinsics_is_comptime_HardwareComptime(clk: %clk: !seq.clock, rst: %rst: i1) -> (is_k_comptime: i1, is_raw_literal_comptime: i1)
    hw.output %HardwareComptime_inst_20_1.is_k_comptime, %HardwareComptime_inst_20_1.is_raw_literal_comptime : i1, i1
  }
  func.func @entry() {
    %true = hw.constant true
    %false = hw.constant false
    %0 = seq.const_clock high
    %1 = seq.const_clock low
    arc.sim.instantiate @TestHardwareContext_Harness as %arg0 {
      arc.sim.set_input %arg0, "k_ct_poke_en" = %false : i1, !arc.sim.instance<@TestHardwareContext_Harness>
      arc.sim.set_input %arg0, "lit_ct_poke_en" = %false : i1, !arc.sim.instance<@TestHardwareContext_Harness>
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@TestHardwareContext_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestHardwareContext_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestHardwareContext_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestHardwareContext_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestHardwareContext_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestHardwareContext_Harness>
      arc.sim.set_input %arg0, "rst" = %false : i1, !arc.sim.instance<@TestHardwareContext_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestHardwareContext_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestHardwareContext_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestHardwareContext_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestHardwareContext_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestHardwareContext_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestHardwareContext_Harness>
      %2 = arc.sim.get_port %arg0, "lit_ct" : i1, !arc.sim.instance<@TestHardwareContext_Harness>
      arc.sim.emit "lit_ct", %2 : i1
      %3 = arc.sim.get_port %arg0, "k_ct" : i1, !arc.sim.instance<@TestHardwareContext_Harness>
      arc.sim.emit "k_ct", %3 : i1
      %4 = arc.sim.get_port %arg0, "k_ct" : i1, !arc.sim.instance<@TestHardwareContext_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22k_ct\22}", %4 : i1
      %false_0 = hw.constant false
      %5 = comb.concat %false_0, %4 : i1, i1
      %false_1 = hw.constant false
      %6 = comb.concat %false_1, %true : i1, i1
      %7 = comb.icmp eq %5, %6 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22In component, wire with constant driver is comptime-known\22, \22line\22: 26, \22column\22: 12, \22condition\22: \22k_ct == 1\22, \22scope\22: \22TestHardwareContext\22}", %7 : i1
      %8 = arc.sim.get_port %arg0, "lit_ct" : i1, !arc.sim.instance<@TestHardwareContext_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22lit_ct\22}", %8 : i1
      %false_2 = hw.constant false
      %9 = comb.concat %false_2, %8 : i1, i1
      %10 = comb.icmp eq %9, %6 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Literal is always comptime-known\22, \22line\22: 27, \22column\22: 12, \22condition\22: \22lit_ct == 1\22, \22scope\22: \22TestHardwareContext\22}", %10 : i1
    }
    return
  }
}