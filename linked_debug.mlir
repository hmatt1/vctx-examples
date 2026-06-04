module {



  hw.module @TestComparisonAllOperators_Harness(in %clk : !seq.clock, in %rst : i1, in %bf : i1, in %bt : i1, in %res_eq : i1, in %s5_a : i5, in %s5_b : i5, in %s64_max : i64, in %s64_min : i64, in %s8_100 : i8, in %s8_neg : i8, in %s8n : i8, in %s8p : i8, in %s8z : i8, in %u16_val : i16, in %u3_a : i3, in %u3_b : i3, in %u64_max : i64, in %u64_zero : i64, in %u8_200 : i8, in %u8_val : i8, in %u8a : i8, in %u8b : i8, in %u8c : i8, out bf : i1, out bt : i1, out res_eq : i1, out s5_a : i5, out s5_b : i5, out s64_max : i64, out s64_min : i64, out s8_100 : i8, out s8_neg : i8, out s8n : i8, out s8p : i8, out s8z : i8, out u16_val : i16, out u3_a : i3, out u3_b : i3, out u64_max : i64, out u64_zero : i64, out u8_200 : i8, out u8_val : i8, out u8a : i8, out u8b : i8, out u8c : i8) {
    hw.output %bf, %bt, %res_eq, %s5_a, %s5_b, %s64_max, %s64_min, %s8_100, %s8_neg, %s8n, %s8p, %s8z, %u16_val, %u3_a, %u3_b, %u64_max, %u64_zero, %u8_200, %u8_val, %u8a, %u8b, %u8c : i1, i1, i1, i5, i5, i64, i64, i8, i8, i8, i8, i8, i16, i3, i3, i64, i64, i8, i8, i8, i8, i8
  }
  func.func @entry() {
    %c-3_i3 = hw.constant -3 : i3
    %c-2_i2 = hw.constant -2 : i2
    %c-6_i4 = hw.constant -6 : i4
    %c-4_i3 = hw.constant -4 : i3
    %c1_i32 = hw.constant 1 : i32
    %c15_i5 = hw.constant 15 : i5
    %c0_i5 = hw.constant 0 : i5
    %c-16_i5 = hw.constant -16 : i5
    %c0_i3 = hw.constant 0 : i3
    %c-1_i3 = hw.constant -1 : i3
    %c0_i2 = hw.constant 0 : i2
    %c100_i8 = hw.constant 100 : i8
    %c-56_i8 = hw.constant -56 : i8
    %c-1_i8 = hw.constant -1 : i8
    %c1000_i16 = hw.constant 1000 : i16
    %c9223372036854775807_i64 = hw.constant 9223372036854775807 : i64
    %c0_i64 = hw.constant 0 : i64
    %c-9223372036854775808_i64 = hw.constant -9223372036854775808 : i64
    %c0_i64_0 = hw.constant 0 : i64
    %c-1_i64 = hw.constant -1 : i64
    %c0_i8 = hw.constant 0 : i8
    %c50_i8 = hw.constant 50 : i8
    %c0_i7 = hw.constant 0 : i7
    %c-14_i6 = hw.constant -14 : i6
    %c20_i8 = hw.constant 20 : i8
    %c10_i8 = hw.constant 10 : i8
    %true = hw.constant true
    %false = hw.constant false
    %0 = seq.const_clock high
    %1 = seq.const_clock low
    arc.sim.instantiate @TestComparisonAllOperators_Harness as %arg0 {
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.set_input %arg0, "bt" = %true : i1, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.set_input %arg0, "bf" = %false : i1, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.set_input %arg0, "u8a" = %c10_i8 : i8, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.set_input %arg0, "u8b" = %c20_i8 : i8, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.set_input %arg0, "u8c" = %c10_i8 : i8, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      %false_1 = hw.constant false
      %2 = comb.concat %false_1, %c-14_i6 : i1, i6
      %false_2 = hw.constant false
      %3 = comb.concat %false_2, %c0_i7 : i1, i7
      %4 = comb.extract %2 from 6 : (i7) -> i1
      %5 = comb.concat %4, %2 : i1, i7
      %6 = comb.sub %3, %5 : i8
      %7 = comb.extract %6 from 0 : (i8) -> i7
      %8 = comb.extract %7 from 6 : (i7) -> i1
      %9 = comb.concat %8, %7 : i1, i7
      arc.sim.set_input %arg0, "s8n" = %9 : i8, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      %c-14_i6_3 = hw.constant -14 : i6
      %c0_i2_4 = hw.constant 0 : i2
      %10 = comb.concat %c0_i2_4, %c-14_i6_3 : i2, i6
      arc.sim.set_input %arg0, "s8p" = %10 : i8, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      %false_5 = hw.constant false
      %c0_i7_6 = hw.constant 0 : i7
      %11 = comb.concat %c0_i7_6, %false_5 : i7, i1
      arc.sim.set_input %arg0, "s8z" = %11 : i8, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.set_input %arg0, "u64_max" = %c-1_i64 : i64, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.set_input %arg0, "u64_zero" = %c0_i64_0 : i64, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      %false_7 = hw.constant false
      %12 = comb.concat %false_7, %c0_i64 : i1, i64
      %true_8 = hw.constant true
      %13 = comb.concat %true_8, %c-9223372036854775808_i64 : i1, i64
      %14 = comb.sub %12, %13 : i65
      %15 = comb.extract %14 from 0 : (i65) -> i64
      arc.sim.set_input %arg0, "s64_min" = %15 : i64, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      %c-1_i63 = hw.constant -1 : i63
      %false_9 = hw.constant false
      %16 = comb.concat %false_9, %c-1_i63 : i1, i63
      arc.sim.set_input %arg0, "s64_max" = %16 : i64, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      %false_10 = hw.constant false
      %17 = comb.concat %false_10, %c10_i8 : i1, i8
      %false_11 = hw.constant false
      %18 = comb.concat %false_11, %c20_i8 : i1, i8
      %19 = comb.icmp eq %17, %18 : i9
      arc.sim.set_input %arg0, "res_eq" = %19 : i1, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.set_input %arg0, "u16_val" = %c1000_i16 : i16, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.set_input %arg0, "u8_val" = %c-1_i8 : i8, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.set_input %arg0, "u8_200" = %c-56_i8 : i8, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      %c-28_i7 = hw.constant -28 : i7
      %false_12 = hw.constant false
      %20 = comb.concat %false_12, %c-28_i7 : i1, i7
      arc.sim.set_input %arg0, "s8_100" = %20 : i8, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      %false_13 = hw.constant false
      %21 = comb.concat %false_13, %true : i1, i1
      %false_14 = hw.constant false
      %22 = comb.concat %false_14, %c0_i2 : i1, i2
      %23 = comb.extract %21 from 1 : (i2) -> i1
      %24 = comb.concat %23, %21 : i1, i2
      %25 = comb.sub %22, %24 : i3
      %26 = comb.extract %25 from 0 : (i3) -> i2
      %27 = comb.extract %26 from 1 : (i2) -> i1
      %28 = comb.replicate %27 : (i1) -> i6
      %29 = comb.concat %28, %26 : i6, i2
      arc.sim.set_input %arg0, "s8_neg" = %29 : i8, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.set_input %arg0, "u3_a" = %c-1_i3 : i3, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.set_input %arg0, "u3_b" = %c0_i3 : i3, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      %false_15 = hw.constant false
      %30 = comb.concat %false_15, %c0_i5 : i1, i5
      %true_16 = hw.constant true
      %31 = comb.concat %true_16, %c-16_i5 : i1, i5
      %32 = comb.sub %30, %31 : i6
      %33 = comb.extract %32 from 0 : (i6) -> i5
      arc.sim.set_input %arg0, "s5_a" = %33 : i5, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      %c-1_i4 = hw.constant -1 : i4
      %false_17 = hw.constant false
      %34 = comb.concat %false_17, %c-1_i4 : i1, i4
      arc.sim.set_input %arg0, "s5_b" = %34 : i5, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.set_input %arg0, "rst" = %false : i1, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      %35 = arc.sim.get_port %arg0, "bt" : i1, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22bt\22}", %35 : i1
      %false_18 = hw.constant false
      %36 = comb.concat %false_18, %35 : i1, i1
      %37 = comb.icmp eq %36, %36 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22bool: T == T\22, \22line\22: 11, \22column\22: 12, \22condition\22: \22bt == bt\22, \22scope\22: \22TestComparisonAllOperators\22}", %37 : i1
      %38 = arc.sim.get_port %arg0, "bf" : i1, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22bf\22}", %38 : i1
      %39 = arc.sim.get_port %arg0, "bt" : i1, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22bt\22}", %39 : i1
      %false_19 = hw.constant false
      %40 = comb.concat %false_19, %39 : i1, i1
      %false_20 = hw.constant false
      %41 = comb.concat %false_20, %38 : i1, i1
      %42 = comb.icmp ne %40, %41 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22bool: T !== F\22, \22line\22: 12, \22column\22: 12, \22condition\22: \22bt !== bf\22, \22scope\22: \22TestComparisonAllOperators\22}", %42 : i1
      %43 = arc.sim.get_port %arg0, "bf" : i1, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22bf\22}", %43 : i1
      %44 = arc.sim.get_port %arg0, "bt" : i1, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22bt\22}", %44 : i1
      %false_21 = hw.constant false
      %45 = comb.concat %false_21, %44 : i1, i1
      %false_22 = hw.constant false
      %46 = comb.concat %false_22, %43 : i1, i1
      %47 = comb.icmp sgt %45, %46 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22bool: T > F (1 > 0)\22, \22line\22: 13, \22column\22: 12, \22condition\22: \22bt > bf\22, \22scope\22: \22TestComparisonAllOperators\22}", %47 : i1
      %48 = arc.sim.get_port %arg0, "bf" : i1, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22bf\22}", %48 : i1
      %49 = arc.sim.get_port %arg0, "bt" : i1, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22bt\22}", %49 : i1
      %false_23 = hw.constant false
      %50 = comb.concat %false_23, %48 : i1, i1
      %false_24 = hw.constant false
      %51 = comb.concat %false_24, %49 : i1, i1
      %52 = comb.icmp slt %50, %51 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22bool: F < T (0 < 1)\22, \22line\22: 14, \22column\22: 12, \22condition\22: \22bf < bt\22, \22scope\22: \22TestComparisonAllOperators\22}", %52 : i1
      %53 = arc.sim.get_port %arg0, "bf" : i1, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22bf\22}", %53 : i1
      %54 = arc.sim.get_port %arg0, "bt" : i1, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22bt\22}", %54 : i1
      %false_25 = hw.constant false
      %55 = comb.concat %false_25, %54 : i1, i1
      %false_26 = hw.constant false
      %56 = comb.concat %false_26, %53 : i1, i1
      %57 = comb.icmp sge %55, %56 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22bool: T >== F\22, \22line\22: 15, \22column\22: 12, \22condition\22: \22bt >== bf\22, \22scope\22: \22TestComparisonAllOperators\22}", %57 : i1
      %58 = arc.sim.get_port %arg0, "bf" : i1, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22bf\22}", %58 : i1
      %59 = arc.sim.get_port %arg0, "bt" : i1, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22bt\22}", %59 : i1
      %false_27 = hw.constant false
      %60 = comb.concat %false_27, %58 : i1, i1
      %false_28 = hw.constant false
      %61 = comb.concat %false_28, %59 : i1, i1
      %62 = comb.icmp sle %60, %61 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22bool: F <== T\22, \22line\22: 16, \22column\22: 12, \22condition\22: \22bf <== bt\22, \22scope\22: \22TestComparisonAllOperators\22}", %62 : i1
      %63 = arc.sim.get_port %arg0, "u8c" : i8, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u8c\22}", %63 : i8
      %64 = arc.sim.get_port %arg0, "u8a" : i8, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u8a\22}", %64 : i8
      %false_29 = hw.constant false
      %65 = comb.concat %false_29, %64 : i1, i8
      %false_30 = hw.constant false
      %66 = comb.concat %false_30, %63 : i1, i8
      %67 = comb.icmp eq %65, %66 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u8: 10 == 10\22, \22line\22: 22, \22column\22: 12, \22condition\22: \22u8a == u8c\22, \22scope\22: \22TestComparisonAllOperators\22}", %67 : i1
      %68 = arc.sim.get_port %arg0, "u8b" : i8, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u8b\22}", %68 : i8
      %69 = arc.sim.get_port %arg0, "u8a" : i8, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u8a\22}", %69 : i8
      %false_31 = hw.constant false
      %70 = comb.concat %false_31, %69 : i1, i8
      %false_32 = hw.constant false
      %71 = comb.concat %false_32, %68 : i1, i8
      %72 = comb.icmp ne %70, %71 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u8: 10 !== 20\22, \22line\22: 23, \22column\22: 12, \22condition\22: \22u8a !== u8b\22, \22scope\22: \22TestComparisonAllOperators\22}", %72 : i1
      %73 = arc.sim.get_port %arg0, "u8b" : i8, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u8b\22}", %73 : i8
      %74 = arc.sim.get_port %arg0, "u8a" : i8, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u8a\22}", %74 : i8
      %false_33 = hw.constant false
      %75 = comb.concat %false_33, %74 : i1, i8
      %false_34 = hw.constant false
      %76 = comb.concat %false_34, %73 : i1, i8
      %77 = comb.icmp slt %75, %76 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u8: 10 < 20\22, \22line\22: 24, \22column\22: 12, \22condition\22: \22u8a < u8b\22, \22scope\22: \22TestComparisonAllOperators\22}", %77 : i1
      %78 = arc.sim.get_port %arg0, "u8b" : i8, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u8b\22}", %78 : i8
      %79 = arc.sim.get_port %arg0, "u8a" : i8, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u8a\22}", %79 : i8
      %false_35 = hw.constant false
      %80 = comb.concat %false_35, %78 : i1, i8
      %false_36 = hw.constant false
      %81 = comb.concat %false_36, %79 : i1, i8
      %82 = comb.icmp sgt %80, %81 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u8: 20 > 10\22, \22line\22: 25, \22column\22: 12, \22condition\22: \22u8b > u8a\22, \22scope\22: \22TestComparisonAllOperators\22}", %82 : i1
      %83 = arc.sim.get_port %arg0, "u8c" : i8, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u8c\22}", %83 : i8
      %84 = arc.sim.get_port %arg0, "u8a" : i8, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u8a\22}", %84 : i8
      %false_37 = hw.constant false
      %85 = comb.concat %false_37, %84 : i1, i8
      %false_38 = hw.constant false
      %86 = comb.concat %false_38, %83 : i1, i8
      %87 = comb.icmp sle %85, %86 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u8: 10 <== 10\22, \22line\22: 26, \22column\22: 12, \22condition\22: \22u8a <== u8c\22, \22scope\22: \22TestComparisonAllOperators\22}", %87 : i1
      %88 = arc.sim.get_port %arg0, "u8c" : i8, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u8c\22}", %88 : i8
      %89 = arc.sim.get_port %arg0, "u8a" : i8, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u8a\22}", %89 : i8
      %false_39 = hw.constant false
      %90 = comb.concat %false_39, %89 : i1, i8
      %false_40 = hw.constant false
      %91 = comb.concat %false_40, %88 : i1, i8
      %92 = comb.icmp sge %90, %91 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u8: 10 >== 10\22, \22line\22: 27, \22column\22: 12, \22condition\22: \22u8a >== u8c\22, \22scope\22: \22TestComparisonAllOperators\22}", %92 : i1
      %93 = arc.sim.get_port %arg0, "u8b" : i8, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u8b\22}", %93 : i8
      %94 = arc.sim.get_port %arg0, "u8a" : i8, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u8a\22}", %94 : i8
      %false_41 = hw.constant false
      %95 = comb.concat %false_41, %93 : i1, i8
      %false_42 = hw.constant false
      %96 = comb.concat %false_42, %94 : i1, i8
      %97 = comb.icmp sge %95, %96 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u8: 20 >== 10\22, \22line\22: 28, \22column\22: 12, \22condition\22: \22u8b >== u8a\22, \22scope\22: \22TestComparisonAllOperators\22}", %97 : i1
      %98 = arc.sim.get_port %arg0, "s8n" : i8, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s8n\22}", %98 : i8
      %99 = arc.sim.get_port %arg0, "s8p" : i8, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s8p\22}", %99 : i8
      %100 = comb.icmp slt %98, %99 : i8
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22val_s8: -50 < 50\22, \22line\22: 34, \22column\22: 12, \22condition\22: \22s8n < s8p\22, \22scope\22: \22TestComparisonAllOperators\22}", %100 : i1
      %101 = arc.sim.get_port %arg0, "s8p" : i8, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s8p\22}", %101 : i8
      %102 = arc.sim.get_port %arg0, "s8n" : i8, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s8n\22}", %102 : i8
      %103 = comb.icmp sgt %101, %102 : i8
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22val_s8: 50 > -50\22, \22line\22: 35, \22column\22: 12, \22condition\22: \22s8p > s8n\22, \22scope\22: \22TestComparisonAllOperators\22}", %103 : i1
      %104 = arc.sim.get_port %arg0, "s8z" : i8, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s8z\22}", %104 : i8
      %105 = arc.sim.get_port %arg0, "s8n" : i8, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s8n\22}", %105 : i8
      %106 = comb.icmp slt %105, %104 : i8
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22val_s8: -50 < 0\22, \22line\22: 36, \22column\22: 12, \22condition\22: \22s8n < s8z\22, \22scope\22: \22TestComparisonAllOperators\22}", %106 : i1
      %107 = arc.sim.get_port %arg0, "s8z" : i8, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s8z\22}", %107 : i8
      %108 = arc.sim.get_port %arg0, "s8n" : i8, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s8n\22}", %108 : i8
      %109 = comb.icmp sgt %107, %108 : i8
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22val_s8: 0 > -50\22, \22line\22: 37, \22column\22: 12, \22condition\22: \22s8z > s8n\22, \22scope\22: \22TestComparisonAllOperators\22}", %109 : i1
      %110 = arc.sim.get_port %arg0, "s8n" : i8, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s8n\22}", %110 : i8
      %111 = comb.icmp sle %110, %9 : i8
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22val_s8: -50 <== -50\22, \22line\22: 38, \22column\22: 12, \22condition\22: \22s8n <== - 50\22, \22scope\22: \22TestComparisonAllOperators\22}", %111 : i1
      %112 = arc.sim.get_port %arg0, "s8n" : i8, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s8n\22}", %112 : i8
      %113 = arc.sim.get_port %arg0, "s8p" : i8, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s8p\22}", %113 : i8
      %114 = comb.icmp ne %112, %113 : i8
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22val_s8: -50 !== 50\22, \22line\22: 39, \22column\22: 12, \22condition\22: \22s8n !== s8p\22, \22scope\22: \22TestComparisonAllOperators\22}", %114 : i1
      %115 = arc.sim.get_port %arg0, "u64_max" : i64, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u64_max\22}", %115 : i64
      %116 = arc.sim.get_port %arg0, "u64_zero" : i64, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u64_zero\22}", %116 : i64
      %false_43 = hw.constant false
      %117 = comb.concat %false_43, %115 : i1, i64
      %false_44 = hw.constant false
      %118 = comb.concat %false_44, %116 : i1, i64
      %119 = comb.icmp sgt %117, %118 : i65
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u64: max > 0\22, \22line\22: 44, \22column\22: 12, \22condition\22: \22u64_max > u64_zero\22, \22scope\22: \22TestComparisonAllOperators\22}", %119 : i1
      %120 = arc.sim.get_port %arg0, "u64_max" : i64, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u64_max\22}", %120 : i64
      %121 = arc.sim.get_port %arg0, "u64_zero" : i64, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u64_zero\22}", %121 : i64
      %false_45 = hw.constant false
      %122 = comb.concat %false_45, %121 : i1, i64
      %false_46 = hw.constant false
      %123 = comb.concat %false_46, %120 : i1, i64
      %124 = comb.icmp slt %122, %123 : i65
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u64: 0 < max\22, \22line\22: 45, \22column\22: 12, \22condition\22: \22u64_zero < u64_max\22, \22scope\22: \22TestComparisonAllOperators\22}", %124 : i1
      %125 = arc.sim.get_port %arg0, "u64_max" : i64, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u64_max\22}", %125 : i64
      %false_47 = hw.constant false
      %126 = comb.concat %false_47, %125 : i1, i64
      %false_48 = hw.constant false
      %127 = comb.concat %false_48, %c-1_i64 : i1, i64
      %128 = comb.icmp eq %126, %127 : i65
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u64: equality\22, \22line\22: 46, \22column\22: 12, \22condition\22: \22u64_max == 0xFFFF_FFFF_FFFF_FFFF\22, \22scope\22: \22TestComparisonAllOperators\22}", %128 : i1
      %129 = arc.sim.get_port %arg0, "u64_max" : i64, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u64_max\22}", %129 : i64
      %false_49 = hw.constant false
      %130 = comb.concat %false_49, %129 : i1, i64
      %c0_i64_50 = hw.constant 0 : i64
      %131 = comb.concat %c0_i64_50, %false : i64, i1
      %132 = comb.icmp sge %130, %131 : i65
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u64: max >== 0\22, \22line\22: 47, \22column\22: 12, \22condition\22: \22u64_max >== 0\22, \22scope\22: \22TestComparisonAllOperators\22}", %132 : i1
      %133 = arc.sim.get_port %arg0, "s64_max" : i64, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s64_max\22}", %133 : i64
      %134 = arc.sim.get_port %arg0, "s64_min" : i64, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s64_min\22}", %134 : i64
      %135 = comb.icmp slt %134, %133 : i64
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22s64: min < max\22, \22line\22: 52, \22column\22: 12, \22condition\22: \22s64_min < s64_max\22, \22scope\22: \22TestComparisonAllOperators\22}", %135 : i1
      %136 = arc.sim.get_port %arg0, "s64_max" : i64, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s64_max\22}", %136 : i64
      %137 = arc.sim.get_port %arg0, "s64_min" : i64, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s64_min\22}", %137 : i64
      %138 = comb.icmp sgt %136, %137 : i64
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22s64: max > min\22, \22line\22: 53, \22column\22: 12, \22condition\22: \22s64_max > s64_min\22, \22scope\22: \22TestComparisonAllOperators\22}", %138 : i1
      %139 = arc.sim.get_port %arg0, "s64_min" : i64, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s64_min\22}", %139 : i64
      %140 = comb.icmp sle %139, %139 : i64
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22s64: min <== min\22, \22line\22: 54, \22column\22: 12, \22condition\22: \22s64_min <== s64_min\22, \22scope\22: \22TestComparisonAllOperators\22}", %140 : i1
      %141 = arc.sim.get_port %arg0, "s64_max" : i64, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s64_max\22}", %141 : i64
      %142 = comb.icmp sge %141, %141 : i64
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22s64: max >== max\22, \22line\22: 55, \22column\22: 12, \22condition\22: \22s64_max >== s64_max\22, \22scope\22: \22TestComparisonAllOperators\22}", %142 : i1
      %143 = arc.sim.get_port %arg0, "res_eq" : i1, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22res_eq\22}", %143 : i1
      %false_51 = hw.constant false
      %144 = comb.concat %false_51, %c1_i32 : i1, i32
      %c0_i32 = hw.constant 0 : i32
      %145 = comb.concat %c0_i32, %true : i32, i1
      %146 = comb.icmp eq %144, %145 : i33
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Comparison result width is 1\22, \22line\22: 59, \22column\22: 12, \22condition\22: \22width res_eq == 1\22, \22scope\22: \22TestComparisonAllOperators\22}", %146 : i1
      %147 = arc.sim.get_port %arg0, "res_eq" : i1, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22res_eq\22}", %147 : i1
      %false_52 = hw.constant false
      %148 = comb.concat %false_52, %false : i1, i1
      %149 = comb.icmp eq %148, %148 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Comparison result is unsigned\22, \22line\22: 60, \22column\22: 12, \22condition\22: \22is_signed res_eq == false\22, \22scope\22: \22TestComparisonAllOperators\22}", %149 : i1
      %150 = arc.sim.get_port %arg0, "u8_val" : i8, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u8_val\22}", %150 : i8
      %151 = arc.sim.get_port %arg0, "u16_val" : i16, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u16_val\22}", %151 : i16
      %false_53 = hw.constant false
      %152 = comb.concat %false_53, %151 : i1, i16
      %c0_i9 = hw.constant 0 : i9
      %153 = comb.concat %c0_i9, %150 : i9, i8
      %154 = comb.icmp sgt %152, %153 : i17
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Mixed: u16(1000) > u8(255)\22, \22line\22: 66, \22column\22: 12, \22condition\22: \22u16_val > u8_val\22, \22scope\22: \22TestComparisonAllOperators\22}", %154 : i1
      %155 = arc.sim.get_port %arg0, "u8_val" : i8, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u8_val\22}", %155 : i8
      %156 = arc.sim.get_port %arg0, "u16_val" : i16, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u16_val\22}", %156 : i16
      %c0_i9_54 = hw.constant 0 : i9
      %157 = comb.concat %c0_i9_54, %155 : i9, i8
      %false_55 = hw.constant false
      %158 = comb.concat %false_55, %156 : i1, i16
      %159 = comb.icmp slt %157, %158 : i17
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Mixed: u8(255) < u16(1000)\22, \22line\22: 67, \22column\22: 12, \22condition\22: \22u8_val < u16_val\22, \22scope\22: \22TestComparisonAllOperators\22}", %159 : i1
      %160 = arc.sim.get_port %arg0, "u8_200" : i8, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u8_200\22}", %160 : i8
      %161 = arc.sim.get_port %arg0, "s8_100" : i8, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s8_100\22}", %161 : i8
      %false_56 = hw.constant false
      %162 = comb.concat %false_56, %160 : i1, i8
      %163 = comb.extract %161 from 7 : (i8) -> i1
      %164 = comb.concat %163, %161 : i1, i8
      %165 = comb.icmp sgt %162, %164 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Mixed: u8(200) > val_s8(100)\22, \22line\22: 73, \22column\22: 12, \22condition\22: \22u8_200 > s8_100\22, \22scope\22: \22TestComparisonAllOperators\22}", %165 : i1
      %166 = arc.sim.get_port %arg0, "u8_200" : i8, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u8_200\22}", %166 : i8
      %167 = arc.sim.get_port %arg0, "s8_neg" : i8, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s8_neg\22}", %167 : i8
      %false_57 = hw.constant false
      %168 = comb.concat %false_57, %166 : i1, i8
      %169 = comb.extract %167 from 7 : (i8) -> i1
      %170 = comb.concat %169, %167 : i1, i8
      %171 = comb.icmp sgt %168, %170 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Mixed: u8(200) > val_s8(-1)\22, \22line\22: 76, \22column\22: 12, \22condition\22: \22u8_200 > s8_neg\22, \22scope\22: \22TestComparisonAllOperators\22}", %171 : i1
      %172 = arc.sim.get_port %arg0, "s8_neg" : i8, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s8_neg\22}", %172 : i8
      %173 = arc.sim.get_port %arg0, "u8_200" : i8, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u8_200\22}", %173 : i8
      %174 = comb.extract %172 from 7 : (i8) -> i1
      %175 = comb.concat %174, %172 : i1, i8
      %false_58 = hw.constant false
      %176 = comb.concat %false_58, %173 : i1, i8
      %177 = comb.icmp slt %175, %176 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Mixed: s8(-1) < u8(200)\22, \22line\22: 77, \22column\22: 12, \22condition\22: \22s8_neg < u8_200\22, \22scope\22: \22TestComparisonAllOperators\22}", %177 : i1
      %false_59 = hw.constant false
      %178 = comb.shl %true, %false_59 : i1
      %c0_i4 = hw.constant 0 : i4
      %179 = comb.concat %c0_i4, %178 : i4, i1
      %false_60 = hw.constant false
      %180 = comb.concat %false_60, %c-6_i4 : i1, i4
      %181 = comb.icmp sgt %179, %180 : i5
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Precedence: (1<<4) > 10 is T (16 > 10)\22, \22line\22: 81, \22column\22: 12, \22condition\22: \221 << 4 > 10\22, \22scope\22: \22TestComparisonAllOperators\22}", %181 : i1
      %false_61 = hw.constant false
      %182 = comb.shl %true, %false_61 : i1
      %c0_i4_62 = hw.constant 0 : i4
      %183 = comb.concat %c0_i4_62, %182 : i4, i1
      %184 = comb.icmp slt %183, %180 : i5
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Precedence: (1<<2) < 10 is T (4 < 10)\22, \22line\22: 82, \22column\22: 12, \22condition\22: \221 << 2 < 10\22, \22scope\22: \22TestComparisonAllOperators\22}", %184 : i1
      %c0_i2_63 = hw.constant 0 : i2
      %185 = comb.concat %c0_i2_63, %c-3_i3 : i2, i3
      %186 = comb.icmp sgt %180, %185 : i5
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Precedence: true and (10 > 5) is T\22, \22line\22: 84, \22column\22: 12, \22condition\22: \22true and 10 > 5\22, \22scope\22: \22TestComparisonAllOperators\22}", %186 : i1
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Precedence: false or (10 > 5) is T\22, \22line\22: 85, \22column\22: 12, \22condition\22: \22false or 10 > 5\22, \22scope\22: \22TestComparisonAllOperators\22}", %186 : i1
      %187 = arc.sim.get_port %arg0, "u3_b" : i3, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u3_b\22}", %187 : i3
      %188 = arc.sim.get_port %arg0, "u3_a" : i3, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u3_a\22}", %188 : i3
      %false_64 = hw.constant false
      %189 = comb.concat %false_64, %188 : i1, i3
      %false_65 = hw.constant false
      %190 = comb.concat %false_65, %187 : i1, i3
      %191 = comb.icmp sgt %189, %190 : i4
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u3: 7 > 0\22, \22line\22: 90, \22column\22: 12, \22condition\22: \22u3_a > u3_b\22, \22scope\22: \22TestComparisonAllOperators\22}", %191 : i1
      %192 = arc.sim.get_port %arg0, "s5_a" : i5, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s5_a\22}", %192 : i5
      %193 = arc.sim.get_port %arg0, "s5_b" : i5, !arc.sim.instance<@TestComparisonAllOperators_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s5_b\22}", %193 : i5
      %194 = comb.icmp slt %192, %193 : i5
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22s5: -16 < 15\22, \22line\22: 94, \22column\22: 12, \22condition\22: \22s5_a < s5_b\22, \22scope\22: \22TestComparisonAllOperators\22}", %194 : i1
    }
    return
  }
}