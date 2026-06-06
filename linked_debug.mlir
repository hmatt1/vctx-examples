module {



  hw.module private @components_component_chain_pipeline_PipeStage(in %clk : !seq.clock, in %rst : i1, in %d : i8, out q : i8) {
    %true = hw.constant true
    %c0_i8 = hw.constant 0 : i8 {sv.namehint = "r_next"}
    %false = hw.constant false {sv.namehint = "r_next_0_to_1"}
    %c0_i7 = hw.constant 0 : i7
    %0 = comb.concat %c0_i7, %false {sv.namehint = "r_next_0_to_1_zext_8"} : i7, i1
    %r = seq.compreg %8, %clk : i8  
    %false_0 = hw.constant false
    %1 = comb.concat %false_0, %d : i1, i8
    %c0_i8_1 = hw.constant 0 : i8
    %2 = comb.concat %c0_i8_1, %true : i8, i1
    %false_2 = hw.constant false
    %3 = comb.concat %false_2, %1 : i1, i9
    %false_3 = hw.constant false
    %4 = comb.concat %false_3, %2 : i1, i9
    %5 = comb.add %3, %4 : i10
    %6 = comb.extract %5 from 0 : (i10) -> i9
    %7 = comb.extract %6 from 0 : (i9) -> i8
    %8 = comb.mux %rst, %0, %7 : i8
    hw.output %r : i8
  }
  hw.module private @components_component_chain_pipeline_PipelineChain3(in %clk : !seq.clock, in %rst : i1, in %d : i8, out q : i8, out val_s1 : i8, out val_s2 : i8) {
    %PipeStage_inst_13_1.q = hw.instance "PipeStage_inst_13_1" sym @PipeStage_inst_13_1 @components_component_chain_pipeline_PipeStage(clk: %clk: !seq.clock, rst: %rst: i1, d: %d: i8) -> (q: i8)
    %PipeStage_inst_13_1.q_0 = hw.instance "PipeStage_inst_13_1" sym @PipeStage_inst_13_1 @components_component_chain_pipeline_PipeStage(clk: %clk: !seq.clock, rst: %rst: i1, d: %PipeStage_inst_13_1.q: i8) -> (q: i8)
    %PipeStage_inst_13_1.q_1 = hw.instance "PipeStage_inst_13_1" sym @PipeStage_inst_13_1 @components_component_chain_pipeline_PipeStage(clk: %clk: !seq.clock, rst: %rst: i1, d: %PipeStage_inst_13_1.q_0: i8) -> (q: i8)
    hw.output %PipeStage_inst_13_1.q_1, %PipeStage_inst_13_1.q, %PipeStage_inst_13_1.q_0 : i8, i8, i8
  }
  hw.module @TestComponentChainPipeline_Harness(in %clk : !seq.clock, in %rst : i1, in %d_poke_val : i8, in %d_poke_en : i1, in %i7_poke_val : i7, in %i7_poke_en : i1, in %q_poke_val : i8, in %q_poke_en : i1, in %r7a_poke_val : i7, in %r7a_poke_en : i1, in %r7b_poke_val : i7, in %r7b_poke_en : i1, in %rs1_poke_val : i8, in %rs1_poke_en : i1, in %rs2_poke_val : i8, in %rs2_poke_en : i1, in %si_poke_val : i8, in %si_poke_en : i1, in %val_s1_poke_val : i8, in %val_s1_poke_en : i1, in %val_s2_poke_val : i8, in %val_s2_poke_en : i1, out d : i8, out i7 : i7, out q : i8, out r7a : i7, out r7b : i7, out rs1 : i8, out rs2 : i8, out si : i8, out val_s1 : i8, out val_s2 : i8) {
    %c-1_i7 = hw.constant -1 : i7
    %c0_i7 = hw.constant 0 : i7 {sv.namehint = "r7b_next"}
    %c0_i5 = hw.constant 0 : i5
    %c10_i5 = hw.constant 10 : i5
    %c0_i8 = hw.constant 0 : i8 {sv.namehint = "rs2_next"}
    %false = hw.constant false {sv.namehint = "rs2_next_0_to_1"}
    %c0_i7_0 = hw.constant 0 : i7
    %0 = comb.concat %c0_i7_0, %false {sv.namehint = "rs2_next_0_to_1_zext_8"} : i7, i1
    %c0_i7_1 = hw.constant 0 : i7
    %1 = comb.concat %c0_i7_1, %false {sv.namehint = "rs2_next_0_to_1_zext_8"} : i7, i1
    %rs1 = seq.compreg %24, %clk : i8  
    %rs2 = seq.compreg %26, %clk : i8  
    %c-6_i4 = hw.constant -6 : i4
    %false_2 = hw.constant false
    %2 = comb.concat %false_2, %c-6_i4 : i1, i4
    %false_3 = hw.constant false
    %3 = comb.concat %false_3, %c0_i5 : i1, i5
    %4 = comb.extract %2 from 4 : (i5) -> i1
    %5 = comb.concat %4, %2 : i1, i5
    %6 = comb.sub %3, %5 : i6
    %7 = comb.extract %6 from 0 : (i6) -> i5
    %8 = comb.extract %7 from 4 : (i5) -> i1
    %9 = comb.replicate %8 : (i1) -> i3
    %10 = comb.concat %9, %7 : i3, i5
    %false_4 = hw.constant false {sv.namehint = "r7b_next_0_to_1"}
    %c0_i6 = hw.constant 0 : i6
    %11 = comb.concat %c0_i6, %false_4 {sv.namehint = "r7b_next_0_to_1_zext_7"} : i6, i1
    %r7a = seq.compreg %20, %clk : i7  
    %r7b = seq.compreg %22, %clk : i7  
    %PipelineChain3_inst_32_1.q, %PipelineChain3_inst_32_1.val_s1, %PipelineChain3_inst_32_1.val_s2 = hw.instance "PipelineChain3_inst_32_1" sym @PipelineChain3_inst_32_1 @components_component_chain_pipeline_PipelineChain3(clk: %clk: !seq.clock, rst: %rst: i1, d: %12: i8) -> (q: i8, val_s1: i8, val_s2: i8)
    %12 = comb.mux %d_poke_en, %d_poke_val, %0 {sv.namehint = "d_wire"} : i8
    %13 = comb.mux %i7_poke_en, %i7_poke_val, %c-1_i7 {sv.namehint = "i7_wire"} : i7
    %14 = comb.mux %r7a_poke_en, %r7a_poke_val, %r7a : i7
    %15 = comb.mux %r7b_poke_en, %r7b_poke_val, %r7b : i7
    %16 = comb.mux %rs1_poke_en, %rs1_poke_val, %rs1 : i8
    %17 = comb.mux %rs2_poke_en, %rs2_poke_val, %rs2 : i8
    %18 = comb.mux %si_poke_en, %si_poke_val, %10 {sv.namehint = "si_wire"} : i8
    %19 = comb.mux %r7a_poke_en, %r7a_poke_val, %13 : i7
    %20 = comb.mux %rst, %11, %19 : i7
    %21 = comb.mux %r7b_poke_en, %r7b_poke_val, %r7a : i7
    %22 = comb.mux %rst, %11, %21 : i7
    %23 = comb.mux %rs1_poke_en, %rs1_poke_val, %18 : i8
    %24 = comb.mux %rst, %1, %23 : i8
    %25 = comb.mux %rs2_poke_en, %rs2_poke_val, %rs1 : i8
    %26 = comb.mux %rst, %1, %25 : i8
    hw.output %12, %13, %PipelineChain3_inst_32_1.q, %14, %15, %16, %17, %18, %PipelineChain3_inst_32_1.val_s1, %PipelineChain3_inst_32_1.val_s2 : i8, i7, i8, i7, i7, i8, i8, i8, i8, i8
  }
  func.func @entry() {
    %c-1_i7 = hw.constant -1 : i7
    %c0_i5 = hw.constant 0 : i5
    %c10_i5 = hw.constant 10 : i5
    %c-3_i4 = hw.constant -3 : i4
    %c-10_i5 = hw.constant -10 : i5
    %c-1_i5 = hw.constant -1 : i5
    %c30_i8 = hw.constant 30 : i8
    %c20_i8 = hw.constant 20 : i8
    %c10_i8 = hw.constant 10 : i8
    %c-25_i7 = hw.constant -25 : i7
    %c-2_i2 = hw.constant -2 : i2
    %c-26_i7 = hw.constant -26 : i7
    %c0_i8 = hw.constant 0 : i8
    %c-27_i7 = hw.constant -27 : i7
    %c100_i8 = hw.constant 100 : i8
    %true = hw.constant true
    %false = hw.constant false
    %0 = seq.const_clock high
    %1 = seq.const_clock low
    arc.sim.instantiate @TestComponentChainPipeline_Harness as %arg0 {
      arc.sim.set_input %arg0, "d_poke_en" = %false : i1, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "i7_poke_en" = %false : i1, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "q_poke_en" = %false : i1, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "r7a_poke_en" = %false : i1, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "r7b_poke_en" = %false : i1, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "rs1_poke_en" = %false : i1, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "rs2_poke_en" = %false : i1, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "si_poke_en" = %false : i1, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "val_s1_poke_en" = %false : i1, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "val_s2_poke_en" = %false : i1, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "rst" = %false : i1, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestComponentChainPipeline_Harness>
      %2 = arc.sim.get_port %arg0, "val_s2" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22val_s2\22}", %2 : i8
      %3 = arc.sim.get_port %arg0, "val_s1" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22val_s1\22}", %3 : i8
      %4 = arc.sim.get_port %arg0, "q" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22q\22}", %4 : i8
      %false_0 = hw.constant false
      %5 = comb.concat %false_0, %3 : i1, i8
      %c0_i8_1 = hw.constant 0 : i8
      %6 = comb.concat %c0_i8_1, %false : i8, i1
      %7 = comb.icmp eq %5, %6 : i9
      %false_2 = hw.constant false
      %8 = comb.concat %false_2, %2 : i1, i8
      %9 = comb.icmp eq %8, %6 : i9
      %false_3 = hw.constant false
      %10 = comb.concat %false_3, %4 : i1, i8
      %11 = comb.icmp eq %10, %6 : i9
      %12 = comb.and %7, %9, %11 : i1
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Pipeline starts at 0\22, \22line\22: 42, \22column\22: 12, \22condition\22: \22val_s1 == 0 and val_s2 == 0 and q == 0\22, \22scope\22: \22TestComponentChainPipeline\22}", %12 : i1
      %c-28_i7 = hw.constant -28 : i7
      %false_4 = hw.constant false
      %13 = comb.concat %false_4, %c-28_i7 : i1, i7
      arc.sim.emit "DRIVER: poke d START", %13 : i8
      arc.sim.set_input %arg0, "d_poke_val" = %13 : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "d_poke_en" = %true : i1, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "DRIVER: poke d END", %13 : i8
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestComponentChainPipeline_Harness>
      %14 = arc.sim.get_port %arg0, "r7a" : i7, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "r7a", %14 : i7
      %15 = arc.sim.get_port %arg0, "rs1" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "rs1", %15 : i8
      %16 = arc.sim.get_port %arg0, "rs2" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "rs2", %16 : i8
      %17 = arc.sim.get_port %arg0, "i7" : i7, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "i7", %17 : i7
      %18 = arc.sim.get_port %arg0, "d" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "d", %18 : i8
      %19 = arc.sim.get_port %arg0, "val_s2" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "val_s2", %19 : i8
      %20 = arc.sim.get_port %arg0, "q" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "q", %20 : i8
      %21 = arc.sim.get_port %arg0, "si" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "si", %21 : i8
      %22 = arc.sim.get_port %arg0, "r7b" : i7, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "r7b", %22 : i7
      %23 = arc.sim.get_port %arg0, "val_s1" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "val_s1", %23 : i8
      %24 = arc.sim.get_port %arg0, "val_s1" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22val_s1\22}", %24 : i8
      %false_5 = hw.constant false
      %25 = comb.concat %false_5, %24 : i1, i8
      %c0_i2 = hw.constant 0 : i2
      %26 = comb.concat %c0_i2, %c-27_i7 : i2, i7
      %27 = comb.icmp eq %25, %26 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Stage 1: 100+1 = 101\22, \22line\22: 49, \22column\22: 12, \22condition\22: \22val_s1 == 101\22, \22scope\22: \22TestComponentChainPipeline\22}", %27 : i1
      %28 = arc.sim.get_port %arg0, "val_s2" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22val_s2\22}", %28 : i8
      %false_6 = hw.constant false
      %29 = comb.concat %false_6, %28 : i1, i8
      %c0_i8_7 = hw.constant 0 : i8
      %30 = comb.concat %c0_i8_7, %true : i8, i1
      %31 = comb.icmp eq %29, %30 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Stage 2: 0+1 = 1\22, \22line\22: 50, \22column\22: 12, \22condition\22: \22val_s2 == 1\22, \22scope\22: \22TestComponentChainPipeline\22}", %31 : i1
      %32 = arc.sim.get_port %arg0, "q" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22q\22}", %32 : i8
      %false_8 = hw.constant false
      %33 = comb.concat %false_8, %32 : i1, i8
      %34 = comb.icmp eq %33, %30 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Stage 3: 0+1 = 1\22, \22line\22: 51, \22column\22: 12, \22condition\22: \22q == 1\22, \22scope\22: \22TestComponentChainPipeline\22}", %34 : i1
      %false_9 = hw.constant false
      %c0_i7 = hw.constant 0 : i7
      %35 = comb.concat %c0_i7, %false_9 : i7, i1
      arc.sim.emit "DRIVER: poke d START", %35 : i8
      arc.sim.set_input %arg0, "d_poke_val" = %35 : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "d_poke_en" = %true : i1, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "DRIVER: poke d END", %35 : i8
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestComponentChainPipeline_Harness>
      %36 = arc.sim.get_port %arg0, "r7a" : i7, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "r7a", %36 : i7
      %37 = arc.sim.get_port %arg0, "rs1" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "rs1", %37 : i8
      %38 = arc.sim.get_port %arg0, "rs2" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "rs2", %38 : i8
      %39 = arc.sim.get_port %arg0, "i7" : i7, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "i7", %39 : i7
      %40 = arc.sim.get_port %arg0, "d" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "d", %40 : i8
      %41 = arc.sim.get_port %arg0, "val_s2" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "val_s2", %41 : i8
      %42 = arc.sim.get_port %arg0, "q" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "q", %42 : i8
      %43 = arc.sim.get_port %arg0, "si" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "si", %43 : i8
      %44 = arc.sim.get_port %arg0, "r7b" : i7, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "r7b", %44 : i7
      %45 = arc.sim.get_port %arg0, "val_s1" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "val_s1", %45 : i8
      %46 = arc.sim.get_port %arg0, "val_s1" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22val_s1\22}", %46 : i8
      %false_10 = hw.constant false
      %47 = comb.concat %false_10, %46 : i1, i8
      %48 = comb.icmp eq %47, %30 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Stage 1: (Input 0+1) = 1\22, \22line\22: 58, \22column\22: 12, \22condition\22: \22val_s1 == 1\22, \22scope\22: \22TestComponentChainPipeline\22}", %48 : i1
      %49 = arc.sim.get_port %arg0, "val_s2" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22val_s2\22}", %49 : i8
      %false_11 = hw.constant false
      %50 = comb.concat %false_11, %49 : i1, i8
      %c0_i2_12 = hw.constant 0 : i2
      %51 = comb.concat %c0_i2_12, %c-26_i7 : i2, i7
      %52 = comb.icmp eq %50, %51 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Stage 2: 101+1 = 102\22, \22line\22: 59, \22column\22: 12, \22condition\22: \22val_s2 == 102\22, \22scope\22: \22TestComponentChainPipeline\22}", %52 : i1
      %53 = arc.sim.get_port %arg0, "q" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22q\22}", %53 : i8
      %false_13 = hw.constant false
      %54 = comb.concat %false_13, %53 : i1, i8
      %c0_i7_14 = hw.constant 0 : i7
      %55 = comb.concat %c0_i7_14, %c-2_i2 : i7, i2
      %56 = comb.icmp eq %54, %55 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Stage 3: 1+1 = 2\22, \22line\22: 60, \22column\22: 12, \22condition\22: \22q == 2\22, \22scope\22: \22TestComponentChainPipeline\22}", %56 : i1
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestComponentChainPipeline_Harness>
      %57 = arc.sim.get_port %arg0, "r7a" : i7, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "r7a", %57 : i7
      %58 = arc.sim.get_port %arg0, "rs1" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "rs1", %58 : i8
      %59 = arc.sim.get_port %arg0, "rs2" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "rs2", %59 : i8
      %60 = arc.sim.get_port %arg0, "i7" : i7, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "i7", %60 : i7
      %61 = arc.sim.get_port %arg0, "d" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "d", %61 : i8
      %62 = arc.sim.get_port %arg0, "val_s2" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "val_s2", %62 : i8
      %63 = arc.sim.get_port %arg0, "q" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "q", %63 : i8
      %64 = arc.sim.get_port %arg0, "si" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "si", %64 : i8
      %65 = arc.sim.get_port %arg0, "r7b" : i7, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "r7b", %65 : i7
      %66 = arc.sim.get_port %arg0, "val_s1" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "val_s1", %66 : i8
      %67 = arc.sim.get_port %arg0, "val_s1" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22val_s1\22}", %67 : i8
      %false_15 = hw.constant false
      %68 = comb.concat %false_15, %67 : i1, i8
      %69 = comb.icmp eq %68, %30 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Stage 1: 0+1 = 1\22, \22line\22: 64, \22column\22: 12, \22condition\22: \22val_s1 == 1\22, \22scope\22: \22TestComponentChainPipeline\22}", %69 : i1
      %70 = arc.sim.get_port %arg0, "val_s2" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22val_s2\22}", %70 : i8
      %false_16 = hw.constant false
      %71 = comb.concat %false_16, %70 : i1, i8
      %72 = comb.icmp eq %71, %55 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Stage 2: 1+1 = 2\22, \22line\22: 65, \22column\22: 12, \22condition\22: \22val_s2 == 2\22, \22scope\22: \22TestComponentChainPipeline\22}", %72 : i1
      %73 = arc.sim.get_port %arg0, "q" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22q\22}", %73 : i8
      %false_17 = hw.constant false
      %74 = comb.concat %false_17, %73 : i1, i8
      %c0_i2_18 = hw.constant 0 : i2
      %75 = comb.concat %c0_i2_18, %c-25_i7 : i2, i7
      %76 = comb.icmp eq %74, %75 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Stage 3: 102+1 = 103 reached output\22, \22line\22: 66, \22column\22: 12, \22condition\22: \22q == 103\22, \22scope\22: \22TestComponentChainPipeline\22}", %76 : i1
      %c-6_i4 = hw.constant -6 : i4
      %c0_i4 = hw.constant 0 : i4
      %77 = comb.concat %c0_i4, %c-6_i4 : i4, i4
      arc.sim.emit "DRIVER: poke d START", %77 : i8
      arc.sim.set_input %arg0, "d_poke_val" = %77 : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "d_poke_en" = %true : i1, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "DRIVER: poke d END", %77 : i8
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestComponentChainPipeline_Harness>
      %78 = arc.sim.get_port %arg0, "r7a" : i7, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "r7a", %78 : i7
      %79 = arc.sim.get_port %arg0, "rs1" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "rs1", %79 : i8
      %80 = arc.sim.get_port %arg0, "rs2" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "rs2", %80 : i8
      %81 = arc.sim.get_port %arg0, "i7" : i7, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "i7", %81 : i7
      %82 = arc.sim.get_port %arg0, "d" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "d", %82 : i8
      %83 = arc.sim.get_port %arg0, "val_s2" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "val_s2", %83 : i8
      %84 = arc.sim.get_port %arg0, "q" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "q", %84 : i8
      %85 = arc.sim.get_port %arg0, "si" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "si", %85 : i8
      %86 = arc.sim.get_port %arg0, "r7b" : i7, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "r7b", %86 : i7
      %87 = arc.sim.get_port %arg0, "val_s1" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "val_s1", %87 : i8
      %c-12_i5 = hw.constant -12 : i5
      %c0_i3 = hw.constant 0 : i3
      %88 = comb.concat %c0_i3, %c-12_i5 : i3, i5
      arc.sim.emit "DRIVER: poke d START", %88 : i8
      arc.sim.set_input %arg0, "d_poke_val" = %88 : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "d_poke_en" = %true : i1, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "DRIVER: poke d END", %88 : i8
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestComponentChainPipeline_Harness>
      %89 = arc.sim.get_port %arg0, "r7a" : i7, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "r7a", %89 : i7
      %90 = arc.sim.get_port %arg0, "rs1" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "rs1", %90 : i8
      %91 = arc.sim.get_port %arg0, "rs2" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "rs2", %91 : i8
      %92 = arc.sim.get_port %arg0, "i7" : i7, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "i7", %92 : i7
      %93 = arc.sim.get_port %arg0, "d" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "d", %93 : i8
      %94 = arc.sim.get_port %arg0, "val_s2" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "val_s2", %94 : i8
      %95 = arc.sim.get_port %arg0, "q" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "q", %95 : i8
      %96 = arc.sim.get_port %arg0, "si" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "si", %96 : i8
      %97 = arc.sim.get_port %arg0, "r7b" : i7, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "r7b", %97 : i7
      %98 = arc.sim.get_port %arg0, "val_s1" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "val_s1", %98 : i8
      %c-2_i5 = hw.constant -2 : i5
      %c0_i3_19 = hw.constant 0 : i3
      %99 = comb.concat %c0_i3_19, %c-2_i5 : i3, i5
      arc.sim.emit "DRIVER: poke d START", %99 : i8
      arc.sim.set_input %arg0, "d_poke_val" = %99 : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "d_poke_en" = %true : i1, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "DRIVER: poke d END", %99 : i8
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestComponentChainPipeline_Harness>
      %100 = arc.sim.get_port %arg0, "r7a" : i7, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "r7a", %100 : i7
      %101 = arc.sim.get_port %arg0, "rs1" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "rs1", %101 : i8
      %102 = arc.sim.get_port %arg0, "rs2" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "rs2", %102 : i8
      %103 = arc.sim.get_port %arg0, "i7" : i7, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "i7", %103 : i7
      %104 = arc.sim.get_port %arg0, "d" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "d", %104 : i8
      %105 = arc.sim.get_port %arg0, "val_s2" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "val_s2", %105 : i8
      %106 = arc.sim.get_port %arg0, "q" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "q", %106 : i8
      %107 = arc.sim.get_port %arg0, "si" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "si", %107 : i8
      %108 = arc.sim.get_port %arg0, "r7b" : i7, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "r7b", %108 : i7
      %109 = arc.sim.get_port %arg0, "val_s1" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "val_s1", %109 : i8
      %110 = arc.sim.get_port %arg0, "val_s1" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22val_s1\22}", %110 : i8
      %false_20 = hw.constant false
      %111 = comb.concat %false_20, %110 : i1, i8
      %c0_i4_21 = hw.constant 0 : i4
      %112 = comb.concat %c0_i4_21, %c-1_i5 : i4, i5
      %113 = comb.icmp eq %111, %112 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Streaming: Stage 1 has 31\22, \22line\22: 81, \22column\22: 12, \22condition\22: \22val_s1 == 31\22, \22scope\22: \22TestComponentChainPipeline\22}", %113 : i1
      %114 = arc.sim.get_port %arg0, "val_s2" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22val_s2\22}", %114 : i8
      %false_22 = hw.constant false
      %115 = comb.concat %false_22, %114 : i1, i8
      %c0_i4_23 = hw.constant 0 : i4
      %116 = comb.concat %c0_i4_23, %c-10_i5 : i4, i5
      %117 = comb.icmp eq %115, %116 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Streaming: Stage 2 has 22\22, \22line\22: 82, \22column\22: 12, \22condition\22: \22val_s2 == 22\22, \22scope\22: \22TestComponentChainPipeline\22}", %117 : i1
      %118 = arc.sim.get_port %arg0, "q" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22q\22}", %118 : i8
      %false_24 = hw.constant false
      %119 = comb.concat %false_24, %118 : i1, i8
      %c0_i5_25 = hw.constant 0 : i5
      %120 = comb.concat %c0_i5_25, %c-3_i4 : i5, i4
      %121 = comb.icmp eq %119, %120 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Streaming: Stage 3 has 13\22, \22line\22: 83, \22column\22: 12, \22condition\22: \22q == 13\22, \22scope\22: \22TestComponentChainPipeline\22}", %121 : i1
      arc.sim.emit "DRIVER: reset START", %true : i1
      arc.sim.set_input %arg0, "d_poke_en" = %false : i1, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "i7_poke_en" = %false : i1, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "q_poke_en" = %false : i1, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "r7a_poke_en" = %false : i1, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "r7b_poke_en" = %false : i1, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "rs1_poke_en" = %false : i1, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "rs2_poke_en" = %false : i1, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "si_poke_en" = %false : i1, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "val_s1_poke_en" = %false : i1, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "val_s2_poke_en" = %false : i1, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "rst" = %false : i1, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "d_poke_en" = %true : i1, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "DRIVER: reset END", %false : i1
      %122 = arc.sim.get_port %arg0, "val_s2" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22val_s2\22}", %122 : i8
      %123 = arc.sim.get_port %arg0, "val_s1" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22val_s1\22}", %123 : i8
      %124 = arc.sim.get_port %arg0, "q" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22q\22}", %124 : i8
      %false_26 = hw.constant false
      %125 = comb.concat %false_26, %123 : i1, i8
      %126 = comb.icmp eq %125, %6 : i9
      %false_27 = hw.constant false
      %127 = comb.concat %false_27, %122 : i1, i8
      %128 = comb.icmp eq %127, %6 : i9
      %false_28 = hw.constant false
      %129 = comb.concat %false_28, %124 : i1, i8
      %130 = comb.icmp eq %129, %6 : i9
      %131 = comb.and %126, %128, %130 : i1
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Chain reset to 0\22, \22line\22: 87, \22column\22: 12, \22condition\22: \22val_s1 == 0 and val_s2 == 0 and q == 0\22, \22scope\22: \22TestComponentChainPipeline\22}", %131 : i1
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestComponentChainPipeline_Harness>
      %132 = arc.sim.get_port %arg0, "r7a" : i7, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "r7a", %132 : i7
      %133 = arc.sim.get_port %arg0, "rs1" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "rs1", %133 : i8
      %134 = arc.sim.get_port %arg0, "rs2" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "rs2", %134 : i8
      %135 = arc.sim.get_port %arg0, "i7" : i7, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "i7", %135 : i7
      %136 = arc.sim.get_port %arg0, "d" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "d", %136 : i8
      %137 = arc.sim.get_port %arg0, "val_s2" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "val_s2", %137 : i8
      %138 = arc.sim.get_port %arg0, "q" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "q", %138 : i8
      %139 = arc.sim.get_port %arg0, "si" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "si", %139 : i8
      %140 = arc.sim.get_port %arg0, "r7b" : i7, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "r7b", %140 : i7
      %141 = arc.sim.get_port %arg0, "val_s1" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "val_s1", %141 : i8
      %142 = arc.sim.get_port %arg0, "rs1" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22rs1\22}", %142 : i8
      %c-6_i4_29 = hw.constant -6 : i4
      %false_30 = hw.constant false
      %143 = comb.concat %false_30, %c-6_i4_29 : i1, i4
      %false_31 = hw.constant false
      %144 = comb.concat %false_31, %c0_i5 : i1, i5
      %145 = comb.extract %143 from 4 : (i5) -> i1
      %146 = comb.concat %145, %143 : i1, i5
      %147 = comb.sub %144, %146 : i6
      %148 = comb.extract %147 from 0 : (i6) -> i5
      %149 = comb.extract %148 from 4 : (i5) -> i1
      %150 = comb.replicate %149 : (i1) -> i3
      %151 = comb.concat %150, %148 : i3, i5
      %152 = comb.icmp eq %142, %151 : i8
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Signed chain stage 1\22, \22line\22: 98, \22column\22: 12, \22condition\22: \22rs1 == - 10\22, \22scope\22: \22TestComponentChainPipeline\22}", %152 : i1
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestComponentChainPipeline_Harness>
      %153 = arc.sim.get_port %arg0, "r7a" : i7, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "r7a", %153 : i7
      %154 = arc.sim.get_port %arg0, "rs1" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "rs1", %154 : i8
      %155 = arc.sim.get_port %arg0, "rs2" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "rs2", %155 : i8
      %156 = arc.sim.get_port %arg0, "i7" : i7, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "i7", %156 : i7
      %157 = arc.sim.get_port %arg0, "d" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "d", %157 : i8
      %158 = arc.sim.get_port %arg0, "val_s2" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "val_s2", %158 : i8
      %159 = arc.sim.get_port %arg0, "q" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "q", %159 : i8
      %160 = arc.sim.get_port %arg0, "si" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "si", %160 : i8
      %161 = arc.sim.get_port %arg0, "r7b" : i7, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "r7b", %161 : i7
      %162 = arc.sim.get_port %arg0, "val_s1" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "val_s1", %162 : i8
      %163 = arc.sim.get_port %arg0, "rs2" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22rs2\22}", %163 : i8
      %164 = comb.icmp eq %163, %151 : i8
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Signed chain stage 2\22, \22line\22: 100, \22column\22: 12, \22condition\22: \22rs2 == - 10\22, \22scope\22: \22TestComponentChainPipeline\22}", %164 : i1
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestComponentChainPipeline_Harness>
      %165 = arc.sim.get_port %arg0, "r7a" : i7, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "r7a", %165 : i7
      %166 = arc.sim.get_port %arg0, "rs1" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "rs1", %166 : i8
      %167 = arc.sim.get_port %arg0, "rs2" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "rs2", %167 : i8
      %168 = arc.sim.get_port %arg0, "i7" : i7, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "i7", %168 : i7
      %169 = arc.sim.get_port %arg0, "d" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "d", %169 : i8
      %170 = arc.sim.get_port %arg0, "val_s2" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "val_s2", %170 : i8
      %171 = arc.sim.get_port %arg0, "q" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "q", %171 : i8
      %172 = arc.sim.get_port %arg0, "si" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "si", %172 : i8
      %173 = arc.sim.get_port %arg0, "r7b" : i7, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "r7b", %173 : i7
      %174 = arc.sim.get_port %arg0, "val_s1" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "val_s1", %174 : i8
      %175 = arc.sim.get_port %arg0, "r7a" : i7, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22r7a\22}", %175 : i7
      %false_32 = hw.constant false
      %176 = comb.concat %false_32, %175 : i1, i7
      %false_33 = hw.constant false
      %177 = comb.concat %false_33, %c-1_i7 : i1, i7
      %178 = comb.icmp eq %176, %177 : i8
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u7 chain stage 1\22, \22line\22: 110, \22column\22: 12, \22condition\22: \22r7a == 127\22, \22scope\22: \22TestComponentChainPipeline\22}", %178 : i1
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestComponentChainPipeline_Harness>
      %179 = arc.sim.get_port %arg0, "r7a" : i7, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "r7a", %179 : i7
      %180 = arc.sim.get_port %arg0, "rs1" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "rs1", %180 : i8
      %181 = arc.sim.get_port %arg0, "rs2" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "rs2", %181 : i8
      %182 = arc.sim.get_port %arg0, "i7" : i7, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "i7", %182 : i7
      %183 = arc.sim.get_port %arg0, "d" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "d", %183 : i8
      %184 = arc.sim.get_port %arg0, "val_s2" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "val_s2", %184 : i8
      %185 = arc.sim.get_port %arg0, "q" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "q", %185 : i8
      %186 = arc.sim.get_port %arg0, "si" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "si", %186 : i8
      %187 = arc.sim.get_port %arg0, "r7b" : i7, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "r7b", %187 : i7
      %188 = arc.sim.get_port %arg0, "val_s1" : i8, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "val_s1", %188 : i8
      %189 = arc.sim.get_port %arg0, "r7b" : i7, !arc.sim.instance<@TestComponentChainPipeline_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22r7b\22}", %189 : i7
      %false_34 = hw.constant false
      %190 = comb.concat %false_34, %189 : i1, i7
      %191 = comb.icmp eq %190, %177 : i8
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u7 chain stage 2\22, \22line\22: 112, \22column\22: 12, \22condition\22: \22r7b == 127\22, \22scope\22: \22TestComponentChainPipeline\22}", %191 : i1
    }
    return
  }
}