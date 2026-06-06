module {



  hw.module private @registers_reg_hold_across_cycles_MultiCycleHold(in %clk : !seq.clock, in %rst : i1, in %load : i1, in %val_8 : i8, in %val_16 : i16, in %val_s8 : i8, out out_8 : i8, out out_16 : i16, out out_s8 : i8) {
    %c0_i16 = hw.constant 0 : i16 {sv.namehint = "r16_next"}
    %c0_i8 = hw.constant 0 : i8 {sv.namehint = "r8_next"}
    %r8 = seq.compreg %4, %clk : i8  
    %r16 = seq.compreg %5, %clk : i16  
    %false = hw.constant false {sv.namehint = "r8_next_0_to_1"}
    %c0_i7 = hw.constant 0 : i7
    %0 = comb.concat %c0_i7, %false {sv.namehint = "r8_next_0_to_1_zext_8"} : i7, i1
    %rs8 = seq.compreg %6, %clk : i8  
    %1 = comb.mux %load, %val_s8, %rs8 : i8
    %2 = comb.mux %load, %val_8, %r8 : i8
    %3 = comb.mux %load, %val_16, %r16 : i16
    %4 = comb.mux %rst, %c0_i8, %2 : i8
    %5 = comb.mux %rst, %c0_i16, %3 : i16
    %6 = comb.mux %rst, %0, %1 : i8
    hw.output %r8, %r16, %rs8 : i8, i16, i8
  }
  hw.module @TestRegHoldAcrossCycles_Harness(in %clk : !seq.clock, in %rst : i1, in %load_poke_val : i1, in %load_poke_en : i1, in %v16_poke_val : i16, in %v16_poke_en : i1, in %v8_poke_val : i8, in %v8_poke_en : i1, in %vs8_poke_val : i8, in %vs8_poke_en : i1, out load : i1, out o16 : i16, out o8 : i8, out os8 : i8, out v16 : i16, out v8 : i8, out vs8 : i8) {
    %c0_i8 = hw.constant 0 : i8
    %c0_i16 = hw.constant 0 : i16
    %false = hw.constant false
    %c0_i7 = hw.constant 0 : i7
    %0 = comb.concat %c0_i7, %false : i7, i1
    %1 = comb.and %load_poke_en, %load_poke_val : i1
    %2 = comb.mux %v16_poke_en, %v16_poke_val, %c0_i16 : i16
    %3 = comb.mux %v8_poke_en, %v8_poke_val, %c0_i8 : i8
    %4 = comb.mux %vs8_poke_en, %vs8_poke_val, %0 : i8
    %MultiCycleHold_inst_32_1.out_8, %MultiCycleHold_inst_32_1.out_16, %MultiCycleHold_inst_32_1.out_s8 = hw.instance "MultiCycleHold_inst_32_1" sym @MultiCycleHold_inst_32_1 @registers_reg_hold_across_cycles_MultiCycleHold(clk: %clk: !seq.clock, rst: %rst: i1, load: %1: i1, val_8: %3: i8, val_16: %2: i16, val_s8: %4: i8) -> (out_8: i8, out_16: i16, out_s8: i8)
    hw.output %1, %MultiCycleHold_inst_32_1.out_16, %MultiCycleHold_inst_32_1.out_8, %MultiCycleHold_inst_32_1.out_s8, %2, %3, %4 : i1, i16, i8, i8, i16, i8, i8
  }
  func.func @entry() {
    %c-28_i7 = hw.constant -28 : i7
    %c-3532_i13 = hw.constant -3532 : i13
    %c-29_i7 = hw.constant -29 : i7
    %c100_i8 = hw.constant 100 : i8
    %c4660_i16 = hw.constant 4660 : i16
    %c99_i8 = hw.constant 99 : i8
    %c-22_i6 = hw.constant -22 : i6
    %c0_i7 = hw.constant 0 : i7
    %c50_i7 = hw.constant 50 : i7
    %c-16657_i16 = hw.constant -16657 : i16
    %c42_i8 = hw.constant 42 : i8
    %c0_i16 = hw.constant 0 : i16
    %c0_i8 = hw.constant 0 : i8
    %true = hw.constant true
    %false = hw.constant false
    %0 = seq.const_clock high
    %1 = seq.const_clock low
    arc.sim.instantiate @TestRegHoldAcrossCycles_Harness as %arg0 {
      arc.sim.set_input %arg0, "load_poke_en" = %false : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "v16_poke_en" = %false : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "v8_poke_en" = %false : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "vs8_poke_en" = %false : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "load_poke_val" = %false : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "load_poke_en" = %true : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "v8_poke_val" = %c0_i8 : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "v8_poke_en" = %true : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "v16_poke_val" = %c0_i16 : i16, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "v16_poke_en" = %true : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      %false_0 = hw.constant false
      %c0_i7_1 = hw.constant 0 : i7
      %2 = comb.concat %c0_i7_1, %false_0 : i7, i1
      arc.sim.set_input %arg0, "vs8_poke_val" = %2 : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "vs8_poke_en" = %true : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "rst" = %false : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      %3 = arc.sim.get_port %arg0, "o8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22o8\22}", %3 : i8
      %false_2 = hw.constant false
      %4 = comb.concat %false_2, %3 : i1, i8
      %c0_i8_3 = hw.constant 0 : i8
      %5 = comb.concat %c0_i8_3, %false : i8, i1
      %6 = comb.icmp eq %4, %5 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22r8 init 0\22, \22line\22: 45, \22column\22: 12, \22condition\22: \22o8 == 0\22, \22scope\22: \22TestRegHoldAcrossCycles\22}", %6 : i1
      %7 = arc.sim.get_port %arg0, "o16" : i16, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22o16\22}", %7 : i16
      %false_4 = hw.constant false
      %8 = comb.concat %false_4, %7 : i1, i16
      %c0_i16_5 = hw.constant 0 : i16
      %9 = comb.concat %c0_i16_5, %false : i16, i1
      %10 = comb.icmp eq %8, %9 : i17
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22r16 init 0\22, \22line\22: 46, \22column\22: 12, \22condition\22: \22o16 == 0\22, \22scope\22: \22TestRegHoldAcrossCycles\22}", %10 : i1
      %11 = arc.sim.get_port %arg0, "os8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22os8\22}", %11 : i8
      %c0_i7_6 = hw.constant 0 : i7
      %12 = comb.concat %c0_i7_6, %false : i7, i1
      %13 = comb.icmp eq %11, %12 : i8
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22rs8 init 0\22, \22line\22: 47, \22column\22: 12, \22condition\22: \22os8 == 0\22, \22scope\22: \22TestRegHoldAcrossCycles\22}", %13 : i1
      arc.sim.emit "DRIVER: poke load START", %true : i1
      arc.sim.set_input %arg0, "load_poke_val" = %true : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "load_poke_en" = %true : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "DRIVER: poke load END", %true : i1
      arc.sim.emit "DRIVER: poke v8 START", %c42_i8 : i8
      arc.sim.set_input %arg0, "v8_poke_val" = %c42_i8 : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "v8_poke_en" = %true : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "DRIVER: poke v8 END", %c42_i8 : i8
      arc.sim.emit "DRIVER: poke v16 START", %c-16657_i16 : i16
      arc.sim.set_input %arg0, "v16_poke_val" = %c-16657_i16 : i16, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "v16_poke_en" = %true : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "DRIVER: poke v16 END", %c-16657_i16 : i16
      %c-14_i6 = hw.constant -14 : i6
      %false_7 = hw.constant false
      %14 = comb.concat %false_7, %c-14_i6 : i1, i6
      %false_8 = hw.constant false
      %15 = comb.concat %false_8, %c0_i7 : i1, i7
      %16 = comb.extract %14 from 6 : (i7) -> i1
      %17 = comb.concat %16, %14 : i1, i7
      %18 = comb.sub %15, %17 : i8
      %19 = comb.extract %18 from 0 : (i8) -> i7
      %20 = comb.extract %19 from 6 : (i7) -> i1
      %21 = comb.concat %20, %19 : i1, i7
      arc.sim.emit "DRIVER: poke vs8 START", %21 : i8
      arc.sim.set_input %arg0, "vs8_poke_val" = %21 : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "vs8_poke_en" = %true : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "DRIVER: poke vs8 END", %21 : i8
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      %22 = arc.sim.get_port %arg0, "o8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "o8", %22 : i8
      %23 = arc.sim.get_port %arg0, "o16" : i16, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "o16", %23 : i16
      %24 = arc.sim.get_port %arg0, "v16" : i16, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "v16", %24 : i16
      %25 = arc.sim.get_port %arg0, "load" : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "load", %25 : i1
      %26 = arc.sim.get_port %arg0, "v8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "v8", %26 : i8
      %27 = arc.sim.get_port %arg0, "vs8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "vs8", %27 : i8
      %28 = arc.sim.get_port %arg0, "os8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "os8", %28 : i8
      %29 = arc.sim.get_port %arg0, "o8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22o8\22}", %29 : i8
      %false_9 = hw.constant false
      %30 = comb.concat %false_9, %29 : i1, i8
      %c0_i3 = hw.constant 0 : i3
      %31 = comb.concat %c0_i3, %c-22_i6 : i3, i6
      %32 = comb.icmp eq %30, %31 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22r8 loaded 42\22, \22line\22: 57, \22column\22: 12, \22condition\22: \22o8 == 42\22, \22scope\22: \22TestRegHoldAcrossCycles\22}", %32 : i1
      %33 = arc.sim.get_port %arg0, "o16" : i16, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22o16\22}", %33 : i16
      %false_10 = hw.constant false
      %34 = comb.concat %false_10, %33 : i1, i16
      %false_11 = hw.constant false
      %35 = comb.concat %false_11, %c-16657_i16 : i1, i16
      %36 = comb.icmp eq %34, %35 : i17
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22r16 loaded 0xBEEF\22, \22line\22: 58, \22column\22: 12, \22condition\22: \22o16 == 0xBEEF\22, \22scope\22: \22TestRegHoldAcrossCycles\22}", %36 : i1
      %37 = arc.sim.get_port %arg0, "os8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22os8\22}", %37 : i8
      %38 = comb.icmp eq %37, %21 : i8
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22rs8 loaded -50\22, \22line\22: 59, \22column\22: 12, \22condition\22: \22os8 == - 50\22, \22scope\22: \22TestRegHoldAcrossCycles\22}", %38 : i1
      arc.sim.emit "DRIVER: poke load START", %false : i1
      arc.sim.set_input %arg0, "load_poke_val" = %false : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "load_poke_en" = %true : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "DRIVER: poke load END", %false : i1
      arc.sim.emit "DRIVER: poke v8 START", %c99_i8 : i8
      arc.sim.set_input %arg0, "v8_poke_val" = %c99_i8 : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "v8_poke_en" = %true : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "DRIVER: poke v8 END", %c99_i8 : i8
      arc.sim.emit "DRIVER: poke v16 START", %c4660_i16 : i16
      arc.sim.set_input %arg0, "v16_poke_val" = %c4660_i16 : i16, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "v16_poke_en" = %true : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "DRIVER: poke v16 END", %c4660_i16 : i16
      %c-28_i7_12 = hw.constant -28 : i7
      %false_13 = hw.constant false
      %39 = comb.concat %false_13, %c-28_i7_12 : i1, i7
      arc.sim.emit "DRIVER: poke vs8 START", %39 : i8
      arc.sim.set_input %arg0, "vs8_poke_val" = %39 : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "vs8_poke_en" = %true : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "DRIVER: poke vs8 END", %39 : i8
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      %40 = arc.sim.get_port %arg0, "o8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "o8", %40 : i8
      %41 = arc.sim.get_port %arg0, "o16" : i16, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "o16", %41 : i16
      %42 = arc.sim.get_port %arg0, "v16" : i16, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "v16", %42 : i16
      %43 = arc.sim.get_port %arg0, "load" : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "load", %43 : i1
      %44 = arc.sim.get_port %arg0, "v8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "v8", %44 : i8
      %45 = arc.sim.get_port %arg0, "vs8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "vs8", %45 : i8
      %46 = arc.sim.get_port %arg0, "os8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "os8", %46 : i8
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      %47 = arc.sim.get_port %arg0, "o8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "o8", %47 : i8
      %48 = arc.sim.get_port %arg0, "o16" : i16, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "o16", %48 : i16
      %49 = arc.sim.get_port %arg0, "v16" : i16, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "v16", %49 : i16
      %50 = arc.sim.get_port %arg0, "load" : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "load", %50 : i1
      %51 = arc.sim.get_port %arg0, "v8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "v8", %51 : i8
      %52 = arc.sim.get_port %arg0, "vs8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "vs8", %52 : i8
      %53 = arc.sim.get_port %arg0, "os8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "os8", %53 : i8
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      %54 = arc.sim.get_port %arg0, "o8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "o8", %54 : i8
      %55 = arc.sim.get_port %arg0, "o16" : i16, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "o16", %55 : i16
      %56 = arc.sim.get_port %arg0, "v16" : i16, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "v16", %56 : i16
      %57 = arc.sim.get_port %arg0, "load" : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "load", %57 : i1
      %58 = arc.sim.get_port %arg0, "v8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "v8", %58 : i8
      %59 = arc.sim.get_port %arg0, "vs8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "vs8", %59 : i8
      %60 = arc.sim.get_port %arg0, "os8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "os8", %60 : i8
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      %61 = arc.sim.get_port %arg0, "o8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "o8", %61 : i8
      %62 = arc.sim.get_port %arg0, "o16" : i16, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "o16", %62 : i16
      %63 = arc.sim.get_port %arg0, "v16" : i16, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "v16", %63 : i16
      %64 = arc.sim.get_port %arg0, "load" : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "load", %64 : i1
      %65 = arc.sim.get_port %arg0, "v8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "v8", %65 : i8
      %66 = arc.sim.get_port %arg0, "vs8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "vs8", %66 : i8
      %67 = arc.sim.get_port %arg0, "os8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "os8", %67 : i8
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      %68 = arc.sim.get_port %arg0, "o8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "o8", %68 : i8
      %69 = arc.sim.get_port %arg0, "o16" : i16, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "o16", %69 : i16
      %70 = arc.sim.get_port %arg0, "v16" : i16, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "v16", %70 : i16
      %71 = arc.sim.get_port %arg0, "load" : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "load", %71 : i1
      %72 = arc.sim.get_port %arg0, "v8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "v8", %72 : i8
      %73 = arc.sim.get_port %arg0, "vs8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "vs8", %73 : i8
      %74 = arc.sim.get_port %arg0, "os8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "os8", %74 : i8
      %75 = arc.sim.get_port %arg0, "o8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22o8\22}", %75 : i8
      %false_14 = hw.constant false
      %76 = comb.concat %false_14, %75 : i1, i8
      %77 = comb.icmp eq %76, %31 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22r8 held 42 across 5 cycles\22, \22line\22: 72, \22column\22: 12, \22condition\22: \22o8 == 42\22, \22scope\22: \22TestRegHoldAcrossCycles\22}", %77 : i1
      %78 = arc.sim.get_port %arg0, "o16" : i16, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22o16\22}", %78 : i16
      %false_15 = hw.constant false
      %79 = comb.concat %false_15, %78 : i1, i16
      %80 = comb.icmp eq %79, %35 : i17
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22r16 held 0xBEEF across 5 cycles\22, \22line\22: 73, \22column\22: 12, \22condition\22: \22o16 == 0xBEEF\22, \22scope\22: \22TestRegHoldAcrossCycles\22}", %80 : i1
      %81 = arc.sim.get_port %arg0, "os8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22os8\22}", %81 : i8
      %82 = comb.icmp eq %81, %21 : i8
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22rs8 held -50 across 5 cycles\22, \22line\22: 74, \22column\22: 12, \22condition\22: \22os8 == - 50\22, \22scope\22: \22TestRegHoldAcrossCycles\22}", %82 : i1
      arc.sim.emit "DRIVER: poke load START", %true : i1
      arc.sim.set_input %arg0, "load_poke_val" = %true : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "load_poke_en" = %true : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "DRIVER: poke load END", %true : i1
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      %83 = arc.sim.get_port %arg0, "o8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "o8", %83 : i8
      %84 = arc.sim.get_port %arg0, "o16" : i16, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "o16", %84 : i16
      %85 = arc.sim.get_port %arg0, "v16" : i16, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "v16", %85 : i16
      %86 = arc.sim.get_port %arg0, "load" : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "load", %86 : i1
      %87 = arc.sim.get_port %arg0, "v8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "v8", %87 : i8
      %88 = arc.sim.get_port %arg0, "vs8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "vs8", %88 : i8
      %89 = arc.sim.get_port %arg0, "os8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "os8", %89 : i8
      %90 = arc.sim.get_port %arg0, "o8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22o8\22}", %90 : i8
      %false_16 = hw.constant false
      %91 = comb.concat %false_16, %90 : i1, i8
      %c0_i2 = hw.constant 0 : i2
      %92 = comb.concat %c0_i2, %c-29_i7 : i2, i7
      %93 = comb.icmp eq %91, %92 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22r8 loaded 99\22, \22line\22: 80, \22column\22: 12, \22condition\22: \22o8 == 99\22, \22scope\22: \22TestRegHoldAcrossCycles\22}", %93 : i1
      %94 = arc.sim.get_port %arg0, "o16" : i16, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22o16\22}", %94 : i16
      %false_17 = hw.constant false
      %95 = comb.concat %false_17, %94 : i1, i16
      %c0_i4 = hw.constant 0 : i4
      %96 = comb.concat %c0_i4, %c-3532_i13 : i4, i13
      %97 = comb.icmp eq %95, %96 : i17
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22r16 loaded 0x1234\22, \22line\22: 81, \22column\22: 12, \22condition\22: \22o16 == 0x1234\22, \22scope\22: \22TestRegHoldAcrossCycles\22}", %97 : i1
      %98 = arc.sim.get_port %arg0, "os8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22os8\22}", %98 : i8
      %false_18 = hw.constant false
      %99 = comb.concat %false_18, %c-28_i7 : i1, i7
      %100 = comb.icmp eq %98, %99 : i8
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22rs8 loaded 100\22, \22line\22: 82, \22column\22: 12, \22condition\22: \22os8 == 100\22, \22scope\22: \22TestRegHoldAcrossCycles\22}", %100 : i1
      arc.sim.emit "DRIVER: poke load START", %false : i1
      arc.sim.set_input %arg0, "load_poke_val" = %false : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "load_poke_en" = %true : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "DRIVER: poke load END", %false : i1
      arc.sim.emit "DRIVER: poke v8 START", %c0_i8 : i8
      arc.sim.set_input %arg0, "v8_poke_val" = %c0_i8 : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "v8_poke_en" = %true : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "DRIVER: poke v8 END", %c0_i8 : i8
      arc.sim.emit "DRIVER: poke v16 START", %c0_i16 : i16
      arc.sim.set_input %arg0, "v16_poke_val" = %c0_i16 : i16, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "v16_poke_en" = %true : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "DRIVER: poke v16 END", %c0_i16 : i16
      arc.sim.emit "DRIVER: poke vs8 START", %2 : i8
      arc.sim.set_input %arg0, "vs8_poke_val" = %2 : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "vs8_poke_en" = %true : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "DRIVER: poke vs8 END", %2 : i8
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      %101 = arc.sim.get_port %arg0, "o8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "o8", %101 : i8
      %102 = arc.sim.get_port %arg0, "o16" : i16, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "o16", %102 : i16
      %103 = arc.sim.get_port %arg0, "v16" : i16, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "v16", %103 : i16
      %104 = arc.sim.get_port %arg0, "load" : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "load", %104 : i1
      %105 = arc.sim.get_port %arg0, "v8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "v8", %105 : i8
      %106 = arc.sim.get_port %arg0, "vs8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "vs8", %106 : i8
      %107 = arc.sim.get_port %arg0, "os8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "os8", %107 : i8
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      %108 = arc.sim.get_port %arg0, "o8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "o8", %108 : i8
      %109 = arc.sim.get_port %arg0, "o16" : i16, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "o16", %109 : i16
      %110 = arc.sim.get_port %arg0, "v16" : i16, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "v16", %110 : i16
      %111 = arc.sim.get_port %arg0, "load" : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "load", %111 : i1
      %112 = arc.sim.get_port %arg0, "v8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "v8", %112 : i8
      %113 = arc.sim.get_port %arg0, "vs8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "vs8", %113 : i8
      %114 = arc.sim.get_port %arg0, "os8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "os8", %114 : i8
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      %115 = arc.sim.get_port %arg0, "o8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "o8", %115 : i8
      %116 = arc.sim.get_port %arg0, "o16" : i16, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "o16", %116 : i16
      %117 = arc.sim.get_port %arg0, "v16" : i16, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "v16", %117 : i16
      %118 = arc.sim.get_port %arg0, "load" : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "load", %118 : i1
      %119 = arc.sim.get_port %arg0, "v8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "v8", %119 : i8
      %120 = arc.sim.get_port %arg0, "vs8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "vs8", %120 : i8
      %121 = arc.sim.get_port %arg0, "os8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "os8", %121 : i8
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      %122 = arc.sim.get_port %arg0, "o8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "o8", %122 : i8
      %123 = arc.sim.get_port %arg0, "o16" : i16, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "o16", %123 : i16
      %124 = arc.sim.get_port %arg0, "v16" : i16, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "v16", %124 : i16
      %125 = arc.sim.get_port %arg0, "load" : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "load", %125 : i1
      %126 = arc.sim.get_port %arg0, "v8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "v8", %126 : i8
      %127 = arc.sim.get_port %arg0, "vs8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "vs8", %127 : i8
      %128 = arc.sim.get_port %arg0, "os8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "os8", %128 : i8
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      %129 = arc.sim.get_port %arg0, "o8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "o8", %129 : i8
      %130 = arc.sim.get_port %arg0, "o16" : i16, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "o16", %130 : i16
      %131 = arc.sim.get_port %arg0, "v16" : i16, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "v16", %131 : i16
      %132 = arc.sim.get_port %arg0, "load" : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "load", %132 : i1
      %133 = arc.sim.get_port %arg0, "v8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "v8", %133 : i8
      %134 = arc.sim.get_port %arg0, "vs8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "vs8", %134 : i8
      %135 = arc.sim.get_port %arg0, "os8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "os8", %135 : i8
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      %136 = arc.sim.get_port %arg0, "o8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "o8", %136 : i8
      %137 = arc.sim.get_port %arg0, "o16" : i16, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "o16", %137 : i16
      %138 = arc.sim.get_port %arg0, "v16" : i16, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "v16", %138 : i16
      %139 = arc.sim.get_port %arg0, "load" : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "load", %139 : i1
      %140 = arc.sim.get_port %arg0, "v8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "v8", %140 : i8
      %141 = arc.sim.get_port %arg0, "vs8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "vs8", %141 : i8
      %142 = arc.sim.get_port %arg0, "os8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "os8", %142 : i8
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      %143 = arc.sim.get_port %arg0, "o8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "o8", %143 : i8
      %144 = arc.sim.get_port %arg0, "o16" : i16, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "o16", %144 : i16
      %145 = arc.sim.get_port %arg0, "v16" : i16, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "v16", %145 : i16
      %146 = arc.sim.get_port %arg0, "load" : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "load", %146 : i1
      %147 = arc.sim.get_port %arg0, "v8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "v8", %147 : i8
      %148 = arc.sim.get_port %arg0, "vs8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "vs8", %148 : i8
      %149 = arc.sim.get_port %arg0, "os8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "os8", %149 : i8
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      %150 = arc.sim.get_port %arg0, "o8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "o8", %150 : i8
      %151 = arc.sim.get_port %arg0, "o16" : i16, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "o16", %151 : i16
      %152 = arc.sim.get_port %arg0, "v16" : i16, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "v16", %152 : i16
      %153 = arc.sim.get_port %arg0, "load" : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "load", %153 : i1
      %154 = arc.sim.get_port %arg0, "v8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "v8", %154 : i8
      %155 = arc.sim.get_port %arg0, "vs8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "vs8", %155 : i8
      %156 = arc.sim.get_port %arg0, "os8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "os8", %156 : i8
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      %157 = arc.sim.get_port %arg0, "o8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "o8", %157 : i8
      %158 = arc.sim.get_port %arg0, "o16" : i16, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "o16", %158 : i16
      %159 = arc.sim.get_port %arg0, "v16" : i16, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "v16", %159 : i16
      %160 = arc.sim.get_port %arg0, "load" : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "load", %160 : i1
      %161 = arc.sim.get_port %arg0, "v8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "v8", %161 : i8
      %162 = arc.sim.get_port %arg0, "vs8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "vs8", %162 : i8
      %163 = arc.sim.get_port %arg0, "os8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "os8", %163 : i8
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      %164 = arc.sim.get_port %arg0, "o8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "o8", %164 : i8
      %165 = arc.sim.get_port %arg0, "o16" : i16, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "o16", %165 : i16
      %166 = arc.sim.get_port %arg0, "v16" : i16, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "v16", %166 : i16
      %167 = arc.sim.get_port %arg0, "load" : i1, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "load", %167 : i1
      %168 = arc.sim.get_port %arg0, "v8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "v8", %168 : i8
      %169 = arc.sim.get_port %arg0, "vs8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "vs8", %169 : i8
      %170 = arc.sim.get_port %arg0, "os8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "os8", %170 : i8
      %171 = arc.sim.get_port %arg0, "o8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22o8\22}", %171 : i8
      %false_19 = hw.constant false
      %172 = comb.concat %false_19, %171 : i1, i8
      %173 = comb.icmp eq %172, %92 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22r8 held 99 across 10 cycles\22, \22line\22: 92, \22column\22: 12, \22condition\22: \22o8 == 99\22, \22scope\22: \22TestRegHoldAcrossCycles\22}", %173 : i1
      %174 = arc.sim.get_port %arg0, "o16" : i16, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22o16\22}", %174 : i16
      %false_20 = hw.constant false
      %175 = comb.concat %false_20, %174 : i1, i16
      %176 = comb.icmp eq %175, %96 : i17
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22r16 held 0x1234 across 10 cycles\22, \22line\22: 93, \22column\22: 12, \22condition\22: \22o16 == 0x1234\22, \22scope\22: \22TestRegHoldAcrossCycles\22}", %176 : i1
      %177 = arc.sim.get_port %arg0, "os8" : i8, !arc.sim.instance<@TestRegHoldAcrossCycles_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22os8\22}", %177 : i8
      %178 = comb.icmp eq %177, %99 : i8
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22rs8 held 100 across 10 cycles\22, \22line\22: 94, \22column\22: 12, \22condition\22: \22os8 == 100\22, \22scope\22: \22TestRegHoldAcrossCycles\22}", %178 : i1
    }
    return
  }
}