module {



  hw.module @TestWidthU9_Harness(in %clk : !seq.clock, in %rst : i1, in %x : i9, out x : i9) {
    hw.output %x : i9
  }
  func.func @entry() {
    %c-7_i4 = hw.constant -7 : i4
    %c9_i32 = hw.constant 9 : i32
    %c0_i9 = hw.constant 0 : i9
    %true = hw.constant true
    %false = hw.constant false
    %0 = seq.const_clock high
    %1 = seq.const_clock low
    arc.sim.instantiate @TestWidthU9_Harness as %arg0 {
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@TestWidthU9_Harness>
      arc.sim.set_input %arg0, "x" = %c0_i9 : i9, !arc.sim.instance<@TestWidthU9_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestWidthU9_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestWidthU9_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestWidthU9_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestWidthU9_Harness>
      arc.sim.set_input %arg0, "rst" = %false : i1, !arc.sim.instance<@TestWidthU9_Harness>
      %2 = arc.sim.get_port %arg0, "x" : i9, !arc.sim.instance<@TestWidthU9_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22x\22}", %2 : i9
      %c0_i28 = hw.constant 0 : i28
      %3 = comb.concat %c0_i28, %c-7_i4 : i28, i4
      %false_0 = hw.constant false
      %4 = comb.concat %false_0, %c9_i32 : i1, i32
      %false_1 = hw.constant false
      %5 = comb.concat %false_1, %3 : i1, i32
      %6 = comb.icmp eq %4, %5 : i33
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22width(u9) = 9\22, \22line\22: 126, \22column\22: 12, \22condition\22: \22width x == 9 as u32\22, \22scope\22: \22TestWidthU9\22}", %6 : i1
    }
    return
  }
}