module {



  hw.module @TestZeroIdentities_Harness(in %clk : !seq.clock, in %rst : i1, in %b_val : i1, in %s64_min : i64, in %s8_neg : i8, in %s8_pos : i8, in %u1_val : i1, in %u64_val : i64, in %u8_mul : i9, in %u8_sum : i9, in %u8_val : i8, in %z_val : i8, out b_val : i1, out s64_min : i64, out s8_neg : i8, out s8_pos : i8, out u1_val : i1, out u64_val : i64, out u8_mul : i9, out u8_sum : i9, out u8_val : i8, out z_val : i8) {
    hw.output %b_val, %s64_min, %s8_neg, %s8_pos, %u1_val, %u64_val, %u8_mul, %u8_sum, %u8_val, %z_val : i1, i64, i8, i8, i1, i64, i9, i9, i8, i8
  }
  func.func @entry() {
    %c-7_i4 = hw.constant -7 : i4
    %c9_i32 = hw.constant 9 : i32
    %c-22_i6 = hw.constant -22 : i6
    %c123_i8 = hw.constant 123 : i8
    %c0_i64 = hw.constant 0 : i64
    %c-9223372036854775808_i64 = hw.constant -9223372036854775808 : i64
    %c0_i5 = hw.constant 0 : i5
    %c-6_i4 = hw.constant -6 : i4
    %c10_i8 = hw.constant 10 : i8
    %c-2401053089206453570_i64 = hw.constant -2401053089206453570 : i64
    %c42_i8 = hw.constant 42 : i8
    %true = hw.constant true
    %false = hw.constant false
    %0 = seq.const_clock high
    %1 = seq.const_clock low
    arc.sim.instantiate @TestZeroIdentities_Harness as %arg0 {
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@TestZeroIdentities_Harness>
      arc.sim.set_input %arg0, "u1_val" = %true : i1, !arc.sim.instance<@TestZeroIdentities_Harness>
      arc.sim.set_input %arg0, "u8_val" = %c42_i8 : i8, !arc.sim.instance<@TestZeroIdentities_Harness>
      arc.sim.set_input %arg0, "u64_val" = %c-2401053089206453570_i64 : i64, !arc.sim.instance<@TestZeroIdentities_Harness>
      %c-6_i4_0 = hw.constant -6 : i4
      %c0_i4 = hw.constant 0 : i4
      %2 = comb.concat %c0_i4, %c-6_i4_0 : i4, i4
      arc.sim.set_input %arg0, "s8_pos" = %2 : i8, !arc.sim.instance<@TestZeroIdentities_Harness>
      %false_1 = hw.constant false
      %3 = comb.concat %false_1, %c-6_i4 : i1, i4
      %false_2 = hw.constant false
      %4 = comb.concat %false_2, %c0_i5 : i1, i5
      %5 = comb.extract %3 from 4 : (i5) -> i1
      %6 = comb.concat %5, %3 : i1, i5
      %7 = comb.sub %4, %6 : i6
      %8 = comb.extract %7 from 0 : (i6) -> i5
      %9 = comb.extract %8 from 4 : (i5) -> i1
      %10 = comb.replicate %9 : (i1) -> i3
      %11 = comb.concat %10, %8 : i3, i5
      arc.sim.set_input %arg0, "s8_neg" = %11 : i8, !arc.sim.instance<@TestZeroIdentities_Harness>
      %false_3 = hw.constant false
      %12 = comb.concat %false_3, %c0_i64 : i1, i64
      %true_4 = hw.constant true
      %13 = comb.concat %true_4, %c-9223372036854775808_i64 : i1, i64
      %14 = comb.sub %12, %13 : i65
      %15 = comb.extract %14 from 0 : (i65) -> i64
      arc.sim.set_input %arg0, "s64_min" = %15 : i64, !arc.sim.instance<@TestZeroIdentities_Harness>
      arc.sim.set_input %arg0, "z_val" = %c123_i8 : i8, !arc.sim.instance<@TestZeroIdentities_Harness>
      %false_5 = hw.constant false
      %16 = comb.concat %false_5, %c42_i8 : i1, i8
      %c0_i8 = hw.constant 0 : i8
      %17 = comb.concat %c0_i8, %false : i8, i1
      %false_6 = hw.constant false
      %18 = comb.concat %false_6, %16 : i1, i9
      %false_7 = hw.constant false
      %19 = comb.concat %false_7, %17 : i1, i9
      %20 = comb.add %18, %19 : i10
      %21 = comb.extract %20 from 0 : (i10) -> i9
      arc.sim.set_input %arg0, "u8_sum" = %21 : i9, !arc.sim.instance<@TestZeroIdentities_Harness>
      %c0_i9 = hw.constant 0 : i9
      %22 = comb.concat %c0_i9, %16 : i9, i9
      %c0_i9_8 = hw.constant 0 : i9
      %23 = comb.concat %c0_i9_8, %17 : i9, i9
      %24 = comb.mul %22, %23 : i18
      %25 = comb.extract %24 from 0 : (i18) -> i9
      arc.sim.set_input %arg0, "u8_mul" = %25 : i9, !arc.sim.instance<@TestZeroIdentities_Harness>
      arc.sim.set_input %arg0, "b_val" = %true : i1, !arc.sim.instance<@TestZeroIdentities_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestZeroIdentities_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestZeroIdentities_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestZeroIdentities_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestZeroIdentities_Harness>
      arc.sim.set_input %arg0, "rst" = %false : i1, !arc.sim.instance<@TestZeroIdentities_Harness>
      %26 = arc.sim.get_port %arg0, "u1_val" : i1, !arc.sim.instance<@TestZeroIdentities_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u1_val\22}", %26 : i1
      %false_9 = hw.constant false
      %27 = comb.concat %false_9, %26 : i1, i1
      %false_10 = hw.constant false
      %28 = comb.concat %false_10, %false : i1, i1
      %false_11 = hw.constant false
      %29 = comb.concat %false_11, %27 : i1, i2
      %false_12 = hw.constant false
      %30 = comb.concat %false_12, %28 : i1, i2
      %31 = comb.add %29, %30 : i3
      %32 = comb.extract %31 from 0 : (i3) -> i2
      %false_13 = hw.constant false
      %33 = comb.concat %false_13, %32 : i1, i2
      %c0_i2 = hw.constant 0 : i2
      %34 = comb.concat %c0_i2, %true : i2, i1
      %35 = comb.icmp eq %33, %34 : i3
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u1: 1 + 0 = 1\22, \22line\22: 27, \22column\22: 12, \22condition\22: \22u1_val + 0 == 1\22, \22scope\22: \22TestZeroIdentities\22}", %35 : i1
      %36 = arc.sim.get_port %arg0, "u1_val" : i1, !arc.sim.instance<@TestZeroIdentities_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u1_val\22}", %36 : i1
      %false_14 = hw.constant false
      %37 = comb.concat %false_14, %36 : i1, i1
      %c0_i2_15 = hw.constant 0 : i2
      %38 = comb.concat %c0_i2_15, %37 : i2, i2
      %c0_i2_16 = hw.constant 0 : i2
      %39 = comb.concat %c0_i2_16, %28 : i2, i2
      %40 = comb.mul %38, %39 : i4
      %41 = comb.extract %40 from 0 : (i4) -> i2
      %false_17 = hw.constant false
      %42 = comb.concat %false_17, %41 : i1, i2
      %c0_i2_18 = hw.constant 0 : i2
      %43 = comb.concat %c0_i2_18, %false : i2, i1
      %44 = comb.icmp eq %42, %43 : i3
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u1: 1 * 0 = 0\22, \22line\22: 28, \22column\22: 12, \22condition\22: \22u1_val * 0 == 0\22, \22scope\22: \22TestZeroIdentities\22}", %44 : i1
      %45 = arc.sim.get_port %arg0, "u1_val" : i1, !arc.sim.instance<@TestZeroIdentities_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u1_val\22}", %45 : i1
      %false_19 = hw.constant false
      %46 = comb.concat %false_19, %45 : i1, i1
      %false_20 = hw.constant false
      %47 = comb.concat %false_20, %true : i1, i1
      %c0_i2_21 = hw.constant 0 : i2
      %48 = comb.concat %c0_i2_21, %46 : i2, i2
      %c0_i2_22 = hw.constant 0 : i2
      %49 = comb.concat %c0_i2_22, %47 : i2, i2
      %50 = comb.mul %48, %49 : i4
      %51 = comb.extract %50 from 0 : (i4) -> i2
      %false_23 = hw.constant false
      %52 = comb.concat %false_23, %51 : i1, i2
      %53 = comb.icmp eq %52, %34 : i3
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u1: 1 * 1 = 1\22, \22line\22: 29, \22column\22: 12, \22condition\22: \22u1_val * 1 == 1\22, \22scope\22: \22TestZeroIdentities\22}", %53 : i1
      %54 = arc.sim.get_port %arg0, "u8_val" : i8, !arc.sim.instance<@TestZeroIdentities_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u8_val\22}", %54 : i8
      %false_24 = hw.constant false
      %55 = comb.concat %false_24, %54 : i1, i8
      %false_25 = hw.constant false
      %56 = comb.concat %false_25, %55 : i1, i9
      %false_26 = hw.constant false
      %57 = comb.concat %false_26, %17 : i1, i9
      %58 = comb.add %56, %57 : i10
      %59 = comb.extract %58 from 0 : (i10) -> i9
      %false_27 = hw.constant false
      %60 = comb.concat %false_27, %59 : i1, i9
      %c0_i4_28 = hw.constant 0 : i4
      %61 = comb.concat %c0_i4_28, %c-22_i6 : i4, i6
      %62 = comb.icmp eq %60, %61 : i10
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u8: 42 + 0 = 42\22, \22line\22: 32, \22column\22: 12, \22condition\22: \22u8_val + 0 == 42\22, \22scope\22: \22TestZeroIdentities\22}", %62 : i1
      %63 = arc.sim.get_port %arg0, "u8_val" : i8, !arc.sim.instance<@TestZeroIdentities_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u8_val\22}", %63 : i8
      %false_29 = hw.constant false
      %64 = comb.concat %false_29, %63 : i1, i8
      %c0_i8_30 = hw.constant 0 : i8
      %65 = comb.concat %c0_i8_30, %false : i8, i1
      %66 = comb.extract %64 from 8 : (i9) -> i1
      %67 = comb.concat %66, %64 : i1, i9
      %68 = comb.extract %65 from 8 : (i9) -> i1
      %69 = comb.concat %68, %65 : i1, i9
      %70 = comb.sub %67, %69 : i10
      %71 = comb.extract %70 from 0 : (i10) -> i9
      %c0_i3 = hw.constant 0 : i3
      %72 = comb.concat %c0_i3, %c-22_i6 : i3, i6
      %73 = comb.icmp eq %71, %72 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u8: 42 - 0 = 42\22, \22line\22: 33, \22column\22: 12, \22condition\22: \22u8_val - 0 == 42\22, \22scope\22: \22TestZeroIdentities\22}", %73 : i1
      %74 = arc.sim.get_port %arg0, "u8_val" : i8, !arc.sim.instance<@TestZeroIdentities_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u8_val\22}", %74 : i8
      %false_31 = hw.constant false
      %75 = comb.concat %false_31, %74 : i1, i8
      %c0_i9_32 = hw.constant 0 : i9
      %76 = comb.concat %c0_i9_32, %75 : i9, i9
      %c0_i9_33 = hw.constant 0 : i9
      %77 = comb.concat %c0_i9_33, %17 : i9, i9
      %78 = comb.mul %76, %77 : i18
      %79 = comb.extract %78 from 0 : (i18) -> i9
      %false_34 = hw.constant false
      %80 = comb.concat %false_34, %79 : i1, i9
      %c0_i9_35 = hw.constant 0 : i9
      %81 = comb.concat %c0_i9_35, %false : i9, i1
      %82 = comb.icmp eq %80, %81 : i10
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u8: 42 * 0 = 0\22, \22line\22: 34, \22column\22: 12, \22condition\22: \22u8_val * 0 == 0\22, \22scope\22: \22TestZeroIdentities\22}", %82 : i1
      %83 = arc.sim.get_port %arg0, "u8_val" : i8, !arc.sim.instance<@TestZeroIdentities_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u8_val\22}", %83 : i8
      %false_36 = hw.constant false
      %84 = comb.concat %false_36, %83 : i1, i8
      %c0_i8_37 = hw.constant 0 : i8
      %85 = comb.concat %c0_i8_37, %true : i8, i1
      %c0_i9_38 = hw.constant 0 : i9
      %86 = comb.concat %c0_i9_38, %84 : i9, i9
      %c0_i9_39 = hw.constant 0 : i9
      %87 = comb.concat %c0_i9_39, %85 : i9, i9
      %88 = comb.mul %86, %87 : i18
      %89 = comb.extract %88 from 0 : (i18) -> i9
      %false_40 = hw.constant false
      %90 = comb.concat %false_40, %89 : i1, i9
      %91 = comb.icmp eq %90, %61 : i10
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u8: 42 * 1 = 42\22, \22line\22: 35, \22column\22: 12, \22condition\22: \22u8_val * 1 == 42\22, \22scope\22: \22TestZeroIdentities\22}", %91 : i1
      %92 = arc.sim.get_port %arg0, "u8_val" : i8, !arc.sim.instance<@TestZeroIdentities_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u8_val\22}", %92 : i8
      %c0_i7 = hw.constant 0 : i7
      %93 = comb.concat %c0_i7, %true : i7, i1
      %94 = comb.divu %92, %93 : i8
      %false_41 = hw.constant false
      %95 = comb.concat %false_41, %94 : i1, i8
      %96 = comb.icmp eq %95, %72 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u8: 42 / 1 = 42\22, \22line\22: 36, \22column\22: 12, \22condition\22: \22u8_val / 1 == 42\22, \22scope\22: \22TestZeroIdentities\22}", %96 : i1
      %97 = arc.sim.get_port %arg0, "u64_val" : i64, !arc.sim.instance<@TestZeroIdentities_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u64_val\22}", %97 : i64
      %false_42 = hw.constant false
      %98 = comb.concat %false_42, %97 : i1, i64
      %c0_i64_43 = hw.constant 0 : i64
      %99 = comb.concat %c0_i64_43, %false : i64, i1
      %false_44 = hw.constant false
      %100 = comb.concat %false_44, %98 : i1, i65
      %false_45 = hw.constant false
      %101 = comb.concat %false_45, %99 : i1, i65
      %102 = comb.add %100, %101 : i66
      %103 = comb.extract %102 from 0 : (i66) -> i65
      %false_46 = hw.constant false
      %104 = comb.concat %false_46, %103 : i1, i65
      %c0_i2_47 = hw.constant 0 : i2
      %105 = comb.concat %c0_i2_47, %c-2401053089206453570_i64 : i2, i64
      %106 = comb.icmp eq %104, %105 : i66
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u64: identity + 0\22, \22line\22: 39, \22column\22: 12, \22condition\22: \22u64_val + 0 == 0xDEAD_BEEF_CAFE_BABE\22, \22scope\22: \22TestZeroIdentities\22}", %106 : i1
      %107 = arc.sim.get_port %arg0, "u64_val" : i64, !arc.sim.instance<@TestZeroIdentities_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u64_val\22}", %107 : i64
      %false_48 = hw.constant false
      %108 = comb.concat %false_48, %107 : i1, i64
      %c0_i65 = hw.constant 0 : i65
      %109 = comb.concat %c0_i65, %108 : i65, i65
      %c0_i65_49 = hw.constant 0 : i65
      %110 = comb.concat %c0_i65_49, %99 : i65, i65
      %111 = comb.mul %109, %110 : i130
      %112 = comb.extract %111 from 0 : (i130) -> i65
      %false_50 = hw.constant false
      %113 = comb.concat %false_50, %112 : i1, i65
      %c0_i65_51 = hw.constant 0 : i65
      %114 = comb.concat %c0_i65_51, %false : i65, i1
      %115 = comb.icmp eq %113, %114 : i66
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u64: identity * 0\22, \22line\22: 40, \22column\22: 12, \22condition\22: \22u64_val * 0 == 0\22, \22scope\22: \22TestZeroIdentities\22}", %115 : i1
      %116 = arc.sim.get_port %arg0, "u64_val" : i64, !arc.sim.instance<@TestZeroIdentities_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u64_val\22}", %116 : i64
      %c0_i63 = hw.constant 0 : i63
      %117 = comb.concat %c0_i63, %true : i63, i1
      %118 = comb.divu %116, %117 : i64
      %false_52 = hw.constant false
      %119 = comb.concat %false_52, %118 : i1, i64
      %false_53 = hw.constant false
      %120 = comb.concat %false_53, %c-2401053089206453570_i64 : i1, i64
      %121 = comb.icmp eq %119, %120 : i65
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u64: identity / 1\22, \22line\22: 41, \22column\22: 12, \22condition\22: \22u64_val / 1 == 0xDEAD_BEEF_CAFE_BABE\22, \22scope\22: \22TestZeroIdentities\22}", %121 : i1
      %122 = arc.sim.get_port %arg0, "s8_pos" : i8, !arc.sim.instance<@TestZeroIdentities_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s8_pos\22}", %122 : i8
      %123 = comb.extract %122 from 7 : (i8) -> i1
      %124 = comb.concat %123, %122 : i1, i8
      %125 = comb.extract %124 from 8 : (i9) -> i1
      %126 = comb.concat %125, %124 : i1, i9
      %127 = comb.extract %65 from 8 : (i9) -> i1
      %128 = comb.concat %127, %65 : i1, i9
      %129 = comb.add %126, %128 : i10
      %130 = comb.extract %129 from 0 : (i10) -> i9
      %c0_i5_54 = hw.constant 0 : i5
      %131 = comb.concat %c0_i5_54, %c-6_i4 : i5, i4
      %132 = comb.icmp eq %130, %131 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22val_s8: 10 + 0 = 10\22, \22line\22: 46, \22column\22: 12, \22condition\22: \22s8_pos + 0 == 10\22, \22scope\22: \22TestZeroIdentities\22}", %132 : i1
      %133 = arc.sim.get_port %arg0, "s8_neg" : i8, !arc.sim.instance<@TestZeroIdentities_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s8_neg\22}", %133 : i8
      %134 = comb.extract %133 from 7 : (i8) -> i1
      %135 = comb.concat %134, %133 : i1, i8
      %136 = comb.extract %135 from 8 : (i9) -> i1
      %137 = comb.concat %136, %135 : i1, i9
      %138 = comb.extract %65 from 8 : (i9) -> i1
      %139 = comb.concat %138, %65 : i1, i9
      %140 = comb.add %137, %139 : i10
      %141 = comb.extract %140 from 0 : (i10) -> i9
      %142 = comb.extract %8 from 4 : (i5) -> i1
      %143 = comb.replicate %142 : (i1) -> i4
      %144 = comb.concat %143, %8 : i4, i5
      %145 = comb.icmp eq %141, %144 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22val_s8: -10 + 0 = -10\22, \22line\22: 47, \22column\22: 12, \22condition\22: \22s8_neg + 0 == - 10\22, \22scope\22: \22TestZeroIdentities\22}", %145 : i1
      %146 = arc.sim.get_port %arg0, "s8_pos" : i8, !arc.sim.instance<@TestZeroIdentities_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s8_pos\22}", %146 : i8
      %147 = comb.extract %146 from 7 : (i8) -> i1
      %148 = comb.concat %147, %146 : i1, i8
      %149 = comb.extract %148 from 8 : (i9) -> i1
      %150 = comb.concat %149, %148 : i1, i9
      %151 = comb.extract %65 from 8 : (i9) -> i1
      %152 = comb.concat %151, %65 : i1, i9
      %153 = comb.sub %150, %152 : i10
      %154 = comb.extract %153 from 0 : (i10) -> i9
      %155 = comb.icmp eq %154, %131 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22val_s8: 10 - 0 = 10\22, \22line\22: 48, \22column\22: 12, \22condition\22: \22s8_pos - 0 == 10\22, \22scope\22: \22TestZeroIdentities\22}", %155 : i1
      %156 = arc.sim.get_port %arg0, "s8_neg" : i8, !arc.sim.instance<@TestZeroIdentities_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s8_neg\22}", %156 : i8
      %157 = comb.extract %156 from 7 : (i8) -> i1
      %158 = comb.concat %157, %156 : i1, i8
      %159 = comb.extract %158 from 8 : (i9) -> i1
      %160 = comb.concat %159, %158 : i1, i9
      %161 = comb.extract %65 from 8 : (i9) -> i1
      %162 = comb.concat %161, %65 : i1, i9
      %163 = comb.sub %160, %162 : i10
      %164 = comb.extract %163 from 0 : (i10) -> i9
      %165 = comb.icmp eq %164, %144 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22val_s8: -10 - 0 = -10\22, \22line\22: 49, \22column\22: 12, \22condition\22: \22s8_neg - 0 == - 10\22, \22scope\22: \22TestZeroIdentities\22}", %165 : i1
      %166 = arc.sim.get_port %arg0, "s8_neg" : i8, !arc.sim.instance<@TestZeroIdentities_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s8_neg\22}", %166 : i8
      %167 = comb.extract %166 from 7 : (i8) -> i1
      %168 = comb.replicate %167 : (i1) -> i2
      %169 = comb.concat %168, %166 : i2, i8
      %170 = comb.extract %169 from 9 : (i10) -> i1
      %171 = comb.replicate %170 : (i1) -> i10
      %172 = comb.concat %171, %169 : i10, i10
      %173 = comb.extract %81 from 9 : (i10) -> i1
      %174 = comb.replicate %173 : (i1) -> i10
      %175 = comb.concat %174, %81 : i10, i10
      %176 = comb.mul %172, %175 : i20
      %177 = comb.extract %176 from 0 : (i20) -> i10
      %178 = comb.icmp eq %177, %81 : i10
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22val_s8: -10 * 0 = 0\22, \22line\22: 50, \22column\22: 12, \22condition\22: \22s8_neg * 0 == 0\22, \22scope\22: \22TestZeroIdentities\22}", %178 : i1
      %179 = arc.sim.get_port %arg0, "s8_neg" : i8, !arc.sim.instance<@TestZeroIdentities_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s8_neg\22}", %179 : i8
      %180 = comb.extract %179 from 7 : (i8) -> i1
      %181 = comb.replicate %180 : (i1) -> i2
      %182 = comb.concat %181, %179 : i2, i8
      %c0_i9_55 = hw.constant 0 : i9
      %183 = comb.concat %c0_i9_55, %true : i9, i1
      %184 = comb.extract %182 from 9 : (i10) -> i1
      %185 = comb.replicate %184 : (i1) -> i10
      %186 = comb.concat %185, %182 : i10, i10
      %187 = comb.extract %183 from 9 : (i10) -> i1
      %188 = comb.replicate %187 : (i1) -> i10
      %189 = comb.concat %188, %183 : i10, i10
      %190 = comb.mul %186, %189 : i20
      %191 = comb.extract %190 from 0 : (i20) -> i10
      %192 = comb.extract %8 from 4 : (i5) -> i1
      %193 = comb.replicate %192 : (i1) -> i5
      %194 = comb.concat %193, %8 : i5, i5
      %195 = comb.icmp eq %191, %194 : i10
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22val_s8: -10 * 1 = -10\22, \22line\22: 51, \22column\22: 12, \22condition\22: \22s8_neg * 1 == - 10\22, \22scope\22: \22TestZeroIdentities\22}", %195 : i1
      %196 = arc.sim.get_port %arg0, "s8_neg" : i8, !arc.sim.instance<@TestZeroIdentities_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s8_neg\22}", %196 : i8
      %c0_i7_56 = hw.constant 0 : i7
      %197 = comb.concat %c0_i7_56, %true : i7, i1
      %198 = comb.extract %196 from 7 : (i8) -> i1
      %199 = comb.concat %198, %196 : i1, i8
      %200 = comb.extract %197 from 7 : (i8) -> i1
      %201 = comb.concat %200, %197 : i1, i8
      %202 = comb.divs %199, %201 : i9
      %203 = comb.extract %202 from 0 : (i9) -> i8
      %204 = comb.icmp eq %203, %11 : i8
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22val_s8: -10 / 1 = -10\22, \22line\22: 52, \22column\22: 12, \22condition\22: \22s8_neg / 1 == - 10\22, \22scope\22: \22TestZeroIdentities\22}", %204 : i1
      %205 = arc.sim.get_port %arg0, "s64_min" : i64, !arc.sim.instance<@TestZeroIdentities_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s64_min\22}", %205 : i64
      %206 = comb.extract %205 from 63 : (i64) -> i1
      %207 = comb.concat %206, %205 : i1, i64
      %c0_i64_57 = hw.constant 0 : i64
      %208 = comb.concat %c0_i64_57, %false : i64, i1
      %209 = comb.extract %207 from 64 : (i65) -> i1
      %210 = comb.concat %209, %207 : i1, i65
      %211 = comb.extract %208 from 64 : (i65) -> i1
      %212 = comb.concat %211, %208 : i1, i65
      %213 = comb.add %210, %212 : i66
      %214 = comb.extract %213 from 0 : (i66) -> i65
      %215 = comb.icmp eq %214, %207 : i65
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22s64: min + 0\22, \22line\22: 55, \22column\22: 12, \22condition\22: \22s64_min + 0 == s64_min\22, \22scope\22: \22TestZeroIdentities\22}", %215 : i1
      %216 = arc.sim.get_port %arg0, "s64_min" : i64, !arc.sim.instance<@TestZeroIdentities_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s64_min\22}", %216 : i64
      %217 = comb.extract %216 from 63 : (i64) -> i1
      %218 = comb.concat %217, %216 : i1, i64
      %219 = comb.extract %218 from 64 : (i65) -> i1
      %220 = comb.concat %219, %218 : i1, i65
      %221 = comb.extract %208 from 64 : (i65) -> i1
      %222 = comb.concat %221, %208 : i1, i65
      %223 = comb.sub %220, %222 : i66
      %224 = comb.extract %223 from 0 : (i66) -> i65
      %225 = comb.icmp eq %224, %218 : i65
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22s64: min - 0\22, \22line\22: 56, \22column\22: 12, \22condition\22: \22s64_min - 0 == s64_min\22, \22scope\22: \22TestZeroIdentities\22}", %225 : i1
      %226 = arc.sim.get_port %arg0, "s64_min" : i64, !arc.sim.instance<@TestZeroIdentities_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s64_min\22}", %226 : i64
      %227 = comb.extract %226 from 63 : (i64) -> i1
      %228 = comb.replicate %227 : (i1) -> i2
      %229 = comb.concat %228, %226 : i2, i64
      %c0_i65_58 = hw.constant 0 : i65
      %230 = comb.concat %c0_i65_58, %true : i65, i1
      %231 = comb.extract %229 from 65 : (i66) -> i1
      %232 = comb.replicate %231 : (i1) -> i66
      %233 = comb.concat %232, %229 : i66, i66
      %234 = comb.extract %230 from 65 : (i66) -> i1
      %235 = comb.replicate %234 : (i1) -> i66
      %236 = comb.concat %235, %230 : i66, i66
      %237 = comb.mul %233, %236 : i132
      %238 = comb.extract %237 from 0 : (i132) -> i66
      %239 = comb.icmp eq %238, %229 : i66
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22s64: min * 1\22, \22line\22: 57, \22column\22: 12, \22condition\22: \22s64_min * 1 == s64_min\22, \22scope\22: \22TestZeroIdentities\22}", %239 : i1
      %240 = arc.sim.get_port %arg0, "s64_min" : i64, !arc.sim.instance<@TestZeroIdentities_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s64_min\22}", %240 : i64
      %241 = comb.extract %240 from 63 : (i64) -> i1
      %242 = comb.concat %241, %240 : i1, i64
      %c0_i64_59 = hw.constant 0 : i64
      %243 = comb.concat %c0_i64_59, %true : i64, i1
      %244 = comb.extract %242 from 64 : (i65) -> i1
      %245 = comb.concat %244, %242 : i1, i65
      %246 = comb.extract %243 from 64 : (i65) -> i1
      %247 = comb.concat %246, %243 : i1, i65
      %248 = comb.divs %245, %247 : i66
      %249 = comb.extract %248 from 0 : (i66) -> i65
      %250 = comb.icmp eq %249, %242 : i65
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22s64: min / 1\22, \22line\22: 58, \22column\22: 12, \22condition\22: \22s64_min / 1 == s64_min\22, \22scope\22: \22TestZeroIdentities\22}", %250 : i1
      %251 = arc.sim.get_port %arg0, "z_val" : i8, !arc.sim.instance<@TestZeroIdentities_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22z_val\22}", %251 : i8
      %c0_i7_60 = hw.constant 0 : i7
      %252 = comb.concat %c0_i7_60, %false : i7, i1
      %253 = comb.divu %252, %251 : i8
      %false_61 = hw.constant false
      %254 = comb.concat %false_61, %253 : i1, i8
      %255 = comb.icmp eq %254, %65 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \220 / x = 0\22, \22line\22: 62, \22column\22: 12, \22condition\22: \220 / z_val == 0\22, \22scope\22: \22TestZeroIdentities\22}", %255 : i1
      %256 = arc.sim.get_port %arg0, "z_val" : i8, !arc.sim.instance<@TestZeroIdentities_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22z_val\22}", %256 : i8
      %257 = comb.modu %252, %256 : i8
      %false_62 = hw.constant false
      %258 = comb.concat %false_62, %257 : i1, i8
      %259 = comb.icmp eq %258, %65 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \220 %% x = 0\22, \22line\22: 63, \22column\22: 12, \22condition\22: \220 %% z_val == 0\22, \22scope\22: \22TestZeroIdentities\22}", %259 : i1
      %260 = arc.sim.get_port %arg0, "u8_sum" : i9, !arc.sim.instance<@TestZeroIdentities_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u8_sum\22}", %260 : i9
      %false_63 = hw.constant false
      %261 = comb.concat %false_63, %c9_i32 : i1, i32
      %c0_i29 = hw.constant 0 : i29
      %262 = comb.concat %c0_i29, %c-7_i4 : i29, i4
      %263 = comb.icmp eq %261, %262 : i33
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u8 + 0 (literal) result width is 9 per spec\22, \22line\22: 69, \22column\22: 12, \22condition\22: \22width u8_sum == 9\22, \22scope\22: \22TestZeroIdentities\22}", %263 : i1
      %264 = arc.sim.get_port %arg0, "u8_sum" : i9, !arc.sim.instance<@TestZeroIdentities_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u8_sum\22}", %264 : i9
      %c0_i3_64 = hw.constant 0 : i3
      %265 = comb.concat %c0_i3_64, %c-22_i6 : i3, i6
      %false_65 = hw.constant false
      %266 = comb.concat %false_65, %264 : i1, i9
      %false_66 = hw.constant false
      %267 = comb.concat %false_66, %265 : i1, i9
      %268 = comb.icmp eq %266, %267 : i10
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u8 + 0 = u9(42)\22, \22line\22: 70, \22column\22: 12, \22condition\22: \22u8_sum == 42 as u9\22, \22scope\22: \22TestZeroIdentities\22}", %268 : i1
      %269 = arc.sim.get_port %arg0, "u8_mul" : i9, !arc.sim.instance<@TestZeroIdentities_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u8_mul\22}", %269 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u8 * 0 (literal 0 is u1) -> width 9\22, \22line\22: 73, \22column\22: 12, \22condition\22: \22width u8_mul == 9\22, \22scope\22: \22TestZeroIdentities\22}", %263 : i1
      %false_67 = hw.constant false
      %270 = comb.concat %false_67, %28 : i1, i2
      %false_68 = hw.constant false
      %271 = comb.concat %false_68, %28 : i1, i2
      %272 = comb.add %270, %271 : i3
      %273 = comb.extract %272 from 0 : (i3) -> i2
      %false_69 = hw.constant false
      %274 = comb.concat %false_69, %273 : i1, i2
      %275 = comb.icmp eq %274, %43 : i3
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \220 + 0 = 0\22, \22line\22: 77, \22column\22: 12, \22condition\22: \220 + 0 == 0\22, \22scope\22: \22TestZeroIdentities\22}", %275 : i1
      %false_70 = hw.constant false
      %276 = comb.concat %false_70, %false : i1, i1
      %277 = comb.extract %276 from 1 : (i2) -> i1
      %278 = comb.concat %277, %276 : i1, i2
      %279 = comb.extract %276 from 1 : (i2) -> i1
      %280 = comb.concat %279, %276 : i1, i2
      %281 = comb.sub %278, %280 : i3
      %282 = comb.extract %281 from 0 : (i3) -> i2
      %283 = comb.icmp eq %282, %276 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \220 - 0 = 0\22, \22line\22: 78, \22column\22: 12, \22condition\22: \220 - 0 == 0\22, \22scope\22: \22TestZeroIdentities\22}", %283 : i1
      %c0_i2_71 = hw.constant 0 : i2
      %284 = comb.concat %c0_i2_71, %28 : i2, i2
      %c0_i2_72 = hw.constant 0 : i2
      %285 = comb.concat %c0_i2_72, %28 : i2, i2
      %286 = comb.mul %284, %285 : i4
      %287 = comb.extract %286 from 0 : (i4) -> i2
      %false_73 = hw.constant false
      %288 = comb.concat %false_73, %287 : i1, i2
      %289 = comb.icmp eq %288, %43 : i3
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \220 * 0 = 0\22, \22line\22: 79, \22column\22: 12, \22condition\22: \220 * 0 == 0\22, \22scope\22: \22TestZeroIdentities\22}", %289 : i1
      %290 = arc.sim.get_port %arg0, "b_val" : i1, !arc.sim.instance<@TestZeroIdentities_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22b_val\22}", %290 : i1
      %false_74 = hw.constant false
      %291 = comb.concat %false_74, %290 : i1, i1
      %false_75 = hw.constant false
      %292 = comb.concat %false_75, %291 : i1, i2
      %false_76 = hw.constant false
      %293 = comb.concat %false_76, %28 : i1, i2
      %294 = comb.add %292, %293 : i3
      %295 = comb.extract %294 from 0 : (i3) -> i2
      %false_77 = hw.constant false
      %296 = comb.concat %false_77, %295 : i1, i2
      %297 = comb.icmp eq %296, %34 : i3
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22bool(true) + 0 = 1\22, \22line\22: 83, \22column\22: 12, \22condition\22: \22b_val + 0 == 1\22, \22scope\22: \22TestZeroIdentities\22}", %297 : i1
      %298 = arc.sim.get_port %arg0, "b_val" : i1, !arc.sim.instance<@TestZeroIdentities_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22b_val\22}", %298 : i1
      %false_78 = hw.constant false
      %299 = comb.concat %false_78, %298 : i1, i1
      %c0_i2_79 = hw.constant 0 : i2
      %300 = comb.concat %c0_i2_79, %299 : i2, i2
      %c0_i2_80 = hw.constant 0 : i2
      %301 = comb.concat %c0_i2_80, %47 : i2, i2
      %302 = comb.mul %300, %301 : i4
      %303 = comb.extract %302 from 0 : (i4) -> i2
      %false_81 = hw.constant false
      %304 = comb.concat %false_81, %303 : i1, i2
      %305 = comb.icmp eq %304, %34 : i3
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22bool(true) * 1 = 1\22, \22line\22: 84, \22column\22: 12, \22condition\22: \22b_val * 1 == 1\22, \22scope\22: \22TestZeroIdentities\22}", %305 : i1
      %306 = arc.sim.get_port %arg0, "b_val" : i1, !arc.sim.instance<@TestZeroIdentities_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22b_val\22}", %306 : i1
      %false_82 = hw.constant false
      %307 = comb.concat %false_82, %306 : i1, i1
      %c0_i2_83 = hw.constant 0 : i2
      %308 = comb.concat %c0_i2_83, %307 : i2, i2
      %c0_i2_84 = hw.constant 0 : i2
      %309 = comb.concat %c0_i2_84, %28 : i2, i2
      %310 = comb.mul %308, %309 : i4
      %311 = comb.extract %310 from 0 : (i4) -> i2
      %false_85 = hw.constant false
      %312 = comb.concat %false_85, %311 : i1, i2
      %313 = comb.icmp eq %312, %43 : i3
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22bool(true) * 0 = 0\22, \22line\22: 85, \22column\22: 12, \22condition\22: \22b_val * 0 == 0\22, \22scope\22: \22TestZeroIdentities\22}", %313 : i1
    }
    return
  }
}