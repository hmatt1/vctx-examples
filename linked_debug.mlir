module {




  hw.module @FailBoolNot_Harness(in %clk : !seq.clock, in %rst : i1, in %t_poke_val : i1, in %t_poke_en : i1, out t : i1) {
    %true = hw.constant true {sv.namehint = "t_wire"}
    %0 = comb.xor %t_poke_en, %true : i1
    %1 = comb.or %0, %t_poke_val : i1
    hw.output %1 : i1
  }
  func.func @entry() {
    %c1_i2 = hw.constant 1 : i2
    %false = hw.constant false
    %true = hw.constant true
    %false_0 = hw.constant false
    %0 = seq.const_clock high
    %1 = seq.const_clock low
    arc.sim.instantiate @FailBoolNot_Harness as %arg0 {
      arc.sim.set_input %arg0, "t_poke_en" = %false_0 : i1, !arc.sim.instance<@FailBoolNot_Harness>
      arc.sim.set_input %arg0, "t_poke_val" = %true : i1, !arc.sim.instance<@FailBoolNot_Harness>
      arc.sim.set_input %arg0, "t_poke_en" = %true : i1, !arc.sim.instance<@FailBoolNot_Harness>
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@FailBoolNot_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@FailBoolNot_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@FailBoolNot_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@FailBoolNot_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@FailBoolNot_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@FailBoolNot_Harness>
      arc.sim.set_input %arg0, "rst" = %false_0 : i1, !arc.sim.instance<@FailBoolNot_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@FailBoolNot_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@FailBoolNot_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@FailBoolNot_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@FailBoolNot_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@FailBoolNot_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@FailBoolNot_Harness>
      %2 = arc.sim.get_port %arg0, "t" : i1, !arc.sim.instance<@FailBoolNot_Harness>
      arc.sim.emit "t", %2 : i1
      %3 = arc.sim.get_port %arg0, "t" : i1, !arc.sim.instance<@FailBoolNot_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22t\22}", %3 : i1
      %4 = comb.icmp eq %3, %false : i1
      %5 = comb.concat %false_0, %4 : i1, i1
      %6 = comb.icmp eq %5, %c1_i2 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22on purpose failure: not true is false\22, \22line\22: 8, \22column\22: 12, \22condition\22: \22not t == true\22, \22scope\22: \22FailBoolNot\22}", %6 : i1
    }
    return
  }
}