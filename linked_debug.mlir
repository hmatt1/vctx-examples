module {



  hw.module @TestSimulationContext_Harness(in %clk : !seq.clock, in %rst : i1, in %ic_poke_val : i1, in %ic_poke_en : i1, in %iz_poke_val : i1, in %iz_poke_en : i1, in %k_poke_val : i8, in %k_poke_en : i1, out ic : i1, out iz : i1, out k : i8) {
    %true = hw.constant true
    %c3_i8 = hw.constant 3 : i8
    %c-1_i2 = hw.constant -1 : i2
    %c0_i6 = hw.constant 0 : i6
    %0 = comb.concat %c0_i6, %c-1_i2 : i6, i2
    %1 = comb.and %ic_poke_en, %ic_poke_val {sv.namehint = "ic_wire"} : i1
    %2 = comb.xor %iz_poke_en, %true : i1
    %3 = comb.or %2, %iz_poke_val {sv.namehint = "iz_wire"} : i1
    %4 = comb.mux %k_poke_en, %k_poke_val, %0 {sv.namehint = "k_wire"} : i8
    hw.output %1, %3, %4 : i1, i1, i8
  }
  func.func @entry() {
    %c-6_i4 = hw.constant -6 : i4
    %c10_i8 = hw.constant 10 : i8
    %true = hw.constant true
    %false = hw.constant false
    %0 = seq.const_clock high
    %1 = seq.const_clock low
    arc.sim.instantiate @TestSimulationContext_Harness as %arg0 {
      arc.sim.set_input %arg0, "ic_poke_en" = %false : i1, !arc.sim.instance<@TestSimulationContext_Harness>
      arc.sim.set_input %arg0, "iz_poke_en" = %false : i1, !arc.sim.instance<@TestSimulationContext_Harness>
      arc.sim.set_input %arg0, "k_poke_en" = %false : i1, !arc.sim.instance<@TestSimulationContext_Harness>
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@TestSimulationContext_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimulationContext_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestSimulationContext_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimulationContext_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestSimulationContext_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimulationContext_Harness>
      arc.sim.set_input %arg0, "rst" = %false : i1, !arc.sim.instance<@TestSimulationContext_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimulationContext_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimulationContext_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestSimulationContext_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimulationContext_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestSimulationContext_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimulationContext_Harness>
      %2 = arc.sim.get_port %arg0, "k" : i8, !arc.sim.instance<@TestSimulationContext_Harness>
      arc.sim.emit "k", %2 : i8
      %3 = arc.sim.get_port %arg0, "iz" : i1, !arc.sim.instance<@TestSimulationContext_Harness>
      arc.sim.emit "iz", %3 : i1
      %4 = arc.sim.get_port %arg0, "ic" : i1, !arc.sim.instance<@TestSimulationContext_Harness>
      arc.sim.emit "ic", %4 : i1
      %5 = arc.sim.get_port %arg0, "ic" : i1, !arc.sim.instance<@TestSimulationContext_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22ic\22}", %5 : i1
      %false_0 = hw.constant false
      %6 = comb.concat %false_0, %5 : i1, i1
      %false_1 = hw.constant false
      %7 = comb.concat %false_1, %false : i1, i1
      %8 = comb.icmp eq %6, %7 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22In sim, wires are runtime signals (even if initialized with a constant)\22, \22line\22: 43, \22column\22: 12, \22condition\22: \22ic == 0\22, \22scope\22: \22TestSimulationContext\22}", %8 : i1
      %9 = arc.sim.get_port %arg0, "iz" : i1, !arc.sim.instance<@TestSimulationContext_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22iz\22}", %9 : i1
      %false_2 = hw.constant false
      %10 = comb.concat %false_2, %9 : i1, i1
      %false_3 = hw.constant false
      %11 = comb.concat %false_3, %true : i1, i1
      %12 = comb.icmp eq %10, %11 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Bare literal is still comptime-known in sim\22, \22line\22: 44, \22column\22: 12, \22condition\22: \22iz == 1\22, \22scope\22: \22TestSimulationContext\22}", %12 : i1
      %c-6_i4_4 = hw.constant -6 : i4
      %c0_i4 = hw.constant 0 : i4
      %13 = comb.concat %c0_i4, %c-6_i4_4 : i4, i4
      arc.sim.emit "DRIVER: poke k START", %13 : i8
      arc.sim.set_input %arg0, "k_poke_val" = %13 : i8, !arc.sim.instance<@TestSimulationContext_Harness>
      arc.sim.set_input %arg0, "k_poke_en" = %true : i1, !arc.sim.instance<@TestSimulationContext_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimulationContext_Harness>
      arc.sim.emit "DRIVER: poke k END", %13 : i8
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestSimulationContext_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimulationContext_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestSimulationContext_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimulationContext_Harness>
      %14 = arc.sim.get_port %arg0, "k" : i8, !arc.sim.instance<@TestSimulationContext_Harness>
      arc.sim.emit "k", %14 : i8
      %15 = arc.sim.get_port %arg0, "iz" : i1, !arc.sim.instance<@TestSimulationContext_Harness>
      arc.sim.emit "iz", %15 : i1
      %16 = arc.sim.get_port %arg0, "ic" : i1, !arc.sim.instance<@TestSimulationContext_Harness>
      arc.sim.emit "ic", %16 : i1
      %17 = arc.sim.get_port %arg0, "k" : i8, !arc.sim.instance<@TestSimulationContext_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22k\22}", %17 : i8
      %false_5 = hw.constant false
      %18 = comb.concat %false_5, %17 : i1, i8
      %c0_i5 = hw.constant 0 : i5
      %19 = comb.concat %c0_i5, %c-6_i4 : i5, i4
      %20 = comb.icmp eq %18, %19 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Wire value changed via poke\22, \22line\22: 49, \22column\22: 12, \22condition\22: \22k == 10\22, \22scope\22: \22TestSimulationContext\22}", %20 : i1
      %21 = arc.sim.get_port %arg0, "k" : i8, !arc.sim.instance<@TestSimulationContext_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22k\22}", %21 : i8
      %22 = comb.icmp eq %7, %7 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Wire remains a runtime signal after poke\22, \22line\22: 50, \22column\22: 12, \22condition\22: \22is_comptime k == 0\22, \22scope\22: \22TestSimulationContext\22}", %22 : i1
    }
    return
  }
}