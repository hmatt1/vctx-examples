module {



  hw.module private @registers_array_procedural_swizzle_Swizzler(in %clk : !seq.clock, in %rst : i1, in %select : i2, in %val : i8, out out0 : i8, out out1 : i8) {
    %c0_i3 = hw.constant 0 : i3
    %c0_i24 = hw.constant 0 : i24
    %c0_i16 = hw.constant 0 : i16
    %c0_i8 = hw.constant 0 : i8
    %c-1_i2 = hw.constant -1 : i2
    %c-1_i32 = hw.constant -1 : i32
    %c255_i32 = hw.constant 255 : i32
    %c4_i8 = hw.constant 4 : i8
    %c3_i8 = hw.constant 3 : i8
    %c2_i8 = hw.constant 2 : i8
    %c1_i8 = hw.constant 1 : i8
    %true = hw.constant true
    %c0_i7 = hw.constant 0 : i7
    %0 = comb.concat %c0_i7, %true : i7, i1
    %c0_i24_0 = hw.constant 0 : i24
    %1 = comb.concat %c0_i24_0, %0 : i24, i8
    %c-2_i2 = hw.constant -2 : i2
    %c0_i6 = hw.constant 0 : i6
    %2 = comb.concat %c0_i6, %c-2_i2 : i6, i2
    %c0_i24_1 = hw.constant 0 : i24
    %3 = comb.concat %c0_i24_1, %2 : i24, i8
    %4 = comb.extract %3 from 0 : (i32) -> i24
    %5 = comb.concat %4, %c0_i8 : i24, i8
    %c-1_i2_2 = hw.constant -1 : i2
    %c0_i6_3 = hw.constant 0 : i6
    %6 = comb.concat %c0_i6_3, %c-1_i2_2 : i6, i2
    %c0_i24_4 = hw.constant 0 : i24
    %7 = comb.concat %c0_i24_4, %6 : i24, i8
    %8 = comb.extract %7 from 0 : (i32) -> i16
    %9 = comb.concat %8, %c0_i16 : i16, i16
    %c-4_i3 = hw.constant -4 : i3
    %c0_i5 = hw.constant 0 : i5
    %10 = comb.concat %c0_i5, %c-4_i3 : i5, i3
    %c0_i24_5 = hw.constant 0 : i24
    %11 = comb.concat %c0_i24_5, %10 : i24, i8
    %12 = comb.extract %11 from 0 : (i32) -> i8
    %13 = comb.concat %12, %c0_i24 : i8, i24
    %14 = comb.or %1, %5, %9, %13 : i32
    %mem = seq.compreg %37, %clk : i32  
    %c0_i24_6 = hw.constant 0 : i24
    %15 = comb.concat %c0_i24_6, %val : i24, i8
    %16 = comb.extract %15 from 0 : (i32) -> i8
    %c0_i24_7 = hw.constant 0 : i24
    %17 = comb.concat %c0_i24_7, %16 : i24, i8
    %c0_i30 = hw.constant 0 : i30
    %18 = comb.concat %c0_i30, %select : i30, i2
    %19 = comb.extract %18 from 0 : (i32) -> i29
    %20 = comb.concat %19, %c0_i3 : i29, i3
    %21 = comb.shl %17, %20 : i32
    %22 = comb.shl %c255_i32, %20 : i32
    %23 = comb.xor %22, %c-1_i32 : i32
    %24 = comb.and %mem, %23 : i32
    %25 = comb.or %24, %21 : i32
    %26 = comb.extract %mem from 0 : (i32) -> i8
    %c0_i24_8 = hw.constant 0 : i24
    %27 = comb.concat %c0_i24_8, %26 : i24, i8
    %c0_i30_9 = hw.constant 0 : i30
    %28 = comb.concat %c0_i30_9, %c-1_i2 : i30, i2
    %29 = comb.extract %28 from 0 : (i32) -> i29
    %30 = comb.concat %29, %c0_i3 : i29, i3
    %31 = comb.shl %27, %30 : i32
    %32 = comb.shl %c255_i32, %30 : i32
    %33 = comb.xor %32, %c-1_i32 : i32
    %34 = comb.and %25, %33 : i32
    %35 = comb.or %34, %31 : i32
    %36 = comb.extract %mem from 24 : (i32) -> i8
    %37 = comb.mux %rst, %14, %35 : i32
    hw.output %26, %36 : i8, i8
  }
  hw.module @TestSwizzle_Harness(in %clk : !seq.clock, in %rst : i1, in %o0_poke_val : i8, in %o0_poke_en : i1, in %o1_poke_val : i8, in %o1_poke_en : i1, in %s_poke_val : i2, in %s_poke_en : i1, in %v_poke_val : i8, in %v_poke_en : i1, out o0 : i8, out o1 : i8, out s : i2, out v : i8) {
    %c99_i8 = hw.constant 99 : i8
    %c0_i2 = hw.constant 0 : i2
    %false = hw.constant false
    %false_0 = hw.constant false
    %0 = comb.concat %false_0, %false : i1, i1
    %c-29_i7 = hw.constant -29 : i7
    %false_1 = hw.constant false
    %1 = comb.concat %false_1, %c-29_i7 : i1, i7
    %Swizzler_inst_23_1.out0, %Swizzler_inst_23_1.out1 = hw.instance "Swizzler_inst_23_1" sym @Swizzler_inst_23_1 @registers_array_procedural_swizzle_Swizzler(clk: %clk: !seq.clock, rst: %rst: i1, select: %2: i2, val: %3: i8) -> (out0: i8, out1: i8)
    %2 = comb.mux %s_poke_en, %s_poke_val, %0 {sv.namehint = "s_wire"} : i2
    %3 = comb.mux %v_poke_en, %v_poke_val, %1 {sv.namehint = "v_wire"} : i8
    hw.output %Swizzler_inst_23_1.out0, %Swizzler_inst_23_1.out1, %2, %3 : i8, i8, i2, i8
  }
  func.func @entry() {
    %c-29_i7 = hw.constant -29 : i7
    %true = hw.constant true
    %false = hw.constant false
    %0 = seq.const_clock high
    %1 = seq.const_clock low
    arc.sim.instantiate @TestSwizzle_Harness as %arg0 {
      arc.sim.set_input %arg0, "o0_poke_en" = %false : i1, !arc.sim.instance<@TestSwizzle_Harness>
      arc.sim.set_input %arg0, "o1_poke_en" = %false : i1, !arc.sim.instance<@TestSwizzle_Harness>
      arc.sim.set_input %arg0, "s_poke_en" = %false : i1, !arc.sim.instance<@TestSwizzle_Harness>
      arc.sim.set_input %arg0, "v_poke_en" = %false : i1, !arc.sim.instance<@TestSwizzle_Harness>
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@TestSwizzle_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSwizzle_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestSwizzle_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSwizzle_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestSwizzle_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSwizzle_Harness>
      arc.sim.set_input %arg0, "rst" = %false : i1, !arc.sim.instance<@TestSwizzle_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSwizzle_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSwizzle_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestSwizzle_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSwizzle_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestSwizzle_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSwizzle_Harness>
      %2 = arc.sim.get_port %arg0, "s" : i2, !arc.sim.instance<@TestSwizzle_Harness>
      arc.sim.emit "s", %2 : i2
      %3 = arc.sim.get_port %arg0, "v" : i8, !arc.sim.instance<@TestSwizzle_Harness>
      arc.sim.emit "v", %3 : i8
      %4 = arc.sim.get_port %arg0, "o0" : i8, !arc.sim.instance<@TestSwizzle_Harness>
      arc.sim.emit "o0", %4 : i8
      %5 = arc.sim.get_port %arg0, "o1" : i8, !arc.sim.instance<@TestSwizzle_Harness>
      arc.sim.emit "o1", %5 : i8
      %6 = arc.sim.get_port %arg0, "o0" : i8, !arc.sim.instance<@TestSwizzle_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22o0\22}", %6 : i8
      %false_0 = hw.constant false
      %7 = comb.concat %false_0, %6 : i1, i8
      %c0_i2 = hw.constant 0 : i2
      %8 = comb.concat %c0_i2, %c-29_i7 : i2, i7
      %9 = comb.icmp eq %7, %8 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22mem[0] updated to 99\22, \22line\22: 36, \22column\22: 12, \22condition\22: \22o0 == 99\22, \22scope\22: \22TestSwizzle\22}", %9 : i1
      %10 = arc.sim.get_port %arg0, "o1" : i8, !arc.sim.instance<@TestSwizzle_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22o1\22}", %10 : i8
      %false_1 = hw.constant false
      %11 = comb.concat %false_1, %10 : i1, i8
      %c0_i8 = hw.constant 0 : i8
      %12 = comb.concat %c0_i8, %true : i8, i1
      %13 = comb.icmp eq %11, %12 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22mem[3] updated from mem[0]\22, \22line\22: 37, \22column\22: 12, \22condition\22: \22o1 == 1\22, \22scope\22: \22TestSwizzle\22}", %13 : i1
    }
    return
  }
}