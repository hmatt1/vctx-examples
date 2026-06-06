module {



  hw.module @TestZeroValueAllTypes_Harness(in %clk : !seq.clock, in %rst : i1, in %r8_poke_val : i8, in %r8_poke_en : i1, in %rs16_poke_val : i16, in %rs16_poke_en : i1, in %z1_poke_val : i1, in %z1_poke_en : i1, in %z16_poke_val : i16, in %z16_poke_en : i1, in %z32_poke_val : i32, in %z32_poke_en : i1, in %z64_poke_val : i64, in %z64_poke_en : i1, in %z8_poke_val : i8, in %z8_poke_en : i1, in %zb_poke_val : i1, in %zb_poke_en : i1, in %zs16_poke_val : i16, in %zs16_poke_en : i1, in %zs32_poke_val : i32, in %zs32_poke_en : i1, in %zs5_poke_val : i5, in %zs5_poke_en : i1, in %zs64_poke_val : i64, in %zs64_poke_en : i1, in %zs8_poke_val : i8, in %zs8_poke_en : i1, in %zu3_poke_val : i3, in %zu3_poke_en : i1, out r8 : i8, out rs16 : i16, out z1 : i1, out z16 : i16, out z32 : i32, out z64 : i64, out z8 : i8, out zb : i1, out zs16 : i16, out zs32 : i32, out zs5 : i5, out zs64 : i64, out zs8 : i8, out zu3 : i3) {
    %c100_i8 = hw.constant 100 : i8
    %c0_i5 = hw.constant 0 : i5
    %c0_i3 = hw.constant 0 : i3
    %c0_i64 = hw.constant 0 : i64
    %c0_i32 = hw.constant 0 : i32
    %c0_i16 = hw.constant 0 : i16 {sv.namehint = "rs16_next"}
    %c0_i8 = hw.constant 0 : i8 {sv.namehint = "r8_next"}
    %false = hw.constant false {sv.namehint = "r8_next_0_to_1"}
    %c0_i7 = hw.constant 0 : i7
    %0 = comb.concat %c0_i7, %false {sv.namehint = "r8_next_0_to_1_zext_8"} : i7, i1
    %false_0 = hw.constant false {sv.namehint = "rs16_next_0_to_1"}
    %c0_i15 = hw.constant 0 : i15
    %1 = comb.concat %c0_i15, %false_0 {sv.namehint = "rs16_next_0_to_1_zext_16"} : i15, i1
    %false_1 = hw.constant false
    %c0_i31 = hw.constant 0 : i31
    %2 = comb.concat %c0_i31, %false_1 : i31, i1
    %false_2 = hw.constant false
    %c0_i63 = hw.constant 0 : i63
    %3 = comb.concat %c0_i63, %false_2 : i63, i1
    %c0_i7_3 = hw.constant 0 : i7
    %4 = comb.concat %c0_i7_3, %false {sv.namehint = "r8_next_0_to_1_zext_8"} : i7, i1
    %c0_i15_4 = hw.constant 0 : i15
    %5 = comb.concat %c0_i15_4, %false_0 {sv.namehint = "rs16_next_0_to_1_zext_16"} : i15, i1
    %c0_i31_5 = hw.constant 0 : i31
    %6 = comb.concat %c0_i31_5, %false_1 : i31, i1
    %c0_i63_6 = hw.constant 0 : i63
    %7 = comb.concat %c0_i63_6, %false_2 : i63, i1
    %false_7 = hw.constant false
    %c0_i2 = hw.constant 0 : i2
    %8 = comb.concat %c0_i2, %false_7 : i2, i1
    %false_8 = hw.constant false
    %c0_i4 = hw.constant 0 : i4
    %9 = comb.concat %c0_i4, %false_8 : i4, i1
    %r8 = seq.compreg %26, %clk : i8  
    %rs16 = seq.compreg %27, %clk : i16  
    %c-28_i7 = hw.constant -28 : i7
    %false_9 = hw.constant false
    %10 = comb.concat %false_9, %c-28_i7 : i1, i7
    %11 = comb.mux %r8_poke_en, %r8_poke_val, %r8 : i8
    %12 = comb.mux %rs16_poke_en, %rs16_poke_val, %rs16 : i16
    %13 = comb.and %z1_poke_en, %z1_poke_val {sv.namehint = "z1_wire"} : i1
    %14 = comb.mux %z16_poke_en, %z16_poke_val, %1 {sv.namehint = "z16_wire"} : i16
    %15 = comb.mux %z32_poke_en, %z32_poke_val, %2 {sv.namehint = "z32_wire"} : i32
    %16 = comb.mux %z64_poke_en, %z64_poke_val, %3 {sv.namehint = "z64_wire"} : i64
    %17 = comb.mux %z8_poke_en, %z8_poke_val, %0 {sv.namehint = "z8_wire"} : i8
    %18 = comb.and %zb_poke_en, %zb_poke_val {sv.namehint = "zb_wire"} : i1
    %19 = comb.mux %zs16_poke_en, %zs16_poke_val, %5 {sv.namehint = "zs16_wire"} : i16
    %20 = comb.mux %zs32_poke_en, %zs32_poke_val, %6 {sv.namehint = "zs32_wire"} : i32
    %21 = comb.mux %zs5_poke_en, %zs5_poke_val, %9 {sv.namehint = "zs5_wire"} : i5
    %22 = comb.mux %zs64_poke_en, %zs64_poke_val, %7 {sv.namehint = "zs64_wire"} : i64
    %23 = comb.mux %zs8_poke_en, %zs8_poke_val, %4 {sv.namehint = "zs8_wire"} : i8
    %24 = comb.mux %zu3_poke_en, %zu3_poke_val, %8 {sv.namehint = "zu3_wire"} : i3
    %25 = comb.mux %r8_poke_en, %r8_poke_val, %10 : i8
    %26 = comb.mux %rst, %0, %25 : i8
    %27 = comb.mux %rst, %5, %12 : i16
    hw.output %11, %12, %13, %14, %15, %16, %17, %18, %19, %20, %21, %22, %23, %24 : i8, i16, i1, i16, i32, i64, i8, i1, i16, i32, i5, i64, i8, i3
  }
  func.func @entry() {
    %c-6_i4 = hw.constant -6 : i4
    %c-28_i7 = hw.constant -28 : i7
    %c-3_i3 = hw.constant -3 : i3
    %c5_i32 = hw.constant 5 : i32
    %c-1_i2 = hw.constant -1 : i2
    %c3_i32 = hw.constant 3 : i32
    %c-64_i7 = hw.constant -64 : i7
    %c64_i32 = hw.constant 64 : i32
    %c-32_i6 = hw.constant -32 : i6
    %c32_i32 = hw.constant 32 : i32
    %c-16_i5 = hw.constant -16 : i5
    %c16_i32 = hw.constant 16 : i32
    %c-8_i4 = hw.constant -8 : i4
    %c8_i32 = hw.constant 8 : i32
    %c1_i32 = hw.constant 1 : i32
    %true = hw.constant true
    %false = hw.constant false
    %0 = seq.const_clock high
    %1 = seq.const_clock low
    arc.sim.instantiate @TestZeroValueAllTypes_Harness as %arg0 {
      arc.sim.set_input %arg0, "r8_poke_en" = %false : i1, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.set_input %arg0, "rs16_poke_en" = %false : i1, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.set_input %arg0, "z1_poke_en" = %false : i1, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.set_input %arg0, "z16_poke_en" = %false : i1, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.set_input %arg0, "z32_poke_en" = %false : i1, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.set_input %arg0, "z64_poke_en" = %false : i1, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.set_input %arg0, "z8_poke_en" = %false : i1, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.set_input %arg0, "zb_poke_en" = %false : i1, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.set_input %arg0, "zs16_poke_en" = %false : i1, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.set_input %arg0, "zs32_poke_en" = %false : i1, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.set_input %arg0, "zs5_poke_en" = %false : i1, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.set_input %arg0, "zs64_poke_en" = %false : i1, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.set_input %arg0, "zs8_poke_en" = %false : i1, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.set_input %arg0, "zu3_poke_en" = %false : i1, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.set_input %arg0, "rst" = %false : i1, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      %2 = arc.sim.get_port %arg0, "z1" : i1, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22z1\22}", %2 : i1
      %false_0 = hw.constant false
      %3 = comb.concat %false_0, %2 : i1, i1
      %false_1 = hw.constant false
      %4 = comb.concat %false_1, %false : i1, i1
      %5 = comb.icmp eq %3, %4 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u1 is 0\22, \22line\22: 9, \22column\22: 12, \22condition\22: \22z1 == 0\22, \22scope\22: \22TestZeroValueAllTypes\22}", %5 : i1
      %6 = arc.sim.get_port %arg0, "z1" : i1, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22z1\22}", %6 : i1
      %false_2 = hw.constant false
      %7 = comb.concat %false_2, %c1_i32 : i1, i32
      %c0_i32 = hw.constant 0 : i32
      %8 = comb.concat %c0_i32, %true : i32, i1
      %9 = comb.icmp eq %7, %8 : i33
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u1 width\22, \22line\22: 10, \22column\22: 12, \22condition\22: \22width z1 == 1\22, \22scope\22: \22TestZeroValueAllTypes\22}", %9 : i1
      %10 = arc.sim.get_port %arg0, "z1" : i1, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22z1\22}", %10 : i1
      %11 = comb.icmp eq %4, %4 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u1 is unsigned\22, \22line\22: 11, \22column\22: 12, \22condition\22: \22is_signed z1 == false\22, \22scope\22: \22TestZeroValueAllTypes\22}", %11 : i1
      %12 = arc.sim.get_port %arg0, "z8" : i8, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22z8\22}", %12 : i8
      %false_3 = hw.constant false
      %13 = comb.concat %false_3, %12 : i1, i8
      %c0_i8 = hw.constant 0 : i8
      %14 = comb.concat %c0_i8, %false : i8, i1
      %15 = comb.icmp eq %13, %14 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u8 is 0\22, \22line\22: 14, \22column\22: 12, \22condition\22: \22z8 == 0\22, \22scope\22: \22TestZeroValueAllTypes\22}", %15 : i1
      %16 = arc.sim.get_port %arg0, "z8" : i8, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22z8\22}", %16 : i8
      %false_4 = hw.constant false
      %17 = comb.concat %false_4, %c8_i32 : i1, i32
      %c0_i29 = hw.constant 0 : i29
      %18 = comb.concat %c0_i29, %c-8_i4 : i29, i4
      %19 = comb.icmp eq %17, %18 : i33
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u8 width\22, \22line\22: 15, \22column\22: 12, \22condition\22: \22width z8 == 8\22, \22scope\22: \22TestZeroValueAllTypes\22}", %19 : i1
      %20 = arc.sim.get_port %arg0, "z16" : i16, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22z16\22}", %20 : i16
      %false_5 = hw.constant false
      %21 = comb.concat %false_5, %20 : i1, i16
      %c0_i16 = hw.constant 0 : i16
      %22 = comb.concat %c0_i16, %false : i16, i1
      %23 = comb.icmp eq %21, %22 : i17
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u16 is 0\22, \22line\22: 18, \22column\22: 12, \22condition\22: \22z16 == 0\22, \22scope\22: \22TestZeroValueAllTypes\22}", %23 : i1
      %24 = arc.sim.get_port %arg0, "z16" : i16, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22z16\22}", %24 : i16
      %false_6 = hw.constant false
      %25 = comb.concat %false_6, %c16_i32 : i1, i32
      %c0_i28 = hw.constant 0 : i28
      %26 = comb.concat %c0_i28, %c-16_i5 : i28, i5
      %27 = comb.icmp eq %25, %26 : i33
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u16 width\22, \22line\22: 19, \22column\22: 12, \22condition\22: \22width z16 == 16\22, \22scope\22: \22TestZeroValueAllTypes\22}", %27 : i1
      %28 = arc.sim.get_port %arg0, "z32" : i32, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22z32\22}", %28 : i32
      %false_7 = hw.constant false
      %29 = comb.concat %false_7, %28 : i1, i32
      %c0_i32_8 = hw.constant 0 : i32
      %30 = comb.concat %c0_i32_8, %false : i32, i1
      %31 = comb.icmp eq %29, %30 : i33
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u32 is 0\22, \22line\22: 22, \22column\22: 12, \22condition\22: \22z32 == 0\22, \22scope\22: \22TestZeroValueAllTypes\22}", %31 : i1
      %32 = arc.sim.get_port %arg0, "z32" : i32, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22z32\22}", %32 : i32
      %false_9 = hw.constant false
      %33 = comb.concat %false_9, %c32_i32 : i1, i32
      %c0_i27 = hw.constant 0 : i27
      %34 = comb.concat %c0_i27, %c-32_i6 : i27, i6
      %35 = comb.icmp eq %33, %34 : i33
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u32 width\22, \22line\22: 23, \22column\22: 12, \22condition\22: \22width z32 == 32\22, \22scope\22: \22TestZeroValueAllTypes\22}", %35 : i1
      %36 = arc.sim.get_port %arg0, "z64" : i64, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22z64\22}", %36 : i64
      %false_10 = hw.constant false
      %37 = comb.concat %false_10, %36 : i1, i64
      %c0_i64 = hw.constant 0 : i64
      %38 = comb.concat %c0_i64, %false : i64, i1
      %39 = comb.icmp eq %37, %38 : i65
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u64 is 0\22, \22line\22: 26, \22column\22: 12, \22condition\22: \22z64 == 0\22, \22scope\22: \22TestZeroValueAllTypes\22}", %39 : i1
      %40 = arc.sim.get_port %arg0, "z64" : i64, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22z64\22}", %40 : i64
      %false_11 = hw.constant false
      %41 = comb.concat %false_11, %c64_i32 : i1, i32
      %c0_i26 = hw.constant 0 : i26
      %42 = comb.concat %c0_i26, %c-64_i7 : i26, i7
      %43 = comb.icmp eq %41, %42 : i33
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u64 width\22, \22line\22: 27, \22column\22: 12, \22condition\22: \22width z64 == 64\22, \22scope\22: \22TestZeroValueAllTypes\22}", %43 : i1
      %44 = arc.sim.get_port %arg0, "zs8" : i8, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22zs8\22}", %44 : i8
      %c0_i7 = hw.constant 0 : i7
      %45 = comb.concat %c0_i7, %false : i7, i1
      %46 = comb.icmp eq %44, %45 : i8
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22val_s8 is 0\22, \22line\22: 31, \22column\22: 12, \22condition\22: \22zs8 == 0\22, \22scope\22: \22TestZeroValueAllTypes\22}", %46 : i1
      %47 = arc.sim.get_port %arg0, "zs8" : i8, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22zs8\22}", %47 : i8
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22val_s8 width\22, \22line\22: 32, \22column\22: 12, \22condition\22: \22width zs8 == 8\22, \22scope\22: \22TestZeroValueAllTypes\22}", %19 : i1
      %48 = arc.sim.get_port %arg0, "zs8" : i8, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22zs8\22}", %48 : i8
      %false_12 = hw.constant false
      %49 = comb.concat %false_12, %true : i1, i1
      %50 = comb.icmp eq %49, %49 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22val_s8 is signed\22, \22line\22: 33, \22column\22: 12, \22condition\22: \22is_signed zs8 == true\22, \22scope\22: \22TestZeroValueAllTypes\22}", %50 : i1
      %51 = arc.sim.get_port %arg0, "zs16" : i16, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22zs16\22}", %51 : i16
      %c0_i15 = hw.constant 0 : i15
      %52 = comb.concat %c0_i15, %false : i15, i1
      %53 = comb.icmp eq %51, %52 : i16
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22val_s16 is 0\22, \22line\22: 36, \22column\22: 12, \22condition\22: \22zs16 == 0\22, \22scope\22: \22TestZeroValueAllTypes\22}", %53 : i1
      %54 = arc.sim.get_port %arg0, "zs16" : i16, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22zs16\22}", %54 : i16
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22val_s16 width\22, \22line\22: 37, \22column\22: 12, \22condition\22: \22width zs16 == 16\22, \22scope\22: \22TestZeroValueAllTypes\22}", %27 : i1
      %55 = arc.sim.get_port %arg0, "zs32" : i32, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22zs32\22}", %55 : i32
      %c0_i31 = hw.constant 0 : i31
      %56 = comb.concat %c0_i31, %false : i31, i1
      %57 = comb.icmp eq %55, %56 : i32
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22s32 is 0\22, \22line\22: 40, \22column\22: 12, \22condition\22: \22zs32 == 0\22, \22scope\22: \22TestZeroValueAllTypes\22}", %57 : i1
      %58 = arc.sim.get_port %arg0, "zs64" : i64, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22zs64\22}", %58 : i64
      %c0_i63 = hw.constant 0 : i63
      %59 = comb.concat %c0_i63, %false : i63, i1
      %60 = comb.icmp eq %58, %59 : i64
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22s64 is 0\22, \22line\22: 43, \22column\22: 12, \22condition\22: \22zs64 == 0\22, \22scope\22: \22TestZeroValueAllTypes\22}", %60 : i1
      %61 = arc.sim.get_port %arg0, "zs64" : i64, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22zs64\22}", %61 : i64
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22s64 width\22, \22line\22: 44, \22column\22: 12, \22condition\22: \22width zs64 == 64\22, \22scope\22: \22TestZeroValueAllTypes\22}", %43 : i1
      %62 = arc.sim.get_port %arg0, "zb" : i1, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22zb\22}", %62 : i1
      %false_13 = hw.constant false
      %63 = comb.concat %false_13, %62 : i1, i1
      %64 = comb.icmp eq %63, %4 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22bool false is numeric 0\22, \22line\22: 48, \22column\22: 12, \22condition\22: \22zb == 0\22, \22scope\22: \22TestZeroValueAllTypes\22}", %64 : i1
      %65 = arc.sim.get_port %arg0, "zb" : i1, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22zb\22}", %65 : i1
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22bool width is 1\22, \22line\22: 49, \22column\22: 12, \22condition\22: \22width zb == 1\22, \22scope\22: \22TestZeroValueAllTypes\22}", %9 : i1
      %66 = arc.sim.get_port %arg0, "zb" : i1, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22zb\22}", %66 : i1
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22bool is unsigned\22, \22line\22: 50, \22column\22: 12, \22condition\22: \22is_signed zb == false\22, \22scope\22: \22TestZeroValueAllTypes\22}", %11 : i1
      %67 = arc.sim.get_port %arg0, "zu3" : i3, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22zu3\22}", %67 : i3
      %false_14 = hw.constant false
      %68 = comb.concat %false_14, %67 : i1, i3
      %c0_i3 = hw.constant 0 : i3
      %69 = comb.concat %c0_i3, %false : i3, i1
      %70 = comb.icmp eq %68, %69 : i4
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u3 is 0\22, \22line\22: 54, \22column\22: 12, \22condition\22: \22zu3 == 0\22, \22scope\22: \22TestZeroValueAllTypes\22}", %70 : i1
      %71 = arc.sim.get_port %arg0, "zu3" : i3, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22zu3\22}", %71 : i3
      %false_15 = hw.constant false
      %72 = comb.concat %false_15, %c3_i32 : i1, i32
      %c0_i31_16 = hw.constant 0 : i31
      %73 = comb.concat %c0_i31_16, %c-1_i2 : i31, i2
      %74 = comb.icmp eq %72, %73 : i33
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u3 width is 3\22, \22line\22: 55, \22column\22: 12, \22condition\22: \22width zu3 == 3\22, \22scope\22: \22TestZeroValueAllTypes\22}", %74 : i1
      %75 = arc.sim.get_port %arg0, "zs5" : i5, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22zs5\22}", %75 : i5
      %c0_i4 = hw.constant 0 : i4
      %76 = comb.concat %c0_i4, %false : i4, i1
      %77 = comb.icmp eq %75, %76 : i5
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22s5 is 0\22, \22line\22: 58, \22column\22: 12, \22condition\22: \22zs5 == 0\22, \22scope\22: \22TestZeroValueAllTypes\22}", %77 : i1
      %78 = arc.sim.get_port %arg0, "zs5" : i5, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22zs5\22}", %78 : i5
      %false_17 = hw.constant false
      %79 = comb.concat %false_17, %c5_i32 : i1, i32
      %c0_i30 = hw.constant 0 : i30
      %80 = comb.concat %c0_i30, %c-3_i3 : i30, i3
      %81 = comb.icmp eq %79, %80 : i33
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22s5 width is 5\22, \22line\22: 59, \22column\22: 12, \22condition\22: \22width zs5 == 5\22, \22scope\22: \22TestZeroValueAllTypes\22}", %81 : i1
      %82 = arc.sim.get_port %arg0, "zs5" : i5, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22zs5\22}", %82 : i5
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22s5 is signed\22, \22line\22: 60, \22column\22: 12, \22condition\22: \22is_signed zs5 == true\22, \22scope\22: \22TestZeroValueAllTypes\22}", %50 : i1
      %83 = arc.sim.get_port %arg0, "r8" : i8, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22r8\22}", %83 : i8
      %false_18 = hw.constant false
      %84 = comb.concat %false_18, %83 : i1, i8
      %85 = comb.icmp eq %84, %14 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u8 reg init 0\22, \22line\22: 67, \22column\22: 12, \22condition\22: \22r8 == 0\22, \22scope\22: \22TestZeroValueAllTypes\22}", %85 : i1
      %86 = arc.sim.get_port %arg0, "rs16" : i16, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22rs16\22}", %86 : i16
      %87 = comb.icmp eq %86, %52 : i16
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22val_s16 reg init 0\22, \22line\22: 68, \22column\22: 12, \22condition\22: \22rs16 == 0\22, \22scope\22: \22TestZeroValueAllTypes\22}", %87 : i1
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      %88 = arc.sim.get_port %arg0, "z64" : i64, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "z64", %88 : i64
      %89 = arc.sim.get_port %arg0, "z1" : i1, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "z1", %89 : i1
      %90 = arc.sim.get_port %arg0, "z16" : i16, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "z16", %90 : i16
      %91 = arc.sim.get_port %arg0, "r8" : i8, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "r8", %91 : i8
      %92 = arc.sim.get_port %arg0, "rs16" : i16, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "rs16", %92 : i16
      %93 = arc.sim.get_port %arg0, "zs16" : i16, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "zs16", %93 : i16
      %94 = arc.sim.get_port %arg0, "zs8" : i8, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "zs8", %94 : i8
      %95 = arc.sim.get_port %arg0, "z32" : i32, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "z32", %95 : i32
      %96 = arc.sim.get_port %arg0, "zs32" : i32, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "zs32", %96 : i32
      %97 = arc.sim.get_port %arg0, "zu3" : i3, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "zu3", %97 : i3
      %98 = arc.sim.get_port %arg0, "zs64" : i64, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "zs64", %98 : i64
      %99 = arc.sim.get_port %arg0, "zs5" : i5, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "zs5", %99 : i5
      %100 = arc.sim.get_port %arg0, "zb" : i1, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "zb", %100 : i1
      %101 = arc.sim.get_port %arg0, "z8" : i8, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "z8", %101 : i8
      %102 = arc.sim.get_port %arg0, "r8" : i8, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22r8\22}", %102 : i8
      %false_19 = hw.constant false
      %103 = comb.concat %false_19, %102 : i1, i8
      %c0_i2 = hw.constant 0 : i2
      %104 = comb.concat %c0_i2, %c-28_i7 : i2, i7
      %105 = comb.icmp eq %103, %104 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u8 reg updated to 100 after first cycle\22, \22line\22: 73, \22column\22: 12, \22condition\22: \22r8 == 100\22, \22scope\22: \22TestZeroValueAllTypes\22}", %105 : i1
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      %106 = arc.sim.get_port %arg0, "z64" : i64, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "z64", %106 : i64
      %107 = arc.sim.get_port %arg0, "z1" : i1, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "z1", %107 : i1
      %108 = arc.sim.get_port %arg0, "z16" : i16, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "z16", %108 : i16
      %109 = arc.sim.get_port %arg0, "r8" : i8, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "r8", %109 : i8
      %110 = arc.sim.get_port %arg0, "rs16" : i16, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "rs16", %110 : i16
      %111 = arc.sim.get_port %arg0, "zs16" : i16, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "zs16", %111 : i16
      %112 = arc.sim.get_port %arg0, "zs8" : i8, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "zs8", %112 : i8
      %113 = arc.sim.get_port %arg0, "z32" : i32, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "z32", %113 : i32
      %114 = arc.sim.get_port %arg0, "zs32" : i32, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "zs32", %114 : i32
      %115 = arc.sim.get_port %arg0, "zu3" : i3, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "zu3", %115 : i3
      %116 = arc.sim.get_port %arg0, "zs64" : i64, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "zs64", %116 : i64
      %117 = arc.sim.get_port %arg0, "zs5" : i5, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "zs5", %117 : i5
      %118 = arc.sim.get_port %arg0, "zb" : i1, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "zb", %118 : i1
      %119 = arc.sim.get_port %arg0, "z8" : i8, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "z8", %119 : i8
      %120 = arc.sim.get_port %arg0, "r8" : i8, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22r8\22}", %120 : i8
      %false_20 = hw.constant false
      %121 = comb.concat %false_20, %120 : i1, i8
      %122 = comb.icmp eq %121, %104 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u8 reg remains 100\22, \22line\22: 77, \22column\22: 12, \22condition\22: \22r8 == 100\22, \22scope\22: \22TestZeroValueAllTypes\22}", %122 : i1
      arc.sim.emit "DRIVER: reset START", %true : i1
      arc.sim.set_input %arg0, "r8_poke_en" = %false : i1, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.set_input %arg0, "rs16_poke_en" = %false : i1, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.set_input %arg0, "z1_poke_en" = %false : i1, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.set_input %arg0, "z16_poke_en" = %false : i1, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.set_input %arg0, "z32_poke_en" = %false : i1, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.set_input %arg0, "z64_poke_en" = %false : i1, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.set_input %arg0, "z8_poke_en" = %false : i1, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.set_input %arg0, "zb_poke_en" = %false : i1, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.set_input %arg0, "zs16_poke_en" = %false : i1, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.set_input %arg0, "zs32_poke_en" = %false : i1, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.set_input %arg0, "zs5_poke_en" = %false : i1, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.set_input %arg0, "zs64_poke_en" = %false : i1, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.set_input %arg0, "zs8_poke_en" = %false : i1, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.set_input %arg0, "zu3_poke_en" = %false : i1, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.set_input %arg0, "rst" = %false : i1, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "DRIVER: reset END", %false : i1
      %123 = arc.sim.get_port %arg0, "r8" : i8, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22r8\22}", %123 : i8
      %false_21 = hw.constant false
      %124 = comb.concat %false_21, %123 : i1, i8
      %125 = comb.icmp eq %124, %14 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u8 reg reset to 0\22, \22line\22: 79, \22column\22: 12, \22condition\22: \22r8 == 0\22, \22scope\22: \22TestZeroValueAllTypes\22}", %125 : i1
      %126 = arc.sim.get_port %arg0, "z8" : i8, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22z8\22}", %126 : i8
      %false_22 = hw.constant false
      %127 = comb.concat %false_22, %126 : i1, i8
      %c0_i8_23 = hw.constant 0 : i8
      %128 = comb.concat %c0_i8_23, %false : i8, i1
      %false_24 = hw.constant false
      %129 = comb.concat %false_24, %127 : i1, i9
      %false_25 = hw.constant false
      %130 = comb.concat %false_25, %128 : i1, i9
      %131 = comb.add %129, %130 : i10
      %132 = comb.extract %131 from 0 : (i10) -> i9
      %false_26 = hw.constant false
      %133 = comb.concat %false_26, %132 : i1, i9
      %c0_i9 = hw.constant 0 : i9
      %134 = comb.concat %c0_i9, %false : i9, i1
      %135 = comb.icmp eq %133, %134 : i10
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \220 + 0 = 0\22, \22line\22: 83, \22column\22: 12, \22condition\22: \22z8 + 0 == 0\22, \22scope\22: \22TestZeroValueAllTypes\22}", %135 : i1
      %136 = arc.sim.get_port %arg0, "zs8" : i8, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22zs8\22}", %136 : i8
      %137 = comb.extract %136 from 7 : (i8) -> i1
      %138 = comb.concat %137, %136 : i1, i8
      %139 = comb.extract %138 from 8 : (i9) -> i1
      %140 = comb.concat %139, %138 : i1, i9
      %141 = comb.extract %14 from 8 : (i9) -> i1
      %142 = comb.concat %141, %14 : i1, i9
      %143 = comb.sub %140, %142 : i10
      %144 = comb.extract %143 from 0 : (i10) -> i9
      %145 = comb.icmp eq %144, %14 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \220 - 0 = 0\22, \22line\22: 84, \22column\22: 12, \22condition\22: \22zs8 - 0 == 0\22, \22scope\22: \22TestZeroValueAllTypes\22}", %145 : i1
      %146 = arc.sim.get_port %arg0, "z16" : i16, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22z16\22}", %146 : i16
      %false_27 = hw.constant false
      %147 = comb.concat %false_27, %146 : i1, i16
      %c0_i16_28 = hw.constant 0 : i16
      %148 = comb.concat %c0_i16_28, %false : i16, i1
      %c0_i17 = hw.constant 0 : i17
      %149 = comb.concat %c0_i17, %147 : i17, i17
      %c0_i17_29 = hw.constant 0 : i17
      %150 = comb.concat %c0_i17_29, %148 : i17, i17
      %151 = comb.mul %149, %150 : i34
      %152 = comb.extract %151 from 0 : (i34) -> i17
      %false_30 = hw.constant false
      %153 = comb.concat %false_30, %152 : i1, i17
      %c0_i17_31 = hw.constant 0 : i17
      %154 = comb.concat %c0_i17_31, %false : i17, i1
      %155 = comb.icmp eq %153, %154 : i18
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \220 * 0 = 0\22, \22line\22: 85, \22column\22: 12, \22condition\22: \22z16 * 0 == 0\22, \22scope\22: \22TestZeroValueAllTypes\22}", %155 : i1
      %c0_i3_32 = hw.constant 0 : i3
      %156 = comb.concat %c0_i3_32, %false : i3, i1
      %157 = comb.divu %156, %c-6_i4 : i4
      %false_33 = hw.constant false
      %158 = comb.concat %false_33, %157 : i1, i4
      %159 = comb.icmp eq %158, %76 : i5
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \220 / 10 = 0\22, \22line\22: 88, \22column\22: 12, \22condition\22: \220 / 10 == 0\22, \22scope\22: \22TestZeroValueAllTypes\22}", %159 : i1
      %160 = comb.modu %156, %c-6_i4 : i4
      %false_34 = hw.constant false
      %161 = comb.concat %false_34, %160 : i1, i4
      %162 = comb.icmp eq %161, %76 : i5
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \220 %% 10 = 0\22, \22line\22: 89, \22column\22: 12, \22condition\22: \220 %% 10 == 0\22, \22scope\22: \22TestZeroValueAllTypes\22}", %162 : i1
      %163 = arc.sim.get_port %arg0, "z64" : i64, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22z64\22}", %163 : i64
      %false_35 = hw.constant false
      %164 = comb.concat %false_35, %163 : i1, i64
      %165 = comb.icmp eq %164, %38 : i65
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u64 equality with literal 0\22, \22line\22: 93, \22column\22: 12, \22condition\22: \22z64 == 0\22, \22scope\22: \22TestZeroValueAllTypes\22}", %165 : i1
      %166 = arc.sim.get_port %arg0, "zs64" : i64, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22zs64\22}", %166 : i64
      %167 = comb.icmp eq %166, %59 : i64
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22s64 equality with literal 0\22, \22line\22: 94, \22column\22: 12, \22condition\22: \22zs64 == 0\22, \22scope\22: \22TestZeroValueAllTypes\22}", %167 : i1
      %168 = arc.sim.get_port %arg0, "zu3" : i3, !arc.sim.instance<@TestZeroValueAllTypes_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22zu3\22}", %168 : i3
      %false_36 = hw.constant false
      %169 = comb.concat %false_36, %168 : i1, i3
      %170 = comb.icmp eq %169, %69 : i4
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22u3 equality with literal 0\22, \22line\22: 95, \22column\22: 12, \22condition\22: \22zu3 == 0\22, \22scope\22: \22TestZeroValueAllTypes\22}", %170 : i1
    }
    return
  }
}