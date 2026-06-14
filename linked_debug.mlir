module {



  hw.module @TestTernaryNested_Harness(in %clk : !seq.clock, in %rst : i1, in %a_poke_val : i8, in %a_poke_en : i1, in %b_poke_val : i8, in %b_poke_en : i1, in %b_res_poke_val : i1, in %b_res_poke_en : i1, in %c_poke_val : i8, in %c_poke_en : i1, in %c1_poke_val : i1, in %c1_poke_en : i1, in %c2_poke_val : i1, in %c2_poke_en : i1, in %deep_poke_val : i8, in %deep_poke_en : i1, in %ra_poke_val : i8, in %ra_poke_en : i1, in %rb_poke_val : i8, in %rb_poke_en : i1, in %res1_poke_val : i8, in %res1_poke_en : i1, in %res_type_poke_val : i8, in %res_type_poke_en : i1, in %s_a_poke_val : i16, in %s_a_poke_en : i1, in %s_b_poke_val : i16, in %s_b_poke_en : i1, in %s_c_poke_val : i16, in %s_c_poke_en : i1, in %s_c1_poke_val : i1, in %s_c1_poke_en : i1, in %s_c2_poke_val : i1, in %s_c2_poke_en : i1, in %tc1_poke_val : i1, in %tc1_poke_en : i1, in %tc2_poke_val : i1, in %tc2_poke_en : i1, in %tv_c_poke_val : i8, in %tv_c_poke_en : i1, in %tv_d_poke_val : i8, in %tv_d_poke_en : i1, in %tv_e_poke_val : i8, in %tv_e_poke_en : i1, in %v1_poke_val : i8, in %v1_poke_en : i1, in %v2_poke_val : i8, in %v2_poke_en : i1, in %v3_poke_val : i8, in %v3_poke_en : i1, in %v4_poke_val : i8, in %v4_poke_en : i1, out a : i8, out b : i8, out b_res : i1, out c : i8, out c1 : i1, out c2 : i1, out deep : i8, out ra : i8, out rb : i8, out res1 : i8, out res_type : i8, out s_a : i16, out s_b : i16, out s_c : i16, out s_c1 : i1, out s_c2 : i1, out tc1 : i1, out tc2 : i1, out tv_c : i8, out tv_d : i8, out tv_e : i8, out v1 : i8, out v2 : i8, out v3 : i8, out v4 : i8) {
    %c300_i10 = hw.constant 300 : i10
    %c200_i9 = hw.constant 200 : i9
    %c40_i8 = hw.constant 40 : i8
    %c100_i8 = hw.constant 100 : i8
    %c30_i8 = hw.constant 30 : i8
    %c20_i8 = hw.constant 20 : i8
    %c10_i8 = hw.constant 10 : i8
    %c3_i8 = hw.constant 3 : i8
    %c2_i8 = hw.constant 2 : i8
    %c-56_i8 = hw.constant -56 : i8 {sv.namehint = "tv_e_wire"}
    %c-106_i8 = hw.constant -106 : i8 {sv.namehint = "tv_d_wire"}
    %c0_i10 = hw.constant 0 : i10
    %c0_i9 = hw.constant 0 : i9
    %c0_i8 = hw.constant 0 : i8
    %true = hw.constant true {sv.namehint = "c2_wire"}
    %c1_i8 = hw.constant 1 : i8
    %false = hw.constant false
    %0 = comb.concat %false, %c0_i8 : i1, i8
    %false_0 = hw.constant false
    %1 = comb.concat %false_0, %c100_i8 : i1, i8
    %2 = comb.sub %0, %1 : i9
    %3 = comb.extract %2 from 0 : (i9) -> i8
    %4 = comb.extract %3 from 7 : (i8) -> i1
    %5 = comb.replicate %4 : (i1) -> i8
    %6 = comb.concat %5, %3 : i8, i8
    %false_1 = hw.constant false
    %7 = comb.concat %false_1, %c0_i9 : i1, i9
    %false_2 = hw.constant false
    %8 = comb.concat %false_2, %c200_i9 : i1, i9
    %9 = comb.sub %7, %8 : i10
    %10 = comb.extract %9 from 0 : (i10) -> i9
    %11 = comb.extract %10 from 8 : (i9) -> i1
    %12 = comb.replicate %11 : (i1) -> i7
    %13 = comb.concat %12, %10 : i7, i9
    %false_3 = hw.constant false
    %14 = comb.concat %false_3, %c0_i10 : i1, i10
    %false_4 = hw.constant false
    %15 = comb.concat %false_4, %c300_i10 : i1, i10
    %16 = comb.sub %14, %15 : i11
    %17 = comb.extract %16 from 0 : (i11) -> i10
    %18 = comb.extract %17 from 9 : (i10) -> i1
    %19 = comb.replicate %18 : (i1) -> i6
    %20 = comb.concat %19, %17 : i6, i10
    %21 = comb.mux %33, %28, %30 : i8
    %22 = comb.mux %31, %27, %21 {sv.namehint = "res1_wire"} : i8
    %23 = comb.mux %33, %27, %28 : i8
    %24 = comb.mux %31, %23, %30 {sv.namehint = "res_type_wire"} : i8
    %25 = comb.xor %46, %true : i1
    %26 = comb.or %25, %47 {sv.namehint = "b_res_wire"} : i1
    %27 = comb.mux %a_poke_en, %a_poke_val, %c1_i8 : i8
    %28 = comb.mux %b_poke_en, %b_poke_val, %c2_i8 : i8
    %29 = comb.mux %b_res_poke_en, %b_res_poke_val, %26 : i1
    %30 = comb.mux %c_poke_en, %c_poke_val, %c3_i8 : i8
    %31 = comb.and %c1_poke_en, %c1_poke_val : i1
    %32 = comb.xor %c2_poke_en, %true : i1
    %33 = comb.or %32, %c2_poke_val : i1
    %34 = comb.mux %deep_poke_en, %deep_poke_val, %53 : i8
    %35 = comb.mux %ra_poke_en, %ra_poke_val, %c30_i8 : i8
    %36 = comb.mux %rb_poke_en, %rb_poke_val, %c30_i8 : i8
    %37 = comb.mux %res1_poke_en, %res1_poke_val, %22 : i8
    %38 = comb.mux %res_type_poke_en, %res_type_poke_val, %24 : i8
    %39 = comb.mux %s_a_poke_en, %s_a_poke_val, %6 : i16
    %40 = comb.mux %s_b_poke_en, %s_b_poke_val, %13 : i16
    %41 = comb.mux %s_c_poke_en, %s_c_poke_val, %20 : i16
    %42 = comb.xor %s_c1_poke_en, %true : i1
    %43 = comb.or %42, %s_c1_poke_val : i1
    %44 = comb.and %s_c2_poke_en, %s_c2_poke_val : i1
    %45 = comb.xor %tc1_poke_en, %true : i1
    %46 = comb.or %45, %tc1_poke_val : i1
    %47 = comb.and %tc2_poke_en, %tc2_poke_val : i1
    %48 = comb.mux %tv_c_poke_en, %tv_c_poke_val, %c100_i8 : i8
    %49 = comb.mux %tv_d_poke_en, %tv_d_poke_val, %c-106_i8 : i8
    %50 = comb.mux %tv_e_poke_en, %tv_e_poke_val, %c-56_i8 : i8
    %51 = comb.mux %v1_poke_en, %v1_poke_val, %c10_i8 : i8
    %52 = comb.mux %v2_poke_en, %v2_poke_val, %c20_i8 : i8
    %53 = comb.mux %v3_poke_en, %v3_poke_val, %c30_i8 {sv.namehint = "deep_wire"} : i8
    %54 = comb.mux %v4_poke_en, %v4_poke_val, %c40_i8 : i8
    hw.output %27, %28, %29, %30, %31, %33, %34, %35, %36, %37, %38, %39, %40, %41, %43, %44, %46, %47, %48, %49, %50, %51, %52, %53, %54 : i8, i8, i1, i8, i1, i1, i8, i8, i8, i8, i8, i16, i16, i16, i1, i1, i1, i1, i8, i8, i8, i8, i8, i8, i8
  }
  func.func @entry() {
    %c1_i2 = hw.constant 1 : i2
    %c0_i2 = hw.constant 0 : i2
    %c8_i33 = hw.constant 8 : i33
    %c100_i9 = hw.constant 100 : i9
    %c150_i9 = hw.constant 150 : i9
    %c30_i9 = hw.constant 30 : i9
    %c1_i9 = hw.constant 1 : i9
    %c3_i9 = hw.constant 3 : i9
    %c2_i9 = hw.constant 2 : i9
    %c300_i10 = hw.constant 300 : i10
    %c200_i9 = hw.constant 200 : i9
    %c40_i8 = hw.constant 40 : i8
    %c100_i8 = hw.constant 100 : i8
    %c30_i8 = hw.constant 30 : i8
    %c20_i8 = hw.constant 20 : i8
    %c10_i8 = hw.constant 10 : i8
    %c3_i8 = hw.constant 3 : i8
    %c2_i8 = hw.constant 2 : i8
    %c1_i8 = hw.constant 1 : i8
    %c0_i10 = hw.constant 0 : i10
    %c0_i9 = hw.constant 0 : i9
    %c0_i8 = hw.constant 0 : i8
    %c-56_i8 = hw.constant -56 : i8
    %c-106_i8 = hw.constant -106 : i8
    %true = hw.constant true
    %false = hw.constant false
    %0 = seq.const_clock high
    %1 = seq.const_clock low
    arc.sim.instantiate @TestTernaryNested_Harness as %arg0 {
      arc.sim.set_input %arg0, "a_poke_en" = %false : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "b_poke_en" = %false : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "b_res_poke_en" = %false : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "c_poke_en" = %false : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "c1_poke_en" = %false : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "c2_poke_en" = %false : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "deep_poke_en" = %false : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "ra_poke_en" = %false : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "rb_poke_en" = %false : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "res1_poke_en" = %false : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "res_type_poke_en" = %false : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "s_a_poke_en" = %false : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "s_b_poke_en" = %false : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "s_c_poke_en" = %false : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "s_c1_poke_en" = %false : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "s_c2_poke_en" = %false : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "tc1_poke_en" = %false : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "tc2_poke_en" = %false : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "tv_c_poke_en" = %false : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "tv_d_poke_en" = %false : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "tv_e_poke_en" = %false : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "v1_poke_en" = %false : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "v2_poke_en" = %false : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "v3_poke_en" = %false : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "v4_poke_en" = %false : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "c1_poke_val" = %false : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "c1_poke_en" = %true : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "c2_poke_val" = %true : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "c2_poke_en" = %true : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "a_poke_val" = %c1_i8 : i8, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "a_poke_en" = %true : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "b_poke_val" = %c2_i8 : i8, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "b_poke_en" = %true : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "c_poke_val" = %c3_i8 : i8, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "c_poke_en" = %true : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "res1_poke_val" = %c2_i8 : i8, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "res1_poke_en" = %true : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "ra_poke_val" = %c30_i8 : i8, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "ra_poke_en" = %true : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "rb_poke_val" = %c30_i8 : i8, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "rb_poke_en" = %true : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "tc1_poke_val" = %true : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "tc1_poke_en" = %true : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "tc2_poke_val" = %false : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "tc2_poke_en" = %true : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "tv_c_poke_val" = %c100_i8 : i8, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "tv_c_poke_en" = %true : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "tv_d_poke_val" = %c-106_i8 : i8, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "tv_d_poke_en" = %true : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "tv_e_poke_val" = %c-56_i8 : i8, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "tv_e_poke_en" = %true : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "v1_poke_val" = %c10_i8 : i8, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "v1_poke_en" = %true : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "v2_poke_val" = %c20_i8 : i8, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "v2_poke_en" = %true : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "v3_poke_val" = %c30_i8 : i8, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "v3_poke_en" = %true : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "v4_poke_val" = %c40_i8 : i8, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "v4_poke_en" = %true : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "deep_poke_val" = %c30_i8 : i8, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "deep_poke_en" = %true : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "s_c1_poke_val" = %true : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "s_c1_poke_en" = %true : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "s_c2_poke_val" = %false : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "s_c2_poke_en" = %true : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      %false_0 = hw.constant false
      %2 = comb.concat %false_0, %c0_i8 : i1, i8
      %false_1 = hw.constant false
      %3 = comb.concat %false_1, %c100_i8 : i1, i8
      %4 = comb.sub %2, %3 : i9
      %5 = comb.extract %4 from 0 : (i9) -> i8
      %6 = comb.extract %5 from 7 : (i8) -> i1
      %7 = comb.replicate %6 : (i1) -> i8
      %8 = comb.concat %7, %5 : i8, i8
      arc.sim.set_input %arg0, "s_a_poke_val" = %8 : i16, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "s_a_poke_en" = %true : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      %false_2 = hw.constant false
      %9 = comb.concat %false_2, %c0_i9 : i1, i9
      %false_3 = hw.constant false
      %10 = comb.concat %false_3, %c200_i9 : i1, i9
      %11 = comb.sub %9, %10 : i10
      %12 = comb.extract %11 from 0 : (i10) -> i9
      %13 = comb.extract %12 from 8 : (i9) -> i1
      %14 = comb.replicate %13 : (i1) -> i7
      %15 = comb.concat %14, %12 : i7, i9
      arc.sim.set_input %arg0, "s_b_poke_val" = %15 : i16, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "s_b_poke_en" = %true : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      %false_4 = hw.constant false
      %16 = comb.concat %false_4, %c0_i10 : i1, i10
      %false_5 = hw.constant false
      %17 = comb.concat %false_5, %c300_i10 : i1, i10
      %18 = comb.sub %16, %17 : i11
      %19 = comb.extract %18 from 0 : (i11) -> i10
      %20 = comb.extract %19 from 9 : (i10) -> i1
      %21 = comb.replicate %20 : (i1) -> i6
      %22 = comb.concat %21, %19 : i6, i10
      arc.sim.set_input %arg0, "s_c_poke_val" = %22 : i16, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "s_c_poke_en" = %true : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "res_type_poke_val" = %c3_i8 : i8, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "res_type_poke_en" = %true : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "b_res_poke_val" = %false : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "b_res_poke_en" = %true : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "rst" = %false : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestTernaryNested_Harness>
      %23 = arc.sim.get_port %arg0, "res1" : i8, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22res1\22}", %23 : i8
      %24 = comb.concat %false, %23 : i1, i8
      %25 = comb.icmp eq %24, %c2_i9 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Nested ternary: false ? a : (true ? b : c) = b\22, \22line\22: 17, \22column\22: 12, \22condition\22: \22res1 == 2\22, \22scope\22: \22TestTernaryNested\22}", %25 : i1
      arc.sim.emit "DRIVER: poke c2 START", %false : i1
      arc.sim.set_input %arg0, "c2_poke_val" = %false : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "c2_poke_en" = %true : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "DRIVER: poke c2 END", %false : i1
      %26 = arc.sim.get_port %arg0, "c1" : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22c1\22}", %26 : i1
      %27 = arc.sim.get_port %arg0, "c2" : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22c2\22}", %27 : i1
      %28 = arc.sim.get_port %arg0, "c" : i8, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22c\22}", %28 : i8
      %29 = arc.sim.get_port %arg0, "b" : i8, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22b\22}", %29 : i8
      %30 = arc.sim.get_port %arg0, "a" : i8, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22a\22}", %30 : i8
      %31 = comb.mux %27, %29, %28 : i8
      %32 = comb.mux %26, %30, %31 : i8
      %33 = comb.concat %false, %32 : i1, i8
      %34 = comb.icmp eq %33, %c3_i9 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Nested ternary: false ? a : (false ? b : c) = c\22, \22line\22: 21, \22column\22: 12, \22condition\22: \22c1 a c2 b c == 3\22, \22scope\22: \22TestTernaryNested\22}", %34 : i1
      arc.sim.emit "DRIVER: poke c1 START", %true : i1
      arc.sim.set_input %arg0, "c1_poke_val" = %true : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "c1_poke_en" = %true : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "DRIVER: poke c1 END", %true : i1
      %35 = arc.sim.get_port %arg0, "c1" : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22c1\22}", %35 : i1
      %36 = arc.sim.get_port %arg0, "c2" : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22c2\22}", %36 : i1
      %37 = arc.sim.get_port %arg0, "c" : i8, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22c\22}", %37 : i8
      %38 = arc.sim.get_port %arg0, "b" : i8, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22b\22}", %38 : i8
      %39 = arc.sim.get_port %arg0, "a" : i8, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22a\22}", %39 : i8
      %40 = comb.mux %36, %38, %37 : i8
      %41 = comb.mux %35, %39, %40 : i8
      %42 = comb.concat %false, %41 : i1, i8
      %43 = comb.icmp eq %42, %c1_i9 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Nested ternary: true ? a : (...) = a\22, \22line\22: 25, \22column\22: 12, \22condition\22: \22c1 a c2 b c == 1\22, \22scope\22: \22TestTernaryNested\22}", %43 : i1
      %44 = arc.sim.get_port %arg0, "ra" : i8, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22ra\22}", %44 : i8
      %45 = comb.concat %false, %44 : i1, i8
      %46 = comb.icmp eq %45, %c30_i9 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Right-assoc explicit\22, \22line\22: 43, \22column\22: 12, \22condition\22: \22ra == 30\22, \22scope\22: \22TestTernaryNested\22}", %46 : i1
      %47 = arc.sim.get_port %arg0, "rb" : i8, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22rb\22}", %47 : i8
      %48 = comb.concat %false, %47 : i1, i8
      %49 = comb.icmp eq %48, %c30_i9 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Right-assoc implicit\22, \22line\22: 44, \22column\22: 12, \22condition\22: \22rb == 30\22, \22scope\22: \22TestTernaryNested\22}", %49 : i1
      %50 = arc.sim.get_port %arg0, "ra" : i8, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22ra\22}", %50 : i8
      %51 = arc.sim.get_port %arg0, "rb" : i8, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22rb\22}", %51 : i8
      %52 = comb.concat %false, %50 : i1, i8
      %53 = comb.concat %false, %51 : i1, i8
      %54 = comb.icmp eq %52, %53 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Implicit matches explicit right-associativity\22, \22line\22: 45, \22column\22: 12, \22condition\22: \22ra == rb\22, \22scope\22: \22TestTernaryNested\22}", %54 : i1
      %55 = arc.sim.get_port %arg0, "tv_c" : i8, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22tv_c\22}", %55 : i8
      %56 = arc.sim.get_port %arg0, "tc2" : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22tc2\22}", %56 : i1
      %57 = arc.sim.get_port %arg0, "tv_e" : i8, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22tv_e\22}", %57 : i8
      %58 = arc.sim.get_port %arg0, "tv_d" : i8, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22tv_d\22}", %58 : i8
      %59 = arc.sim.get_port %arg0, "tc1" : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22tc1\22}", %59 : i1
      %60 = comb.mux %56, %55, %58 : i8
      %61 = comb.mux %59, %60, %57 : i8
      %62 = comb.concat %false, %61 : i1, i8
      %63 = comb.icmp eq %62, %c150_i9 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22True-arm nesting: (T, F) selects d\22, \22line\22: 56, \22column\22: 12, \22condition\22: \22tc1 tc2 tv_c tv_d tv_e == 150\22, \22scope\22: \22TestTernaryNested\22}", %63 : i1
      arc.sim.emit "DRIVER: poke tc2 START", %true : i1
      arc.sim.set_input %arg0, "tc2_poke_val" = %true : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "tc2_poke_en" = %true : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "DRIVER: poke tc2 END", %true : i1
      %64 = arc.sim.get_port %arg0, "tv_c" : i8, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22tv_c\22}", %64 : i8
      %65 = arc.sim.get_port %arg0, "tc2" : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22tc2\22}", %65 : i1
      %66 = arc.sim.get_port %arg0, "tv_e" : i8, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22tv_e\22}", %66 : i8
      %67 = arc.sim.get_port %arg0, "tv_d" : i8, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22tv_d\22}", %67 : i8
      %68 = arc.sim.get_port %arg0, "tc1" : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22tc1\22}", %68 : i1
      %69 = comb.mux %65, %64, %67 : i8
      %70 = comb.mux %68, %69, %66 : i8
      %71 = comb.concat %false, %70 : i1, i8
      %72 = comb.icmp eq %71, %c100_i9 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22True-arm nesting: (T, T) selects c\22, \22line\22: 60, \22column\22: 12, \22condition\22: \22tc1 tc2 tv_c tv_d tv_e == 100\22, \22scope\22: \22TestTernaryNested\22}", %72 : i1
      arc.sim.emit "DRIVER: poke tc1 START", %false : i1
      arc.sim.set_input %arg0, "tc1_poke_val" = %false : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "tc1_poke_en" = %true : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "DRIVER: poke tc1 END", %false : i1
      %73 = arc.sim.get_port %arg0, "tv_c" : i8, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22tv_c\22}", %73 : i8
      %74 = arc.sim.get_port %arg0, "tc2" : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22tc2\22}", %74 : i1
      %75 = arc.sim.get_port %arg0, "tv_e" : i8, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22tv_e\22}", %75 : i8
      %76 = arc.sim.get_port %arg0, "tv_d" : i8, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22tv_d\22}", %76 : i8
      %77 = arc.sim.get_port %arg0, "tc1" : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22tc1\22}", %77 : i1
      %78 = comb.mux %74, %73, %76 : i8
      %79 = comb.mux %77, %78, %75 : i8
      %80 = comb.concat %false, %79 : i1, i8
      %81 = comb.icmp eq %80, %c200_i9 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22True-arm nesting: (F, T) selects e\22, \22line\22: 64, \22column\22: 12, \22condition\22: \22tc1 tc2 tv_c tv_d tv_e == 200\22, \22scope\22: \22TestTernaryNested\22}", %81 : i1
      %82 = arc.sim.get_port %arg0, "deep" : i8, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22deep\22}", %82 : i8
      %83 = comb.concat %false, %82 : i1, i8
      %84 = comb.icmp eq %83, %c30_i9 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Deep nesting selection\22, \22line\22: 74, \22column\22: 12, \22condition\22: \22deep == 30\22, \22scope\22: \22TestTernaryNested\22}", %84 : i1
      %85 = arc.sim.get_port %arg0, "s_a" : i16, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s_a\22}", %85 : i16
      %86 = arc.sim.get_port %arg0, "s_c1" : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s_c1\22}", %86 : i1
      %87 = arc.sim.get_port %arg0, "s_c" : i16, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s_c\22}", %87 : i16
      %88 = arc.sim.get_port %arg0, "s_b" : i16, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s_b\22}", %88 : i16
      %89 = arc.sim.get_port %arg0, "s_c2" : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s_c2\22}", %89 : i1
      %90 = comb.mux %89, %88, %87 : i16
      %91 = comb.mux %86, %85, %90 : i16
      %92 = comb.icmp eq %91, %8 : i16
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Signed nested (T) selects a\22, \22line\22: 85, \22column\22: 12, \22condition\22: \22s_c1 s_a s_c2 s_b s_c == - 100\22, \22scope\22: \22TestTernaryNested\22}", %92 : i1
      arc.sim.emit "DRIVER: poke s_c1 START", %false : i1
      arc.sim.set_input %arg0, "s_c1_poke_val" = %false : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.set_input %arg0, "s_c1_poke_en" = %true : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "DRIVER: poke s_c1 END", %false : i1
      %93 = arc.sim.get_port %arg0, "s_a" : i16, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s_a\22}", %93 : i16
      %94 = arc.sim.get_port %arg0, "s_c1" : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s_c1\22}", %94 : i1
      %95 = arc.sim.get_port %arg0, "s_c" : i16, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s_c\22}", %95 : i16
      %96 = arc.sim.get_port %arg0, "s_b" : i16, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s_b\22}", %96 : i16
      %97 = arc.sim.get_port %arg0, "s_c2" : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22s_c2\22}", %97 : i1
      %98 = comb.mux %97, %96, %95 : i16
      %99 = comb.mux %94, %93, %98 : i16
      %100 = comb.icmp eq %99, %22 : i16
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Signed nested (F,F) selects c\22, \22line\22: 89, \22column\22: 12, \22condition\22: \22s_c1 s_a s_c2 s_b s_c == - 300\22, \22scope\22: \22TestTernaryNested\22}", %100 : i1
      %101 = arc.sim.get_port %arg0, "res_type" : i8, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22res_type\22}", %101 : i8
      %102 = comb.icmp eq %c8_i33, %c8_i33 : i33
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Nested result width matches arms\22, \22line\22: 93, \22column\22: 12, \22condition\22: \22width res_type == 8\22, \22scope\22: \22TestTernaryNested\22}", %102 : i1
      %103 = arc.sim.get_port %arg0, "res_type" : i8, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22res_type\22}", %103 : i8
      %104 = comb.icmp eq %c0_i2, %c0_i2 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Nested result signedness matches arms\22, \22line\22: 94, \22column\22: 12, \22condition\22: \22is_signed res_type == false\22, \22scope\22: \22TestTernaryNested\22}", %104 : i1
      %105 = arc.sim.get_port %arg0, "b_res" : i1, !arc.sim.instance<@TestTernaryNested_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22b_res\22}", %105 : i1
      %106 = comb.concat %false, %105 : i1, i1
      %107 = comb.icmp eq %106, %c1_i2 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Boolean nested ternary\22, \22line\22: 100, \22column\22: 12, \22condition\22: \22b_res == true\22, \22scope\22: \22TestTernaryNested\22}", %107 : i1
    }
    return
  }
}