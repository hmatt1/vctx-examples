module {



  hw.module private @comptime_slice_known_width_SliceExprNarrowingCast(in %clk : !seq.clock, in %rst : i1, in %word : i32, in %i : i3, out as_u8 : i8) {
    %c0_i29 = hw.constant 0 : i29
    %0 = comb.concat %c0_i29, %i : i29, i3
    %1 = comb.shru %word, %0 : i32
    %2 = comb.extract %1 from 0 : (i32) -> i8
    %c0_i24 = hw.constant 0 : i24
    %3 = comb.concat %c0_i24, %2 : i24, i8
    %4 = comb.extract %3 from 0 : (i32) -> i8
    hw.output %4 : i8
  }
  hw.module @SimSliceExprNarrowingCast_Harness(in %clk : !seq.clock, in %rst : i1, in %as_u8_poke_val : i8, in %as_u8_poke_en : i1, in %i_poke_val : i3, in %i_poke_en : i1, in %w_poke_val : i32, in %w_poke_en : i1, out as_u8 : i8, out i : i3, out w : i32) {
    %c-1515870811_i32 = hw.constant -1515870811 : i32
    %c0_i3 = hw.constant 0 : i3
    %false = hw.constant false
    %c0_i2 = hw.constant 0 : i2
    %0 = comb.concat %c0_i2, %false : i2, i1
    %SliceExprNarrowingCast_inst_97_1.as_u8 = hw.instance "SliceExprNarrowingCast_inst_97_1" sym @SliceExprNarrowingCast_inst_97_1 @comptime_slice_known_width_SliceExprNarrowingCast(clk: %clk: !seq.clock, rst: %rst: i1, word: %2: i32, i: %1: i3) -> (as_u8: i8)
    %1 = comb.mux %i_poke_en, %i_poke_val, %0 {sv.namehint = "i_wire"} : i3
    %2 = comb.mux %w_poke_en, %w_poke_val, %c-1515870811_i32 {sv.namehint = "w_wire"} : i32
    hw.output %SliceExprNarrowingCast_inst_97_1.as_u8, %1, %2 : i8, i3, i32
  }
  func.func @entry() {
    %c-91_i8 = hw.constant -91 : i8
    %true = hw.constant true
    %false = hw.constant false
    %0 = seq.const_clock high
    %1 = seq.const_clock low
    arc.sim.instantiate @SimSliceExprNarrowingCast_Harness as %arg0 {
      arc.sim.set_input %arg0, "as_u8_poke_en" = %false : i1, !arc.sim.instance<@SimSliceExprNarrowingCast_Harness>
      arc.sim.set_input %arg0, "i_poke_en" = %false : i1, !arc.sim.instance<@SimSliceExprNarrowingCast_Harness>
      arc.sim.set_input %arg0, "w_poke_en" = %false : i1, !arc.sim.instance<@SimSliceExprNarrowingCast_Harness>
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@SimSliceExprNarrowingCast_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@SimSliceExprNarrowingCast_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@SimSliceExprNarrowingCast_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@SimSliceExprNarrowingCast_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@SimSliceExprNarrowingCast_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@SimSliceExprNarrowingCast_Harness>
      arc.sim.set_input %arg0, "rst" = %false : i1, !arc.sim.instance<@SimSliceExprNarrowingCast_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@SimSliceExprNarrowingCast_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@SimSliceExprNarrowingCast_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@SimSliceExprNarrowingCast_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@SimSliceExprNarrowingCast_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@SimSliceExprNarrowingCast_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@SimSliceExprNarrowingCast_Harness>
      %2 = arc.sim.get_port %arg0, "w" : i32, !arc.sim.instance<@SimSliceExprNarrowingCast_Harness>
      arc.sim.emit "w", %2 : i32
      %3 = arc.sim.get_port %arg0, "as_u8" : i8, !arc.sim.instance<@SimSliceExprNarrowingCast_Harness>
      arc.sim.emit "as_u8", %3 : i8
      %4 = arc.sim.get_port %arg0, "i" : i3, !arc.sim.instance<@SimSliceExprNarrowingCast_Harness>
      arc.sim.emit "i", %4 : i3
      %5 = arc.sim.get_port %arg0, "as_u8" : i8, !arc.sim.instance<@SimSliceExprNarrowingCast_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22as_u8\22}", %5 : i8
      %false_0 = hw.constant false
      %6 = comb.concat %false_0, %5 : i1, i8
      %false_1 = hw.constant false
      %7 = comb.concat %false_1, %c-91_i8 : i1, i8
      %8 = comb.icmp eq %6, %7 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Slice(...) as u8 matches statement Slice + cast\22, \22line\22: 103, \22column\22: 12, \22condition\22: \22as_u8 == 0xA5 as u8\22, \22scope\22: \22SimSliceExprNarrowingCast\22}", %8 : i1
    }
    return
  }
}