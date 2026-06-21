module {



  hw.module private @registers_reg_nontrivial_init_reset_BitPatternTriple(in %clk : !seq.clock, in %rst : i1, in %corrupting : i1, out qa : i8, out qb : i8, out qc : i8) {
    %c90_i8 = hw.constant 90 : i8
    %c-1_i8 = hw.constant -1 : i8
    %c-85_i8 = hw.constant -85 : i8
    %c-75_i8 = hw.constant -75 : i8
    %ra = seq.compreg %3, %clk : i8  
    %rb = seq.compreg %4, %clk : i8  
    %rc = seq.compreg %5, %clk : i8  
    %0 = comb.mux %corrupting, %c-1_i8, %rb : i8
    %1 = comb.mux %corrupting, %c-1_i8, %ra : i8
    %2 = comb.mux %corrupting, %c-1_i8, %rc : i8
    %3 = comb.mux %rst, %c-75_i8, %1 : i8
    %4 = comb.mux %rst, %c-85_i8, %0 : i8
    %5 = comb.mux %rst, %c90_i8, %2 : i8
    hw.output %ra, %rb, %rc : i8, i8, i8
  }
  hw.module @TestBitPatternThreeResets_Harness(in %clk : !seq.clock, in %rst : i1, in %corrupting_poke_val : i1, in %corrupting_poke_en : i1, in %qa_poke_val : i8, in %qa_poke_en : i1, in %qb_poke_val : i8, in %qb_poke_en : i1, in %qc_poke_val : i8, in %qc_poke_en : i1, out corrupting : i1, out qa : i8, out qb : i8, out qc : i8) {
    %BitPatternTriple_inst_36_1.qa, %BitPatternTriple_inst_36_1.qb, %BitPatternTriple_inst_36_1.qc = hw.instance "BitPatternTriple_inst_36_1" sym @BitPatternTriple_inst_36_1 @registers_reg_nontrivial_init_reset_BitPatternTriple(clk: %clk: !seq.clock, rst: %rst: i1, corrupting: %0: i1) -> (qa: i8, qb: i8, qc: i8)
    %0 = comb.and %corrupting_poke_en, %corrupting_poke_val : i1
    %1 = comb.mux %qa_poke_en, %qa_poke_val, %BitPatternTriple_inst_36_1.qa : i8
    %2 = comb.mux %qb_poke_en, %qb_poke_val, %BitPatternTriple_inst_36_1.qb : i8
    %3 = comb.mux %qc_poke_en, %qc_poke_val, %BitPatternTriple_inst_36_1.qc : i8
    hw.output %0, %1, %2, %3 : i1, i8, i8, i8
  }
  func.func @entry() {
    %c255_i9 = hw.constant 255 : i9
    %c90_i8 = hw.constant 90 : i8
    %c171_i9 = hw.constant 171 : i9
    %c181_i9 = hw.constant 181 : i9
    %true = hw.constant true
    %false = hw.constant false
    %0 = seq.const_clock high
    %1 = seq.const_clock low
    arc.sim.instantiate @TestBitPatternThreeResets_Harness as %arg0 {
      arc.sim.set_input %arg0, "corrupting_poke_en" = %false : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "qa_poke_en" = %false : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "qb_poke_en" = %false : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "qc_poke_en" = %false : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "corrupting_poke_val" = %false : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "corrupting_poke_en" = %true : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "rst" = %false : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      %2 = arc.sim.get_port %arg0, "qa" : i8, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22qa\22}", %2 : i8
      %3 = comb.concat %false, %2 : i1, i8
      %4 = comb.icmp eq %3, %c181_i9 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22ra init = 0b10110101 = 0xB5 = 181\22, \22line\22: 44, \22column\22: 12, \22condition\22: \22qa == 181 as u8\22, \22scope\22: \22TestBitPatternThreeResets\22}", %4 : i1
      %5 = arc.sim.get_port %arg0, "qb" : i8, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22qb\22}", %5 : i8
      %6 = comb.concat %false, %5 : i1, i8
      %7 = comb.icmp eq %6, %c171_i9 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22rb init = 0xAB = 171\22, \22line\22: 45, \22column\22: 12, \22condition\22: \22qb == 171 as u8\22, \22scope\22: \22TestBitPatternThreeResets\22}", %7 : i1
      %8 = arc.sim.get_port %arg0, "qc" : i8, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22qc\22}", %8 : i8
      %9 = comb.concat %false, %8 : i1, i8
      %10 = comb.concat %false, %c90_i8 : i1, i8
      %11 = comb.icmp eq %9, %10 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22rc init = 0x5A = 90\22, \22line\22: 46, \22column\22: 12, \22condition\22: \22qc == 90 as u8\22, \22scope\22: \22TestBitPatternThreeResets\22}", %11 : i1
      arc.sim.emit "DRIVER: poke corrupting START", %true : i1
      arc.sim.set_input %arg0, "corrupting_poke_val" = %true : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "corrupting_poke_en" = %true : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.emit "DRIVER: poke corrupting END", %true : i1
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      %12 = arc.sim.get_port %arg0, "qb" : i8, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.emit "qb", %12 : i8
      %13 = arc.sim.get_port %arg0, "qc" : i8, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.emit "qc", %13 : i8
      %14 = arc.sim.get_port %arg0, "corrupting" : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.emit "corrupting", %14 : i1
      %15 = arc.sim.get_port %arg0, "qa" : i8, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.emit "qa", %15 : i8
      arc.sim.emit "DRIVER: poke corrupting START", %false : i1
      arc.sim.set_input %arg0, "corrupting_poke_val" = %false : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "corrupting_poke_en" = %true : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.emit "DRIVER: poke corrupting END", %false : i1
      %16 = arc.sim.get_port %arg0, "qa" : i8, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22qa\22}", %16 : i8
      %17 = comb.concat %false, %16 : i1, i8
      %18 = comb.icmp eq %17, %c255_i9 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22ra after corrupt #1 = 0xFF\22, \22line\22: 52, \22column\22: 12, \22condition\22: \22qa == 255 as u8\22, \22scope\22: \22TestBitPatternThreeResets\22}", %18 : i1
      %19 = arc.sim.get_port %arg0, "qb" : i8, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22qb\22}", %19 : i8
      %20 = comb.concat %false, %19 : i1, i8
      %21 = comb.icmp eq %20, %c255_i9 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22rb after corrupt #1 = 0xFF\22, \22line\22: 53, \22column\22: 12, \22condition\22: \22qb == 255 as u8\22, \22scope\22: \22TestBitPatternThreeResets\22}", %21 : i1
      %22 = arc.sim.get_port %arg0, "qc" : i8, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22qc\22}", %22 : i8
      %23 = comb.concat %false, %22 : i1, i8
      %24 = comb.icmp eq %23, %c255_i9 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22rc after corrupt #1 = 0xFF\22, \22line\22: 54, \22column\22: 12, \22condition\22: \22qc == 255 as u8\22, \22scope\22: \22TestBitPatternThreeResets\22}", %24 : i1
      arc.sim.emit "DRIVER: reset START", %true : i1
      arc.sim.set_input %arg0, "corrupting_poke_en" = %false : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "qa_poke_en" = %false : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "qb_poke_en" = %false : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "qc_poke_en" = %false : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "rst" = %false : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "corrupting_poke_en" = %true : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.emit "DRIVER: reset END", %false : i1
      %25 = arc.sim.get_port %arg0, "qa" : i8, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22qa\22}", %25 : i8
      %26 = comb.concat %false, %25 : i1, i8
      %27 = comb.icmp eq %26, %c181_i9 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22ra restored by reset #1 = 0xB5\22, \22line\22: 56, \22column\22: 12, \22condition\22: \22qa == 181 as u8\22, \22scope\22: \22TestBitPatternThreeResets\22}", %27 : i1
      %28 = arc.sim.get_port %arg0, "qb" : i8, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22qb\22}", %28 : i8
      %29 = comb.concat %false, %28 : i1, i8
      %30 = comb.icmp eq %29, %c171_i9 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22rb restored by reset #1 = 0xAB\22, \22line\22: 57, \22column\22: 12, \22condition\22: \22qb == 171 as u8\22, \22scope\22: \22TestBitPatternThreeResets\22}", %30 : i1
      %31 = arc.sim.get_port %arg0, "qc" : i8, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22qc\22}", %31 : i8
      %32 = comb.concat %false, %31 : i1, i8
      %33 = comb.icmp eq %32, %10 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22rc restored by reset #1 = 0x5A\22, \22line\22: 58, \22column\22: 12, \22condition\22: \22qc == 90 as u8\22, \22scope\22: \22TestBitPatternThreeResets\22}", %33 : i1
      arc.sim.emit "DRIVER: poke corrupting START", %true : i1
      arc.sim.set_input %arg0, "corrupting_poke_val" = %true : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "corrupting_poke_en" = %true : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.emit "DRIVER: poke corrupting END", %true : i1
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      %34 = arc.sim.get_port %arg0, "qb" : i8, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.emit "qb", %34 : i8
      %35 = arc.sim.get_port %arg0, "qc" : i8, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.emit "qc", %35 : i8
      %36 = arc.sim.get_port %arg0, "corrupting" : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.emit "corrupting", %36 : i1
      %37 = arc.sim.get_port %arg0, "qa" : i8, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.emit "qa", %37 : i8
      arc.sim.emit "DRIVER: poke corrupting START", %false : i1
      arc.sim.set_input %arg0, "corrupting_poke_val" = %false : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "corrupting_poke_en" = %true : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.emit "DRIVER: poke corrupting END", %false : i1
      %38 = arc.sim.get_port %arg0, "qa" : i8, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22qa\22}", %38 : i8
      %39 = comb.concat %false, %38 : i1, i8
      %40 = comb.icmp eq %39, %c255_i9 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22ra after corrupt #2 = 0xFF\22, \22line\22: 64, \22column\22: 12, \22condition\22: \22qa == 255 as u8\22, \22scope\22: \22TestBitPatternThreeResets\22}", %40 : i1
      arc.sim.emit "DRIVER: reset START", %true : i1
      arc.sim.set_input %arg0, "corrupting_poke_en" = %false : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "qa_poke_en" = %false : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "qb_poke_en" = %false : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "qc_poke_en" = %false : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "rst" = %false : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "corrupting_poke_en" = %true : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.emit "DRIVER: reset END", %false : i1
      %41 = arc.sim.get_port %arg0, "qa" : i8, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22qa\22}", %41 : i8
      %42 = comb.concat %false, %41 : i1, i8
      %43 = comb.icmp eq %42, %c181_i9 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22ra restored by reset #2 = 0xB5\22, \22line\22: 66, \22column\22: 12, \22condition\22: \22qa == 181 as u8\22, \22scope\22: \22TestBitPatternThreeResets\22}", %43 : i1
      %44 = arc.sim.get_port %arg0, "qb" : i8, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22qb\22}", %44 : i8
      %45 = comb.concat %false, %44 : i1, i8
      %46 = comb.icmp eq %45, %c171_i9 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22rb restored by reset #2 = 0xAB\22, \22line\22: 67, \22column\22: 12, \22condition\22: \22qb == 171 as u8\22, \22scope\22: \22TestBitPatternThreeResets\22}", %46 : i1
      %47 = arc.sim.get_port %arg0, "qc" : i8, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22qc\22}", %47 : i8
      %48 = comb.concat %false, %47 : i1, i8
      %49 = comb.icmp eq %48, %10 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22rc restored by reset #2 = 0x5A\22, \22line\22: 68, \22column\22: 12, \22condition\22: \22qc == 90 as u8\22, \22scope\22: \22TestBitPatternThreeResets\22}", %49 : i1
      arc.sim.emit "DRIVER: poke corrupting START", %true : i1
      arc.sim.set_input %arg0, "corrupting_poke_val" = %true : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "corrupting_poke_en" = %true : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.emit "DRIVER: poke corrupting END", %true : i1
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      %50 = arc.sim.get_port %arg0, "qb" : i8, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.emit "qb", %50 : i8
      %51 = arc.sim.get_port %arg0, "qc" : i8, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.emit "qc", %51 : i8
      %52 = arc.sim.get_port %arg0, "corrupting" : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.emit "corrupting", %52 : i1
      %53 = arc.sim.get_port %arg0, "qa" : i8, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.emit "qa", %53 : i8
      arc.sim.emit "DRIVER: poke corrupting START", %false : i1
      arc.sim.set_input %arg0, "corrupting_poke_val" = %false : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "corrupting_poke_en" = %true : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.emit "DRIVER: poke corrupting END", %false : i1
      arc.sim.emit "DRIVER: reset START", %true : i1
      arc.sim.set_input %arg0, "corrupting_poke_en" = %false : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "qa_poke_en" = %false : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "qb_poke_en" = %false : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "qc_poke_en" = %false : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "rst" = %false : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.set_input %arg0, "corrupting_poke_en" = %true : i1, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.emit "DRIVER: reset END", %false : i1
      %54 = arc.sim.get_port %arg0, "qa" : i8, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22qa\22}", %54 : i8
      %55 = comb.concat %false, %54 : i1, i8
      %56 = comb.icmp eq %55, %c181_i9 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22ra restored by reset #3 = 0xB5\22, \22line\22: 75, \22column\22: 12, \22condition\22: \22qa == 181 as u8\22, \22scope\22: \22TestBitPatternThreeResets\22}", %56 : i1
      %57 = arc.sim.get_port %arg0, "qb" : i8, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22qb\22}", %57 : i8
      %58 = comb.concat %false, %57 : i1, i8
      %59 = comb.icmp eq %58, %c171_i9 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22rb restored by reset #3 = 0xAB\22, \22line\22: 76, \22column\22: 12, \22condition\22: \22qb == 171 as u8\22, \22scope\22: \22TestBitPatternThreeResets\22}", %59 : i1
      %60 = arc.sim.get_port %arg0, "qc" : i8, !arc.sim.instance<@TestBitPatternThreeResets_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22qc\22}", %60 : i8
      %61 = comb.concat %false, %60 : i1, i8
      %62 = comb.icmp eq %61, %10 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22rc restored by reset #3 = 0x5A\22, \22line\22: 77, \22column\22: 12, \22condition\22: \22qc == 90 as u8\22, \22scope\22: \22TestBitPatternThreeResets\22}", %62 : i1
    }
    return
  }
}