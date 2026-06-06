module {



  hw.module @ParametricArrayCarrierShouldWork_Harness(in %clk : !seq.clock, in %rst : i1, in %out0_poke_val : i8, in %out0_poke_en : i1, in %v_poke_val : i8, in %v_poke_en : i1, out out0 : i8, out v : i8) {
    %c7_i8 = hw.constant 7 : i8
    %c-1_i3 = hw.constant -1 : i3
    %c0_i5 = hw.constant 0 : i5
    %0 = comb.concat %c0_i5, %c-1_i3 : i5, i3
    %ParametricArrayCarrier_inst_10_1.out0 = hw.instance "ParametricArrayCarrier_inst_10_1" sym @ParametricArrayCarrier_inst_10_1 @comptime_generics_parametric_array_carrier_ParametricArrayCarrier_8(clk: %clk: !seq.clock, rst: %rst: i1, v: %1: i8) -> (out0: i8)
    %1 = comb.mux %v_poke_en, %v_poke_val, %0 {sv.namehint = "v_wire"} : i8
    hw.output %ParametricArrayCarrier_inst_10_1.out0, %1 : i8, i8
  }
  hw.module private @comptime_generics_parametric_array_carrier_ParametricArrayCarrier_8(in %clk : !seq.clock, in %rst : i1, in %v : i8, out out0 : i8) {
    %false = hw.constant false
    %c0_i7 = hw.constant 0 : i7
    %0 = comb.concat %c0_i7, %false : i7, i1
    %c0_i8 = hw.constant 0 : i8
    %1 = comb.concat %c0_i8, %0 : i8, i8
    %2 = comb.extract %1 from 0 : (i16) -> i8
    hw.output %2 : i8
  }
  func.func @entry() {
    %c-1_i3 = hw.constant -1 : i3
    %true = hw.constant true
    %false = hw.constant false
    %0 = seq.const_clock high
    %1 = seq.const_clock low
    arc.sim.instantiate @ParametricArrayCarrierShouldWork_Harness as %arg0 {
      arc.sim.set_input %arg0, "out0_poke_en" = %false : i1, !arc.sim.instance<@ParametricArrayCarrierShouldWork_Harness>
      arc.sim.set_input %arg0, "v_poke_en" = %false : i1, !arc.sim.instance<@ParametricArrayCarrierShouldWork_Harness>
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@ParametricArrayCarrierShouldWork_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@ParametricArrayCarrierShouldWork_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@ParametricArrayCarrierShouldWork_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@ParametricArrayCarrierShouldWork_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@ParametricArrayCarrierShouldWork_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@ParametricArrayCarrierShouldWork_Harness>
      arc.sim.set_input %arg0, "rst" = %false : i1, !arc.sim.instance<@ParametricArrayCarrierShouldWork_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@ParametricArrayCarrierShouldWork_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@ParametricArrayCarrierShouldWork_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@ParametricArrayCarrierShouldWork_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@ParametricArrayCarrierShouldWork_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@ParametricArrayCarrierShouldWork_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@ParametricArrayCarrierShouldWork_Harness>
      %2 = arc.sim.get_port %arg0, "v" : i8, !arc.sim.instance<@ParametricArrayCarrierShouldWork_Harness>
      arc.sim.emit "v", %2 : i8
      %3 = arc.sim.get_port %arg0, "out0" : i8, !arc.sim.instance<@ParametricArrayCarrierShouldWork_Harness>
      arc.sim.emit "out0", %3 : i8
      %4 = arc.sim.get_port %arg0, "out0" : i8, !arc.sim.instance<@ParametricArrayCarrierShouldWork_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22out0\22}", %4 : i8
      %c0_i5 = hw.constant 0 : i5
      %5 = comb.concat %c0_i5, %c-1_i3 : i5, i3
      %false_0 = hw.constant false
      %6 = comb.concat %false_0, %4 : i1, i8
      %false_1 = hw.constant false
      %7 = comb.concat %false_1, %5 : i1, i8
      %8 = comb.icmp eq %6, %7 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u[W][2] specialization should retain element value\22, \22line\22: 15, \22column\22: 12, \22condition\22: \22out0 == 7 as u8\22, \22scope\22: \22ParametricArrayCarrierShouldWork\22}", %8 : i1
    }
    return
  }
}