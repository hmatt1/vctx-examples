module {



  hw.module @TestEndianSwap_Harness(in %clk : !seq.clock, in %rst : i1, in %data_poke_val : i16, in %data_poke_en : i1, in %swapped_poke_val : i16, in %swapped_poke_en : i1, out data : i16, out swapped : i16) {
    %c8_i16 = hw.constant 8 : i16
    %c0_i16 = hw.constant 0 : i16
    %c0_i14 = hw.constant 0 : i14
    %c4660_i16 = hw.constant 4660 : i16
    %0 = comb.shru %5, %c0_i16 : i16
    %1 = comb.extract %0 from 0 : (i16) -> i1
    %2 = comb.shru %5, %c8_i16 : i16
    %3 = comb.extract %2 from 0 : (i16) -> i1
    %4 = comb.concat %c0_i14, %1, %3 : i14, i1, i1
    %5 = comb.mux %data_poke_en, %data_poke_val, %c4660_i16 {sv.namehint = "data_wire"} : i16
    %6 = comb.mux %swapped_poke_en, %swapped_poke_val, %4 {sv.namehint = "swapped_wire"} : i16
    hw.output %5, %6 : i16, i16
  }
  func.func @entry() {
    %c13330_i17 = hw.constant 13330 : i17
    %true = hw.constant true
    %false = hw.constant false
    %0 = seq.const_clock high
    %1 = seq.const_clock low
    arc.sim.instantiate @TestEndianSwap_Harness as %arg0 {
      arc.sim.set_input %arg0, "data_poke_en" = %false : i1, !arc.sim.instance<@TestEndianSwap_Harness>
      arc.sim.set_input %arg0, "swapped_poke_en" = %false : i1, !arc.sim.instance<@TestEndianSwap_Harness>
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@TestEndianSwap_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestEndianSwap_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestEndianSwap_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestEndianSwap_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestEndianSwap_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestEndianSwap_Harness>
      arc.sim.set_input %arg0, "rst" = %false : i1, !arc.sim.instance<@TestEndianSwap_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestEndianSwap_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestEndianSwap_Harness>
      %2 = arc.sim.get_port %arg0, "swapped" : i16, !arc.sim.instance<@TestEndianSwap_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22swapped\22}", %2 : i16
      %3 = comb.concat %false, %2 : i1, i16
      %4 = comb.icmp eq %3, %c13330_i17 : i17
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Swapping bytes using slicing and concatenation\22, \22line\22: 95, \22column\22: 12, \22condition\22: \22swapped == 0x3412\22, \22scope\22: \22TestEndianSwap\22}", %4 : i1
    }
    return
  }
}