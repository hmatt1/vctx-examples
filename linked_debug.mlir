module {



  hw.module @SliceConcatByteswap_Harness(in %clk : !seq.clock, in %rst : i1, in %x_poke_val : i16, in %x_poke_en : i1, in %y_poke_val : i16, in %y_poke_en : i1, out x : i16, out y : i16) {
    %c8_i16 = hw.constant 8 : i16
    %c0_i16 = hw.constant 0 : i16
    %c4660_i16 = hw.constant 4660 : i16
    %0 = comb.shru %5, %c0_i16 : i16
    %1 = comb.extract %0 from 0 : (i16) -> i8
    %2 = comb.shru %5, %c8_i16 : i16
    %3 = comb.extract %2 from 0 : (i16) -> i8
    %4 = comb.concat %1, %3 : i8, i8
    %5 = comb.mux %x_poke_en, %x_poke_val, %c4660_i16 : i16
    %6 = comb.mux %y_poke_en, %y_poke_val, %4 : i16
    hw.output %5, %6 : i16, i16
  }
  func.func @entry() {
    %c13330_i17 = hw.constant 13330 : i17
    %true = hw.constant true
    %false = hw.constant false
    %0 = seq.const_clock high
    %1 = seq.const_clock low
    arc.sim.instantiate @SliceConcatByteswap_Harness as %arg0 {
      arc.sim.set_input %arg0, "x_poke_en" = %false : i1, !arc.sim.instance<@SliceConcatByteswap_Harness>
      arc.sim.set_input %arg0, "y_poke_en" = %false : i1, !arc.sim.instance<@SliceConcatByteswap_Harness>
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@SliceConcatByteswap_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@SliceConcatByteswap_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@SliceConcatByteswap_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@SliceConcatByteswap_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@SliceConcatByteswap_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@SliceConcatByteswap_Harness>
      arc.sim.set_input %arg0, "rst" = %false : i1, !arc.sim.instance<@SliceConcatByteswap_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@SliceConcatByteswap_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@SliceConcatByteswap_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@SliceConcatByteswap_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@SliceConcatByteswap_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@SliceConcatByteswap_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@SliceConcatByteswap_Harness>
      %2 = arc.sim.get_port %arg0, "x" : i16, !arc.sim.instance<@SliceConcatByteswap_Harness>
      arc.sim.emit "x", %2 : i16
      %3 = arc.sim.get_port %arg0, "y" : i16, !arc.sim.instance<@SliceConcatByteswap_Harness>
      arc.sim.emit "y", %3 : i16
      %4 = arc.sim.get_port %arg0, "y" : i16, !arc.sim.instance<@SliceConcatByteswap_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22y\22}", %4 : i16
      %5 = comb.concat %false, %4 : i1, i16
      %6 = comb.icmp eq %5, %c13330_i17 : i17
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22byte swap 0x1234 -> 0x3412\22, \22line\22: 12, \22column\22: 12, \22condition\22: \22y == 0x3412\22, \22scope\22: \22SliceConcatByteswap\22}", %6 : i1
    }
    return
  }
}