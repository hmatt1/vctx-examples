module {



  hw.module @TestSliceBoundaries_Harness(in %clk : !seq.clock, in %rst : i1, in %lsb_poke_val : i1, in %lsb_poke_en : i1, in %mid_poke_val : i2, in %mid_poke_en : i1, in %msb_poke_val : i1, in %msb_poke_en : i1, in %w_poke_val : i8, in %w_poke_en : i1, out lsb : i1, out mid : i2, out msb : i1, out w : i8) {
    %c-91_i8 = hw.constant -91 : i8
    %c-1_i2 = hw.constant -1 : i2
    %false = hw.constant false
    %c-1_i3 = hw.constant -1 : i3
    %c0_i5 = hw.constant 0 : i5
    %0 = comb.concat %c0_i5, %c-1_i3 : i5, i3
    %1 = comb.shru %18, %0 : i8
    %2 = comb.extract %1 from 0 : (i8) -> i1
    %c0_i7 = hw.constant 0 : i7
    %3 = comb.concat %c0_i7, %2 : i7, i1
    %4 = comb.extract %3 from 0 : (i8) -> i1
    %c0_i7_0 = hw.constant 0 : i7
    %5 = comb.concat %c0_i7_0, %false : i7, i1
    %6 = comb.shru %18, %5 : i8
    %7 = comb.extract %6 from 0 : (i8) -> i1
    %c0_i7_1 = hw.constant 0 : i7
    %8 = comb.concat %c0_i7_1, %7 : i7, i1
    %9 = comb.extract %8 from 0 : (i8) -> i1
    %c0_i6 = hw.constant 0 : i6
    %10 = comb.concat %c0_i6, %c-1_i2 : i6, i2
    %11 = comb.shru %18, %10 : i8
    %12 = comb.extract %11 from 0 : (i8) -> i2
    %c0_i6_2 = hw.constant 0 : i6
    %13 = comb.concat %c0_i6_2, %12 : i6, i2
    %14 = comb.extract %13 from 0 : (i8) -> i2
    %15 = comb.mux %lsb_poke_en, %lsb_poke_val, %9 {sv.namehint = "lsb_wire"} : i1
    %16 = comb.mux %mid_poke_en, %mid_poke_val, %14 {sv.namehint = "mid_wire"} : i2
    %17 = comb.mux %msb_poke_en, %msb_poke_val, %4 {sv.namehint = "msb_wire"} : i1
    %18 = comb.mux %w_poke_en, %w_poke_val, %c-91_i8 {sv.namehint = "w_wire"} : i8
    hw.output %15, %16, %17, %18 : i1, i2, i1, i8
  }
  func.func @entry() {
    %true = hw.constant true
    %false = hw.constant false
    %0 = seq.const_clock high
    %1 = seq.const_clock low
    arc.sim.instantiate @TestSliceBoundaries_Harness as %arg0 {
      arc.sim.set_input %arg0, "lsb_poke_en" = %false : i1, !arc.sim.instance<@TestSliceBoundaries_Harness>
      arc.sim.set_input %arg0, "mid_poke_en" = %false : i1, !arc.sim.instance<@TestSliceBoundaries_Harness>
      arc.sim.set_input %arg0, "msb_poke_en" = %false : i1, !arc.sim.instance<@TestSliceBoundaries_Harness>
      arc.sim.set_input %arg0, "w_poke_en" = %false : i1, !arc.sim.instance<@TestSliceBoundaries_Harness>
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@TestSliceBoundaries_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSliceBoundaries_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestSliceBoundaries_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSliceBoundaries_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestSliceBoundaries_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSliceBoundaries_Harness>
      arc.sim.set_input %arg0, "rst" = %false : i1, !arc.sim.instance<@TestSliceBoundaries_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSliceBoundaries_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSliceBoundaries_Harness>
      %2 = arc.sim.get_port %arg0, "msb" : i1, !arc.sim.instance<@TestSliceBoundaries_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22msb\22}", %2 : i1
      %false_0 = hw.constant false
      %3 = comb.concat %false_0, %2 : i1, i1
      %false_1 = hw.constant false
      %4 = comb.concat %false_1, %true : i1, i1
      %5 = comb.icmp eq %3, %4 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Slice(w, 7, 7) is bit 7 (1)\22, \22line\22: 12, \22column\22: 12, \22condition\22: \22msb == 1 as u1\22, \22scope\22: \22TestSliceBoundaries\22}", %5 : i1
      %6 = arc.sim.get_port %arg0, "lsb" : i1, !arc.sim.instance<@TestSliceBoundaries_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22lsb\22}", %6 : i1
      %false_2 = hw.constant false
      %7 = comb.concat %false_2, %6 : i1, i1
      %8 = comb.icmp eq %7, %4 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Slice(w, 0, 0) is bit 0 (1)\22, \22line\22: 15, \22column\22: 12, \22condition\22: \22lsb == 1 as u1\22, \22scope\22: \22TestSliceBoundaries\22}", %8 : i1
      %9 = arc.sim.get_port %arg0, "mid" : i2, !arc.sim.instance<@TestSliceBoundaries_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22mid\22}", %9 : i2
      %false_3 = hw.constant false
      %10 = comb.concat %false_3, %false : i1, i1
      %false_4 = hw.constant false
      %11 = comb.concat %false_4, %9 : i1, i2
      %false_5 = hw.constant false
      %12 = comb.concat %false_5, %10 : i1, i2
      %13 = comb.icmp eq %11, %12 : i3
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Slice(w, 4, 3) is 0b00\22, \22line\22: 19, \22column\22: 12, \22condition\22: \22mid == 0 as u2\22, \22scope\22: \22TestSliceBoundaries\22}", %13 : i1
    }
    return
  }
}