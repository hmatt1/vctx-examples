module {



  hw.module private @registers_handshake_buffer_HandshakeBuffer(in %clk : !seq.clock, in %rst : i1, in %valid : i1, in %data_in : i8, in %ready : i1, out data_out : i8, out full : i1, out accepting : i1) {
    %true = hw.constant true
    %false = hw.constant false
    %c0_i8 = hw.constant 0 : i8
    %buf = seq.compreg %8, %clk : i8  
    %is_full = seq.compreg %10, %clk : i1  
    %0 = comb.icmp eq %is_full, %false : i1
    %1 = comb.and %0, %valid : i1
    %2 = comb.xor %1, %true : i1
    %3 = comb.and %2, %is_full, %ready : i1
    %4 = comb.xor %3, %true : i1
    %5 = comb.and %4, %is_full : i1
    %6 = comb.or %1, %5 : i1
    %7 = comb.mux %1, %data_in, %buf : i8
    %8 = comb.mux %rst, %c0_i8, %7 : i8
    %9 = comb.xor %rst, %true : i1
    %10 = comb.and %9, %6 : i1
    hw.output %buf, %is_full, %0 : i8, i1, i1
  }
  hw.module @TestHandshakeBufferWriteAfterDrain_Harness(in %clk : !seq.clock, in %rst : i1, in %accepting_poke_val : i1, in %accepting_poke_en : i1, in %data_in_poke_val : i8, in %data_in_poke_en : i1, in %data_out_poke_val : i8, in %data_out_poke_en : i1, in %full_poke_val : i1, in %full_poke_en : i1, in %ready_poke_val : i1, in %ready_poke_en : i1, in %valid_poke_val : i1, in %valid_poke_en : i1, out accepting : i1, out data_in : i8, out data_out : i8, out full : i1, out ready : i1, out valid : i1) {
    %c0_i8 = hw.constant 0 : i8
    %HandshakeBuffer_inst_149_1.data_out, %HandshakeBuffer_inst_149_1.full, %HandshakeBuffer_inst_149_1.accepting = hw.instance "HandshakeBuffer_inst_149_1" sym @HandshakeBuffer_inst_149_1 @registers_handshake_buffer_HandshakeBuffer(clk: %clk: !seq.clock, rst: %rst: i1, valid: %5: i1, data_in: %1: i8, ready: %4: i1) -> (data_out: i8, full: i1, accepting: i1)
    %0 = comb.mux %accepting_poke_en, %accepting_poke_val, %HandshakeBuffer_inst_149_1.accepting : i1
    %1 = comb.mux %data_in_poke_en, %data_in_poke_val, %c0_i8 : i8
    %2 = comb.mux %data_out_poke_en, %data_out_poke_val, %HandshakeBuffer_inst_149_1.data_out : i8
    %3 = comb.mux %full_poke_en, %full_poke_val, %HandshakeBuffer_inst_149_1.full : i1
    %4 = comb.and %ready_poke_en, %ready_poke_val : i1
    %5 = comb.and %valid_poke_en, %valid_poke_val : i1
    hw.output %0, %1, %2, %3, %4, %5 : i1, i8, i8, i1, i1, i1
  }
  func.func @entry() {
    %c34_i9 = hw.constant 34 : i9
    %c1_i2 = hw.constant 1 : i2
    %c34_i8 = hw.constant 34 : i8
    %c0_i2 = hw.constant 0 : i2
    %c17_i9 = hw.constant 17 : i9
    %c17_i8 = hw.constant 17 : i8
    %c0_i8 = hw.constant 0 : i8
    %true = hw.constant true
    %false = hw.constant false
    %0 = seq.const_clock high
    %1 = seq.const_clock low
    arc.sim.instantiate @TestHandshakeBufferWriteAfterDrain_Harness as %arg0 {
      arc.sim.set_input %arg0, "accepting_poke_en" = %false : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.set_input %arg0, "data_in_poke_en" = %false : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.set_input %arg0, "data_out_poke_en" = %false : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.set_input %arg0, "full_poke_en" = %false : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.set_input %arg0, "ready_poke_en" = %false : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.set_input %arg0, "valid_poke_en" = %false : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.set_input %arg0, "valid_poke_val" = %false : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.set_input %arg0, "valid_poke_en" = %true : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.set_input %arg0, "data_in_poke_val" = %c0_i8 : i8, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.set_input %arg0, "data_in_poke_en" = %true : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.set_input %arg0, "ready_poke_val" = %false : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.set_input %arg0, "ready_poke_en" = %true : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.set_input %arg0, "rst" = %false : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.emit "DRIVER: poke valid START", %true : i1
      arc.sim.set_input %arg0, "valid_poke_val" = %true : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.set_input %arg0, "valid_poke_en" = %true : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.emit "DRIVER: poke valid END", %true : i1
      arc.sim.emit "DRIVER: poke data_in START", %c17_i8 : i8
      arc.sim.set_input %arg0, "data_in_poke_val" = %c17_i8 : i8, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.set_input %arg0, "data_in_poke_en" = %true : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.emit "DRIVER: poke data_in END", %c17_i8 : i8
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      %2 = arc.sim.get_port %arg0, "ready" : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.emit "ready", %2 : i1
      %3 = arc.sim.get_port %arg0, "data_out" : i8, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.emit "data_out", %3 : i8
      %4 = arc.sim.get_port %arg0, "data_in" : i8, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.emit "data_in", %4 : i8
      %5 = arc.sim.get_port %arg0, "valid" : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.emit "valid", %5 : i1
      %6 = arc.sim.get_port %arg0, "accepting" : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.emit "accepting", %6 : i1
      %7 = arc.sim.get_port %arg0, "full" : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.emit "full", %7 : i1
      arc.sim.emit "DRIVER: poke valid START", %false : i1
      arc.sim.set_input %arg0, "valid_poke_val" = %false : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.set_input %arg0, "valid_poke_en" = %true : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.emit "DRIVER: poke valid END", %false : i1
      %8 = arc.sim.get_port %arg0, "data_out" : i8, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22data_out\22}", %8 : i8
      %9 = comb.concat %false, %8 : i1, i8
      %10 = comb.icmp eq %9, %c17_i9 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22first write: 0x11\22, \22line\22: 164, \22column\22: 12, \22condition\22: \22data_out == 0x11\22, \22scope\22: \22TestHandshakeBufferWriteAfterDrain\22}", %10 : i1
      arc.sim.emit "DRIVER: poke ready START", %true : i1
      arc.sim.set_input %arg0, "ready_poke_val" = %true : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.set_input %arg0, "ready_poke_en" = %true : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.emit "DRIVER: poke ready END", %true : i1
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      %11 = arc.sim.get_port %arg0, "ready" : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.emit "ready", %11 : i1
      %12 = arc.sim.get_port %arg0, "data_out" : i8, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.emit "data_out", %12 : i8
      %13 = arc.sim.get_port %arg0, "data_in" : i8, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.emit "data_in", %13 : i8
      %14 = arc.sim.get_port %arg0, "valid" : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.emit "valid", %14 : i1
      %15 = arc.sim.get_port %arg0, "accepting" : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.emit "accepting", %15 : i1
      %16 = arc.sim.get_port %arg0, "full" : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.emit "full", %16 : i1
      arc.sim.emit "DRIVER: poke ready START", %false : i1
      arc.sim.set_input %arg0, "ready_poke_val" = %false : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.set_input %arg0, "ready_poke_en" = %true : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.emit "DRIVER: poke ready END", %false : i1
      %17 = arc.sim.get_port %arg0, "full" : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22full\22}", %17 : i1
      %18 = comb.concat %false, %17 : i1, i1
      %19 = comb.icmp eq %18, %c0_i2 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22drained\22, \22line\22: 169, \22column\22: 12, \22condition\22: \22full == false\22, \22scope\22: \22TestHandshakeBufferWriteAfterDrain\22}", %19 : i1
      arc.sim.emit "DRIVER: poke valid START", %true : i1
      arc.sim.set_input %arg0, "valid_poke_val" = %true : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.set_input %arg0, "valid_poke_en" = %true : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.emit "DRIVER: poke valid END", %true : i1
      arc.sim.emit "DRIVER: poke data_in START", %c34_i8 : i8
      arc.sim.set_input %arg0, "data_in_poke_val" = %c34_i8 : i8, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.set_input %arg0, "data_in_poke_en" = %true : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.emit "DRIVER: poke data_in END", %c34_i8 : i8
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      %20 = arc.sim.get_port %arg0, "ready" : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.emit "ready", %20 : i1
      %21 = arc.sim.get_port %arg0, "data_out" : i8, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.emit "data_out", %21 : i8
      %22 = arc.sim.get_port %arg0, "data_in" : i8, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.emit "data_in", %22 : i8
      %23 = arc.sim.get_port %arg0, "valid" : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.emit "valid", %23 : i1
      %24 = arc.sim.get_port %arg0, "accepting" : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.emit "accepting", %24 : i1
      %25 = arc.sim.get_port %arg0, "full" : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.emit "full", %25 : i1
      arc.sim.emit "DRIVER: poke valid START", %false : i1
      arc.sim.set_input %arg0, "valid_poke_val" = %false : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.set_input %arg0, "valid_poke_en" = %true : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.emit "DRIVER: poke valid END", %false : i1
      %26 = arc.sim.get_port %arg0, "full" : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22full\22}", %26 : i1
      %27 = comb.concat %false, %26 : i1, i1
      %28 = comb.icmp eq %27, %c1_i2 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22re-filled\22, \22line\22: 175, \22column\22: 12, \22condition\22: \22full == true\22, \22scope\22: \22TestHandshakeBufferWriteAfterDrain\22}", %28 : i1
      %29 = arc.sim.get_port %arg0, "data_out" : i8, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22data_out\22}", %29 : i8
      %30 = comb.concat %false, %29 : i1, i8
      %31 = comb.icmp eq %30, %c34_i9 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22second write: 0x22\22, \22line\22: 176, \22column\22: 12, \22condition\22: \22data_out == 0x22\22, \22scope\22: \22TestHandshakeBufferWriteAfterDrain\22}", %31 : i1
      arc.sim.emit "DRIVER: poke ready START", %true : i1
      arc.sim.set_input %arg0, "ready_poke_val" = %true : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.set_input %arg0, "ready_poke_en" = %true : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.emit "DRIVER: poke ready END", %true : i1
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      %32 = arc.sim.get_port %arg0, "ready" : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.emit "ready", %32 : i1
      %33 = arc.sim.get_port %arg0, "data_out" : i8, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.emit "data_out", %33 : i8
      %34 = arc.sim.get_port %arg0, "data_in" : i8, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.emit "data_in", %34 : i8
      %35 = arc.sim.get_port %arg0, "valid" : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.emit "valid", %35 : i1
      %36 = arc.sim.get_port %arg0, "accepting" : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.emit "accepting", %36 : i1
      %37 = arc.sim.get_port %arg0, "full" : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.emit "full", %37 : i1
      arc.sim.emit "DRIVER: poke ready START", %false : i1
      arc.sim.set_input %arg0, "ready_poke_val" = %false : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.set_input %arg0, "ready_poke_en" = %true : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.emit "DRIVER: poke ready END", %false : i1
      %38 = arc.sim.get_port %arg0, "full" : i1, !arc.sim.instance<@TestHandshakeBufferWriteAfterDrain_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22full\22}", %38 : i1
      %39 = comb.concat %false, %38 : i1, i1
      %40 = comb.icmp eq %39, %c0_i2 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22drained again\22, \22line\22: 181, \22column\22: 12, \22condition\22: \22full == false\22, \22scope\22: \22TestHandshakeBufferWriteAfterDrain\22}", %40 : i1
    }
    return
  }
}