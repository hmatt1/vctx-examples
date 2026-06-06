module {



  hw.module @TestWidthInArithmetic_Harness(in %clk : !seq.clock, in %rst : i1, in %diff_w_poke_val : i8, in %diff_w_poke_en : i1, in %double_w_poke_val : i8, in %double_w_poke_en : i1, in %dynamic_w_poke_val : i8, in %dynamic_w_poke_en : i1, in %sel_poke_val : i1, in %sel_poke_en : i1, in %sum_w_poke_val : i8, in %sum_w_poke_en : i1, in %val_u7_poke_val : i7, in %val_u7_poke_en : i1, in %val_u9_poke_val : i9, in %val_u9_poke_en : i1, in %x8_poke_val : i8, in %x8_poke_en : i1, in %y16_poke_val : i16, in %y16_poke_en : i1, in %z8_poke_val : i8, in %z8_poke_en : i1, out diff_w : i8, out double_w : i8, out dynamic_w : i8, out sel : i1, out sum_w : i8, out val_u7 : i7, out val_u9 : i9, out x8 : i8, out y16 : i16, out z8 : i8) {
    %true = hw.constant true
    %c0_i9 = hw.constant 0 : i9
    %c0_i7 = hw.constant 0 : i7
    %c-2_i2 = hw.constant -2 : i2
    %c16_i32 = hw.constant 16 : i32
    %c8_i32 = hw.constant 8 : i32
    %c0_i16 = hw.constant 0 : i16
    %c0_i8 = hw.constant 0 : i8
    %false = hw.constant false
    %c0_i7_0 = hw.constant 0 : i7
    %0 = comb.concat %c0_i7_0, %false : i7, i1
    %false_1 = hw.constant false
    %c0_i15 = hw.constant 0 : i15
    %1 = comb.concat %c0_i15, %false_1 : i15, i1
    %c0_i7_2 = hw.constant 0 : i7
    %2 = comb.concat %c0_i7_2, %false : i7, i1
    %false_3 = hw.constant false
    %3 = comb.concat %false_3, %c8_i32 : i1, i32
    %false_4 = hw.constant false
    %4 = comb.concat %false_4, %c16_i32 : i1, i32
    %false_5 = hw.constant false
    %5 = comb.concat %false_5, %3 : i1, i33
    %false_6 = hw.constant false
    %6 = comb.concat %false_6, %4 : i1, i33
    %7 = comb.add %5, %6 : i34
    %8 = comb.extract %7 from 0 : (i34) -> i33
    %9 = comb.extract %8 from 0 : (i33) -> i8
    %c0_i2 = hw.constant 0 : i2
    %10 = comb.concat %c0_i2, %c8_i32 : i2, i32
    %c0_i32 = hw.constant 0 : i32
    %11 = comb.concat %c0_i32, %c-2_i2 : i32, i2
    %c0_i34 = hw.constant 0 : i34
    %12 = comb.concat %c0_i34, %10 : i34, i34
    %c0_i34_7 = hw.constant 0 : i34
    %13 = comb.concat %c0_i34_7, %11 : i34, i34
    %14 = comb.mul %12, %13 : i68
    %15 = comb.extract %14 from 0 : (i68) -> i34
    %16 = comb.extract %15 from 0 : (i34) -> i8
    %false_8 = hw.constant false
    %17 = comb.concat %false_8, %c16_i32 : i1, i32
    %false_9 = hw.constant false
    %18 = comb.concat %false_9, %c8_i32 : i1, i32
    %19 = comb.extract %17 from 32 : (i33) -> i1
    %20 = comb.concat %19, %17 : i1, i33
    %21 = comb.extract %18 from 32 : (i33) -> i1
    %22 = comb.concat %21, %18 : i1, i33
    %23 = comb.sub %20, %22 : i34
    %24 = comb.extract %23 from 0 : (i34) -> i33
    %25 = comb.extract %24 from 0 : (i33) -> i8
    %false_10 = hw.constant false
    %c0_i6 = hw.constant 0 : i6
    %26 = comb.concat %c0_i6, %false_10 : i6, i1
    %false_11 = hw.constant false
    %c0_i8_12 = hw.constant 0 : i8
    %27 = comb.concat %c0_i8_12, %false_11 : i8, i1
    %28 = comb.mux %34, %c8_i32, %c16_i32 : i32
    %29 = comb.extract %28 from 0 : (i32) -> i8
    %30 = comb.mux %diff_w_poke_en, %diff_w_poke_val, %25 {sv.namehint = "diff_w_wire"} : i8
    %31 = comb.mux %double_w_poke_en, %double_w_poke_val, %16 {sv.namehint = "double_w_wire"} : i8
    %32 = comb.mux %dynamic_w_poke_en, %dynamic_w_poke_val, %29 {sv.namehint = "dynamic_w_wire"} : i8
    %33 = comb.xor %sel_poke_en, %true : i1
    %34 = comb.or %33, %sel_poke_val {sv.namehint = "sel_wire"} : i1
    %35 = comb.mux %sum_w_poke_en, %sum_w_poke_val, %9 {sv.namehint = "sum_w_wire"} : i8
    %36 = comb.mux %val_u7_poke_en, %val_u7_poke_val, %26 {sv.namehint = "val_u7_wire"} : i7
    %37 = comb.mux %val_u9_poke_en, %val_u9_poke_val, %27 {sv.namehint = "val_u9_wire"} : i9
    %38 = comb.mux %x8_poke_en, %x8_poke_val, %0 {sv.namehint = "x8_wire"} : i8
    %39 = comb.mux %y16_poke_en, %y16_poke_val, %1 {sv.namehint = "y16_wire"} : i16
    %40 = comb.mux %z8_poke_en, %z8_poke_val, %2 {sv.namehint = "z8_wire"} : i8
    hw.output %30, %31, %32, %34, %35, %36, %37, %38, %39, %40 : i8, i8, i8, i1, i8, i7, i9, i8, i16, i8
  }
  func.func @entry() {
    %c9_i32 = hw.constant 9 : i32
    %c7_i32 = hw.constant 7 : i32
    %c-15_i5 = hw.constant -15 : i5
    %c17_i32 = hw.constant 17 : i32
    %c24_i32 = hw.constant 24 : i32
    %c16_i32 = hw.constant 16 : i32
    %c8_i32 = hw.constant 8 : i32
    %c-8_i4 = hw.constant -8 : i4
    %c-16_i5 = hw.constant -16 : i5
    %c-8_i5 = hw.constant -8 : i5
    %true = hw.constant true
    %false = hw.constant false
    %0 = seq.const_clock high
    %1 = seq.const_clock low
    arc.sim.instantiate @TestWidthInArithmetic_Harness as %arg0 {
      arc.sim.set_input %arg0, "diff_w_poke_en" = %false : i1, !arc.sim.instance<@TestWidthInArithmetic_Harness>
      arc.sim.set_input %arg0, "double_w_poke_en" = %false : i1, !arc.sim.instance<@TestWidthInArithmetic_Harness>
      arc.sim.set_input %arg0, "dynamic_w_poke_en" = %false : i1, !arc.sim.instance<@TestWidthInArithmetic_Harness>
      arc.sim.set_input %arg0, "sel_poke_en" = %false : i1, !arc.sim.instance<@TestWidthInArithmetic_Harness>
      arc.sim.set_input %arg0, "sum_w_poke_en" = %false : i1, !arc.sim.instance<@TestWidthInArithmetic_Harness>
      arc.sim.set_input %arg0, "val_u7_poke_en" = %false : i1, !arc.sim.instance<@TestWidthInArithmetic_Harness>
      arc.sim.set_input %arg0, "val_u9_poke_en" = %false : i1, !arc.sim.instance<@TestWidthInArithmetic_Harness>
      arc.sim.set_input %arg0, "x8_poke_en" = %false : i1, !arc.sim.instance<@TestWidthInArithmetic_Harness>
      arc.sim.set_input %arg0, "y16_poke_en" = %false : i1, !arc.sim.instance<@TestWidthInArithmetic_Harness>
      arc.sim.set_input %arg0, "z8_poke_en" = %false : i1, !arc.sim.instance<@TestWidthInArithmetic_Harness>
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@TestWidthInArithmetic_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestWidthInArithmetic_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestWidthInArithmetic_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestWidthInArithmetic_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestWidthInArithmetic_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestWidthInArithmetic_Harness>
      arc.sim.set_input %arg0, "rst" = %false : i1, !arc.sim.instance<@TestWidthInArithmetic_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestWidthInArithmetic_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestWidthInArithmetic_Harness>
      %2 = arc.sim.get_port %arg0, "sum_w" : i8, !arc.sim.instance<@TestWidthInArithmetic_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22sum_w\22}", %2 : i8
      %false_0 = hw.constant false
      %3 = comb.concat %false_0, %2 : i1, i8
      %c0_i4 = hw.constant 0 : i4
      %4 = comb.concat %c0_i4, %c-8_i5 : i4, i5
      %5 = comb.icmp eq %3, %4 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22width(u8) + width(u16) = 24\22, \22line\22: 16, \22column\22: 12, \22condition\22: \22sum_w == 24\22, \22scope\22: \22TestWidthInArithmetic\22}", %5 : i1
      %6 = arc.sim.get_port %arg0, "double_w" : i8, !arc.sim.instance<@TestWidthInArithmetic_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22double_w\22}", %6 : i8
      %false_1 = hw.constant false
      %7 = comb.concat %false_1, %6 : i1, i8
      %c0_i4_2 = hw.constant 0 : i4
      %8 = comb.concat %c0_i4_2, %c-16_i5 : i4, i5
      %9 = comb.icmp eq %7, %8 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22width(u8) * 2 = 16\22, \22line\22: 20, \22column\22: 12, \22condition\22: \22double_w == 16\22, \22scope\22: \22TestWidthInArithmetic\22}", %9 : i1
      %10 = arc.sim.get_port %arg0, "diff_w" : i8, !arc.sim.instance<@TestWidthInArithmetic_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22diff_w\22}", %10 : i8
      %false_3 = hw.constant false
      %11 = comb.concat %false_3, %10 : i1, i8
      %c0_i5 = hw.constant 0 : i5
      %12 = comb.concat %c0_i5, %c-8_i4 : i5, i4
      %13 = comb.icmp eq %11, %12 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22width(u16) - width(u8) = 8\22, \22line\22: 24, \22column\22: 12, \22condition\22: \22diff_w == 8\22, \22scope\22: \22TestWidthInArithmetic\22}", %13 : i1
      %14 = arc.sim.get_port %arg0, "z8" : i8, !arc.sim.instance<@TestWidthInArithmetic_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22z8\22}", %14 : i8
      %15 = arc.sim.get_port %arg0, "x8" : i8, !arc.sim.instance<@TestWidthInArithmetic_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22x8\22}", %15 : i8
      %false_4 = hw.constant false
      %16 = comb.concat %false_4, %c8_i32 : i1, i32
      %17 = comb.icmp eq %16, %16 : i33
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u8 and val_s8 have same width 8\22, \22line\22: 28, \22column\22: 12, \22condition\22: \22width x8 == width z8\22, \22scope\22: \22TestWidthInArithmetic\22}", %17 : i1
      %18 = arc.sim.get_port %arg0, "y16" : i16, !arc.sim.instance<@TestWidthInArithmetic_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22y16\22}", %18 : i16
      %19 = arc.sim.get_port %arg0, "x8" : i8, !arc.sim.instance<@TestWidthInArithmetic_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22x8\22}", %19 : i8
      %false_5 = hw.constant false
      %20 = comb.concat %false_5, %c16_i32 : i1, i32
      %21 = comb.icmp ne %16, %20 : i33
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u8 and u16 have different widths\22, \22line\22: 29, \22column\22: 12, \22condition\22: \22width x8 !== width y16\22, \22scope\22: \22TestWidthInArithmetic\22}", %21 : i1
      %22 = arc.sim.get_port %arg0, "y16" : i16, !arc.sim.instance<@TestWidthInArithmetic_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22y16\22}", %22 : i16
      %23 = arc.sim.get_port %arg0, "x8" : i8, !arc.sim.instance<@TestWidthInArithmetic_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22x8\22}", %23 : i8
      %24 = comb.icmp sgt %20, %16 : i33
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u16 width > u8 width\22, \22line\22: 30, \22column\22: 12, \22condition\22: \22width y16 > width x8\22, \22scope\22: \22TestWidthInArithmetic\22}", %24 : i1
      %25 = arc.sim.get_port %arg0, "x8" : i8, !arc.sim.instance<@TestWidthInArithmetic_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22x8\22}", %25 : i8
      %c0_i29 = hw.constant 0 : i29
      %26 = comb.concat %c0_i29, %c-8_i4 : i29, i4
      %27 = comb.icmp sle %16, %26 : i33
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u8 width <== 8\22, \22line\22: 31, \22column\22: 12, \22condition\22: \22width x8 <== 8\22, \22scope\22: \22TestWidthInArithmetic\22}", %27 : i1
      %28 = arc.sim.get_port %arg0, "y16" : i16, !arc.sim.instance<@TestWidthInArithmetic_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22y16\22}", %28 : i16
      %29 = arc.sim.get_port %arg0, "x8" : i8, !arc.sim.instance<@TestWidthInArithmetic_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22x8\22}", %29 : i8
      %false_6 = hw.constant false
      %30 = comb.concat %false_6, %c8_i32 : i1, i32
      %false_7 = hw.constant false
      %31 = comb.concat %false_7, %c16_i32 : i1, i32
      %false_8 = hw.constant false
      %32 = comb.concat %false_8, %30 : i1, i33
      %false_9 = hw.constant false
      %33 = comb.concat %false_9, %31 : i1, i33
      %34 = comb.add %32, %33 : i34
      %35 = comb.extract %34 from 0 : (i34) -> i33
      %c0_i2 = hw.constant 0 : i2
      %36 = comb.concat %c0_i2, %c24_i32 : i2, i32
      %false_10 = hw.constant false
      %37 = comb.concat %false_10, %35 : i1, i33
      %38 = comb.icmp eq %36, %37 : i34
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22width(concat) identity\22, \22line\22: 35, \22column\22: 12, \22condition\22: \22width concat x8 y16 == width x8 + width y16\22, \22scope\22: \22TestWidthInArithmetic\22}", %38 : i1
      %39 = arc.sim.get_port %arg0, "y16" : i16, !arc.sim.instance<@TestWidthInArithmetic_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22y16\22}", %39 : i16
      %40 = arc.sim.get_port %arg0, "x8" : i8, !arc.sim.instance<@TestWidthInArithmetic_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22x8\22}", %40 : i8
      %false_11 = hw.constant false
      %41 = comb.concat %false_11, %c17_i32 : i1, i32
      %c0_i28 = hw.constant 0 : i28
      %42 = comb.concat %c0_i28, %c-15_i5 : i28, i5
      %43 = comb.icmp eq %41, %42 : i33
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22width of u8 + u16 is 17\22, \22line\22: 40, \22column\22: 12, \22condition\22: \22width x8 + y16 == 17\22, \22scope\22: \22TestWidthInArithmetic\22}", %43 : i1
      %44 = arc.sim.get_port %arg0, "x8" : i8, !arc.sim.instance<@TestWidthInArithmetic_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22x8\22}", %44 : i8
      %c0_i28_12 = hw.constant 0 : i28
      %45 = comb.concat %c0_i28_12, %c-16_i5 : i28, i5
      %46 = comb.icmp eq %20, %45 : i33
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22width of u8 * u8 is 16\22, \22line\22: 43, \22column\22: 12, \22condition\22: \22width x8 * x8 == 16\22, \22scope\22: \22TestWidthInArithmetic\22}", %46 : i1
      %47 = arc.sim.get_port %arg0, "val_u9" : i9, !arc.sim.instance<@TestWidthInArithmetic_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22val_u9\22}", %47 : i9
      %48 = arc.sim.get_port %arg0, "val_u7" : i7, !arc.sim.instance<@TestWidthInArithmetic_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22val_u7\22}", %48 : i7
      %false_13 = hw.constant false
      %49 = comb.concat %false_13, %c7_i32 : i1, i32
      %false_14 = hw.constant false
      %50 = comb.concat %false_14, %c9_i32 : i1, i32
      %false_15 = hw.constant false
      %51 = comb.concat %false_15, %49 : i1, i33
      %false_16 = hw.constant false
      %52 = comb.concat %false_16, %50 : i1, i33
      %53 = comb.add %51, %52 : i34
      %54 = comb.extract %53 from 0 : (i34) -> i33
      %false_17 = hw.constant false
      %55 = comb.concat %false_17, %54 : i1, i33
      %c0_i29_18 = hw.constant 0 : i29
      %56 = comb.concat %c0_i29_18, %c-16_i5 : i29, i5
      %57 = comb.icmp eq %55, %56 : i34
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u7 + u9 widths sum to 16\22, \22line\22: 48, \22column\22: 12, \22condition\22: \22width val_u7 + width val_u9 == 16\22, \22scope\22: \22TestWidthInArithmetic\22}", %57 : i1
      %58 = arc.sim.get_port %arg0, "val_u9" : i9, !arc.sim.instance<@TestWidthInArithmetic_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22val_u9\22}", %58 : i9
      %59 = arc.sim.get_port %arg0, "val_u7" : i7, !arc.sim.instance<@TestWidthInArithmetic_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22val_u7\22}", %59 : i7
      %false_19 = hw.constant false
      %60 = comb.concat %false_19, %c7_i32 : i1, i32
      %false_20 = hw.constant false
      %61 = comb.concat %false_20, %c9_i32 : i1, i32
      %62 = comb.icmp slt %60, %61 : i33
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \227 < 9\22, \22line\22: 49, \22column\22: 12, \22condition\22: \22width val_u7 < width val_u9\22, \22scope\22: \22TestWidthInArithmetic\22}", %62 : i1
      %63 = arc.sim.get_port %arg0, "dynamic_w" : i8, !arc.sim.instance<@TestWidthInArithmetic_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22dynamic_w\22}", %63 : i8
      %false_21 = hw.constant false
      %64 = comb.concat %false_21, %63 : i1, i8
      %65 = comb.icmp eq %64, %12 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Ternary selection of width\22, \22line\22: 54, \22column\22: 12, \22condition\22: \22dynamic_w == 8\22, \22scope\22: \22TestWidthInArithmetic\22}", %65 : i1
    }
    return
  }
}