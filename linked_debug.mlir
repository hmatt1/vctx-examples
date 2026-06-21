module {



  hw.module private @functions_mlir_generic_function_type_param_MlirTypeGenericHarness(in %clk : !seq.clock, in %rst : i1, in %x : i8, out y : i8) {
    hw.output %x : i8
  }
  hw.module @TestTypeParamPoke_Harness(in %clk : !seq.clock, in %rst : i1, in %x_poke_val : i8, in %x_poke_en : i1, in %y_poke_val : i8, in %y_poke_en : i1, out x : i8, out y : i8) {
    %c0_i8 = hw.constant 0 : i8
    %MlirTypeGenericHarness_inst_20_1.y = hw.instance "MlirTypeGenericHarness_inst_20_1" sym @MlirTypeGenericHarness_inst_20_1 @functions_mlir_generic_function_type_param_MlirTypeGenericHarness(clk: %clk: !seq.clock, rst: %rst: i1, x: %0: i8) -> (y: i8)
    %0 = comb.mux %x_poke_en, %x_poke_val, %c0_i8 : i8
    %1 = comb.mux %y_poke_en, %y_poke_val, %MlirTypeGenericHarness_inst_20_1.y : i8
    hw.output %0, %1 : i8, i8
  }
  func.func @entry() {
    %c255_i9 = hw.constant 255 : i9
    %c77_i9 = hw.constant 77 : i9
    %c77_i8 = hw.constant 77 : i8
    %c0_i9 = hw.constant 0 : i9
    %c0_i8 = hw.constant 0 : i8
    %c-1_i8 = hw.constant -1 : i8
    %true = hw.constant true
    %false = hw.constant false
    %0 = seq.const_clock high
    %1 = seq.const_clock low
    arc.sim.instantiate @TestTypeParamPoke_Harness as %arg0 {
      arc.sim.set_input %arg0, "x_poke_en" = %false : i1, !arc.sim.instance<@TestTypeParamPoke_Harness>
      arc.sim.set_input %arg0, "y_poke_en" = %false : i1, !arc.sim.instance<@TestTypeParamPoke_Harness>
      arc.sim.set_input %arg0, "x_poke_val" = %c0_i8 : i8, !arc.sim.instance<@TestTypeParamPoke_Harness>
      arc.sim.set_input %arg0, "x_poke_en" = %true : i1, !arc.sim.instance<@TestTypeParamPoke_Harness>
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@TestTypeParamPoke_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestTypeParamPoke_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestTypeParamPoke_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestTypeParamPoke_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestTypeParamPoke_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestTypeParamPoke_Harness>
      arc.sim.set_input %arg0, "rst" = %false : i1, !arc.sim.instance<@TestTypeParamPoke_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestTypeParamPoke_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestTypeParamPoke_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestTypeParamPoke_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestTypeParamPoke_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestTypeParamPoke_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestTypeParamPoke_Harness>
      %2 = arc.sim.get_port %arg0, "y" : i8, !arc.sim.instance<@TestTypeParamPoke_Harness>
      arc.sim.emit "y", %2 : i8
      %3 = arc.sim.get_port %arg0, "x" : i8, !arc.sim.instance<@TestTypeParamPoke_Harness>
      arc.sim.emit "x", %3 : i8
      %4 = arc.sim.get_port %arg0, "y" : i8, !arc.sim.instance<@TestTypeParamPoke_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22y\22}", %4 : i8
      %5 = comb.concat %false, %4 : i1, i8
      %6 = comb.icmp eq %5, %c0_i9 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22initial: identity of 0 is 0\22, \22line\22: 25, \22column\22: 12, \22condition\22: \22y == 0\22, \22scope\22: \22TestTypeParamPoke\22}", %6 : i1
      arc.sim.emit "DRIVER: poke x START", %c77_i8 : i8
      arc.sim.set_input %arg0, "x_poke_val" = %c77_i8 : i8, !arc.sim.instance<@TestTypeParamPoke_Harness>
      arc.sim.set_input %arg0, "x_poke_en" = %true : i1, !arc.sim.instance<@TestTypeParamPoke_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestTypeParamPoke_Harness>
      arc.sim.emit "DRIVER: poke x END", %c77_i8 : i8
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestTypeParamPoke_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestTypeParamPoke_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestTypeParamPoke_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestTypeParamPoke_Harness>
      %7 = arc.sim.get_port %arg0, "y" : i8, !arc.sim.instance<@TestTypeParamPoke_Harness>
      arc.sim.emit "y", %7 : i8
      %8 = arc.sim.get_port %arg0, "x" : i8, !arc.sim.instance<@TestTypeParamPoke_Harness>
      arc.sim.emit "x", %8 : i8
      %9 = arc.sim.get_port %arg0, "y" : i8, !arc.sim.instance<@TestTypeParamPoke_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22y\22}", %9 : i8
      %10 = comb.concat %false, %9 : i1, i8
      %11 = comb.icmp eq %10, %c77_i9 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22poke 77: identity function yields 77\22, \22line\22: 28, \22column\22: 12, \22condition\22: \22y == 77\22, \22scope\22: \22TestTypeParamPoke\22}", %11 : i1
      arc.sim.emit "DRIVER: poke x START", %c-1_i8 : i8
      arc.sim.set_input %arg0, "x_poke_val" = %c-1_i8 : i8, !arc.sim.instance<@TestTypeParamPoke_Harness>
      arc.sim.set_input %arg0, "x_poke_en" = %true : i1, !arc.sim.instance<@TestTypeParamPoke_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestTypeParamPoke_Harness>
      arc.sim.emit "DRIVER: poke x END", %c-1_i8 : i8
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestTypeParamPoke_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestTypeParamPoke_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestTypeParamPoke_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestTypeParamPoke_Harness>
      %12 = arc.sim.get_port %arg0, "y" : i8, !arc.sim.instance<@TestTypeParamPoke_Harness>
      arc.sim.emit "y", %12 : i8
      %13 = arc.sim.get_port %arg0, "x" : i8, !arc.sim.instance<@TestTypeParamPoke_Harness>
      arc.sim.emit "x", %13 : i8
      %14 = arc.sim.get_port %arg0, "y" : i8, !arc.sim.instance<@TestTypeParamPoke_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22y\22}", %14 : i8
      %15 = comb.concat %false, %14 : i1, i8
      %16 = comb.icmp eq %15, %c255_i9 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22poke 0xFF: identity preserves max value\22, \22line\22: 31, \22column\22: 12, \22condition\22: \22y == 0xFF as u8\22, \22scope\22: \22TestTypeParamPoke\22}", %16 : i1
    }
    return
  }
}