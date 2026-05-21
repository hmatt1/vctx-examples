module {



  hw.module @TestSubUnsigned_Harness(in %clk : !seq.clock, in %rst : i1, in %a : i8, in %b : i8, in %z : i8, out a : i8, out b : i8, out z : i8) {
    hw.output %a, %b, %z : i8, i8, i8
  }
  func.func @entry() {
    %c-1_i8 = hw.constant -1 : i8
    %false = hw.constant false
    %c-6_i4 = hw.constant -6 : i4
    %c0_i8 = hw.constant 0 : i8
    %c10_i8 = hw.constant 10 : i8
    %c20_i8 = hw.constant 20 : i8
    %true = hw.constant true
    %false_0 = hw.constant false
    %0 = seq.const_clock high
    %1 = seq.const_clock low
    arc.sim.instantiate @TestSubUnsigned_Harness as %arg0 {
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@TestSubUnsigned_Harness>
      arc.sim.set_input %arg0, "a" = %c20_i8 : i8, !arc.sim.instance<@TestSubUnsigned_Harness>
      arc.sim.set_input %arg0, "b" = %c10_i8 : i8, !arc.sim.instance<@TestSubUnsigned_Harness>
      arc.sim.set_input %arg0, "z" = %c0_i8 : i8, !arc.sim.instance<@TestSubUnsigned_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestSubUnsigned_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSubUnsigned_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestSubUnsigned_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSubUnsigned_Harness>
      arc.sim.set_input %arg0, "rst" = %false_0 : i1, !arc.sim.instance<@TestSubUnsigned_Harness>
      %2 = arc.sim.get_port %arg0, "b" : i8, !arc.sim.instance<@TestSubUnsigned_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22b\22}", %2 : i8
      %3 = arc.sim.get_port %arg0, "a" : i8, !arc.sim.instance<@TestSubUnsigned_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22a\22}", %3 : i8
      %c0_i2 = hw.constant 0 : i2
      %4 = comb.concat %c0_i2, %3 : i2, i8
      %c0_i2_1 = hw.constant 0 : i2
      %5 = comb.concat %c0_i2_1, %2 : i2, i8
      %6 = comb.extract %4 from 9 : (i10) -> i1
      %7 = comb.concat %6, %4 : i1, i10
      %8 = comb.extract %5 from 9 : (i10) -> i1
      %9 = comb.concat %8, %5 : i1, i10
      %10 = comb.sub %7, %9 : i11
      %11 = comb.extract %10 from 0 : (i11) -> i10
      %c0_i6 = hw.constant 0 : i6
      %12 = comb.concat %c0_i6, %c-6_i4 : i6, i4
      %13 = comb.icmp eq %11, %12 : i10
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \2220 - 10 = 10\22, \22line\22: 7, \22column\22: 12, \22condition\22: \22a - b == 10\22, \22scope\22: \22TestSubUnsigned\22}", %13 : i1
      %14 = arc.sim.get_port %arg0, "z" : i8, !arc.sim.instance<@TestSubUnsigned_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22z\22}", %14 : i8
      %c0_i2_2 = hw.constant 0 : i2
      %15 = comb.concat %c0_i2_2, %14 : i2, i8
      %c0_i9 = hw.constant 0 : i9
      %16 = comb.concat %c0_i9, %true : i9, i1
      %17 = comb.extract %15 from 9 : (i10) -> i1
      %18 = comb.concat %17, %15 : i1, i10
      %19 = comb.extract %16 from 9 : (i10) -> i1
      %20 = comb.concat %19, %16 : i1, i10
      %21 = comb.sub %18, %20 : i11
      %22 = comb.extract %21 from 0 : (i11) -> i10
      %23 = comb.concat %false, %false : i1, i1
      %24 = comb.concat %true, %true : i1, i1
      %25 = comb.sub %23, %24 : i2
      %26 = comb.extract %25 from 0 : (i2) -> i1
      %27 = comb.replicate %26 : (i1) -> i9
      %28 = comb.concat %27, %26 : i9, i1
      %29 = comb.icmp eq %22, %28 : i10
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22mathematically, 0 - 1 = -1\22, \22line\22: 11, \22column\22: 12, \22condition\22: \22z - 1 == - 1\22, \22scope\22: \22TestSubUnsigned\22}", %29 : i1
      %30 = arc.sim.get_port %arg0, "z" : i8, !arc.sim.instance<@TestSubUnsigned_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22z\22}", %30 : i8
      %c0_i2_3 = hw.constant 0 : i2
      %31 = comb.concat %c0_i2_3, %30 : i2, i8
      %32 = comb.extract %31 from 9 : (i10) -> i1
      %33 = comb.concat %32, %31 : i1, i10
      %34 = comb.extract %16 from 9 : (i10) -> i1
      %35 = comb.concat %34, %16 : i1, i10
      %36 = comb.sub %33, %35 : i11
      %37 = comb.extract %36 from 0 : (i11) -> i10
      %38 = comb.extract %37 from 0 : (i10) -> i8
      %false_4 = hw.constant false
      %39 = comb.concat %false_4, %38 : i1, i8
      %false_5 = hw.constant false
      %40 = comb.concat %false_5, %c-1_i8 : i1, i8
      %41 = comb.icmp eq %39, %40 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22casting to u8 to wrap to 255\22, \22line\22: 13, \22column\22: 12, \22condition\22: \22z - 1 as u8 == 255\22, \22scope\22: \22TestSubUnsigned\22}", %41 : i1
    }
    return
  }
}25, \22column\22: 12, \22condition\22: \22a - c == 15\22, \22scope\22: \22TestSubSigned\22}", %48 : i1
    }
    return
  }
}