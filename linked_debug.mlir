module {



  hw.module private @sim_sim_poke_all_types_CombinationalEcho(in %clk : !seq.clock, in %rst : i1, in %b_in : i1, in %u8_in : i8, in %s8_in : i8, in %u16_in : i16, in %u5_in : i5, in %s64_in : i64, out b_out : i1, out u8_out : i8, out s8_out : i8, out u16_out : i16, out u5_out : i5, out s64_out : i64) {
    %c1000_i65 = hw.constant 1000 : i65
    %c2_i18 = hw.constant 2 : i18
    %c1_i9 = hw.constant 1 : i9
    %c-1_i5 = hw.constant -1 : i5
    %c0_i2 = hw.constant 0 : i2
    %false = hw.constant false
    %0 = comb.concat %false, %u8_in : i1, i8
    %false_0 = hw.constant false
    %1 = comb.concat %false_0, %0 : i1, i9
    %false_1 = hw.constant false
    %2 = comb.concat %false_1, %c1_i9 : i1, i9
    %3 = comb.add %1, %2 : i10
    %4 = comb.extract %3 from 0 : (i10) -> i9
    %5 = comb.extract %4 from 0 : (i9) -> i8
    %6 = comb.extract %s8_in from 7 : (i8) -> i1
    %7 = comb.concat %6, %s8_in : i1, i8
    %8 = comb.extract %7 from 8 : (i9) -> i1
    %9 = comb.concat %8, %7 : i1, i9
    %false_2 = hw.constant false
    %10 = comb.concat %false_2, %c1_i9 : i1, i9
    %11 = comb.sub %9, %10 : i10
    %12 = comb.extract %11 from 0 : (i10) -> i9
    %13 = comb.extract %12 from 0 : (i9) -> i8
    %14 = comb.concat %c0_i2, %u16_in : i2, i16
    %c0_i18 = hw.constant 0 : i18
    %15 = comb.concat %c0_i18, %14 : i18, i18
    %c0_i18_3 = hw.constant 0 : i18
    %16 = comb.concat %c0_i18_3, %c2_i18 : i18, i18
    %17 = comb.mul %15, %16 : i36
    %18 = comb.extract %17 from 0 : (i36) -> i18
    %19 = comb.extract %18 from 0 : (i18) -> i16
    %20 = comb.xor %u5_in, %c-1_i5 : i5
    %21 = comb.extract %s64_in from 63 : (i64) -> i1
    %22 = comb.concat %21, %s64_in : i1, i64
    %23 = comb.extract %22 from 64 : (i65) -> i1
    %24 = comb.concat %23, %22 : i1, i65
    %false_4 = hw.constant false
    %25 = comb.concat %false_4, %c1000_i65 : i1, i65
    %26 = comb.add %24, %25 : i66
    %27 = comb.extract %26 from 0 : (i66) -> i65
    %28 = comb.extract %27 from 0 : (i65) -> i64
    hw.output %b_in, %5, %13, %19, %20, %28 : i1, i8, i8, i16, i5, i64
  }

  hw.module @TestSimPokeAllTypes_Harness(in %clk : !seq.clock, in %rst : i1, in %b_poke_val : i1, in %b_poke_en : i1, in %b_o_poke_val : i1, in %b_o_poke_en : i1, in %s64_o_poke_val : i64, in %s64_o_poke_en : i1, in %s64v_poke_val : i64, in %s64v_poke_en : i1, in %s8_o_poke_val : i8, in %s8_o_poke_en : i1, in %s8v_poke_val : i8, in %s8v_poke_en : i1, in %u16_o_poke_val : i16, in %u16_o_poke_en : i1, in %u16v_poke_val : i16, in %u16v_poke_en : i1, in %u5_o_poke_val : i5, in %u5_o_poke_en : i1, in %u5v_poke_val : i5, in %u5v_poke_en : i1, in %u8_o_poke_val : i8, in %u8_o_poke_en : i1, in %u8v_poke_val : i8, in %u8v_poke_en : i1, out b : i1, out b_o : i1, out s64_o : i64, out s64v : i64, out s8_o : i8, out s8v : i8, out u16_o : i16, out u16v : i16, out u5_o : i5, out u5v : i5, out u8_o : i8, out u8v : i8) {
    %c0_i64 = hw.constant 0 : i64
    %c0_i5 = hw.constant 0 : i5
    %c0_i16 = hw.constant 0 : i16
    %c0_i8 = hw.constant 0 : i8
    %CombinationalEcho_inst_23_1.b_out, %CombinationalEcho_inst_23_1.u8_out, %CombinationalEcho_inst_23_1.s8_out, %CombinationalEcho_inst_23_1.u16_out, %CombinationalEcho_inst_23_1.u5_out, %CombinationalEcho_inst_23_1.s64_out = hw.instance "CombinationalEcho_inst_23_1" sym @CombinationalEcho_inst_23_1 @sim_sim_poke_all_types_CombinationalEcho(clk: %clk: !seq.clock, rst: %rst: i1, b_in: %0: i1, u8_in: %11: i8, s8_in: %5: i8, u16_in: %7: i16, u5_in: %9: i5, s64_in: %3: i64) -> (b_out: i1, u8_out: i8, s8_out: i8, u16_out: i16, u5_out: i5, s64_out: i64)
    %0 = comb.and %b_poke_en, %b_poke_val : i1
    %1 = comb.mux %b_o_poke_en, %b_o_poke_val, %CombinationalEcho_inst_23_1.b_out : i1
    %2 = comb.mux %s64_o_poke_en, %s64_o_poke_val, %CombinationalEcho_inst_23_1.s64_out : i64
    %3 = comb.mux %s64v_poke_en, %s64v_poke_val, %c0_i64 : i64
    %4 = comb.mux %s8_o_poke_en, %s8_o_poke_val, %CombinationalEcho_inst_23_1.s8_out : i8
    %5 = comb.mux %s8v_poke_en, %s8v_poke_val, %c0_i8 : i8
    %6 = comb.mux %u16_o_poke_en, %u16_o_poke_val, %CombinationalEcho_inst_23_1.u16_out : i16
    %7 = comb.mux %u16v_poke_en, %u16v_poke_val, %c0_i16 : i16
    %8 = comb.mux %u5_o_poke_en, %u5_o_poke_val, %CombinationalEcho_inst_23_1.u5_out : i5
    %9 = comb.mux %u5v_poke_en, %u5v_poke_val, %c0_i5 : i5
    %10 = comb.mux %u8_o_poke_en, %u8_o_poke_val, %CombinationalEcho_inst_23_1.u8_out : i8
    %11 = comb.mux %u8v_poke_en, %u8v_poke_val, %c0_i8 : i8
    hw.output %0, %1, %2, %3, %4, %5, %6, %7, %8, %9, %10, %11 : i1, i1, i64, i64, i8, i8, i16, i16, i5, i5, i8, i8
  }
  func.func @entry() {
    %c0_i9 = hw.constant 0 : i9
    %c8999999999999999000_i64 = hw.constant 8999999999999999000 : i64
    %c9000000000000000000_i64 = hw.constant 9000000000000000000 : i64
    %c21_i6 = hw.constant 21 : i6
    %c10_i5 = hw.constant 10 : i5
    %c8192_i17 = hw.constant 8192 : i17
    %c4096_i16 = hw.constant 4096 : i16
    %c51_i7 = hw.constant 51 : i7
    %c50_i7 = hw.constant 50 : i7
    %c101_i9 = hw.constant 101 : i9
    %c100_i8 = hw.constant 100 : i8
    %c1000_i64 = hw.constant 1000 : i64
    %c31_i6 = hw.constant 31 : i6
    %c0_i17 = hw.constant 0 : i17
    %c1_i2 = hw.constant 1 : i2
    %c1_i9 = hw.constant 1 : i9
    %c0_i2 = hw.constant 0 : i2
    %c0_i64 = hw.constant 0 : i64
    %c0_i5 = hw.constant 0 : i5
    %c0_i16 = hw.constant 0 : i16
    %c0_i8 = hw.constant 0 : i8
    %c-1_i8 = hw.constant -1 : i8
    %c0_i64_0 = hw.constant 0 : i64
    %c0_i7 = hw.constant 0 : i7
    %c0_i2_1 = hw.constant 0 : i2
    %true = hw.constant true
    %false = hw.constant false
    %0 = seq.const_clock high
    %1 = seq.const_clock low
    arc.sim.instantiate @TestSimPokeAllTypes_Harness as %arg0 {
      arc.sim.set_input %arg0, "b_poke_en" = %false : i1, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.set_input %arg0, "b_o_poke_en" = %false : i1, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.set_input %arg0, "s64_o_poke_en" = %false : i1, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.set_input %arg0, "s64v_poke_en" = %false : i1, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.set_input %arg0, "s8_o_poke_en" = %false : i1, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.set_input %arg0, "s8v_poke_en" = %false : i1, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.set_input %arg0, "u16_o_poke_en" = %false : i1, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.set_input %arg0, "u16v_poke_en" = %false : i1, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.set_input %arg0, "u5_o_poke_en" = %false : i1, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.set_input %arg0, "u5v_poke_en" = %false : i1, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.set_input %arg0, "u8_o_poke_en" = %false : i1, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.set_input %arg0, "u8v_poke_en" = %false : i1, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.set_input %arg0, "b_poke_val" = %false : i1, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.set_input %arg0, "b_poke_en" = %true : i1, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.set_input %arg0, "u8v_poke_val" = %c0_i8 : i8, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.set_input %arg0, "u8v_poke_en" = %true : i1, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.set_input %arg0, "s8v_poke_val" = %c0_i8 : i8, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.set_input %arg0, "s8v_poke_en" = %true : i1, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.set_input %arg0, "u16v_poke_val" = %c0_i16 : i16, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.set_input %arg0, "u16v_poke_en" = %true : i1, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.set_input %arg0, "u5v_poke_val" = %c0_i5 : i5, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.set_input %arg0, "u5v_poke_en" = %true : i1, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.set_input %arg0, "s64v_poke_val" = %c0_i64 : i64, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.set_input %arg0, "s64v_poke_en" = %true : i1, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.set_input %arg0, "rst" = %false : i1, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      %2 = arc.sim.get_port %arg0, "b_o" : i1, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22b_o\22}", %2 : i1
      %3 = comb.concat %false, %2 : i1, i1
      %4 = comb.icmp eq %3, %c0_i2 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Init bool\22, \22line\22: 51, \22column\22: 12, \22condition\22: \22b_o == false\22, \22scope\22: \22TestSimPokeAllTypes\22}", %4 : i1
      %5 = arc.sim.get_port %arg0, "u8_o" : i8, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u8_o\22}", %5 : i8
      %6 = comb.concat %false, %5 : i1, i8
      %7 = comb.icmp eq %6, %c1_i9 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Init u8 (0+1)\22, \22line\22: 52, \22column\22: 12, \22condition\22: \22u8_o == 1\22, \22scope\22: \22TestSimPokeAllTypes\22}", %7 : i1
      %8 = arc.sim.get_port %arg0, "s8_o" : i8, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s8_o\22}", %8 : i8
      %false_2 = hw.constant false
      %9 = comb.concat %false_2, %c0_i2_1 : i1, i2
      %false_3 = hw.constant false
      %10 = comb.concat %false_3, %c1_i2 : i1, i2
      %11 = comb.sub %9, %10 : i3
      %12 = comb.extract %11 from 0 : (i3) -> i2
      %13 = comb.extract %12 from 1 : (i2) -> i1
      %14 = comb.replicate %13 : (i1) -> i6
      %15 = comb.concat %14, %12 : i6, i2
      %16 = comb.icmp eq %8, %15 : i8
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Init val_s8 (0-1)\22, \22line\22: 53, \22column\22: 12, \22condition\22: \22s8_o == - 1\22, \22scope\22: \22TestSimPokeAllTypes\22}", %16 : i1
      %17 = arc.sim.get_port %arg0, "u16_o" : i16, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u16_o\22}", %17 : i16
      %18 = comb.concat %false, %17 : i1, i16
      %19 = comb.icmp eq %18, %c0_i17 : i17
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Init u16 (0*2)\22, \22line\22: 54, \22column\22: 12, \22condition\22: \22u16_o == 0\22, \22scope\22: \22TestSimPokeAllTypes\22}", %19 : i1
      %20 = arc.sim.get_port %arg0, "u5_o" : i5, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u5_o\22}", %20 : i5
      %21 = comb.concat %false, %20 : i1, i5
      %22 = comb.icmp eq %21, %c31_i6 : i6
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Init u5 (0^1F)\22, \22line\22: 55, \22column\22: 12, \22condition\22: \22u5_o == 0x1F\22, \22scope\22: \22TestSimPokeAllTypes\22}", %22 : i1
      %23 = arc.sim.get_port %arg0, "s64_o" : i64, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s64_o\22}", %23 : i64
      %24 = comb.icmp eq %23, %c1000_i64 : i64
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Init s64 (0+1000)\22, \22line\22: 56, \22column\22: 12, \22condition\22: \22s64_o == 1000\22, \22scope\22: \22TestSimPokeAllTypes\22}", %24 : i1
      arc.sim.emit "DRIVER: poke b START", %true : i1
      arc.sim.set_input %arg0, "b_poke_val" = %true : i1, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.set_input %arg0, "b_poke_en" = %true : i1, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.emit "DRIVER: poke b END", %true : i1
      %25 = arc.sim.get_port %arg0, "b_o" : i1, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22b_o\22}", %25 : i1
      %26 = comb.concat %false, %25 : i1, i1
      %27 = comb.icmp eq %26, %c1_i2 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22poke(bool) immediately evaluates\22, \22line\22: 62, \22column\22: 12, \22condition\22: \22b_o == true\22, \22scope\22: \22TestSimPokeAllTypes\22}", %27 : i1
      arc.sim.emit "DRIVER: poke u8v START", %c100_i8 : i8
      arc.sim.set_input %arg0, "u8v_poke_val" = %c100_i8 : i8, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.set_input %arg0, "u8v_poke_en" = %true : i1, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.emit "DRIVER: poke u8v END", %c100_i8 : i8
      %28 = arc.sim.get_port %arg0, "u8_o" : i8, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u8_o\22}", %28 : i8
      %29 = comb.concat %false, %28 : i1, i8
      %30 = comb.icmp eq %29, %c101_i9 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22poke(u8) immediately evaluates (100+1)\22, \22line\22: 66, \22column\22: 12, \22condition\22: \22u8_o == 101\22, \22scope\22: \22TestSimPokeAllTypes\22}", %30 : i1
      %false_4 = hw.constant false
      %31 = comb.concat %false_4, %c0_i7 : i1, i7
      %false_5 = hw.constant false
      %32 = comb.concat %false_5, %c50_i7 : i1, i7
      %33 = comb.sub %31, %32 : i8
      %34 = comb.extract %33 from 0 : (i8) -> i7
      %35 = comb.extract %34 from 6 : (i7) -> i1
      %36 = comb.concat %35, %34 : i1, i7
      arc.sim.emit "DRIVER: poke s8v START", %36 : i8
      arc.sim.set_input %arg0, "s8v_poke_val" = %36 : i8, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.set_input %arg0, "s8v_poke_en" = %true : i1, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.emit "DRIVER: poke s8v END", %36 : i8
      %37 = arc.sim.get_port %arg0, "s8_o" : i8, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s8_o\22}", %37 : i8
      %false_6 = hw.constant false
      %38 = comb.concat %false_6, %c0_i7 : i1, i7
      %false_7 = hw.constant false
      %39 = comb.concat %false_7, %c51_i7 : i1, i7
      %40 = comb.sub %38, %39 : i8
      %41 = comb.extract %40 from 0 : (i8) -> i7
      %42 = comb.extract %41 from 6 : (i7) -> i1
      %43 = comb.concat %42, %41 : i1, i7
      %44 = comb.icmp eq %37, %43 : i8
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22poke(val_s8) immediately evaluates (-50-1)\22, \22line\22: 70, \22column\22: 12, \22condition\22: \22s8_o == - 51\22, \22scope\22: \22TestSimPokeAllTypes\22}", %44 : i1
      arc.sim.emit "DRIVER: poke u16v START", %c4096_i16 : i16
      arc.sim.set_input %arg0, "u16v_poke_val" = %c4096_i16 : i16, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.set_input %arg0, "u16v_poke_en" = %true : i1, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.emit "DRIVER: poke u16v END", %c4096_i16 : i16
      %45 = arc.sim.get_port %arg0, "u16_o" : i16, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u16_o\22}", %45 : i16
      %46 = comb.concat %false, %45 : i1, i16
      %47 = comb.icmp eq %46, %c8192_i17 : i17
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22poke(u16) immediately evaluates (0x1000 * 2)\22, \22line\22: 74, \22column\22: 12, \22condition\22: \22u16_o == 0x2000\22, \22scope\22: \22TestSimPokeAllTypes\22}", %47 : i1
      arc.sim.emit "DRIVER: poke u5v START", %c10_i5 : i5
      arc.sim.set_input %arg0, "u5v_poke_val" = %c10_i5 : i5, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.set_input %arg0, "u5v_poke_en" = %true : i1, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.emit "DRIVER: poke u5v END", %c10_i5 : i5
      %48 = arc.sim.get_port %arg0, "u5_o" : i5, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u5_o\22}", %48 : i5
      %49 = comb.concat %false, %48 : i1, i5
      %50 = comb.icmp eq %49, %c21_i6 : i6
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22poke(u5) immediately evaluates\22, \22line\22: 79, \22column\22: 12, \22condition\22: \22u5_o == 21\22, \22scope\22: \22TestSimPokeAllTypes\22}", %50 : i1
      %false_8 = hw.constant false
      %51 = comb.concat %false_8, %c0_i64_0 : i1, i64
      %false_9 = hw.constant false
      %52 = comb.concat %false_9, %c9000000000000000000_i64 : i1, i64
      %53 = comb.sub %51, %52 : i65
      %54 = comb.extract %53 from 0 : (i65) -> i64
      arc.sim.emit "DRIVER: poke s64v START", %54 : i64
      arc.sim.set_input %arg0, "s64v_poke_val" = %54 : i64, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.set_input %arg0, "s64v_poke_en" = %true : i1, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.emit "DRIVER: poke s64v END", %54 : i64
      %55 = arc.sim.get_port %arg0, "s64_o" : i64, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s64_o\22}", %55 : i64
      %false_10 = hw.constant false
      %56 = comb.concat %false_10, %c0_i64_0 : i1, i64
      %false_11 = hw.constant false
      %57 = comb.concat %false_11, %c8999999999999999000_i64 : i1, i64
      %58 = comb.sub %56, %57 : i65
      %59 = comb.extract %58 from 0 : (i65) -> i64
      %60 = comb.icmp eq %55, %59 : i64
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22poke(s64) immediately evaluates\22, \22line\22: 83, \22column\22: 12, \22condition\22: \22s64_o == - 8999999999999999000\22, \22scope\22: \22TestSimPokeAllTypes\22}", %60 : i1
      arc.sim.emit "DRIVER: poke b START", %false : i1
      arc.sim.set_input %arg0, "b_poke_val" = %false : i1, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.set_input %arg0, "b_poke_en" = %true : i1, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.emit "DRIVER: poke b END", %false : i1
      arc.sim.emit "DRIVER: poke u8v START", %c-1_i8 : i8
      arc.sim.set_input %arg0, "u8v_poke_val" = %c-1_i8 : i8, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.set_input %arg0, "u8v_poke_en" = %true : i1, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.emit "DRIVER: poke u8v END", %c-1_i8 : i8
      %61 = arc.sim.get_port %arg0, "b_o" : i1, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22b_o\22}", %61 : i1
      %62 = comb.concat %false, %61 : i1, i1
      %63 = comb.icmp eq %62, %c0_i2 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Re-poke(bool)\22, \22line\22: 88, \22column\22: 12, \22condition\22: \22b_o == false\22, \22scope\22: \22TestSimPokeAllTypes\22}", %63 : i1
      %64 = arc.sim.get_port %arg0, "u8_o" : i8, !arc.sim.instance<@TestSimPokeAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22u8_o\22}", %64 : i8
      %65 = comb.concat %false, %64 : i1, i8
      %66 = comb.icmp eq %65, %c0_i9 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Re-poke(u8 max) wraps to 0 (255+1 as u8)\22, \22line\22: 89, \22column\22: 12, \22condition\22: \22u8_o == 0\22, \22scope\22: \22TestSimPokeAllTypes\22}", %66 : i1
    }
    return
  }
}