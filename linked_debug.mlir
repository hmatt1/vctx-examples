module {



  hw.module @TestHexLiteralsAllSizes_Harness(in %clk : !seq.clock, in %rst : i1, in %h16_max_poke_val : i16, in %h16_max_poke_en : i1, in %h16_pat_poke_val : i16, in %h16_pat_poke_en : i1, in %h32_max_poke_val : i32, in %h32_max_poke_en : i1, in %h32_pat_poke_val : i32, in %h32_pat_poke_en : i1, in %h64_max_poke_val : i64, in %h64_max_poke_en : i1, in %h64_pat_poke_val : i64, in %h64_pat_poke_en : i1, in %h8_max_poke_val : i8, in %h8_max_poke_en : i1, in %h8_mid_poke_val : i8, in %h8_mid_poke_en : i1, in %h8_min_poke_val : i8, in %h8_min_poke_en : i1, in %inf_16_poke_val : i16, in %inf_16_poke_en : i1, in %inf_33_poke_val : i33, in %inf_33_poke_en : i1, in %inf_8_poke_val : i8, in %inf_8_poke_en : i1, in %padded_poke_val : i8, in %padded_poke_en : i1, out h16_max : i16, out h16_pat : i16, out h32_max : i32, out h32_pat : i32, out h64_max : i64, out h64_pat : i64, out h8_max : i8, out h8_mid : i8, out h8_min : i8, out inf_16 : i16, out inf_33 : i33, out inf_8 : i8, out padded : i8) {
    %c-4294967296_i33 = hw.constant -4294967296 : i33
    %c0_i8 = hw.constant 0 : i8
    %c127_i8 = hw.constant 127 : i8
    %c-1_i8 = hw.constant -1 : i8
    %c81985529216486895_i64 = hw.constant 81985529216486895 : i64
    %c-1_i64 = hw.constant -1 : i64
    %c-559038737_i32 = hw.constant -559038737 : i32
    %c-1_i32 = hw.constant -1 : i32
    %c-13570_i16 = hw.constant -13570 : i16
    %c-1_i16 = hw.constant -1 : i16
    %0 = comb.mux %h16_max_poke_en, %h16_max_poke_val, %c-1_i16 {sv.namehint = "h16_max_wire"} : i16
    %1 = comb.mux %h16_pat_poke_en, %h16_pat_poke_val, %c-13570_i16 {sv.namehint = "h16_pat_wire"} : i16
    %2 = comb.mux %h32_max_poke_en, %h32_max_poke_val, %c-1_i32 {sv.namehint = "h32_max_wire"} : i32
    %3 = comb.mux %h32_pat_poke_en, %h32_pat_poke_val, %c-559038737_i32 {sv.namehint = "h32_pat_wire"} : i32
    %4 = comb.mux %h64_max_poke_en, %h64_max_poke_val, %c-1_i64 {sv.namehint = "h64_max_wire"} : i64
    %5 = comb.mux %h64_pat_poke_en, %h64_pat_poke_val, %c81985529216486895_i64 {sv.namehint = "h64_pat_wire"} : i64
    %6 = comb.mux %h8_max_poke_en, %h8_max_poke_val, %c-1_i8 {sv.namehint = "h8_max_wire"} : i8
    %7 = comb.mux %h8_mid_poke_en, %h8_mid_poke_val, %c127_i8 {sv.namehint = "h8_mid_wire"} : i8
    %8 = comb.mux %h8_min_poke_en, %h8_min_poke_val, %c0_i8 {sv.namehint = "h8_min_wire"} : i8
    %9 = comb.mux %inf_16_poke_en, %inf_16_poke_val, %c-1_i16 {sv.namehint = "inf_16_wire"} : i16
    %10 = comb.mux %inf_33_poke_en, %inf_33_poke_val, %c-4294967296_i33 {sv.namehint = "inf_33_wire"} : i33
    %11 = comb.mux %inf_8_poke_en, %inf_8_poke_val, %c-1_i8 {sv.namehint = "inf_8_wire"} : i8
    %12 = comb.mux %padded_poke_en, %padded_poke_val, %c-1_i8 {sv.namehint = "padded_wire"} : i8
    hw.output %0, %1, %2, %3, %4, %5, %6, %7, %8, %9, %10, %11, %12 : i16, i16, i32, i32, i64, i64, i8, i8, i8, i16, i33, i8, i8
  }
  func.func @entry() {
    %c-529_i12 = hw.constant -529 : i12
    %c-1348_i12 = hw.constant -1348 : i12
    %c-31_i6 = hw.constant -31 : i6
    %c33_i32 = hw.constant 33 : i32
    %c-16_i5 = hw.constant -16 : i5
    %c16_i32 = hw.constant 16 : i32
    %c-8_i4 = hw.constant -8 : i4
    %c8_i32 = hw.constant 8 : i32
    %c-16419087305933_i45 = hw.constant -16419087305933 : i45
    %c-1985229329_i32 = hw.constant -1985229329 : i32
    %c-14465689_i25 = hw.constant -14465689 : i25
    %c-32_i6 = hw.constant -32 : i6
    %c-1_i7 = hw.constant -1 : i7
    %c-4294967296_i33 = hw.constant -4294967296 : i33
    %c81985529216486895_i64 = hw.constant 81985529216486895 : i64
    %c-1_i64 = hw.constant -1 : i64
    %c-559038737_i32 = hw.constant -559038737 : i32
    %c-1_i32 = hw.constant -1 : i32
    %c-13570_i16 = hw.constant -13570 : i16
    %c-1_i16 = hw.constant -1 : i16
    %c127_i8 = hw.constant 127 : i8
    %c0_i8 = hw.constant 0 : i8
    %c-1_i8 = hw.constant -1 : i8
    %true = hw.constant true
    %false = hw.constant false
    %0 = seq.const_clock high
    %1 = seq.const_clock low
    arc.sim.instantiate @TestHexLiteralsAllSizes_Harness as %arg0 {
      arc.sim.set_input %arg0, "h16_max_poke_en" = %false : i1, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.set_input %arg0, "h16_pat_poke_en" = %false : i1, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.set_input %arg0, "h32_max_poke_en" = %false : i1, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.set_input %arg0, "h32_pat_poke_en" = %false : i1, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.set_input %arg0, "h64_max_poke_en" = %false : i1, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.set_input %arg0, "h64_pat_poke_en" = %false : i1, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.set_input %arg0, "h8_max_poke_en" = %false : i1, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.set_input %arg0, "h8_mid_poke_en" = %false : i1, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.set_input %arg0, "h8_min_poke_en" = %false : i1, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.set_input %arg0, "inf_16_poke_en" = %false : i1, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.set_input %arg0, "inf_33_poke_en" = %false : i1, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.set_input %arg0, "inf_8_poke_en" = %false : i1, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.set_input %arg0, "padded_poke_en" = %false : i1, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.set_input %arg0, "h8_max_poke_val" = %c-1_i8 : i8, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.set_input %arg0, "h8_max_poke_en" = %true : i1, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.set_input %arg0, "h8_min_poke_val" = %c0_i8 : i8, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.set_input %arg0, "h8_min_poke_en" = %true : i1, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.set_input %arg0, "h8_mid_poke_val" = %c127_i8 : i8, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.set_input %arg0, "h8_mid_poke_en" = %true : i1, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.set_input %arg0, "h16_max_poke_val" = %c-1_i16 : i16, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.set_input %arg0, "h16_max_poke_en" = %true : i1, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.set_input %arg0, "h16_pat_poke_val" = %c-13570_i16 : i16, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.set_input %arg0, "h16_pat_poke_en" = %true : i1, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.set_input %arg0, "h32_max_poke_val" = %c-1_i32 : i32, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.set_input %arg0, "h32_max_poke_en" = %true : i1, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.set_input %arg0, "h32_pat_poke_val" = %c-559038737_i32 : i32, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.set_input %arg0, "h32_pat_poke_en" = %true : i1, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.set_input %arg0, "h64_max_poke_val" = %c-1_i64 : i64, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.set_input %arg0, "h64_max_poke_en" = %true : i1, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.set_input %arg0, "h64_pat_poke_val" = %c81985529216486895_i64 : i64, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.set_input %arg0, "h64_pat_poke_en" = %true : i1, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.set_input %arg0, "inf_8_poke_val" = %c-1_i8 : i8, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.set_input %arg0, "inf_8_poke_en" = %true : i1, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.set_input %arg0, "inf_16_poke_val" = %c-1_i16 : i16, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.set_input %arg0, "inf_16_poke_en" = %true : i1, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.set_input %arg0, "inf_33_poke_val" = %c-4294967296_i33 : i33, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.set_input %arg0, "inf_33_poke_en" = %true : i1, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.set_input %arg0, "padded_poke_val" = %c-1_i8 : i8, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.set_input %arg0, "padded_poke_en" = %true : i1, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.set_input %arg0, "rst" = %false : i1, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      %2 = arc.sim.get_port %arg0, "h8_max" : i8, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22h8_max\22}", %2 : i8
      %false_0 = hw.constant false
      %3 = comb.concat %false_0, %2 : i1, i8
      %false_1 = hw.constant false
      %4 = comb.concat %false_1, %c-1_i8 : i1, i8
      %5 = comb.icmp eq %3, %4 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \220xFF is 255\22, \22line\22: 12, \22column\22: 12, \22condition\22: \22h8_max == 255\22, \22scope\22: \22TestHexLiteralsAllSizes\22}", %5 : i1
      %6 = arc.sim.get_port %arg0, "h8_min" : i8, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22h8_min\22}", %6 : i8
      %false_2 = hw.constant false
      %7 = comb.concat %false_2, %6 : i1, i8
      %c0_i8_3 = hw.constant 0 : i8
      %8 = comb.concat %c0_i8_3, %false : i8, i1
      %9 = comb.icmp eq %7, %8 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \220x00 is 0\22, \22line\22: 13, \22column\22: 12, \22condition\22: \22h8_min == 0\22, \22scope\22: \22TestHexLiteralsAllSizes\22}", %9 : i1
      %10 = arc.sim.get_port %arg0, "h8_mid" : i8, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22h8_mid\22}", %10 : i8
      %false_4 = hw.constant false
      %11 = comb.concat %false_4, %10 : i1, i8
      %c0_i2 = hw.constant 0 : i2
      %12 = comb.concat %c0_i2, %c-1_i7 : i2, i7
      %13 = comb.icmp eq %11, %12 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \220x7F is 127\22, \22line\22: 14, \22column\22: 12, \22condition\22: \22h8_mid == 127\22, \22scope\22: \22TestHexLiteralsAllSizes\22}", %13 : i1
      %14 = arc.sim.get_port %arg0, "h16_max" : i16, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22h16_max\22}", %14 : i16
      %false_5 = hw.constant false
      %15 = comb.concat %false_5, %14 : i1, i16
      %false_6 = hw.constant false
      %16 = comb.concat %false_6, %c-1_i16 : i1, i16
      %17 = comb.icmp eq %15, %16 : i17
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \220xFFFF is 65535\22, \22line\22: 20, \22column\22: 12, \22condition\22: \22h16_max == 65535\22, \22scope\22: \22TestHexLiteralsAllSizes\22}", %17 : i1
      %18 = arc.sim.get_port %arg0, "h16_pat" : i16, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22h16_pat\22}", %18 : i16
      %false_7 = hw.constant false
      %19 = comb.concat %false_7, %18 : i1, i16
      %false_8 = hw.constant false
      %20 = comb.concat %false_8, %c-13570_i16 : i1, i16
      %21 = comb.icmp eq %19, %20 : i17
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \220xCAFE translates correctly\22, \22line\22: 21, \22column\22: 12, \22condition\22: \22h16_pat == 51966\22, \22scope\22: \22TestHexLiteralsAllSizes\22}", %21 : i1
      %22 = arc.sim.get_port %arg0, "h32_max" : i32, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22h32_max\22}", %22 : i32
      %false_9 = hw.constant false
      %23 = comb.concat %false_9, %22 : i1, i32
      %false_10 = hw.constant false
      %24 = comb.concat %false_10, %c-1_i32 : i1, i32
      %25 = comb.icmp eq %23, %24 : i33
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \220xFFFF_FFFF is 2^32 - 1\22, \22line\22: 27, \22column\22: 12, \22condition\22: \22h32_max == 4294967295\22, \22scope\22: \22TestHexLiteralsAllSizes\22}", %25 : i1
      %26 = arc.sim.get_port %arg0, "h32_pat" : i32, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22h32_pat\22}", %26 : i32
      %false_11 = hw.constant false
      %27 = comb.concat %false_11, %26 : i1, i32
      %false_12 = hw.constant false
      %28 = comb.concat %false_12, %c-559038737_i32 : i1, i32
      %29 = comb.icmp eq %27, %28 : i33
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \220xDEADBEEF translates correctly\22, \22line\22: 28, \22column\22: 12, \22condition\22: \22h32_pat == 3735928559\22, \22scope\22: \22TestHexLiteralsAllSizes\22}", %29 : i1
      %30 = arc.sim.get_port %arg0, "h64_max" : i64, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22h64_max\22}", %30 : i64
      %c0_i63 = hw.constant 0 : i63
      %31 = comb.concat %c0_i63, %false : i63, i1
      %false_13 = hw.constant false
      %32 = comb.concat %false_13, %31 : i1, i64
      %c0_i64 = hw.constant 0 : i64
      %33 = comb.concat %c0_i64, %true : i64, i1
      %34 = comb.extract %32 from 64 : (i65) -> i1
      %35 = comb.concat %34, %32 : i1, i65
      %36 = comb.extract %33 from 64 : (i65) -> i1
      %37 = comb.concat %36, %33 : i1, i65
      %38 = comb.sub %35, %37 : i66
      %39 = comb.extract %38 from 0 : (i66) -> i65
      %40 = comb.extract %39 from 0 : (i65) -> i64
      %false_14 = hw.constant false
      %41 = comb.concat %false_14, %30 : i1, i64
      %false_15 = hw.constant false
      %42 = comb.concat %false_15, %40 : i1, i64
      %43 = comb.icmp eq %41, %42 : i65
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \220xFFFF_FFFF_FFFF_FFFF is u64 max (0-1)\22, \22line\22: 36, \22column\22: 12, \22condition\22: \22h64_max == 0 as u64 - 1 as u64\22, \22scope\22: \22TestHexLiteralsAllSizes\22}", %43 : i1
      %44 = arc.sim.get_port %arg0, "h64_pat" : i64, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22h64_pat\22}", %44 : i64
      %c0_i58 = hw.constant 0 : i58
      %45 = comb.concat %c0_i58, %c-32_i6 : i58, i6
      %46 = comb.shru %44, %45 : i64
      %false_16 = hw.constant false
      %47 = comb.concat %false_16, %46 : i1, i64
      %c0_i40 = hw.constant 0 : i40
      %48 = comb.concat %c0_i40, %c-14465689_i25 : i40, i25
      %49 = comb.icmp eq %47, %48 : i65
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Upper 32 bits of 0x0123456789ABCDEF\22, \22line\22: 39, \22column\22: 12, \22condition\22: \22h64_pat >> 32 == 0x01234567\22, \22scope\22: \22TestHexLiteralsAllSizes\22}", %49 : i1
      %50 = arc.sim.get_port %arg0, "h64_pat" : i64, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22h64_pat\22}", %50 : i64
      %c0_i32 = hw.constant 0 : i32
      %51 = comb.concat %c0_i32, %c-1_i32 : i32, i32
      %52 = comb.and %50, %51 : i64
      %false_17 = hw.constant false
      %53 = comb.concat %false_17, %52 : i1, i64
      %c0_i33 = hw.constant 0 : i33
      %54 = comb.concat %c0_i33, %c-1985229329_i32 : i33, i32
      %55 = comb.icmp eq %53, %54 : i65
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Lower 32 bits of 0x0123456789ABCDEF\22, \22line\22: 40, \22column\22: 12, \22condition\22: \22h64_pat & 0xFFFFFFFF == 0x89ABCDEF\22, \22scope\22: \22TestHexLiteralsAllSizes\22}", %55 : i1
      %56 = comb.icmp eq %4, %4 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Underscore in 8-bit\22, \22line\22: 44, \22column\22: 12, \22condition\22: \220xF_F == 0xFF\22, \22scope\22: \22TestHexLiteralsAllSizes\22}", %56 : i1
      %57 = comb.icmp eq %16, %16 : i17
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Underscore in 16-bit\22, \22line\22: 45, \22column\22: 12, \22condition\22: \220xFF_FF == 0xFFFF\22, \22scope\22: \22TestHexLiteralsAllSizes\22}", %57 : i1
      %58 = comb.icmp eq %28, %28 : i33
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Underscore in 32-bit\22, \22line\22: 46, \22column\22: 12, \22condition\22: \220xDEAD_BEEF == 0xDEADBEEF\22, \22scope\22: \22TestHexLiteralsAllSizes\22}", %58 : i1
      %false_18 = hw.constant false
      %59 = comb.concat %false_18, %c-16419087305933_i45 : i1, i45
      %60 = comb.icmp eq %59, %59 : i46
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Underscores in 64-bit\22, \22line\22: 47, \22column\22: 12, \22condition\22: \220x0000_1111_2222_3333 == 0x0000111122223333\22, \22scope\22: \22TestHexLiteralsAllSizes\22}", %60 : i1
      %61 = arc.sim.get_port %arg0, "inf_8" : i8, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22inf_8\22}", %61 : i8
      %false_19 = hw.constant false
      %62 = comb.concat %false_19, %c8_i32 : i1, i32
      %c0_i29 = hw.constant 0 : i29
      %63 = comb.concat %c0_i29, %c-8_i4 : i29, i4
      %64 = comb.icmp eq %62, %63 : i33
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \220xFF infers as 8-bit\22, \22line\22: 52, \22column\22: 12, \22condition\22: \22width inf_8 == 8\22, \22scope\22: \22TestHexLiteralsAllSizes\22}", %64 : i1
      %65 = arc.sim.get_port %arg0, "inf_16" : i16, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22inf_16\22}", %65 : i16
      %false_20 = hw.constant false
      %66 = comb.concat %false_20, %c16_i32 : i1, i32
      %c0_i28 = hw.constant 0 : i28
      %67 = comb.concat %c0_i28, %c-16_i5 : i28, i5
      %68 = comb.icmp eq %66, %67 : i33
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \220xFFFF infers as 16-bit\22, \22line\22: 55, \22column\22: 12, \22condition\22: \22width inf_16 == 16\22, \22scope\22: \22TestHexLiteralsAllSizes\22}", %68 : i1
      %69 = arc.sim.get_port %arg0, "inf_33" : i33, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22inf_33\22}", %69 : i33
      %false_21 = hw.constant false
      %70 = comb.concat %false_21, %c33_i32 : i1, i32
      %c0_i27 = hw.constant 0 : i27
      %71 = comb.concat %c0_i27, %c-31_i6 : i27, i6
      %72 = comb.icmp eq %70, %71 : i33
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \220x1_0000_0000 infers as 33-bit\22, \22line\22: 58, \22column\22: 12, \22condition\22: \22width inf_33 == 33\22, \22scope\22: \22TestHexLiteralsAllSizes\22}", %72 : i1
      %false_22 = hw.constant false
      %73 = comb.concat %false_22, %c-1348_i12 : i1, i12
      %74 = comb.icmp eq %73, %73 : i13
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Lowercase hex matches uppercase\22, \22line\22: 62, \22column\22: 12, \22condition\22: \220xabc == 0xABC\22, \22scope\22: \22TestHexLiteralsAllSizes\22}", %74 : i1
      %false_23 = hw.constant false
      %75 = comb.concat %false_23, %c-529_i12 : i1, i12
      %76 = comb.icmp eq %75, %75 : i13
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Mixed case hex matches uppercase\22, \22line\22: 63, \22column\22: 12, \22condition\22: \220xDeF == 0xDEF\22, \22scope\22: \22TestHexLiteralsAllSizes\22}", %76 : i1
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Leading zeros ignored for value\22, \22line\22: 68, \22column\22: 12, \22condition\22: \220x00FF == 0xFF\22, \22scope\22: \22TestHexLiteralsAllSizes\22}", %56 : i1
      %77 = arc.sim.get_port %arg0, "padded" : i8, !arc.sim.instance<@TestHexLiteralsAllSizes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22padded\22}", %77 : i8
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Zero-padded 0x00FF infers as 8-bit based on magnitude, not string length\22, \22line\22: 73, \22column\22: 12, \22condition\22: \22width padded == 8\22, \22scope\22: \22TestHexLiteralsAllSizes\22}", %64 : i1
    }
    return
  }
}