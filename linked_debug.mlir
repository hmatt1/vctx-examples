module {



  hw.module private @components_utils_math_ALU(in %clk : !seq.clock, in %rst : i1, in %a : i8, in %b : i8, in %op : i4, out result : i8, out zero : i1, out negative : i1, out carry : i1, out overflow : i1) {
    %c-1_i3 = hw.constant -1 : i3
    %c-2_i3 = hw.constant -2 : i3
    %c-3_i3 = hw.constant -3 : i3
    %c-4_i3 = hw.constant -4 : i3
    %c-1_i2 = hw.constant -1 : i2
    %c-2_i2 = hw.constant -2 : i2
    %c0_i8 = hw.constant 0 : i8
    %true = hw.constant true
    %true_0 = hw.constant true
    %c-1_i8 = hw.constant -1 : i8
    %false = hw.constant false
    %false_1 = hw.constant false
    %0 = comb.concat %false_1, %a : i1, i8
    %false_2 = hw.constant false
    %1 = comb.concat %false_2, %b : i1, i8
    %false_3 = hw.constant false
    %2 = comb.concat %false_3, %0 : i1, i9
    %false_4 = hw.constant false
    %3 = comb.concat %false_4, %1 : i1, i9
    %4 = comb.add %2, %3 : i10
    %5 = comb.extract %4 from 0 : (i10) -> i9
    %false_5 = hw.constant false
    %6 = comb.concat %false_5, %a : i1, i8
    %false_6 = hw.constant false
    %7 = comb.concat %false_6, %b : i1, i8
    %8 = comb.extract %6 from 8 : (i9) -> i1
    %9 = comb.concat %8, %6 : i1, i9
    %10 = comb.extract %7 from 8 : (i9) -> i1
    %11 = comb.concat %10, %7 : i1, i9
    %12 = comb.sub %9, %11 : i10
    %13 = comb.extract %12 from 0 : (i10) -> i9
    %c0_i8_7 = hw.constant 0 : i8
    %14 = comb.concat %c0_i8_7, %false : i8, i1
    %15 = comb.shru %5, %14 : i9
    %16 = comb.extract %15 from 0 : (i9) -> i8
    %17 = comb.shru %13, %14 : i9
    %18 = comb.extract %17 from 0 : (i9) -> i8
    %19 = comb.and %a, %b : i8
    %20 = comb.or %a, %b : i8
    %21 = comb.xor %a, %b : i8
    %false_8 = hw.constant false
    %22 = comb.concat %false_8, %c-1_i8 : i1, i8
    %false_9 = hw.constant false
    %23 = comb.concat %false_9, %a : i1, i8
    %24 = comb.sub %22, %23 : i9
    %25 = comb.extract %24 from 0 : (i9) -> i8
    %c0_i7 = hw.constant 0 : i7
    %26 = comb.concat %c0_i7, %true_0 : i7, i1
    %27 = comb.shl %a, %26 : i8
    %28 = comb.shru %a, %26 : i8
    %29 = comb.extract %a from 7 : (i8) -> i1
    %30 = comb.extract %b from 7 : (i8) -> i1
    %31 = comb.xor %29, %30 : i1
    %false_10 = hw.constant false
    %32 = comb.concat %false_10, %true : i1, i1
    %false_11 = hw.constant false
    %33 = comb.concat %false_11, %31 : i1, i1
    %34 = comb.sub %32, %33 : i2
    %35 = comb.extract %34 from 0 : (i2) -> i1
    %36 = comb.extract %5 from 7 : (i9) -> i1
    %37 = comb.xor %29, %36 : i1
    %38 = comb.and %35, %37 : i1
    %39 = comb.extract %13 from 7 : (i9) -> i1
    %40 = comb.xor %29, %39 : i1
    %false_12 = hw.constant false
    %41 = comb.concat %false_12, %op : i1, i4
    %c0_i4 = hw.constant 0 : i4
    %42 = comb.concat %c0_i4, %false : i4, i1
    %43 = comb.icmp eq %41, %42 : i5
    %44 = comb.xor %43, %true_0 : i1
    %c0_i4_13 = hw.constant 0 : i4
    %45 = comb.concat %c0_i4_13, %true_0 : i4, i1
    %46 = comb.icmp eq %41, %45 : i5
    %47 = comb.and %44, %46 : i1
    %48 = comb.xor %46, %true_0 : i1
    %49 = comb.and %44, %48 : i1
    %c0_i3 = hw.constant 0 : i3
    %50 = comb.concat %c0_i3, %c-2_i2 : i3, i2
    %51 = comb.icmp eq %41, %50 : i5
    %52 = comb.and %49, %51 : i1
    %53 = comb.xor %51, %true_0 : i1
    %54 = comb.and %49, %53 : i1
    %c0_i3_14 = hw.constant 0 : i3
    %55 = comb.concat %c0_i3_14, %c-1_i2 : i3, i2
    %56 = comb.icmp eq %41, %55 : i5
    %57 = comb.and %54, %56 : i1
    %58 = comb.xor %56, %true_0 : i1
    %59 = comb.and %54, %58 : i1
    %c0_i2 = hw.constant 0 : i2
    %60 = comb.concat %c0_i2, %c-4_i3 : i2, i3
    %61 = comb.icmp eq %41, %60 : i5
    %62 = comb.and %59, %61 : i1
    %63 = comb.xor %61, %true_0 : i1
    %64 = comb.and %59, %63 : i1
    %c0_i2_15 = hw.constant 0 : i2
    %65 = comb.concat %c0_i2_15, %c-3_i3 : i2, i3
    %66 = comb.icmp eq %41, %65 : i5
    %67 = comb.and %64, %66 : i1
    %68 = comb.xor %66, %true_0 : i1
    %69 = comb.and %64, %68 : i1
    %c0_i2_16 = hw.constant 0 : i2
    %70 = comb.concat %c0_i2_16, %c-2_i3 : i2, i3
    %71 = comb.icmp eq %41, %70 : i5
    %72 = comb.and %69, %71 : i1
    %73 = comb.xor %71, %true_0 : i1
    %c0_i2_17 = hw.constant 0 : i2
    %74 = comb.concat %c0_i2_17, %c-1_i3 : i2, i3
    %75 = comb.icmp eq %41, %74 : i5
    %76 = comb.and %69, %73, %75 : i1
    %77 = comb.mux %76, %28, %c0_i8 : i8
    %78 = comb.mux %72, %27, %77 : i8
    %79 = comb.mux %67, %25, %78 : i8
    %80 = comb.mux %62, %21, %79 : i8
    %81 = comb.mux %57, %20, %80 : i8
    %82 = comb.mux %52, %19, %81 : i8
    %83 = comb.mux %47, %18, %82 : i8
    %84 = comb.mux %43, %16, %83 : i8
    %85 = comb.extract %a from 0 : (i8) -> i1
    %86 = comb.and %76, %85 : i1
    %87 = comb.mux %72, %29, %86 : i1
    %88 = comb.xor %67, %true_0 : i1
    %89 = comb.xor %62, %true_0 : i1
    %90 = comb.xor %57, %true_0 : i1
    %91 = comb.xor %52, %true_0 : i1
    %92 = comb.and %91, %90, %89, %88, %87 : i1
    %93 = comb.extract %13 from 8 : (i9) -> i1
    %94 = comb.mux %47, %93, %92 : i1
    %95 = comb.extract %5 from 8 : (i9) -> i1
    %96 = comb.mux %43, %95, %94 : i1
    %97 = comb.and %47, %31, %40 : i1
    %98 = comb.mux %43, %38, %97 : i1
    %false_18 = hw.constant false
    %99 = comb.concat %false_18, %84 : i1, i8
    %c0_i8_19 = hw.constant 0 : i8
    %100 = comb.concat %c0_i8_19, %false : i8, i1
    %101 = comb.icmp eq %99, %100 : i9
    %102 = comb.extract %84 from 7 : (i8) -> i1
    hw.output %84, %101, %102, %96, %98 : i8, i1, i1, i1, i1
  }
  hw.module @TestShr_NoCarry_Harness(in %clk : !seq.clock, in %rst : i1, in %a : i8, in %b : i8, in %op : i4, out a : i8, out b : i8, out carry : i1, out negative : i1, out op : i4, out overflow : i1, out result : i8, out zero : i1) {
    %ALU_inst_457_1.result, %ALU_inst_457_1.zero, %ALU_inst_457_1.negative, %ALU_inst_457_1.carry, %ALU_inst_457_1.overflow = hw.instance "ALU_inst_457_1" sym @ALU_inst_457_1 @components_utils_math_ALU(clk: %clk: !seq.clock, rst: %rst: i1, a: %a: i8, b: %b: i8, op: %op: i4) -> (result: i8, zero: i1, negative: i1, carry: i1, overflow: i1)
    hw.output %a, %b, %ALU_inst_457_1.carry, %ALU_inst_457_1.negative, %op, %ALU_inst_457_1.overflow, %ALU_inst_457_1.result, %ALU_inst_457_1.zero : i8, i8, i1, i1, i4, i1, i8, i1
  }
  func.func @entry() {
    %c-64_i7 = hw.constant -64 : i7
    %c7_i4 = hw.constant 7 : i4
    %c0_i8 = hw.constant 0 : i8
    %c-128_i8 = hw.constant -128 : i8
    %true = hw.constant true
    %false = hw.constant false
    %0 = seq.const_clock high
    %1 = seq.const_clock low
    arc.sim.instantiate @TestShr_NoCarry_Harness as %arg0 {
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@TestShr_NoCarry_Harness>
      arc.sim.set_input %arg0, "a" = %c-128_i8 : i8, !arc.sim.instance<@TestShr_NoCarry_Harness>
      arc.sim.set_input %arg0, "b" = %c0_i8 : i8, !arc.sim.instance<@TestShr_NoCarry_Harness>
      arc.sim.set_input %arg0, "op" = %c7_i4 : i4, !arc.sim.instance<@TestShr_NoCarry_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestShr_NoCarry_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestShr_NoCarry_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestShr_NoCarry_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestShr_NoCarry_Harness>
      arc.sim.set_input %arg0, "rst" = %false : i1, !arc.sim.instance<@TestShr_NoCarry_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestShr_NoCarry_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestShr_NoCarry_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestShr_NoCarry_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestShr_NoCarry_Harness>
      %2 = arc.sim.get_port %arg0, "b" : i8, !arc.sim.instance<@TestShr_NoCarry_Harness>
      arc.sim.emit "b", %2 : i8
      %3 = arc.sim.get_port %arg0, "result" : i8, !arc.sim.instance<@TestShr_NoCarry_Harness>
      arc.sim.emit "result", %3 : i8
      %4 = arc.sim.get_port %arg0, "zero" : i1, !arc.sim.instance<@TestShr_NoCarry_Harness>
      arc.sim.emit "zero", %4 : i1
      %5 = arc.sim.get_port %arg0, "a" : i8, !arc.sim.instance<@TestShr_NoCarry_Harness>
      arc.sim.emit "a", %5 : i8
      %6 = arc.sim.get_port %arg0, "carry" : i1, !arc.sim.instance<@TestShr_NoCarry_Harness>
      arc.sim.emit "carry", %6 : i1
      %7 = arc.sim.get_port %arg0, "overflow" : i1, !arc.sim.instance<@TestShr_NoCarry_Harness>
      arc.sim.emit "overflow", %7 : i1
      %8 = arc.sim.get_port %arg0, "op" : i4, !arc.sim.instance<@TestShr_NoCarry_Harness>
      arc.sim.emit "op", %8 : i4
      %9 = arc.sim.get_port %arg0, "negative" : i1, !arc.sim.instance<@TestShr_NoCarry_Harness>
      arc.sim.emit "negative", %9 : i1
      %10 = arc.sim.get_port %arg0, "result" : i8, !arc.sim.instance<@TestShr_NoCarry_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22result\22}", %10 : i8
      %false_0 = hw.constant false
      %11 = comb.concat %false_0, %10 : i1, i8
      %c0_i2 = hw.constant 0 : i2
      %12 = comb.concat %c0_i2, %c-64_i7 : i2, i7
      %13 = comb.icmp eq %11, %12 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22SHR: 0x80 >> 1 = 0x40\22, \22line\22: 470, \22column\22: 12, \22condition\22: \22result == 0b0100_0000\22, \22scope\22: \22TestShr_NoCarry\22}", %13 : i1
      %14 = arc.sim.get_port %arg0, "carry" : i1, !arc.sim.instance<@TestShr_NoCarry_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22carry\22}", %14 : i1
      %false_1 = hw.constant false
      %15 = comb.concat %false_1, %14 : i1, i1
      %false_2 = hw.constant false
      %16 = comb.concat %false_2, %false : i1, i1
      %17 = comb.icmp eq %15, %16 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22no carry: LSB was 0\22, \22line\22: 471, \22column\22: 12, \22condition\22: \22carry == false\22, \22scope\22: \22TestShr_NoCarry\22}", %17 : i1
      %18 = arc.sim.get_port %arg0, "negative" : i1, !arc.sim.instance<@TestShr_NoCarry_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22negative\22}", %18 : i1
      %false_3 = hw.constant false
      %19 = comb.concat %false_3, %18 : i1, i1
      %20 = comb.icmp eq %19, %16 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22MSB is 0 after right shift\22, \22line\22: 472, \22column\22: 12, \22condition\22: \22negative == false\22, \22scope\22: \22TestShr_NoCarry\22}", %20 : i1
    }
    return
  }
}stance<@TestSub_NoFlags_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22carry\22}", %21 : i1
      %false_4 = hw.constant false
      %22 = comb.concat %false_4, %21 : i1, i1
      %23 = comb.icmp eq %22, %16 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22no borrow: a >= b\22, \22line\22: 209, \22column\22: 12, \22condition\22: \22carry == false\22, \22scope\22: \22TestSub_NoFlags\22}", %23 : i1
      %24 = arc.sim.get_port %arg0, "overflow" : i1, !arc.sim.instance<@TestSub_NoFlags_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22overflow\22}", %24 : i1
      %false_5 = hw.constant false
      %25 = comb.concat %false_5, %24 : i1, i1
      %26 = comb.icmp eq %25, %16 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22no signed overflow\22, \22line\22: 210, \22column\22: 12, \22condition\22: \22overflow == false\22, \22scope\22: \22TestSub_NoFlags\22}", %26 : i1
    }
    return
  }
}