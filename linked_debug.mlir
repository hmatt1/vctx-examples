module {



  hw.module private @intrinsics_width_coverage_IsSignedCheck(in %clk : !seq.clock, in %rst : i1, in %bo : i1, in %u8v : i8, in %u16v : i16, in %u32v : i32, in %u64v : i64, in %s8v : i8, in %s16v : i16, in %s32v : i32, in %s64v : i64, out sbo : i1, out su8 : i1, out su16 : i1, out su32 : i1, out su64 : i1, out ss8 : i1, out ss16 : i1, out ss32 : i1, out ss64 : i1) {
    %false = hw.constant false
    %true = hw.constant true
    hw.output %false, %false, %false, %false, %false, %true, %true, %true, %true : i1, i1, i1, i1, i1, i1, i1, i1, i1
  }
  hw.module @TestIsSignedAllTypes_Harness(in %clk : !seq.clock, in %rst : i1, in %bo_poke_val : i1, in %bo_poke_en : i1, in %s16v_poke_val : i16, in %s16v_poke_en : i1, in %s32v_poke_val : i32, in %s32v_poke_en : i1, in %s64v_poke_val : i64, in %s64v_poke_en : i1, in %s8v_poke_val : i8, in %s8v_poke_en : i1, in %sbo_poke_val : i1, in %sbo_poke_en : i1, in %ss16_poke_val : i1, in %ss16_poke_en : i1, in %ss32_poke_val : i1, in %ss32_poke_en : i1, in %ss64_poke_val : i1, in %ss64_poke_en : i1, in %ss8_poke_val : i1, in %ss8_poke_en : i1, in %su16_poke_val : i1, in %su16_poke_en : i1, in %su32_poke_val : i1, in %su32_poke_en : i1, in %su64_poke_val : i1, in %su64_poke_en : i1, in %su8_poke_val : i1, in %su8_poke_en : i1, in %u16v_poke_val : i16, in %u16v_poke_en : i1, in %u32v_poke_val : i32, in %u32v_poke_en : i1, in %u64v_poke_val : i64, in %u64v_poke_en : i1, in %u8v_poke_val : i8, in %u8v_poke_en : i1, out bo : i1, out s16v : i16, out s32v : i32, out s64v : i64, out s8v : i8, out sbo : i1, out ss16 : i1, out ss32 : i1, out ss64 : i1, out ss8 : i1, out su16 : i1, out su32 : i1, out su64 : i1, out su8 : i1, out u16v : i16, out u32v : i32, out u64v : i64, out u8v : i8) {
    %c0_i64 = hw.constant 0 : i64
    %c0_i32 = hw.constant 0 : i32
    %c0_i16 = hw.constant 0 : i16
    %c0_i8 = hw.constant 0 : i8
    %false = hw.constant false
    %c0_i7 = hw.constant 0 : i7
    %0 = comb.concat %c0_i7, %false : i7, i1
    %false_0 = hw.constant false
    %c0_i15 = hw.constant 0 : i15
    %1 = comb.concat %c0_i15, %false_0 : i15, i1
    %false_1 = hw.constant false
    %c0_i31 = hw.constant 0 : i31
    %2 = comb.concat %c0_i31, %false_1 : i31, i1
    %false_2 = hw.constant false
    %c0_i63 = hw.constant 0 : i63
    %3 = comb.concat %c0_i63, %false_2 : i63, i1
    %c0_i7_3 = hw.constant 0 : i7
    %4 = comb.concat %c0_i7_3, %false : i7, i1
    %c0_i15_4 = hw.constant 0 : i15
    %5 = comb.concat %c0_i15_4, %false_0 : i15, i1
    %c0_i31_5 = hw.constant 0 : i31
    %6 = comb.concat %c0_i31_5, %false_1 : i31, i1
    %c0_i63_6 = hw.constant 0 : i63
    %7 = comb.concat %c0_i63_6, %false_2 : i63, i1
    %IsSignedCheck_inst_87_1.sbo, %IsSignedCheck_inst_87_1.su8, %IsSignedCheck_inst_87_1.su16, %IsSignedCheck_inst_87_1.su32, %IsSignedCheck_inst_87_1.su64, %IsSignedCheck_inst_87_1.ss8, %IsSignedCheck_inst_87_1.ss16, %IsSignedCheck_inst_87_1.ss32, %IsSignedCheck_inst_87_1.ss64 = hw.instance "IsSignedCheck_inst_87_1" sym @IsSignedCheck_inst_87_1 @intrinsics_width_coverage_IsSignedCheck(clk: %clk: !seq.clock, rst: %rst: i1, bo: %8: i1, u8v: %16: i8, u16v: %13: i16, u32v: %14: i32, u64v: %15: i64, s8v: %12: i8, s16v: %9: i16, s32v: %10: i32, s64v: %11: i64) -> (sbo: i1, su8: i1, su16: i1, su32: i1, su64: i1, ss8: i1, ss16: i1, ss32: i1, ss64: i1)
    %8 = comb.and %bo_poke_en, %bo_poke_val {sv.namehint = "bo_wire"} : i1
    %9 = comb.mux %s16v_poke_en, %s16v_poke_val, %5 {sv.namehint = "s16v_wire"} : i16
    %10 = comb.mux %s32v_poke_en, %s32v_poke_val, %6 {sv.namehint = "s32v_wire"} : i32
    %11 = comb.mux %s64v_poke_en, %s64v_poke_val, %7 {sv.namehint = "s64v_wire"} : i64
    %12 = comb.mux %s8v_poke_en, %s8v_poke_val, %4 {sv.namehint = "s8v_wire"} : i8
    %13 = comb.mux %u16v_poke_en, %u16v_poke_val, %1 {sv.namehint = "u16v_wire"} : i16
    %14 = comb.mux %u32v_poke_en, %u32v_poke_val, %2 {sv.namehint = "u32v_wire"} : i32
    %15 = comb.mux %u64v_poke_en, %u64v_poke_val, %3 {sv.namehint = "u64v_wire"} : i64
    %16 = comb.mux %u8v_poke_en, %u8v_poke_val, %0 {sv.namehint = "u8v_wire"} : i8
    hw.output %8, %9, %10, %11, %12, %IsSignedCheck_inst_87_1.sbo, %IsSignedCheck_inst_87_1.ss16, %IsSignedCheck_inst_87_1.ss32, %IsSignedCheck_inst_87_1.ss64, %IsSignedCheck_inst_87_1.ss8, %IsSignedCheck_inst_87_1.su16, %IsSignedCheck_inst_87_1.su32, %IsSignedCheck_inst_87_1.su64, %IsSignedCheck_inst_87_1.su8, %13, %14, %15, %16 : i1, i16, i32, i64, i8, i1, i1, i1, i1, i1, i1, i1, i1, i1, i16, i32, i64, i8
  }
  func.func @entry() {
    %true = hw.constant true
    %false = hw.constant false
    %0 = seq.const_clock high
    %1 = seq.const_clock low
    arc.sim.instantiate @TestIsSignedAllTypes_Harness as %arg0 {
      arc.sim.set_input %arg0, "bo_poke_en" = %false : i1, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.set_input %arg0, "s16v_poke_en" = %false : i1, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.set_input %arg0, "s32v_poke_en" = %false : i1, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.set_input %arg0, "s64v_poke_en" = %false : i1, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.set_input %arg0, "s8v_poke_en" = %false : i1, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.set_input %arg0, "sbo_poke_en" = %false : i1, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.set_input %arg0, "ss16_poke_en" = %false : i1, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.set_input %arg0, "ss32_poke_en" = %false : i1, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.set_input %arg0, "ss64_poke_en" = %false : i1, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.set_input %arg0, "ss8_poke_en" = %false : i1, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.set_input %arg0, "su16_poke_en" = %false : i1, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.set_input %arg0, "su32_poke_en" = %false : i1, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.set_input %arg0, "su64_poke_en" = %false : i1, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.set_input %arg0, "su8_poke_en" = %false : i1, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.set_input %arg0, "u16v_poke_en" = %false : i1, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.set_input %arg0, "u32v_poke_en" = %false : i1, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.set_input %arg0, "u64v_poke_en" = %false : i1, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.set_input %arg0, "u8v_poke_en" = %false : i1, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.set_input %arg0, "rst" = %false : i1, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      %2 = arc.sim.get_port %arg0, "s32v" : i32, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.emit "s32v", %2 : i32
      %3 = arc.sim.get_port %arg0, "s64v" : i64, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.emit "s64v", %3 : i64
      %4 = arc.sim.get_port %arg0, "u64v" : i64, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.emit "u64v", %4 : i64
      %5 = arc.sim.get_port %arg0, "sbo" : i1, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.emit "sbo", %5 : i1
      %6 = arc.sim.get_port %arg0, "su16" : i1, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.emit "su16", %6 : i1
      %7 = arc.sim.get_port %arg0, "bo" : i1, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.emit "bo", %7 : i1
      %8 = arc.sim.get_port %arg0, "ss64" : i1, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.emit "ss64", %8 : i1
      %9 = arc.sim.get_port %arg0, "ss16" : i1, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.emit "ss16", %9 : i1
      %10 = arc.sim.get_port %arg0, "ss8" : i1, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.emit "ss8", %10 : i1
      %11 = arc.sim.get_port %arg0, "u32v" : i32, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.emit "u32v", %11 : i32
      %12 = arc.sim.get_port %arg0, "u16v" : i16, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.emit "u16v", %12 : i16
      %13 = arc.sim.get_port %arg0, "su32" : i1, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.emit "su32", %13 : i1
      %14 = arc.sim.get_port %arg0, "u8v" : i8, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.emit "u8v", %14 : i8
      %15 = arc.sim.get_port %arg0, "su8" : i1, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.emit "su8", %15 : i1
      %16 = arc.sim.get_port %arg0, "ss32" : i1, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.emit "ss32", %16 : i1
      %17 = arc.sim.get_port %arg0, "s16v" : i16, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.emit "s16v", %17 : i16
      %18 = arc.sim.get_port %arg0, "s8v" : i8, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.emit "s8v", %18 : i8
      %19 = arc.sim.get_port %arg0, "su64" : i1, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.emit "su64", %19 : i1
      %20 = arc.sim.get_port %arg0, "sbo" : i1, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22sbo\22}", %20 : i1
      %false_0 = hw.constant false
      %21 = comb.concat %false_0, %20 : i1, i1
      %false_1 = hw.constant false
      %22 = comb.concat %false_1, %false : i1, i1
      %23 = comb.icmp eq %21, %22 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22is_signed(bool) = 0\22, \22line\22: 109, \22column\22: 12, \22condition\22: \22sbo == 0 as u1\22, \22scope\22: \22TestIsSignedAllTypes\22}", %23 : i1
      %24 = arc.sim.get_port %arg0, "su8" : i1, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22su8\22}", %24 : i1
      %false_2 = hw.constant false
      %25 = comb.concat %false_2, %24 : i1, i1
      %26 = comb.icmp eq %25, %22 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22is_signed(u8) = 0\22, \22line\22: 110, \22column\22: 12, \22condition\22: \22su8 == 0 as u1\22, \22scope\22: \22TestIsSignedAllTypes\22}", %26 : i1
      %27 = arc.sim.get_port %arg0, "su16" : i1, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22su16\22}", %27 : i1
      %false_3 = hw.constant false
      %28 = comb.concat %false_3, %27 : i1, i1
      %29 = comb.icmp eq %28, %22 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22is_signed(u16) = 0\22, \22line\22: 111, \22column\22: 12, \22condition\22: \22su16 == 0 as u1\22, \22scope\22: \22TestIsSignedAllTypes\22}", %29 : i1
      %30 = arc.sim.get_port %arg0, "su32" : i1, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22su32\22}", %30 : i1
      %false_4 = hw.constant false
      %31 = comb.concat %false_4, %30 : i1, i1
      %32 = comb.icmp eq %31, %22 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22is_signed(u32) = 0\22, \22line\22: 112, \22column\22: 12, \22condition\22: \22su32 == 0 as u1\22, \22scope\22: \22TestIsSignedAllTypes\22}", %32 : i1
      %33 = arc.sim.get_port %arg0, "su64" : i1, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22su64\22}", %33 : i1
      %false_5 = hw.constant false
      %34 = comb.concat %false_5, %33 : i1, i1
      %35 = comb.icmp eq %34, %22 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22is_signed(u64) = 0\22, \22line\22: 113, \22column\22: 12, \22condition\22: \22su64 == 0 as u1\22, \22scope\22: \22TestIsSignedAllTypes\22}", %35 : i1
      %36 = arc.sim.get_port %arg0, "ss8" : i1, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22ss8\22}", %36 : i1
      %false_6 = hw.constant false
      %37 = comb.concat %false_6, %36 : i1, i1
      %false_7 = hw.constant false
      %38 = comb.concat %false_7, %true : i1, i1
      %39 = comb.icmp eq %37, %38 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22is_signed(s8) = 1\22, \22line\22: 114, \22column\22: 12, \22condition\22: \22ss8 == 1 as u1\22, \22scope\22: \22TestIsSignedAllTypes\22}", %39 : i1
      %40 = arc.sim.get_port %arg0, "ss16" : i1, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22ss16\22}", %40 : i1
      %false_8 = hw.constant false
      %41 = comb.concat %false_8, %40 : i1, i1
      %42 = comb.icmp eq %41, %38 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22is_signed(s16) = 1\22, \22line\22: 115, \22column\22: 12, \22condition\22: \22ss16 == 1 as u1\22, \22scope\22: \22TestIsSignedAllTypes\22}", %42 : i1
      %43 = arc.sim.get_port %arg0, "ss32" : i1, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22ss32\22}", %43 : i1
      %false_9 = hw.constant false
      %44 = comb.concat %false_9, %43 : i1, i1
      %45 = comb.icmp eq %44, %38 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22is_signed(s32) = 1\22, \22line\22: 116, \22column\22: 12, \22condition\22: \22ss32 == 1 as u1\22, \22scope\22: \22TestIsSignedAllTypes\22}", %45 : i1
      %46 = arc.sim.get_port %arg0, "ss64" : i1, !arc.sim.instance<@TestIsSignedAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22ss64\22}", %46 : i1
      %false_10 = hw.constant false
      %47 = comb.concat %false_10, %46 : i1, i1
      %48 = comb.icmp eq %47, %38 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22is_signed(s64) = 1\22, \22line\22: 117, \22column\22: 12, \22condition\22: \22ss64 == 1 as u1\22, \22scope\22: \22TestIsSignedAllTypes\22}", %48 : i1
    }
    return
  }
}