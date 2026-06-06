module {



  hw.module private @operators_dynamic_bracket_slice_DynBracketSlice(in %clk : !seq.clock, in %rst : i1, in %hi : i4, in %lo : i4, in %w : i16, out z : i8) {
    %c0_i12 = hw.constant 0 : i12
    %0 = comb.concat %c0_i12, %lo : i12, i4
    %1 = comb.shru %w, %0 : i16
    %2 = comb.extract %1 from 0 : (i16) -> i8
    hw.output %2 : i8
  }
  hw.module @DynamicBracketSlice_Harness(in %clk : !seq.clock, in %rst : i1, in %hi_poke_val : i4, in %hi_poke_en : i1, in %lo_poke_val : i4, in %lo_poke_en : i1, in %wv_poke_val : i16, in %wv_poke_en : i1, in %z_poke_val : i8, in %z_poke_en : i1, out hi : i4, out lo : i4, out wv : i16, out z : i8) {
    %c0_i16 = hw.constant 0 : i16
    %c0_i4 = hw.constant 0 : i4
    %DynBracketSlice_inst_7_1.z = hw.instance "DynBracketSlice_inst_7_1" sym @DynBracketSlice_inst_7_1 @operators_dynamic_bracket_slice_DynBracketSlice(clk: %clk: !seq.clock, rst: %rst: i1, hi: %0: i4, lo: %1: i4, w: %2: i16) -> (z: i8)
    %0 = comb.mux %hi_poke_en, %hi_poke_val, %c0_i4 {sv.namehint = "hi_wire"} : i4
    %1 = comb.mux %lo_poke_en, %lo_poke_val, %c0_i4 {sv.namehint = "lo_wire"} : i4
    %2 = comb.mux %wv_poke_en, %wv_poke_val, %c0_i16 {sv.namehint = "wv_wire"} : i16
    hw.output %0, %1, %2, %DynBracketSlice_inst_7_1.z : i4, i4, i16, i8
  }
  func.func @entry() {
    %c-3532_i13 = hw.constant -3532 : i13
    %c-1_i3 = hw.constant -1 : i3
    %c-12_i6 = hw.constant -12 : i6
    %true = hw.constant true
    %false = hw.constant false
    %0 = seq.const_clock high
    %1 = seq.const_clock low
    arc.sim.instantiate @DynamicBracketSlice_Harness as %arg0 {
      arc.sim.set_input %arg0, "hi_poke_en" = %false : i1, !arc.sim.instance<@DynamicBracketSlice_Harness>
      arc.sim.set_input %arg0, "lo_poke_en" = %false : i1, !arc.sim.instance<@DynamicBracketSlice_Harness>
      arc.sim.set_input %arg0, "wv_poke_en" = %false : i1, !arc.sim.instance<@DynamicBracketSlice_Harness>
      arc.sim.set_input %arg0, "z_poke_en" = %false : i1, !arc.sim.instance<@DynamicBracketSlice_Harness>
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@DynamicBracketSlice_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@DynamicBracketSlice_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@DynamicBracketSlice_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@DynamicBracketSlice_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@DynamicBracketSlice_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@DynamicBracketSlice_Harness>
      arc.sim.set_input %arg0, "rst" = %false : i1, !arc.sim.instance<@DynamicBracketSlice_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@DynamicBracketSlice_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@DynamicBracketSlice_Harness>
      %false_0 = hw.constant false
      %2 = comb.concat %false_0, %c-1_i3 : i1, i3
      arc.sim.emit "DRIVER: poke hi START", %2 : i4
      arc.sim.set_input %arg0, "hi_poke_val" = %2 : i4, !arc.sim.instance<@DynamicBracketSlice_Harness>
      arc.sim.set_input %arg0, "hi_poke_en" = %true : i1, !arc.sim.instance<@DynamicBracketSlice_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@DynamicBracketSlice_Harness>
      arc.sim.emit "DRIVER: poke hi END", %2 : i4
      %c0_i3 = hw.constant 0 : i3
      %3 = comb.concat %c0_i3, %false : i3, i1
      arc.sim.emit "DRIVER: poke lo START", %3 : i4
      arc.sim.set_input %arg0, "lo_poke_val" = %3 : i4, !arc.sim.instance<@DynamicBracketSlice_Harness>
      arc.sim.set_input %arg0, "lo_poke_en" = %true : i1, !arc.sim.instance<@DynamicBracketSlice_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@DynamicBracketSlice_Harness>
      arc.sim.emit "DRIVER: poke lo END", %3 : i4
      %c0_i3_1 = hw.constant 0 : i3
      %4 = comb.concat %c0_i3_1, %c-3532_i13 : i3, i13
      arc.sim.emit "DRIVER: poke wv START", %4 : i16
      arc.sim.set_input %arg0, "wv_poke_val" = %4 : i16, !arc.sim.instance<@DynamicBracketSlice_Harness>
      arc.sim.set_input %arg0, "wv_poke_en" = %true : i1, !arc.sim.instance<@DynamicBracketSlice_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@DynamicBracketSlice_Harness>
      arc.sim.emit "DRIVER: poke wv END", %4 : i16
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@DynamicBracketSlice_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@DynamicBracketSlice_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@DynamicBracketSlice_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@DynamicBracketSlice_Harness>
      %5 = arc.sim.get_port %arg0, "z" : i8, !arc.sim.instance<@DynamicBracketSlice_Harness>
      arc.sim.emit "z", %5 : i8
      %6 = arc.sim.get_port %arg0, "lo" : i4, !arc.sim.instance<@DynamicBracketSlice_Harness>
      arc.sim.emit "lo", %6 : i4
      %7 = arc.sim.get_port %arg0, "wv" : i16, !arc.sim.instance<@DynamicBracketSlice_Harness>
      arc.sim.emit "wv", %7 : i16
      %8 = arc.sim.get_port %arg0, "hi" : i4, !arc.sim.instance<@DynamicBracketSlice_Harness>
      arc.sim.emit "hi", %8 : i4
      %9 = arc.sim.get_port %arg0, "z" : i8, !arc.sim.instance<@DynamicBracketSlice_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22z\22}", %9 : i8
      %c0_i2 = hw.constant 0 : i2
      %10 = comb.concat %c0_i2, %c-12_i6 : i2, i6
      %false_2 = hw.constant false
      %11 = comb.concat %false_2, %9 : i1, i8
      %false_3 = hw.constant false
      %12 = comb.concat %false_3, %10 : i1, i8
      %13 = comb.icmp eq %11, %12 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22low byte of 0x1234\22, \22line\22: 17, \22column\22: 12, \22condition\22: \22z == 0x34 as u8\22, \22scope\22: \22DynamicBracketSlice\22}", %13 : i1
    }
    return
  }
}