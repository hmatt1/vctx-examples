module {



  hw.module private @sim_sim_multi_cycle_accumulator_Accumulator(in %clk : !seq.clock, in %rst : i1, in %en : i1, in %d : i16, out q : i16) {
    %false = hw.constant false
    %c0_i16 = hw.constant 0 : i16
    %acc = seq.compreg %8, %clk : i16  
    %0 = comb.concat %false, %acc : i1, i16
    %1 = comb.concat %false, %d : i1, i16
    %false_0 = hw.constant false
    %2 = comb.concat %false_0, %0 : i1, i17
    %false_1 = hw.constant false
    %3 = comb.concat %false_1, %1 : i1, i17
    %4 = comb.add %2, %3 : i18
    %5 = comb.extract %4 from 0 : (i18) -> i17
    %6 = comb.extract %5 from 0 : (i17) -> i16
    %7 = comb.mux %en, %6, %acc : i16
    %8 = comb.mux %rst, %c0_i16, %7 : i16
    hw.output %acc : i16
  }

  hw.module @TestSimMultiCycleAccumulator_Harness(in %clk : !seq.clock, in %rst : i1, in %d_poke_val : i16, in %d_poke_en : i1, in %en_poke_val : i1, in %en_poke_en : i1, in %q_poke_val : i16, in %q_poke_en : i1, out d : i16, out en : i1, out q : i16) {
    %c0_i16 = hw.constant 0 : i16
    %Accumulator_inst_21_1.q = hw.instance "Accumulator_inst_21_1" sym @Accumulator_inst_21_1 @sim_sim_multi_cycle_accumulator_Accumulator(clk: %clk: !seq.clock, rst: %rst: i1, en: %1: i1, d: %0: i16) -> (q: i16)
    %0 = comb.mux %d_poke_en, %d_poke_val, %c0_i16 : i16
    %1 = comb.and %en_poke_en, %en_poke_val : i1
    %2 = comb.mux %q_poke_en, %q_poke_val, %Accumulator_inst_21_1.q : i16
    hw.output %0, %1, %2 : i16, i1, i16
  }
  func.func @entry() {
    %c10987_i16 = hw.constant 10987 : i16
    %c54549_i17 = hw.constant 54549 : i17
    %c85_i17 = hw.constant 85 : i17
    %c5_i16 = hw.constant 5 : i16
    %c100_i16 = hw.constant 100 : i16
    %c35_i17 = hw.constant 35 : i17
    %c25_i16 = hw.constant 25 : i16
    %c10_i17 = hw.constant 10 : i17
    %c10_i16 = hw.constant 10 : i16
    %c0_i17 = hw.constant 0 : i17
    %c0_i16 = hw.constant 0 : i16
    %c-5536_i16 = hw.constant -5536 : i16
    %true = hw.constant true
    %false = hw.constant false
    %0 = seq.const_clock high
    %1 = seq.const_clock low
    arc.sim.instantiate @TestSimMultiCycleAccumulator_Harness as %arg0 {
      arc.sim.set_input %arg0, "d_poke_en" = %false : i1, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.set_input %arg0, "en_poke_en" = %false : i1, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.set_input %arg0, "q_poke_en" = %false : i1, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.set_input %arg0, "en_poke_val" = %false : i1, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.set_input %arg0, "en_poke_en" = %true : i1, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.set_input %arg0, "d_poke_val" = %c0_i16 : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.set_input %arg0, "d_poke_en" = %true : i1, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.set_input %arg0, "rst" = %false : i1, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      %2 = arc.sim.get_port %arg0, "q" : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22q\22}", %2 : i16
      %3 = comb.concat %false, %2 : i1, i16
      %4 = comb.icmp eq %3, %c0_i17 : i17
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Accumulator starts at 0\22, \22line\22: 29, \22column\22: 12, \22condition\22: \22q == 0\22, \22scope\22: \22TestSimMultiCycleAccumulator\22}", %4 : i1
      arc.sim.emit "DRIVER: poke en START", %true : i1
      arc.sim.set_input %arg0, "en_poke_val" = %true : i1, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.set_input %arg0, "en_poke_en" = %true : i1, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "DRIVER: poke en END", %true : i1
      arc.sim.emit "DRIVER: poke d START", %c10_i16 : i16
      arc.sim.set_input %arg0, "d_poke_val" = %c10_i16 : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.set_input %arg0, "d_poke_en" = %true : i1, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "DRIVER: poke d END", %c10_i16 : i16
      %5 = arc.sim.get_port %arg0, "q" : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22q\22}", %5 : i16
      %6 = comb.concat %false, %5 : i1, i16
      %7 = comb.icmp eq %6, %c0_i17 : i17
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Combinational output holds pre-clock value\22, \22line\22: 37, \22column\22: 12, \22condition\22: \22q == 0\22, \22scope\22: \22TestSimMultiCycleAccumulator\22}", %7 : i1
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      %8 = arc.sim.get_port %arg0, "d" : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "d", %8 : i16
      %9 = arc.sim.get_port %arg0, "en" : i1, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "en", %9 : i1
      %10 = arc.sim.get_port %arg0, "q" : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "q", %10 : i16
      %11 = arc.sim.get_port %arg0, "q" : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22q\22}", %11 : i16
      %12 = comb.concat %false, %11 : i1, i16
      %13 = comb.icmp eq %12, %c10_i17 : i17
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Accumulated 10 after 1 cycle\22, \22line\22: 40, \22column\22: 12, \22condition\22: \22q == 10\22, \22scope\22: \22TestSimMultiCycleAccumulator\22}", %13 : i1
      arc.sim.emit "DRIVER: poke d START", %c25_i16 : i16
      arc.sim.set_input %arg0, "d_poke_val" = %c25_i16 : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.set_input %arg0, "d_poke_en" = %true : i1, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "DRIVER: poke d END", %c25_i16 : i16
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      %14 = arc.sim.get_port %arg0, "d" : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "d", %14 : i16
      %15 = arc.sim.get_port %arg0, "en" : i1, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "en", %15 : i1
      %16 = arc.sim.get_port %arg0, "q" : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "q", %16 : i16
      %17 = arc.sim.get_port %arg0, "q" : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22q\22}", %17 : i16
      %18 = comb.concat %false, %17 : i1, i16
      %19 = comb.icmp eq %18, %c35_i17 : i17
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Accumulated 25 -> 35\22, \22line\22: 45, \22column\22: 12, \22condition\22: \22q == 35\22, \22scope\22: \22TestSimMultiCycleAccumulator\22}", %19 : i1
      arc.sim.emit "DRIVER: poke en START", %false : i1
      arc.sim.set_input %arg0, "en_poke_val" = %false : i1, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.set_input %arg0, "en_poke_en" = %true : i1, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "DRIVER: poke en END", %false : i1
      arc.sim.emit "DRIVER: poke d START", %c100_i16 : i16
      arc.sim.set_input %arg0, "d_poke_val" = %c100_i16 : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.set_input %arg0, "d_poke_en" = %true : i1, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "DRIVER: poke d END", %c100_i16 : i16
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      %20 = arc.sim.get_port %arg0, "d" : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "d", %20 : i16
      %21 = arc.sim.get_port %arg0, "en" : i1, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "en", %21 : i1
      %22 = arc.sim.get_port %arg0, "q" : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "q", %22 : i16
      %23 = arc.sim.get_port %arg0, "q" : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22q\22}", %23 : i16
      %24 = comb.concat %false, %23 : i1, i16
      %25 = comb.icmp eq %24, %c35_i17 : i17
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22State held when en=false\22, \22line\22: 52, \22column\22: 12, \22condition\22: \22q == 35\22, \22scope\22: \22TestSimMultiCycleAccumulator\22}", %25 : i1
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      %26 = arc.sim.get_port %arg0, "d" : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "d", %26 : i16
      %27 = arc.sim.get_port %arg0, "en" : i1, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "en", %27 : i1
      %28 = arc.sim.get_port %arg0, "q" : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "q", %28 : i16
      %29 = arc.sim.get_port %arg0, "q" : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22q\22}", %29 : i16
      %30 = comb.concat %false, %29 : i1, i16
      %31 = comb.icmp eq %30, %c35_i17 : i17
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22State held across multiple disabled cycles\22, \22line\22: 55, \22column\22: 12, \22condition\22: \22q == 35\22, \22scope\22: \22TestSimMultiCycleAccumulator\22}", %31 : i1
      arc.sim.emit "DRIVER: poke en START", %true : i1
      arc.sim.set_input %arg0, "en_poke_val" = %true : i1, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.set_input %arg0, "en_poke_en" = %true : i1, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "DRIVER: poke en END", %true : i1
      arc.sim.emit "DRIVER: poke d START", %c5_i16 : i16
      arc.sim.set_input %arg0, "d_poke_val" = %c5_i16 : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.set_input %arg0, "d_poke_en" = %true : i1, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "DRIVER: poke d END", %c5_i16 : i16
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      %32 = arc.sim.get_port %arg0, "d" : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "d", %32 : i16
      %33 = arc.sim.get_port %arg0, "en" : i1, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "en", %33 : i1
      %34 = arc.sim.get_port %arg0, "q" : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "q", %34 : i16
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      %35 = arc.sim.get_port %arg0, "d" : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "d", %35 : i16
      %36 = arc.sim.get_port %arg0, "en" : i1, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "en", %36 : i1
      %37 = arc.sim.get_port %arg0, "q" : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "q", %37 : i16
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      %38 = arc.sim.get_port %arg0, "d" : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "d", %38 : i16
      %39 = arc.sim.get_port %arg0, "en" : i1, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "en", %39 : i1
      %40 = arc.sim.get_port %arg0, "q" : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "q", %40 : i16
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      %41 = arc.sim.get_port %arg0, "d" : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "d", %41 : i16
      %42 = arc.sim.get_port %arg0, "en" : i1, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "en", %42 : i1
      %43 = arc.sim.get_port %arg0, "q" : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "q", %43 : i16
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      %44 = arc.sim.get_port %arg0, "d" : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "d", %44 : i16
      %45 = arc.sim.get_port %arg0, "en" : i1, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "en", %45 : i1
      %46 = arc.sim.get_port %arg0, "q" : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "q", %46 : i16
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      %47 = arc.sim.get_port %arg0, "d" : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "d", %47 : i16
      %48 = arc.sim.get_port %arg0, "en" : i1, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "en", %48 : i1
      %49 = arc.sim.get_port %arg0, "q" : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "q", %49 : i16
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      %50 = arc.sim.get_port %arg0, "d" : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "d", %50 : i16
      %51 = arc.sim.get_port %arg0, "en" : i1, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "en", %51 : i1
      %52 = arc.sim.get_port %arg0, "q" : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "q", %52 : i16
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      %53 = arc.sim.get_port %arg0, "d" : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "d", %53 : i16
      %54 = arc.sim.get_port %arg0, "en" : i1, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "en", %54 : i1
      %55 = arc.sim.get_port %arg0, "q" : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "q", %55 : i16
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      %56 = arc.sim.get_port %arg0, "d" : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "d", %56 : i16
      %57 = arc.sim.get_port %arg0, "en" : i1, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "en", %57 : i1
      %58 = arc.sim.get_port %arg0, "q" : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "q", %58 : i16
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      %59 = arc.sim.get_port %arg0, "d" : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "d", %59 : i16
      %60 = arc.sim.get_port %arg0, "en" : i1, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "en", %60 : i1
      %61 = arc.sim.get_port %arg0, "q" : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "q", %61 : i16
      %62 = arc.sim.get_port %arg0, "q" : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22q\22}", %62 : i16
      %63 = comb.concat %false, %62 : i1, i16
      %64 = comb.icmp eq %63, %c85_i17 : i17
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Accumulated 5 for 10 cycles (35 + 50 = 85)\22, \22line\22: 63, \22column\22: 12, \22condition\22: \22q == 85\22, \22scope\22: \22TestSimMultiCycleAccumulator\22}", %64 : i1
      arc.sim.emit "DRIVER: poke d START", %c-5536_i16 : i16
      arc.sim.set_input %arg0, "d_poke_val" = %c-5536_i16 : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.set_input %arg0, "d_poke_en" = %true : i1, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "DRIVER: poke d END", %c-5536_i16 : i16
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      %65 = arc.sim.get_port %arg0, "d" : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "d", %65 : i16
      %66 = arc.sim.get_port %arg0, "en" : i1, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "en", %66 : i1
      %67 = arc.sim.get_port %arg0, "q" : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "q", %67 : i16
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      %68 = arc.sim.get_port %arg0, "d" : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "d", %68 : i16
      %69 = arc.sim.get_port %arg0, "en" : i1, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "en", %69 : i1
      %70 = arc.sim.get_port %arg0, "q" : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "q", %70 : i16
      %71 = arc.sim.get_port %arg0, "q" : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22q\22}", %71 : i16
      %72 = comb.concat %false, %71 : i1, i16
      %73 = comb.icmp eq %72, %c54549_i17 : i17
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Accumulator wrapped correctly over 2 cycles\22, \22line\22: 73, \22column\22: 12, \22condition\22: \22q == 54549\22, \22scope\22: \22TestSimMultiCycleAccumulator\22}", %73 : i1
      arc.sim.emit "DRIVER: poke d START", %c10987_i16 : i16
      arc.sim.set_input %arg0, "d_poke_val" = %c10987_i16 : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.set_input %arg0, "d_poke_en" = %true : i1, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "DRIVER: poke d END", %c10987_i16 : i16
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      %74 = arc.sim.get_port %arg0, "d" : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "d", %74 : i16
      %75 = arc.sim.get_port %arg0, "en" : i1, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "en", %75 : i1
      %76 = arc.sim.get_port %arg0, "q" : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "q", %76 : i16
      %77 = arc.sim.get_port %arg0, "q" : i16, !arc.sim.instance<@TestSimMultiCycleAccumulator_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22q\22}", %77 : i16
      %78 = comb.concat %false, %77 : i1, i16
      %79 = comb.icmp eq %78, %c0_i17 : i17
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Accumulated exactly to 0 (wrap boundary)\22, \22line\22: 81, \22column\22: 12, \22condition\22: \22q == 0\22, \22scope\22: \22TestSimMultiCycleAccumulator\22}", %79 : i1
    }
    return
  }
}