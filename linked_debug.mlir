module {



  hw.module @TestMixedSignBitwise_Harness(in %clk : !seq.clock, in %rst : i1, in %and_res_poke_val : i9, in %and_res_poke_en : i1, in %and_res2_poke_val : i9, in %and_res2_poke_en : i1, in %or_res_poke_val : i9, in %or_res_poke_en : i1, in %s_data_poke_val : i8, in %s_data_poke_en : i1, in %s_val_poke_val : i8, in %s_val_poke_en : i1, in %u_mask_poke_val : i8, in %u_mask_poke_en : i1, in %u_val_poke_val : i8, in %u_val_poke_en : i1, in %xor_res_poke_val : i9, in %xor_res_poke_en : i1, out and_res : i9, out and_res2 : i9, out or_res : i9, out s_data : i8, out s_val : i8, out u_mask : i8, out u_val : i8, out xor_res : i9) {
    %c15_i8 = hw.constant 15 : i8
    %c0_i5 = hw.constant 0 : i5
    %c-16_i5 = hw.constant -16 : i5
    %c0_i2 = hw.constant 0 : i2
    %false = hw.constant false
    %c-1_i8 = hw.constant -1 : i8 {sv.namehint = "u_val_wire"}
    %c1_i2 = hw.constant 1 : i2
    %false_0 = hw.constant false
    %0 = comb.concat %false_0, %c0_i2 : i1, i2
    %false_1 = hw.constant false
    %1 = comb.concat %false_1, %c1_i2 : i1, i2
    %2 = comb.sub %0, %1 : i3
    %3 = comb.extract %2 from 0 : (i3) -> i2
    %4 = comb.extract %3 from 1 : (i2) -> i1
    %5 = comb.replicate %4 : (i1) -> i6
    %6 = comb.concat %5, %3 : i6, i2
    %false_2 = hw.constant false
    %7 = comb.concat %false_2, %c0_i5 : i1, i5
    %true = hw.constant true
    %8 = comb.concat %true, %c-16_i5 : i1, i5
    %9 = comb.sub %7, %8 : i6
    %10 = comb.extract %9 from 0 : (i6) -> i5
    %11 = comb.extract %10 from 4 : (i5) -> i1
    %12 = comb.replicate %11 : (i1) -> i3
    %13 = comb.concat %12, %10 : i3, i5
    %14 = comb.and %28, %26 : i8
    %15 = comb.concat %false, %14 : i1, i8
    %16 = comb.and %27, %25 : i8
    %17 = comb.concat %false, %16 : i1, i8
    %18 = comb.or %27, %25 : i8
    %19 = comb.concat %false, %18 : i1, i8
    %20 = comb.xor %27, %25 : i8
    %21 = comb.concat %false, %20 : i1, i8
    %22 = comb.mux %and_res_poke_en, %and_res_poke_val, %15 : i9
    %23 = comb.mux %and_res2_poke_en, %and_res2_poke_val, %17 : i9
    %24 = comb.mux %or_res_poke_en, %or_res_poke_val, %19 : i9
    %25 = comb.mux %s_data_poke_en, %s_data_poke_val, %13 : i8
    %26 = comb.mux %s_val_poke_en, %s_val_poke_val, %6 : i8
    %27 = comb.mux %u_mask_poke_en, %u_mask_poke_val, %c15_i8 : i8
    %28 = comb.mux %u_val_poke_en, %u_val_poke_val, %c-1_i8 : i8
    %29 = comb.mux %xor_res_poke_en, %xor_res_poke_val, %21 : i9
    hw.output %22, %23, %24, %25, %26, %27, %28, %29 : i9, i9, i9, i8, i8, i8, i8, i9
  }
  func.func @entry() {
    %c0_i9 = hw.constant 0 : i9
    %c255_i9 = hw.constant 255 : i9
    %c15_i8 = hw.constant 15 : i8
    %c1_i2 = hw.constant 1 : i2
    %c0_i5 = hw.constant 0 : i5
    %c-16_i5 = hw.constant -16 : i5
    %c0_i2 = hw.constant 0 : i2
    %c-1_i8 = hw.constant -1 : i8
    %true = hw.constant true
    %false = hw.constant false
    %0 = seq.const_clock high
    %1 = seq.const_clock low
    arc.sim.instantiate @TestMixedSignBitwise_Harness as %arg0 {
      arc.sim.set_input %arg0, "and_res_poke_en" = %false : i1, !arc.sim.instance<@TestMixedSignBitwise_Harness>
      arc.sim.set_input %arg0, "and_res2_poke_en" = %false : i1, !arc.sim.instance<@TestMixedSignBitwise_Harness>
      arc.sim.set_input %arg0, "or_res_poke_en" = %false : i1, !arc.sim.instance<@TestMixedSignBitwise_Harness>
      arc.sim.set_input %arg0, "s_data_poke_en" = %false : i1, !arc.sim.instance<@TestMixedSignBitwise_Harness>
      arc.sim.set_input %arg0, "s_val_poke_en" = %false : i1, !arc.sim.instance<@TestMixedSignBitwise_Harness>
      arc.sim.set_input %arg0, "u_mask_poke_en" = %false : i1, !arc.sim.instance<@TestMixedSignBitwise_Harness>
      arc.sim.set_input %arg0, "u_val_poke_en" = %false : i1, !arc.sim.instance<@TestMixedSignBitwise_Harness>
      arc.sim.set_input %arg0, "xor_res_poke_en" = %false : i1, !arc.sim.instance<@TestMixedSignBitwise_Harness>
      arc.sim.set_input %arg0, "u_val_poke_val" = %c-1_i8 : i8, !arc.sim.instance<@TestMixedSignBitwise_Harness>
      arc.sim.set_input %arg0, "u_val_poke_en" = %true : i1, !arc.sim.instance<@TestMixedSignBitwise_Harness>
      %false_0 = hw.constant false
      %2 = comb.concat %false_0, %c0_i2 : i1, i2
      %false_1 = hw.constant false
      %3 = comb.concat %false_1, %c1_i2 : i1, i2
      %4 = comb.sub %2, %3 : i3
      %5 = comb.extract %4 from 0 : (i3) -> i2
      %6 = comb.extract %5 from 1 : (i2) -> i1
      %7 = comb.replicate %6 : (i1) -> i6
      %8 = comb.concat %7, %5 : i6, i2
      arc.sim.set_input %arg0, "s_val_poke_val" = %8 : i8, !arc.sim.instance<@TestMixedSignBitwise_Harness>
      arc.sim.set_input %arg0, "s_val_poke_en" = %true : i1, !arc.sim.instance<@TestMixedSignBitwise_Harness>
      arc.sim.set_input %arg0, "u_mask_poke_val" = %c15_i8 : i8, !arc.sim.instance<@TestMixedSignBitwise_Harness>
      arc.sim.set_input %arg0, "u_mask_poke_en" = %true : i1, !arc.sim.instance<@TestMixedSignBitwise_Harness>
      %false_2 = hw.constant false
      %9 = comb.concat %false_2, %c0_i5 : i1, i5
      %true_3 = hw.constant true
      %10 = comb.concat %true_3, %c-16_i5 : i1, i5
      %11 = comb.sub %9, %10 : i6
      %12 = comb.extract %11 from 0 : (i6) -> i5
      %13 = comb.extract %12 from 4 : (i5) -> i1
      %14 = comb.replicate %13 : (i1) -> i3
      %15 = comb.concat %14, %12 : i3, i5
      arc.sim.set_input %arg0, "s_data_poke_val" = %15 : i8, !arc.sim.instance<@TestMixedSignBitwise_Harness>
      arc.sim.set_input %arg0, "s_data_poke_en" = %true : i1, !arc.sim.instance<@TestMixedSignBitwise_Harness>
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@TestMixedSignBitwise_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestMixedSignBitwise_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestMixedSignBitwise_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestMixedSignBitwise_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestMixedSignBitwise_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestMixedSignBitwise_Harness>
      arc.sim.set_input %arg0, "rst" = %false : i1, !arc.sim.instance<@TestMixedSignBitwise_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestMixedSignBitwise_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestMixedSignBitwise_Harness>
      %16 = arc.sim.get_port %arg0, "and_res" : i9, !arc.sim.instance<@TestMixedSignBitwise_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22and_res\22}", %16 : i9
      %17 = comb.icmp eq %16, %c255_i9 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \220xFF & 0xFF = 0xFF (255 as s9)\22, \22line\22: 12, \22column\22: 12, \22condition\22: \22and_res == 255 as s9\22, \22scope\22: \22TestMixedSignBitwise\22}", %17 : i1
      %18 = arc.sim.get_port %arg0, "and_res2" : i9, !arc.sim.instance<@TestMixedSignBitwise_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22and_res2\22}", %18 : i9
      %19 = comb.icmp eq %18, %c0_i9 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \220x0F & 0xF0 = 0x00\22, \22line\22: 18, \22column\22: 12, \22condition\22: \22and_res2 == 0 as s9\22, \22scope\22: \22TestMixedSignBitwise\22}", %19 : i1
      %20 = arc.sim.get_port %arg0, "or_res" : i9, !arc.sim.instance<@TestMixedSignBitwise_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22or_res\22}", %20 : i9
      %21 = comb.icmp eq %20, %c255_i9 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \220x0F | 0xF0 = 0xFF (255 as s9)\22, \22line\22: 21, \22column\22: 12, \22condition\22: \22or_res == 255 as s9\22, \22scope\22: \22TestMixedSignBitwise\22}", %21 : i1
      %22 = arc.sim.get_port %arg0, "xor_res" : i9, !arc.sim.instance<@TestMixedSignBitwise_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22xor_res\22}", %22 : i9
      %23 = comb.icmp eq %22, %c255_i9 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \220x0F ^ 0xF0 = 0xFF (255 as s9)\22, \22line\22: 24, \22column\22: 12, \22condition\22: \22xor_res == 255 as s9\22, \22scope\22: \22TestMixedSignBitwise\22}", %23 : i1
    }
    return
  }
}