module {



  hw.module private @comptime_comptime_clog2_fold_Clog2Demo(in %clk : !seq.clock, in %rst : i1, out w : i32) {
    %c4_i32 = hw.constant 4 : i32
    hw.output %c4_i32 : i32
  }
  hw.module @ComptimeClog2Fold_Harness(in %clk : !seq.clock, in %rst : i1, out w : i32) {
    %Clog2Demo_inst_13_1.w = hw.instance "Clog2Demo_inst_13_1" sym @Clog2Demo_inst_13_1 @comptime_comptime_clog2_fold_Clog2Demo(clk: %clk: !seq.clock, rst: %rst: i1) -> (w: i32)
    hw.output %Clog2Demo_inst_13_1.w : i32
  }
  func.func @entry() {
    %c-4_i3 = hw.constant -4 : i3
    %true = hw.constant true
    %false = hw.constant false
    %0 = seq.const_clock high
    %1 = seq.const_clock low
    arc.sim.instantiate @ComptimeClog2Fold_Harness as %arg0 {
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@ComptimeClog2Fold_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@ComptimeClog2Fold_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@ComptimeClog2Fold_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@ComptimeClog2Fold_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@ComptimeClog2Fold_Harness>
      arc.sim.set_input %arg0, "rst" = %false : i1, !arc.sim.instance<@ComptimeClog2Fold_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@ComptimeClog2Fold_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@ComptimeClog2Fold_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@ComptimeClog2Fold_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@ComptimeClog2Fold_Harness>
      %2 = arc.sim.get_port %arg0, "w" : i32, !arc.sim.instance<@ComptimeClog2Fold_Harness>
      arc.sim.emit "w", %2 : i32
      %3 = arc.sim.get_port %arg0, "w" : i32, !arc.sim.instance<@ComptimeClog2Fold_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22w\22}", %3 : i32
      %c0_i29 = hw.constant 0 : i29
      %4 = comb.concat %c0_i29, %c-4_i3 : i29, i3
      %false_0 = hw.constant false
      %5 = comb.concat %false_0, %3 : i1, i32
      %false_1 = hw.constant false
      %6 = comb.concat %false_1, %4 : i1, i32
      %7 = comb.icmp eq %5, %6 : i33
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22clog2_int(16) == 4\22, \22line\22: 17, \22column\22: 12, \22condition\22: \22w == 4 as u32\22, \22scope\22: \22ComptimeClog2Fold\22}", %7 : i1
    }
    return
  }
}