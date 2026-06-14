module {



  hw.module @TestDivisionTruncation_Harness(in %clk : !seq.clock, in %rst : i1, in %n_a_poke_val : i8, in %n_a_poke_en : i1, in %n_b_poke_val : i8, in %n_b_poke_en : i1, in %n_c_poke_val : i8, in %n_c_poke_en : i1, in %neg_1_poke_val : i8, in %neg_1_poke_en : i1, in %p_a_poke_val : i8, in %p_a_poke_en : i1, in %p_b_poke_val : i8, in %p_b_poke_en : i1, in %p_c_poke_val : i8, in %p_c_poke_en : i1, in %s16_a_poke_val : i16, in %s16_a_poke_en : i1, in %s16_b_poke_val : i16, in %s16_b_poke_en : i1, in %s64_a_poke_val : i64, in %s64_a_poke_en : i1, in %s64_b_poke_val : i64, in %s64_b_poke_en : i1, in %s8_min_poke_val : i8, in %s8_min_poke_en : i1, in %val_poke_val : i8, in %val_poke_en : i1, out n_a : i8, out n_b : i8, out n_c : i8, out neg_1 : i8, out p_a : i8, out p_b : i8, out p_c : i8, out s16_a : i16, out s16_b : i16, out s64_a : i64, out s64_b : i64, out s8_min : i8, out val : i8) {
    %c42_i8 = hw.constant 42 : i8
    %c3000000000000000000_i64 = hw.constant 3000000000000000000 : i64
    %c9000000000000000000_i64 = hw.constant 9000000000000000000 : i64
    %c333_i10 = hw.constant 333 : i10
    %c1000_i16 = hw.constant 1000 : i16
    %c1_i2 = hw.constant 1 : i2
    %c7_i4 = hw.constant 7 : i4
    %c3_i3 = hw.constant 3 : i3
    %c1_i8 = hw.constant 1 : i8
    %c3_i8 = hw.constant 3 : i8
    %c0_i8 = hw.constant 0 : i8
    %c-128_i8 = hw.constant -128 : i8
    %c0_i64 = hw.constant 0 : i64
    %c0_i10 = hw.constant 0 : i10
    %c0_i2 = hw.constant 0 : i2
    %c0_i4 = hw.constant 0 : i4
    %c0_i3 = hw.constant 0 : i3
    %c7_i8 = hw.constant 7 : i8
    %false = hw.constant false
    %0 = comb.concat %false, %c0_i3 : i1, i3
    %false_0 = hw.constant false
    %1 = comb.concat %false_0, %c3_i3 : i1, i3
    %2 = comb.sub %0, %1 : i4
    %3 = comb.extract %2 from 0 : (i4) -> i3
    %4 = comb.extract %3 from 2 : (i3) -> i1
    %5 = comb.replicate %4 : (i1) -> i5
    %6 = comb.concat %5, %3 : i5, i3
    %false_1 = hw.constant false
    %7 = comb.concat %false_1, %c0_i4 : i1, i4
    %false_2 = hw.constant false
    %8 = comb.concat %false_2, %c7_i4 : i1, i4
    %9 = comb.sub %7, %8 : i5
    %10 = comb.extract %9 from 0 : (i5) -> i4
    %11 = comb.extract %10 from 3 : (i4) -> i1
    %12 = comb.replicate %11 : (i1) -> i4
    %13 = comb.concat %12, %10 : i4, i4
    %false_3 = hw.constant false
    %14 = comb.concat %false_3, %c0_i2 : i1, i2
    %false_4 = hw.constant false
    %15 = comb.concat %false_4, %c1_i2 : i1, i2
    %16 = comb.sub %14, %15 : i3
    %17 = comb.extract %16 from 0 : (i3) -> i2
    %18 = comb.extract %17 from 1 : (i2) -> i1
    %19 = comb.replicate %18 : (i1) -> i6
    %20 = comb.concat %19, %17 : i6, i2
    %false_5 = hw.constant false
    %21 = comb.concat %false_5, %c0_i10 : i1, i10
    %false_6 = hw.constant false
    %22 = comb.concat %false_6, %c333_i10 : i1, i10
    %23 = comb.sub %21, %22 : i11
    %24 = comb.extract %23 from 0 : (i11) -> i10
    %25 = comb.extract %24 from 9 : (i10) -> i1
    %26 = comb.replicate %25 : (i1) -> i6
    %27 = comb.concat %26, %24 : i6, i10
    %false_7 = hw.constant false
    %28 = comb.concat %false_7, %c0_i64 : i1, i64
    %false_8 = hw.constant false
    %29 = comb.concat %false_8, %c9000000000000000000_i64 : i1, i64
    %30 = comb.sub %28, %29 : i65
    %false_9 = hw.constant false
    %31 = comb.concat %false_9, %c0_i8 : i1, i8
    %true = hw.constant true
    %32 = comb.concat %true, %c-128_i8 : i1, i8
    %33 = comb.sub %31, %32 : i9
    %34 = comb.extract %30 from 0 : (i65) -> i64
    %35 = comb.extract %33 from 0 : (i9) -> i8
    %36 = comb.mux %n_a_poke_en, %n_a_poke_val, %13 : i8
    %37 = comb.mux %n_b_poke_en, %n_b_poke_val, %6 : i8
    %38 = comb.mux %n_c_poke_en, %n_c_poke_val, %20 : i8
    %39 = comb.mux %neg_1_poke_en, %neg_1_poke_val, %20 : i8
    %40 = comb.mux %p_a_poke_en, %p_a_poke_val, %c7_i8 : i8
    %41 = comb.mux %p_b_poke_en, %p_b_poke_val, %c3_i8 : i8
    %42 = comb.mux %p_c_poke_en, %p_c_poke_val, %c1_i8 : i8
    %43 = comb.mux %s16_a_poke_en, %s16_a_poke_val, %c1000_i16 : i16
    %44 = comb.mux %s16_b_poke_en, %s16_b_poke_val, %27 : i16
    %45 = comb.mux %s64_a_poke_en, %s64_a_poke_val, %34 : i64
    %46 = comb.mux %s64_b_poke_en, %s64_b_poke_val, %c3000000000000000000_i64 : i64
    %47 = comb.mux %s8_min_poke_en, %s8_min_poke_val, %35 : i8
    %48 = comb.mux %val_poke_en, %val_poke_val, %c42_i8 : i8
    hw.output %36, %37, %38, %39, %40, %41, %42, %43, %44, %45, %46, %47, %48 : i8, i8, i8, i8, i8, i8, i8, i16, i16, i64, i64, i8, i8
  }
  func.func @entry() {
    %c3_i6 = hw.constant 3 : i6
    %c12_i6 = hw.constant 12 : i6
    %c4_i6 = hw.constant 4 : i6
    %c12_i5 = hw.constant 12 : i5
    %c3_i5 = hw.constant 3 : i5
    %c4_i4 = hw.constant 4 : i4
    %c5_i6 = hw.constant 5 : i6
    %c10_i5 = hw.constant 10 : i5
    %c0_i6 = hw.constant 0 : i6
    %c10_i6 = hw.constant 10 : i6
    %c0_i5 = hw.constant 0 : i5
    %c5_i4 = hw.constant 5 : i4
    %c128_i9 = hw.constant 128 : i9
    %c42_i7 = hw.constant 42 : i7
    %c1_i2 = hw.constant 1 : i2
    %c42_i9 = hw.constant 42 : i9
    %c1_i9 = hw.constant 1 : i9
    %c3_i3 = hw.constant 3 : i3
    %c0_i9 = hw.constant 0 : i9
    %c2_i9 = hw.constant 2 : i9
    %c-4_i3 = hw.constant -4 : i3
    %c-4_i4 = hw.constant -4 : i4
    %c0_i5_0 = hw.constant 0 : i5
    %c0_i4 = hw.constant 0 : i4
    %c-6_i4 = hw.constant -6 : i4
    %c0_i7 = hw.constant 0 : i7
    %c0_i3 = hw.constant 0 : i3
    %c0_i2 = hw.constant 0 : i2
    %c-2_i2 = hw.constant -2 : i2
    %true = hw.constant true
    %false = hw.constant false
    %0 = seq.const_clock high
    %1 = seq.const_clock low
    arc.sim.instantiate @TestDivisionTruncation_Harness as %arg0 {
      arc.sim.set_input %arg0, "n_a_poke_en" = %false : i1, !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.set_input %arg0, "n_b_poke_en" = %false : i1, !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.set_input %arg0, "n_c_poke_en" = %false : i1, !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.set_input %arg0, "neg_1_poke_en" = %false : i1, !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.set_input %arg0, "p_a_poke_en" = %false : i1, !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.set_input %arg0, "p_b_poke_en" = %false : i1, !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.set_input %arg0, "p_c_poke_en" = %false : i1, !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.set_input %arg0, "s16_a_poke_en" = %false : i1, !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.set_input %arg0, "s16_b_poke_en" = %false : i1, !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.set_input %arg0, "s64_a_poke_en" = %false : i1, !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.set_input %arg0, "s64_b_poke_en" = %false : i1, !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.set_input %arg0, "s8_min_poke_en" = %false : i1, !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.set_input %arg0, "val_poke_en" = %false : i1, !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.set_input %arg0, "rst" = %false : i1, !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestDivisionTruncation_Harness>
      %2 = arc.sim.get_port %arg0, "p_b" : i8, !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22p_b\22}", %2 : i8
      %3 = arc.sim.get_port %arg0, "p_a" : i8, !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22p_a\22}", %3 : i8
      %4 = comb.extract %3 from 7 : (i8) -> i1
      %5 = comb.concat %4, %3 : i1, i8
      %6 = comb.extract %2 from 7 : (i8) -> i1
      %7 = comb.concat %6, %2 : i1, i8
      %8 = comb.extract %5 from 8 : (i9) -> i1
      %9 = comb.concat %8, %5 : i1, i9
      %10 = comb.extract %7 from 8 : (i9) -> i1
      %11 = comb.concat %10, %7 : i1, i9
      %12 = comb.divs %9, %11 : i10
      %13 = comb.extract %12 from 0 : (i10) -> i9
      %14 = comb.icmp eq %13, %c2_i9 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \227 / 3 = 2\22, \22line\22: 10, \22column\22: 12, \22condition\22: \22p_a / p_b == 2\22, \22scope\22: \22TestDivisionTruncation\22}", %14 : i1
      %15 = arc.sim.get_port %arg0, "p_b" : i8, !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22p_b\22}", %15 : i8
      %16 = arc.sim.get_port %arg0, "p_c" : i8, !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22p_c\22}", %16 : i8
      %17 = comb.extract %16 from 7 : (i8) -> i1
      %18 = comb.concat %17, %16 : i1, i8
      %19 = comb.extract %15 from 7 : (i8) -> i1
      %20 = comb.concat %19, %15 : i1, i8
      %21 = comb.extract %18 from 8 : (i9) -> i1
      %22 = comb.concat %21, %18 : i1, i9
      %23 = comb.extract %20 from 8 : (i9) -> i1
      %24 = comb.concat %23, %20 : i1, i9
      %25 = comb.divs %22, %24 : i10
      %26 = comb.extract %25 from 0 : (i10) -> i9
      %27 = comb.icmp eq %26, %c0_i9 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \221 / 3 = 0\22, \22line\22: 13, \22column\22: 12, \22condition\22: \22p_c / p_b == 0\22, \22scope\22: \22TestDivisionTruncation\22}", %27 : i1
      %28 = arc.sim.get_port %arg0, "p_a" : i8, !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22p_a\22}", %28 : i8
      %29 = arc.sim.get_port %arg0, "n_b" : i8, !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22n_b\22}", %29 : i8
      %30 = comb.extract %28 from 7 : (i8) -> i1
      %31 = comb.concat %30, %28 : i1, i8
      %32 = comb.extract %29 from 7 : (i8) -> i1
      %33 = comb.concat %32, %29 : i1, i8
      %34 = comb.extract %31 from 8 : (i9) -> i1
      %35 = comb.concat %34, %31 : i1, i9
      %36 = comb.extract %33 from 8 : (i9) -> i1
      %37 = comb.concat %36, %33 : i1, i9
      %38 = comb.divs %35, %37 : i10
      %39 = comb.extract %38 from 0 : (i10) -> i9
      %false_1 = hw.constant false
      %40 = comb.concat %false_1, %c0_i2 : i1, i2
      %true_2 = hw.constant true
      %41 = comb.concat %true_2, %c-2_i2 : i1, i2
      %42 = comb.sub %40, %41 : i3
      %43 = comb.extract %42 from 0 : (i3) -> i2
      %44 = comb.extract %43 from 1 : (i2) -> i1
      %45 = comb.replicate %44 : (i1) -> i7
      %46 = comb.concat %45, %43 : i7, i2
      %47 = comb.icmp eq %39, %46 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \227 / -3 = -2\22, \22line\22: 17, \22column\22: 12, \22condition\22: \22p_a / n_b == - 2\22, \22scope\22: \22TestDivisionTruncation\22}", %47 : i1
      %48 = arc.sim.get_port %arg0, "p_c" : i8, !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22p_c\22}", %48 : i8
      %49 = arc.sim.get_port %arg0, "n_b" : i8, !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22n_b\22}", %49 : i8
      %50 = comb.extract %48 from 7 : (i8) -> i1
      %51 = comb.concat %50, %48 : i1, i8
      %52 = comb.extract %49 from 7 : (i8) -> i1
      %53 = comb.concat %52, %49 : i1, i8
      %54 = comb.extract %51 from 8 : (i9) -> i1
      %55 = comb.concat %54, %51 : i1, i9
      %56 = comb.extract %53 from 8 : (i9) -> i1
      %57 = comb.concat %56, %53 : i1, i9
      %58 = comb.divs %55, %57 : i10
      %59 = comb.extract %58 from 0 : (i10) -> i9
      %60 = comb.icmp eq %59, %c0_i9 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \221 / -3 = 0\22, \22line\22: 18, \22column\22: 12, \22condition\22: \22p_c / n_b == 0\22, \22scope\22: \22TestDivisionTruncation\22}", %60 : i1
      %61 = arc.sim.get_port %arg0, "p_b" : i8, !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22p_b\22}", %61 : i8
      %62 = arc.sim.get_port %arg0, "n_a" : i8, !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22n_a\22}", %62 : i8
      %63 = comb.extract %62 from 7 : (i8) -> i1
      %64 = comb.concat %63, %62 : i1, i8
      %65 = comb.extract %61 from 7 : (i8) -> i1
      %66 = comb.concat %65, %61 : i1, i8
      %67 = comb.extract %64 from 8 : (i9) -> i1
      %68 = comb.concat %67, %64 : i1, i9
      %69 = comb.extract %66 from 8 : (i9) -> i1
      %70 = comb.concat %69, %66 : i1, i9
      %71 = comb.divs %68, %70 : i10
      %72 = comb.extract %71 from 0 : (i10) -> i9
      %73 = comb.icmp eq %72, %46 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22-7 / 3 = -2\22, \22line\22: 22, \22column\22: 12, \22condition\22: \22n_a / p_b == - 2\22, \22scope\22: \22TestDivisionTruncation\22}", %73 : i1
      %74 = arc.sim.get_port %arg0, "n_c" : i8, !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22n_c\22}", %74 : i8
      %75 = arc.sim.get_port %arg0, "p_b" : i8, !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22p_b\22}", %75 : i8
      %76 = comb.extract %74 from 7 : (i8) -> i1
      %77 = comb.concat %76, %74 : i1, i8
      %78 = comb.extract %75 from 7 : (i8) -> i1
      %79 = comb.concat %78, %75 : i1, i8
      %80 = comb.extract %77 from 8 : (i9) -> i1
      %81 = comb.concat %80, %77 : i1, i9
      %82 = comb.extract %79 from 8 : (i9) -> i1
      %83 = comb.concat %82, %79 : i1, i9
      %84 = comb.divs %81, %83 : i10
      %85 = comb.extract %84 from 0 : (i10) -> i9
      %86 = comb.icmp eq %85, %c0_i9 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22-1 / 3 = 0\22, \22line\22: 25, \22column\22: 12, \22condition\22: \22n_c / p_b == 0\22, \22scope\22: \22TestDivisionTruncation\22}", %86 : i1
      %87 = arc.sim.get_port %arg0, "n_a" : i8, !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22n_a\22}", %87 : i8
      %88 = arc.sim.get_port %arg0, "n_b" : i8, !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22n_b\22}", %88 : i8
      %89 = comb.extract %87 from 7 : (i8) -> i1
      %90 = comb.concat %89, %87 : i1, i8
      %91 = comb.extract %88 from 7 : (i8) -> i1
      %92 = comb.concat %91, %88 : i1, i8
      %93 = comb.extract %90 from 8 : (i9) -> i1
      %94 = comb.concat %93, %90 : i1, i9
      %95 = comb.extract %92 from 8 : (i9) -> i1
      %96 = comb.concat %95, %92 : i1, i9
      %97 = comb.divs %94, %96 : i10
      %98 = comb.extract %97 from 0 : (i10) -> i9
      %99 = comb.icmp eq %98, %c2_i9 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22-7 / -3 = 2\22, \22line\22: 28, \22column\22: 12, \22condition\22: \22n_a / n_b == 2\22, \22scope\22: \22TestDivisionTruncation\22}", %99 : i1
      %100 = arc.sim.get_port %arg0, "n_c" : i8, !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22n_c\22}", %100 : i8
      %101 = arc.sim.get_port %arg0, "n_b" : i8, !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22n_b\22}", %101 : i8
      %102 = comb.extract %100 from 7 : (i8) -> i1
      %103 = comb.concat %102, %100 : i1, i8
      %104 = comb.extract %101 from 7 : (i8) -> i1
      %105 = comb.concat %104, %101 : i1, i8
      %106 = comb.extract %103 from 8 : (i9) -> i1
      %107 = comb.concat %106, %103 : i1, i9
      %108 = comb.extract %105 from 8 : (i9) -> i1
      %109 = comb.concat %108, %105 : i1, i9
      %110 = comb.divs %107, %109 : i10
      %111 = comb.extract %110 from 0 : (i10) -> i9
      %112 = comb.icmp eq %111, %c0_i9 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22-1 / -3 = 0\22, \22line\22: 29, \22column\22: 12, \22condition\22: \22n_c / n_b == 0\22, \22scope\22: \22TestDivisionTruncation\22}", %112 : i1
      %113 = arc.sim.get_port %arg0, "s16_a" : i16, !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s16_a\22}", %113 : i16
      %114 = arc.sim.get_port %arg0, "s16_b" : i16, !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s16_b\22}", %114 : i16
      %115 = comb.extract %113 from 15 : (i16) -> i1
      %116 = comb.concat %115, %113 : i1, i16
      %117 = comb.extract %114 from 15 : (i16) -> i1
      %118 = comb.concat %117, %114 : i1, i16
      %119 = comb.extract %116 from 16 : (i17) -> i1
      %120 = comb.concat %119, %116 : i1, i17
      %121 = comb.extract %118 from 16 : (i17) -> i1
      %122 = comb.concat %121, %118 : i1, i17
      %123 = comb.divs %120, %122 : i18
      %124 = comb.extract %123 from 0 : (i18) -> i17
      %false_3 = hw.constant false
      %125 = comb.concat %false_3, %c0_i3 : i1, i3
      %false_4 = hw.constant false
      %126 = comb.concat %false_4, %c3_i3 : i1, i3
      %127 = comb.sub %125, %126 : i4
      %128 = comb.extract %127 from 0 : (i4) -> i3
      %129 = comb.extract %128 from 2 : (i3) -> i1
      %130 = comb.replicate %129 : (i1) -> i14
      %131 = comb.concat %130, %128 : i14, i3
      %132 = comb.icmp eq %124, %131 : i17
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \221000 / -333 = -3\22, \22line\22: 34, \22column\22: 12, \22condition\22: \22s16_a / s16_b == - 3\22, \22scope\22: \22TestDivisionTruncation\22}", %132 : i1
      %133 = arc.sim.get_port %arg0, "s64_b" : i64, !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s64_b\22}", %133 : i64
      %134 = arc.sim.get_port %arg0, "s64_a" : i64, !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s64_a\22}", %134 : i64
      %135 = comb.extract %134 from 63 : (i64) -> i1
      %136 = comb.concat %135, %134 : i1, i64
      %137 = comb.extract %133 from 63 : (i64) -> i1
      %138 = comb.concat %137, %133 : i1, i64
      %139 = comb.extract %136 from 64 : (i65) -> i1
      %140 = comb.concat %139, %136 : i1, i65
      %141 = comb.extract %138 from 64 : (i65) -> i1
      %142 = comb.concat %141, %138 : i1, i65
      %143 = comb.divs %140, %142 : i66
      %144 = comb.extract %143 from 0 : (i66) -> i65
      %145 = comb.replicate %129 : (i1) -> i62
      %146 = comb.concat %145, %128 : i62, i3
      %147 = comb.icmp eq %144, %146 : i65
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Large s64 division\22, \22line\22: 38, \22column\22: 12, \22condition\22: \22s64_a / s64_b == - 3\22, \22scope\22: \22TestDivisionTruncation\22}", %147 : i1
      %148 = arc.sim.get_port %arg0, "val" : i8, !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22val\22}", %148 : i8
      %149 = comb.extract %148 from 7 : (i8) -> i1
      %150 = comb.concat %149, %148 : i1, i8
      %151 = comb.extract %150 from 8 : (i9) -> i1
      %152 = comb.concat %151, %150 : i1, i9
      %false_5 = hw.constant false
      %153 = comb.concat %false_5, %c1_i9 : i1, i9
      %154 = comb.divs %152, %153 : i10
      %155 = comb.extract %154 from 0 : (i10) -> i9
      %156 = comb.icmp eq %155, %c42_i9 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22x / 1 = x\22, \22line\22: 42, \22column\22: 12, \22condition\22: \22val / 1 == 42\22, \22scope\22: \22TestDivisionTruncation\22}", %156 : i1
      %157 = arc.sim.get_port %arg0, "val" : i8, !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22val\22}", %157 : i8
      %false_6 = hw.constant false
      %158 = comb.concat %false_6, %c0_i2 : i1, i2
      %false_7 = hw.constant false
      %159 = comb.concat %false_7, %c1_i2 : i1, i2
      %160 = comb.sub %158, %159 : i3
      %161 = comb.extract %160 from 0 : (i3) -> i2
      %162 = comb.extract %157 from 7 : (i8) -> i1
      %163 = comb.concat %162, %157 : i1, i8
      %164 = comb.extract %161 from 1 : (i2) -> i1
      %165 = comb.replicate %164 : (i1) -> i7
      %166 = comb.concat %165, %161 : i7, i2
      %167 = comb.extract %163 from 8 : (i9) -> i1
      %168 = comb.concat %167, %163 : i1, i9
      %169 = comb.extract %166 from 8 : (i9) -> i1
      %170 = comb.concat %169, %166 : i1, i9
      %171 = comb.divs %168, %170 : i10
      %172 = comb.extract %171 from 0 : (i10) -> i9
      %false_8 = hw.constant false
      %173 = comb.concat %false_8, %c0_i7 : i1, i7
      %false_9 = hw.constant false
      %174 = comb.concat %false_9, %c42_i7 : i1, i7
      %175 = comb.sub %173, %174 : i8
      %176 = comb.extract %175 from 0 : (i8) -> i7
      %177 = comb.extract %176 from 6 : (i7) -> i1
      %178 = comb.replicate %177 : (i1) -> i2
      %179 = comb.concat %178, %176 : i2, i7
      %180 = comb.icmp eq %172, %179 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22x / -1 = -x\22, \22line\22: 43, \22column\22: 12, \22condition\22: \22val / - 1 == - 42\22, \22scope\22: \22TestDivisionTruncation\22}", %180 : i1
      %181 = arc.sim.get_port %arg0, "neg_1" : i8, !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22neg_1\22}", %181 : i8
      %182 = arc.sim.get_port %arg0, "s8_min" : i8, !arc.sim.instance<@TestDivisionTruncation_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s8_min\22}", %182 : i8
      %183 = comb.extract %182 from 7 : (i8) -> i1
      %184 = comb.concat %183, %182 : i1, i8
      %185 = comb.extract %181 from 7 : (i8) -> i1
      %186 = comb.concat %185, %181 : i1, i8
      %187 = comb.extract %184 from 8 : (i9) -> i1
      %188 = comb.concat %187, %184 : i1, i9
      %189 = comb.extract %186 from 8 : (i9) -> i1
      %190 = comb.concat %189, %186 : i1, i9
      %191 = comb.divs %188, %190 : i10
      %192 = comb.extract %191 from 0 : (i10) -> i9
      %193 = comb.icmp eq %192, %c128_i9 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22-128 / -1 is 128\22, \22line\22: 48, \22column\22: 12, \22condition\22: \22s8_min / neg_1 == 128\22, \22scope\22: \22TestDivisionTruncation\22}", %193 : i1
      %194 = comb.divu %c5_i4, %c-6_i4 : i4
      %195 = comb.concat %false, %194 : i1, i4
      %196 = comb.icmp eq %195, %c0_i5 : i5
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \225 / 10 = 0\22, \22line\22: 51, \22column\22: 12, \22condition\22: \225 / 10 == 0\22, \22scope\22: \22TestDivisionTruncation\22}", %196 : i1
      %false_10 = hw.constant false
      %197 = comb.concat %false_10, %c0_i4 : i1, i4
      %false_11 = hw.constant false
      %198 = comb.concat %false_11, %c5_i4 : i1, i4
      %199 = comb.sub %197, %198 : i5
      %200 = comb.extract %199 from 0 : (i5) -> i4
      %201 = comb.extract %200 from 3 : (i4) -> i1
      %202 = comb.replicate %201 : (i1) -> i2
      %203 = comb.concat %202, %200 : i2, i4
      %204 = comb.extract %203 from 5 : (i6) -> i1
      %205 = comb.concat %204, %203 : i1, i6
      %false_12 = hw.constant false
      %206 = comb.concat %false_12, %c10_i6 : i1, i6
      %207 = comb.divs %205, %206 : i7
      %208 = comb.extract %207 from 0 : (i7) -> i6
      %209 = comb.icmp eq %208, %c0_i6 : i6
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22-5 / 10 = 0\22, \22line\22: 52, \22column\22: 12, \22condition\22: \22- 5 / 10 == 0\22, \22scope\22: \22TestDivisionTruncation\22}", %209 : i1
      %false_13 = hw.constant false
      %210 = comb.concat %false_13, %c0_i5_0 : i1, i5
      %false_14 = hw.constant false
      %211 = comb.concat %false_14, %c10_i5 : i1, i5
      %212 = comb.sub %210, %211 : i6
      %213 = comb.extract %212 from 0 : (i6) -> i5
      %214 = comb.extract %213 from 4 : (i5) -> i1
      %215 = comb.concat %214, %213 : i1, i5
      %false_15 = hw.constant false
      %216 = comb.concat %false_15, %c5_i6 : i1, i6
      %217 = comb.extract %215 from 5 : (i6) -> i1
      %218 = comb.concat %217, %215 : i1, i6
      %219 = comb.divs %216, %218 : i7
      %220 = comb.extract %219 from 0 : (i7) -> i6
      %221 = comb.icmp eq %220, %c0_i6 : i6
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \225 / -10 = 0\22, \22line\22: 53, \22column\22: 12, \22condition\22: \225 / - 10 == 0\22, \22scope\22: \22TestDivisionTruncation\22}", %221 : i1
      %222 = comb.extract %203 from 5 : (i6) -> i1
      %223 = comb.concat %222, %203 : i1, i6
      %224 = comb.extract %215 from 5 : (i6) -> i1
      %225 = comb.concat %224, %215 : i1, i6
      %226 = comb.divs %223, %225 : i7
      %227 = comb.extract %226 from 0 : (i7) -> i6
      %228 = comb.icmp eq %227, %c0_i6 : i6
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22-5 / -10 = 0\22, \22line\22: 54, \22column\22: 12, \22condition\22: \22- 5 / - 10 == 0\22, \22scope\22: \22TestDivisionTruncation\22}", %228 : i1
      %229 = comb.divu %c-4_i4, %c4_i4 : i4
      %230 = comb.concat %false, %229 : i1, i4
      %231 = comb.icmp eq %230, %c3_i5 : i5
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \2212 / 4 = 3\22, \22line\22: 57, \22column\22: 12, \22condition\22: \2212 / 4 == 3\22, \22scope\22: \22TestDivisionTruncation\22}", %231 : i1
      %false_16 = hw.constant false
      %232 = comb.concat %false_16, %c0_i5_0 : i1, i5
      %false_17 = hw.constant false
      %233 = comb.concat %false_17, %c12_i5 : i1, i5
      %234 = comb.sub %232, %233 : i6
      %235 = comb.extract %234 from 0 : (i6) -> i5
      %236 = comb.extract %235 from 4 : (i5) -> i1
      %237 = comb.concat %236, %235 : i1, i5
      %238 = comb.extract %237 from 5 : (i6) -> i1
      %239 = comb.concat %238, %237 : i1, i6
      %false_18 = hw.constant false
      %240 = comb.concat %false_18, %c4_i6 : i1, i6
      %241 = comb.divs %239, %240 : i7
      %242 = comb.extract %241 from 0 : (i7) -> i6
      %243 = comb.replicate %129 : (i1) -> i3
      %244 = comb.concat %243, %128 : i3, i3
      %245 = comb.icmp eq %242, %244 : i6
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22-12 / 4 = -3\22, \22line\22: 58, \22column\22: 12, \22condition\22: \22- 12 / 4 == - 3\22, \22scope\22: \22TestDivisionTruncation\22}", %245 : i1
      %false_19 = hw.constant false
      %246 = comb.concat %false_19, %c0_i3 : i1, i3
      %true_20 = hw.constant true
      %247 = comb.concat %true_20, %c-4_i3 : i1, i3
      %248 = comb.sub %246, %247 : i4
      %249 = comb.extract %248 from 0 : (i4) -> i3
      %250 = comb.extract %249 from 2 : (i3) -> i1
      %251 = comb.replicate %250 : (i1) -> i3
      %252 = comb.concat %251, %249 : i3, i3
      %false_21 = hw.constant false
      %253 = comb.concat %false_21, %c12_i6 : i1, i6
      %254 = comb.extract %252 from 5 : (i6) -> i1
      %255 = comb.concat %254, %252 : i1, i6
      %256 = comb.divs %253, %255 : i7
      %257 = comb.extract %256 from 0 : (i7) -> i6
      %258 = comb.icmp eq %257, %244 : i6
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \2212 / -4 = -3\22, \22line\22: 59, \22column\22: 12, \22condition\22: \2212 / - 4 == - 3\22, \22scope\22: \22TestDivisionTruncation\22}", %258 : i1
      %259 = comb.extract %237 from 5 : (i6) -> i1
      %260 = comb.concat %259, %237 : i1, i6
      %261 = comb.extract %252 from 5 : (i6) -> i1
      %262 = comb.concat %261, %252 : i1, i6
      %263 = comb.divs %260, %262 : i7
      %264 = comb.extract %263 from 0 : (i7) -> i6
      %265 = comb.icmp eq %264, %c3_i6 : i6
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22-12 / -4 = 3\22, \22line\22: 60, \22column\22: 12, \22condition\22: \22- 12 / - 4 == 3\22, \22scope\22: \22TestDivisionTruncation\22}", %265 : i1
    }
    return
  }
}