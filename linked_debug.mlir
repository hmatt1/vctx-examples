module {



  hw.module @TestSignedBitwiseComprehensive_Harness(in %clk : !seq.clock, in %rst : i1, in %not_sig : i8, in %not_uns : i8, in %res_lit1 : i8, in %res_lit2 : i8, in %res_mixed_w : i16, in %res_mixed_w2 : i16, in %res_s4_s8 : i8, in %res_s_s : i8, in %res_s_u : i8, in %res_u4_u16 : i16, in %res_u_s : i8, in %res_u_u : i8, in %s16_val : i16, in %s4_val : i4, in %s8_val : i8, in %sig1 : i8, in %sig2 : i8, in %u16_val2 : i16, in %u4_val : i4, in %u4_val2 : i4, in %uns1 : i8, in %uns2 : i8, in %variadic1 : i8, in %variadic2 : i8, in %wide_m : i16, in %wide_s : i16, out not_sig : i8, out not_uns : i8, out res_lit1 : i8, out res_lit2 : i8, out res_mixed_w : i16, out res_mixed_w2 : i16, out res_s4_s8 : i8, out res_s_s : i8, out res_s_u : i8, out res_u4_u16 : i16, out res_u_s : i8, out res_u_u : i8, out s16_val : i16, out s4_val : i4, out s8_val : i8, out sig1 : i8, out sig2 : i8, out u16_val2 : i16, out u4_val : i4, out u4_val2 : i4, out uns1 : i8, out uns2 : i8, out variadic1 : i8, out variadic2 : i8, out wide_m : i16, out wide_s : i16) {
    hw.output %not_sig, %not_uns, %res_lit1, %res_lit2, %res_mixed_w, %res_mixed_w2, %res_s4_s8, %res_s_s, %res_s_u, %res_u4_u16, %res_u_s, %res_u_u, %s16_val, %s4_val, %s8_val, %sig1, %sig2, %u16_val2, %u4_val, %u4_val2, %uns1, %uns2, %variadic1, %variadic2, %wide_m, %wide_s : i8, i8, i8, i8, i16, i16, i8, i8, i8, i16, i8, i8, i16, i4, i8, i8, i8, i16, i4, i4, i8, i8, i8, i8, i16, i16
  }
  func.func @entry() {
    %c0_i4 = hw.constant 0 : i4
    %c-4086_i13 = hw.constant -4086 : i13
    %c-16_i16 = hw.constant -16 : i16
    %c-3340_i13 = hw.constant -3340 : i13
    %c-4_i3 = hw.constant -4 : i3
    %c-1_i8 = hw.constant -1 : i8
    %c4096_i16 = hw.constant 4096 : i16
    %c-6_i4 = hw.constant -6 : i4
    %c-1_i8_0 = hw.constant -1 : i8
    %c-1_i8_1 = hw.constant -1 : i8
    %c4660_i16 = hw.constant 4660 : i16
    %c-1_i4 = hw.constant -1 : i4
    %c-16_i8 = hw.constant -16 : i8
    %c15_i8 = hw.constant 15 : i8
    %c0_i6 = hw.constant 0 : i6
    %c-16_i5 = hw.constant -16 : i5
    %c0_i2 = hw.constant 0 : i2
    %true = hw.constant true
    %false = hw.constant false
    %0 = seq.const_clock high
    %1 = seq.const_clock low
    arc.sim.instantiate @TestSignedBitwiseComprehensive_Harness as %arg0 {
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      %false_2 = hw.constant false
      %2 = comb.concat %false_2, %true : i1, i1
      %false_3 = hw.constant false
      %3 = comb.concat %false_3, %c0_i2 : i1, i2
      %4 = comb.extract %2 from 1 : (i2) -> i1
      %5 = comb.concat %4, %2 : i1, i2
      %6 = comb.sub %3, %5 : i3
      %7 = comb.extract %6 from 0 : (i3) -> i2
      %8 = comb.extract %7 from 1 : (i2) -> i1
      %9 = comb.replicate %8 : (i1) -> i6
      %10 = comb.concat %9, %7 : i6, i2
      arc.sim.set_input %arg0, "sig1" = %10 : i8, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      %false_4 = hw.constant false
      %11 = comb.concat %false_4, %c-16_i5 : i1, i5
      %false_5 = hw.constant false
      %12 = comb.concat %false_5, %c0_i6 : i1, i6
      %13 = comb.extract %11 from 5 : (i6) -> i1
      %14 = comb.concat %13, %11 : i1, i6
      %15 = comb.sub %12, %14 : i7
      %16 = comb.extract %15 from 0 : (i7) -> i6
      %17 = comb.extract %16 from 5 : (i6) -> i1
      %18 = comb.replicate %17 : (i1) -> i2
      %19 = comb.concat %18, %16 : i2, i6
      arc.sim.set_input %arg0, "sig2" = %19 : i8, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      arc.sim.set_input %arg0, "uns1" = %c15_i8 : i8, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      arc.sim.set_input %arg0, "uns2" = %c-16_i8 : i8, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      %20 = comb.and %10, %19 : i8
      arc.sim.set_input %arg0, "res_s_s" = %20 : i8, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      arc.sim.set_input %arg0, "res_u_u" = %c-1_i8 : i8, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      %21 = comb.xor %10, %c15_i8 : i8
      arc.sim.set_input %arg0, "res_u_s" = %21 : i8, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      %22 = comb.extract %19 from 0 : (i8) -> i4
      %23 = comb.concat %c0_i4, %22 : i4, i4
      arc.sim.set_input %arg0, "res_s_u" = %23 : i8, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      arc.sim.set_input %arg0, "u4_val" = %c-1_i4 : i4, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      %c-3532_i13 = hw.constant -3532 : i13
      %c0_i3 = hw.constant 0 : i3
      %24 = comb.concat %c0_i3, %c-3532_i13 : i3, i13
      arc.sim.set_input %arg0, "s16_val" = %24 : i16, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      %c0_i12 = hw.constant 0 : i12
      %25 = comb.concat %c0_i12, %c-1_i4 : i12, i4
      %26 = comb.and %25, %24 : i16
      arc.sim.set_input %arg0, "res_mixed_w" = %26 : i16, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      %c0_i8 = hw.constant 0 : i8
      %27 = comb.concat %c0_i8, %c-16_i8 : i8, i8
      %28 = comb.or %24, %27 : i16
      arc.sim.set_input %arg0, "res_mixed_w2" = %28 : i16, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      %true_6 = hw.constant true
      %29 = comb.concat %true_6, %c-1_i8_1 : i1, i8
      %30 = comb.extract %19 from 7 : (i8) -> i1
      %31 = comb.concat %30, %19 : i1, i8
      %32 = comb.sub %29, %31 : i9
      %33 = comb.extract %32 from 0 : (i9) -> i8
      arc.sim.set_input %arg0, "not_sig" = %33 : i8, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      %false_7 = hw.constant false
      %34 = comb.concat %false_7, %c-1_i8_0 : i1, i8
      %false_8 = hw.constant false
      %35 = comb.concat %false_8, %c15_i8 : i1, i8
      %36 = comb.sub %34, %35 : i9
      %37 = comb.extract %36 from 0 : (i9) -> i8
      arc.sim.set_input %arg0, "not_uns" = %37 : i8, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      %c0_i4_9 = hw.constant 0 : i4
      %38 = comb.concat %c0_i4_9, %c-1_i4 : i4, i4
      %39 = comb.and %10, %38 : i8
      arc.sim.set_input %arg0, "res_lit1" = %39 : i8, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      %40 = comb.extract %7 from 1 : (i2) -> i1
      %41 = comb.replicate %40 : (i1) -> i6
      %42 = comb.concat %41, %7 : i6, i2
      %43 = comb.or %42, %c15_i8 : i8
      arc.sim.set_input %arg0, "res_lit2" = %43 : i8, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      %c0_i8_10 = hw.constant 0 : i8
      %44 = comb.concat %c0_i8_10, %21 : i8, i8
      arc.sim.set_input %arg0, "wide_m" = %44 : i16, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      %45 = comb.extract %20 from 7 : (i8) -> i1
      %46 = comb.replicate %45 : (i1) -> i8
      %47 = comb.concat %46, %20 : i8, i8
      arc.sim.set_input %arg0, "wide_s" = %47 : i16, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      %48 = comb.extract %20 from 0 : (i8) -> i4
      %49 = comb.concat %c0_i4, %48 : i4, i4
      arc.sim.set_input %arg0, "variadic1" = %49 : i8, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      %50 = comb.or %10, %19, %c15_i8 : i8
      arc.sim.set_input %arg0, "variadic2" = %50 : i8, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      %51 = comb.extract %7 from 1 : (i2) -> i1
      %52 = comb.replicate %51 : (i1) -> i2
      %53 = comb.concat %52, %7 : i2, i2
      arc.sim.set_input %arg0, "s4_val" = %53 : i4, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      %c-1_i4_11 = hw.constant -1 : i4
      %c0_i4_12 = hw.constant 0 : i4
      %54 = comb.concat %c0_i4_12, %c-1_i4_11 : i4, i4
      arc.sim.set_input %arg0, "s8_val" = %54 : i8, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      %55 = comb.extract %53 from 3 : (i4) -> i1
      %56 = comb.replicate %55 : (i1) -> i4
      %57 = comb.concat %56, %53 : i4, i4
      %58 = comb.and %57, %54 : i8
      arc.sim.set_input %arg0, "res_s4_s8" = %58 : i8, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      arc.sim.set_input %arg0, "u4_val2" = %c-6_i4 : i4, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      arc.sim.set_input %arg0, "u16_val2" = %c4096_i16 : i16, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      %c0_i12_13 = hw.constant 0 : i12
      %59 = comb.concat %c0_i12_13, %c-6_i4 : i12, i4
      %60 = comb.or %59, %c4096_i16 : i16
      arc.sim.set_input %arg0, "res_u4_u16" = %60 : i16, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      arc.sim.set_input %arg0, "rst" = %false : i1, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      %61 = arc.sim.get_port %arg0, "res_s_s" : i8, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22res_s_s\22}", %61 : i8
      %62 = comb.icmp eq %61, %19 : i8
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22s8 & s8 results in s8\22, \22line\22: 33, \22column\22: 12, \22condition\22: \22res_s_s == - 16\22, \22scope\22: \22TestSignedBitwiseComprehensive\22}", %62 : i1
      %63 = arc.sim.get_port %arg0, "res_u_u" : i8, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22res_u_u\22}", %63 : i8
      %false_14 = hw.constant false
      %64 = comb.concat %false_14, %63 : i1, i8
      %false_15 = hw.constant false
      %65 = comb.concat %false_15, %c-1_i8 : i1, i8
      %66 = comb.icmp eq %64, %65 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u8 | u8 results in u8\22, \22line\22: 37, \22column\22: 12, \22condition\22: \22res_u_u == 0xFF\22, \22scope\22: \22TestSignedBitwiseComprehensive\22}", %66 : i1
      %67 = arc.sim.get_port %arg0, "res_u_s" : i8, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22res_u_s\22}", %67 : i8
      %false_16 = hw.constant false
      %68 = comb.concat %false_16, %67 : i1, i8
      %false_17 = hw.constant false
      %69 = comb.concat %false_17, %c-16_i8 : i1, i8
      %70 = comb.icmp eq %68, %69 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u8 ^ s8 results in u8\22, \22line\22: 41, \22column\22: 12, \22condition\22: \22res_u_s == 0xF0\22, \22scope\22: \22TestSignedBitwiseComprehensive\22}", %70 : i1
      %71 = arc.sim.get_port %arg0, "res_s_u" : i8, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22res_s_u\22}", %71 : i8
      %false_18 = hw.constant false
      %72 = comb.concat %false_18, %71 : i1, i8
      %c0_i8_19 = hw.constant 0 : i8
      %73 = comb.concat %c0_i8_19, %false : i8, i1
      %74 = comb.icmp eq %72, %73 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22s8 & u8 results in u8\22, \22line\22: 45, \22column\22: 12, \22condition\22: \22res_s_u == 0x00\22, \22scope\22: \22TestSignedBitwiseComprehensive\22}", %74 : i1
      %75 = arc.sim.get_port %arg0, "res_mixed_w" : i16, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22res_mixed_w\22}", %75 : i16
      %false_20 = hw.constant false
      %76 = comb.concat %false_20, %75 : i1, i16
      %c0_i14 = hw.constant 0 : i14
      %77 = comb.concat %c0_i14, %c-4_i3 : i14, i3
      %78 = comb.icmp eq %76, %77 : i17
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u4 & s16 results in u16 (width is max)\22, \22line\22: 55, \22column\22: 12, \22condition\22: \22res_mixed_w == 0x0004\22, \22scope\22: \22TestSignedBitwiseComprehensive\22}", %78 : i1
      %79 = arc.sim.get_port %arg0, "res_mixed_w2" : i16, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22res_mixed_w2\22}", %79 : i16
      %false_21 = hw.constant false
      %80 = comb.concat %false_21, %79 : i1, i16
      %c0_i4_22 = hw.constant 0 : i4
      %81 = comb.concat %c0_i4_22, %c-3340_i13 : i4, i13
      %82 = comb.icmp eq %80, %81 : i17
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22s16 | u8 results in u16\22, \22line\22: 59, \22column\22: 12, \22condition\22: \22res_mixed_w2 == 0x12F4\22, \22scope\22: \22TestSignedBitwiseComprehensive\22}", %82 : i1
      %83 = arc.sim.get_port %arg0, "not_sig" : i8, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22not_sig\22}", %83 : i8
      %c0_i4_23 = hw.constant 0 : i4
      %84 = comb.concat %c0_i4_23, %c-1_i4 : i4, i4
      %85 = comb.icmp eq %83, %84 : i8
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22~s8 results in s8\22, \22line\22: 65, \22column\22: 12, \22condition\22: \22not_sig == 15\22, \22scope\22: \22TestSignedBitwiseComprehensive\22}", %85 : i1
      %86 = arc.sim.get_port %arg0, "not_uns" : i8, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22not_uns\22}", %86 : i8
      %false_24 = hw.constant false
      %87 = comb.concat %false_24, %86 : i1, i8
      %88 = comb.icmp eq %87, %69 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22~u8 results in u8\22, \22line\22: 68, \22column\22: 12, \22condition\22: \22not_uns == 240\22, \22scope\22: \22TestSignedBitwiseComprehensive\22}", %88 : i1
      %89 = arc.sim.get_port %arg0, "res_lit1" : i8, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22res_lit1\22}", %89 : i8
      %false_25 = hw.constant false
      %90 = comb.concat %false_25, %89 : i1, i8
      %c0_i5 = hw.constant 0 : i5
      %91 = comb.concat %c0_i5, %c-1_i4 : i5, i4
      %92 = comb.icmp eq %90, %91 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22s8 & 0x0F (unsigned lit) -> u8\22, \22line\22: 76, \22column\22: 12, \22condition\22: \22res_lit1 == 0x0F\22, \22scope\22: \22TestSignedBitwiseComprehensive\22}", %92 : i1
      %93 = arc.sim.get_port %arg0, "res_lit2" : i8, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22res_lit2\22}", %93 : i8
      %false_26 = hw.constant false
      %94 = comb.concat %false_26, %93 : i1, i8
      %95 = comb.icmp eq %94, %65 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u8 | -1 (signed lit) -> u8\22, \22line\22: 80, \22column\22: 12, \22condition\22: \22res_lit2 == 0xFF\22, \22scope\22: \22TestSignedBitwiseComprehensive\22}", %95 : i1
      %96 = arc.sim.get_port %arg0, "wide_m" : i16, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22wide_m\22}", %96 : i16
      %c0_i8_27 = hw.constant 0 : i8
      %97 = comb.concat %c0_i8_27, %c-16_i8 : i8, i8
      %98 = comb.icmp eq %96, %97 : i16
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Mixed (u8 result) is zero-extended to s16\22, \22line\22: 88, \22column\22: 12, \22condition\22: \22wide_m == 240\22, \22scope\22: \22TestSignedBitwiseComprehensive\22}", %98 : i1
      %99 = arc.sim.get_port %arg0, "wide_s" : i16, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22wide_s\22}", %99 : i16
      %100 = comb.extract %16 from 5 : (i6) -> i1
      %101 = comb.replicate %100 : (i1) -> i10
      %102 = comb.concat %101, %16 : i10, i6
      %103 = comb.icmp eq %99, %102 : i16
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Pure signed (s8 result) is sign-extended to s16\22, \22line\22: 92, \22column\22: 12, \22condition\22: \22wide_s == - 16\22, \22scope\22: \22TestSignedBitwiseComprehensive\22}", %103 : i1
      %104 = arc.sim.get_port %arg0, "wide_s" : i16, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22wide_s\22}", %104 : i16
      %false_28 = hw.constant false
      %105 = comb.concat %false_28, %104 : i1, i16
      %false_29 = hw.constant false
      %106 = comb.concat %false_29, %c-16_i16 : i1, i16
      %107 = comb.icmp eq %105, %106 : i17
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Pure signed sign-extension bit check\22, \22line\22: 93, \22column\22: 12, \22condition\22: \22wide_s as u16 == 0xFFF0\22, \22scope\22: \22TestSignedBitwiseComprehensive\22}", %107 : i1
      %108 = arc.sim.get_port %arg0, "variadic1" : i8, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22variadic1\22}", %108 : i8
      %false_30 = hw.constant false
      %109 = comb.concat %false_30, %108 : i1, i8
      %110 = comb.icmp eq %109, %73 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22(s8 & s8) & u8 -> u8\22, \22line\22: 100, \22column\22: 12, \22condition\22: \22variadic1 == 0x00\22, \22scope\22: \22TestSignedBitwiseComprehensive\22}", %110 : i1
      %111 = arc.sim.get_port %arg0, "variadic2" : i8, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22variadic2\22}", %111 : i8
      %false_31 = hw.constant false
      %112 = comb.concat %false_31, %111 : i1, i8
      %113 = comb.icmp eq %112, %65 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22(u8 | s8) | s8 -> u8\22, \22line\22: 104, \22column\22: 12, \22condition\22: \22variadic2 == 0xFF\22, \22scope\22: \22TestSignedBitwiseComprehensive\22}", %113 : i1
      %114 = arc.sim.get_port %arg0, "res_s4_s8" : i8, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22res_s4_s8\22}", %114 : i8
      %115 = comb.icmp eq %114, %84 : i8
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22s4 & s8 results in s8\22, \22line\22: 112, \22column\22: 12, \22condition\22: \22res_s4_s8 == 15\22, \22scope\22: \22TestSignedBitwiseComprehensive\22}", %115 : i1
      %116 = arc.sim.get_port %arg0, "res_u4_u16" : i16, !arc.sim.instance<@TestSignedBitwiseComprehensive_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22res_u4_u16\22}", %116 : i16
      %false_32 = hw.constant false
      %117 = comb.concat %false_32, %116 : i1, i16
      %c0_i4_33 = hw.constant 0 : i4
      %118 = comb.concat %c0_i4_33, %c-4086_i13 : i4, i13
      %119 = comb.icmp eq %117, %118 : i17
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u4 | u16 results in u16\22, \22line\22: 120, \22column\22: 12, \22condition\22: \22res_u4_u16 == 0x100A\22, \22scope\22: \22TestSignedBitwiseComprehensive\22}", %119 : i1
    }
    return
  }
}