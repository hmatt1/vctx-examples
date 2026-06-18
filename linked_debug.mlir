module {



  hw.module private @spec_instance_out_only_in_when_Child(in %clk : !seq.clock, in %rst : i1, out q : i1) {
    %true = hw.constant true
    hw.output %true : i1
  }
  hw.module private @spec_instance_out_only_in_when_Parent(in %clk : !seq.clock, in %rst : i1, in %sel : i1, out o : i1) {
    %c1_i2 = hw.constant 1 : i2
    %false = hw.constant false
    %Child_inst_10_1.q = hw.instance "Child_inst_10_1" sym @Child_inst_10_1 @spec_instance_out_only_in_when_Child(clk: %clk: !seq.clock, rst: %rst: i1) -> (q: i1)
    %0 = comb.concat %false, %sel : i1, i1
    %1 = comb.icmp eq %0, %c1_i2 : i2
    %2 = comb.and %1, %Child_inst_10_1.q : i1
    hw.output %2 : i1
  }
  hw.module @SimInstOutWhen_Harness(in %clk : !seq.clock, in %rst : i1, in %o_poke_val : i1, in %o_poke_en : i1, in %sel_poke_val : i1, in %sel_poke_en : i1, out o : i1, out sel : i1) {
    %Parent_inst_18_1.o = hw.instance "Parent_inst_18_1" sym @Parent_inst_18_1 @spec_instance_out_only_in_when_Parent(clk: %clk: !seq.clock, rst: %rst: i1, sel: %1: i1) -> (o: i1)
    %0 = comb.mux %o_poke_en, %o_poke_val, %Parent_inst_18_1.o : i1
    %1 = comb.and %sel_poke_en, %sel_poke_val : i1
    hw.output %0, %1 : i1, i1
  }
  func.func @entry() {
    %c1_i2 = hw.constant 1 : i2
    %c0_i2 = hw.constant 0 : i2
    %true = hw.constant true
    %false = hw.constant false
    %0 = seq.const_clock high
    %1 = seq.const_clock low
    arc.sim.instantiate @SimInstOutWhen_Harness as %arg0 {
      arc.sim.set_input %arg0, "o_poke_en" = %false : i1, !arc.sim.instance<@SimInstOutWhen_Harness>
      arc.sim.set_input %arg0, "sel_poke_en" = %false : i1, !arc.sim.instance<@SimInstOutWhen_Harness>
      arc.sim.set_input %arg0, "sel_poke_val" = %false : i1, !arc.sim.instance<@SimInstOutWhen_Harness>
      arc.sim.set_input %arg0, "sel_poke_en" = %true : i1, !arc.sim.instance<@SimInstOutWhen_Harness>
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@SimInstOutWhen_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@SimInstOutWhen_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@SimInstOutWhen_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@SimInstOutWhen_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@SimInstOutWhen_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@SimInstOutWhen_Harness>
      arc.sim.set_input %arg0, "rst" = %false : i1, !arc.sim.instance<@SimInstOutWhen_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@SimInstOutWhen_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@SimInstOutWhen_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@SimInstOutWhen_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@SimInstOutWhen_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@SimInstOutWhen_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@SimInstOutWhen_Harness>
      %2 = arc.sim.get_port %arg0, "o" : i1, !arc.sim.instance<@SimInstOutWhen_Harness>
      arc.sim.emit "o", %2 : i1
      %3 = arc.sim.get_port %arg0, "sel" : i1, !arc.sim.instance<@SimInstOutWhen_Harness>
      arc.sim.emit "sel", %3 : i1
      %4 = arc.sim.get_port %arg0, "o" : i1, !arc.sim.instance<@SimInstOutWhen_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22o\22}", %4 : i1
      %5 = comb.concat %false, %4 : i1, i1
      %6 = comb.icmp eq %5, %c0_i2 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22hold 0 when arm not taken\22, \22line\22: 23, \22column\22: 10, \22condition\22: \22o == 0 as u1\22, \22scope\22: \22SimInstOutWhen\22}", %6 : i1
      arc.sim.emit "DRIVER: poke sel START", %true : i1
      arc.sim.set_input %arg0, "sel_poke_val" = %true : i1, !arc.sim.instance<@SimInstOutWhen_Harness>
      arc.sim.set_input %arg0, "sel_poke_en" = %true : i1, !arc.sim.instance<@SimInstOutWhen_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@SimInstOutWhen_Harness>
      arc.sim.emit "DRIVER: poke sel END", %true : i1
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@SimInstOutWhen_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@SimInstOutWhen_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@SimInstOutWhen_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@SimInstOutWhen_Harness>
      %7 = arc.sim.get_port %arg0, "o" : i1, !arc.sim.instance<@SimInstOutWhen_Harness>
      arc.sim.emit "o", %7 : i1
      %8 = arc.sim.get_port %arg0, "sel" : i1, !arc.sim.instance<@SimInstOutWhen_Harness>
      arc.sim.emit "sel", %8 : i1
      %9 = arc.sim.get_port %arg0, "o" : i1, !arc.sim.instance<@SimInstOutWhen_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22o\22}", %9 : i1
      %10 = comb.concat %false, %9 : i1, i1
      %11 = comb.icmp eq %10, %c1_i2 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22child output forwarded when arm taken\22, \22line\22: 26, \22column\22: 10, \22condition\22: \22o == 1 as u1\22, \22scope\22: \22SimInstOutWhen\22}", %11 : i1
    }
    return
  }
}