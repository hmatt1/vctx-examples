module {



  hw.module private @comptime_comptime_values_containers_ComptimeValueContainers(in %clk : !seq.clock, in %rst : i1, out a : i32, out b : i32) {
    %c20_i32 = hw.constant 20 : i32
    %c9_i32 = hw.constant 9 : i32
    hw.output %c20_i32, %c9_i32 : i32, i32
  }
  hw.module @SimComptimeValueContainers_Harness(in %clk : !seq.clock, in %rst : i1, in %a_poke_val : i32, in %a_poke_en : i1, in %b_poke_val : i32, in %b_poke_en : i1, out a : i32, out b : i32) {
    %ComptimeValueContainers_inst_24_1.a, %ComptimeValueContainers_inst_24_1.b = hw.instance "ComptimeValueContainers_inst_24_1" sym @ComptimeValueContainers_inst_24_1 @comptime_comptime_values_containers_ComptimeValueContainers(clk: %clk: !seq.clock, rst: %rst: i1) -> (a: i32, b: i32)
    %0 = comb.mux %a_poke_en, %a_poke_val, %ComptimeValueContainers_inst_24_1.a : i32
    %1 = comb.mux %b_poke_en, %b_poke_val, %ComptimeValueContainers_inst_24_1.b : i32
    hw.output %0, %1 : i32, i32
  }
  func.func @entry() {
    %c9_i32 = hw.constant 9 : i32
    %c20_i32 = hw.constant 20 : i32
    %true = hw.constant true
    %false = hw.constant false
    %0 = seq.const_clock high
    %1 = seq.const_clock low
    arc.sim.instantiate @SimComptimeValueContainers_Harness as %arg0 {
      arc.sim.set_input %arg0, "a_poke_en" = %false : i1, !arc.sim.instance<@SimComptimeValueContainers_Harness>
      arc.sim.set_input %arg0, "b_poke_en" = %false : i1, !arc.sim.instance<@SimComptimeValueContainers_Harness>
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@SimComptimeValueContainers_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@SimComptimeValueContainers_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@SimComptimeValueContainers_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@SimComptimeValueContainers_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@SimComptimeValueContainers_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@SimComptimeValueContainers_Harness>
      arc.sim.set_input %arg0, "rst" = %false : i1, !arc.sim.instance<@SimComptimeValueContainers_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@SimComptimeValueContainers_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@SimComptimeValueContainers_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@SimComptimeValueContainers_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@SimComptimeValueContainers_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@SimComptimeValueContainers_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@SimComptimeValueContainers_Harness>
      %2 = arc.sim.get_port %arg0, "a" : i32, !arc.sim.instance<@SimComptimeValueContainers_Harness>
      arc.sim.emit "a", %2 : i32
      %3 = arc.sim.get_port %arg0, "b" : i32, !arc.sim.instance<@SimComptimeValueContainers_Harness>
      arc.sim.emit "b", %3 : i32
      %4 = arc.sim.get_port %arg0, "a" : i32, !arc.sim.instance<@SimComptimeValueContainers_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22a\22}", %4 : i32
      %5 = comb.concat %false, %4 : i1, i32
      %6 = comb.concat %false, %c20_i32 : i1, i32
      %7 = comb.icmp eq %5, %6 : i33
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22arr_demo() returns a[1] = 20\22, \22line\22: 30, \22column\22: 12, \22condition\22: \22a == 20 as u32\22, \22scope\22: \22SimComptimeValueContainers\22}", %7 : i1
      %8 = arc.sim.get_port %arg0, "b" : i32, !arc.sim.instance<@SimComptimeValueContainers_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22b\22}", %8 : i32
      %9 = comb.concat %false, %8 : i1, i32
      %10 = comb.concat %false, %c9_i32 : i1, i32
      %11 = comb.icmp eq %9, %10 : i33
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22map_demo() returns 9 for key y\22, \22line\22: 32, \22column\22: 12, \22condition\22: \22b == 9 as u32\22, \22scope\22: \22SimComptimeValueContainers\22}", %11 : i1
    }
    return
  }
}