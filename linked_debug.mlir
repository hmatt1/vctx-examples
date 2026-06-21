module {



  hw.module private @inout_io_chain_Chain(in %clk : !seq.clock, in %rst : i1, in %pin : i8, out q : i8) {
    %InnerLeaf_inst_13_1.q = hw.instance "InnerLeaf_inst_13_1" sym @InnerLeaf_inst_13_1 @inout_io_chain_InnerLeaf(clk: %clk: !seq.clock, rst: %rst: i1, pin: %pin: i8) -> (q: i8)
    hw.output %InnerLeaf_inst_13_1.q : i8
  }
  hw.module private @inout_io_chain_InnerLeaf(in %clk : !seq.clock, in %rst : i1, in %pin : i8, out q : i8) {
    hw.output %pin : i8
  }

  hw.module @TestChainBasic_Harness(in %clk : !seq.clock, in %rst : i1, in %pin_poke_val : i8, in %pin_poke_en : i1, in %q_poke_val : i8, in %q_poke_en : i1, out pin : i8, out q : i8) {
    %c85_i8 = hw.constant 85 : i8
    %Chain_inst_18_1.q = hw.instance "Chain_inst_18_1" sym @Chain_inst_18_1 @inout_io_chain_Chain(clk: %clk: !seq.clock, rst: %rst: i1, pin: %0: i8) -> (q: i8) {sv.namehint = "q_sv"}
    %0 = comb.mux %pin_poke_en, %pin_poke_val, %c85_i8 : i8
    %1 = comb.mux %q_poke_en, %q_poke_val, %Chain_inst_18_1.q : i8
    hw.output %0, %1 : i8, i8
  }
  func.func @entry() {
    %c85_i8 = hw.constant 85 : i8
    %true = hw.constant true
    %false = hw.constant false
    %0 = seq.const_clock high
    %1 = seq.const_clock low
    arc.sim.instantiate @TestChainBasic_Harness as %arg0 {
      arc.sim.set_input %arg0, "pin_poke_en" = %false : i1, !arc.sim.instance<@TestChainBasic_Harness>
      arc.sim.set_input %arg0, "q_poke_en" = %false : i1, !arc.sim.instance<@TestChainBasic_Harness>
      arc.sim.set_input %arg0, "pin_poke_val" = %c85_i8 : i8, !arc.sim.instance<@TestChainBasic_Harness>
      arc.sim.set_input %arg0, "pin_poke_en" = %true : i1, !arc.sim.instance<@TestChainBasic_Harness>
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@TestChainBasic_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestChainBasic_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestChainBasic_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestChainBasic_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestChainBasic_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestChainBasic_Harness>
      arc.sim.set_input %arg0, "rst" = %false : i1, !arc.sim.instance<@TestChainBasic_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestChainBasic_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestChainBasic_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestChainBasic_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestChainBasic_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestChainBasic_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestChainBasic_Harness>
      %2 = arc.sim.get_port %arg0, "q" : i8, !arc.sim.instance<@TestChainBasic_Harness>
      arc.sim.emit "q", %2 : i8
      %3 = arc.sim.get_port %arg0, "pin" : i8, !arc.sim.instance<@TestChainBasic_Harness>
      arc.sim.emit "pin", %3 : i8
      %4 = arc.sim.get_port %arg0, "q" : i8, !arc.sim.instance<@TestChainBasic_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22q\22}", %4 : i8
      %5 = comb.concat %false, %4 : i1, i8
      %6 = comb.concat %false, %c85_i8 : i1, i8
      %7 = comb.icmp eq %5, %6 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22chain passes inout pin through to output q\22, \22line\22: 23, \22column\22: 12, \22condition\22: \22q == 0x55 as u8\22, \22scope\22: \22TestChainBasic\22}", %7 : i1
    }
    return
  }
}