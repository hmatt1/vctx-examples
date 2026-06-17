module {



  hw.module private @control_flow_when_nested_deep_TankController(in %clk : !seq.clock, in %rst : i1, in %sensor_ok : i1, in %level : i8, in %inlet_en : i1, in %outlet_en : i1, in %manual_mode : i1, in %manual_fill : i1, in %manual_drain : i1, out inlet_open : i1, out outlet_open : i1, out alarm : i1, out status : i2, out fault_count : i8) {
    %c150_i9 = hw.constant 150 : i9
    %c200_i9 = hw.constant 200 : i9
    %c50_i8 = hw.constant 50 : i8
    %c1_i9 = hw.constant 1 : i9
    %c1_i2 = hw.constant 1 : i2
    %c0_i8 = hw.constant 0 : i8
    %c-2_i2 = hw.constant -2 : i2
    %c-1_i2 = hw.constant -1 : i2
    %false = hw.constant false
    %true = hw.constant true
    %false_0 = hw.constant false
    %c0_i2 = hw.constant 0 : i2
    %s_last = seq.compreg %125, %clk : i2  
    %s_faults = seq.compreg %126, %clk : i8  
    %0 = comb.xor %sensor_ok, %true : i1
    %1 = comb.and %sensor_ok, %manual_mode : i1
    %2 = comb.xor %manual_mode, %true : i1
    %3 = comb.and %sensor_ok, %2 : i1
    %4 = comb.icmp eq %manual_drain, %false : i1
    %5 = comb.and %manual_fill, %4 : i1
    %6 = comb.and %1, %5 : i1
    %7 = comb.xor %5, %true : i1
    %8 = comb.and %1, %7 : i1
    %9 = comb.icmp eq %manual_fill, %false : i1
    %10 = comb.and %manual_drain, %9 : i1
    %11 = comb.and %8, %10 : i1
    %12 = comb.xor %10, %true : i1
    %13 = comb.and %8, %12 : i1
    %14 = comb.and %6, %inlet_en : i1
    %15 = comb.xor %inlet_en, %true : i1
    %16 = comb.and %6, %15 : i1
    %17 = comb.concat %false_0, %s_faults : i1, i8
    %false_1 = hw.constant false
    %18 = comb.concat %false_1, %17 : i1, i9
    %false_2 = hw.constant false
    %19 = comb.concat %false_2, %c1_i9 : i1, i9
    %20 = comb.add %18, %19 : i10
    %21 = comb.extract %20 from 0 : (i10) -> i9
    %22 = comb.extract %21 from 0 : (i9) -> i8
    %23 = comb.mux %16, %c-1_i2, %c0_i2 : i2
    %24 = comb.mux %14, %c1_i2, %23 : i2
    %25 = comb.xor %14, %true : i1
    %26 = comb.and %25, %16 : i1
    %27 = comb.mux %16, %c-1_i2, %s_last : i2
    %28 = comb.mux %14, %c1_i2, %27 : i2
    %29 = comb.xor %16, %true : i1
    %30 = comb.or %14, %29 : i1
    %31 = comb.and %11, %outlet_en : i1
    %32 = comb.xor %outlet_en, %true : i1
    %33 = comb.and %11, %32 : i1
    %34 = comb.mux %33, %c-1_i2, %c0_i2 : i2
    %35 = comb.mux %31, %c-2_i2, %34 : i2
    %36 = comb.xor %31, %true : i1
    %37 = comb.mux %33, %c-1_i2, %s_last : i2
    %38 = comb.mux %31, %c-2_i2, %37 : i2
    %39 = comb.xor %33, %true : i1
    %40 = comb.and %36, %33 : i1
    %41 = comb.mux %6, %26, %40 : i1
    %42 = comb.mux %13, %s_last, %c0_i2 : i2
    %43 = comb.mux %11, %35, %42 : i2
    %44 = comb.mux %6, %24, %43 : i2
    %45 = comb.xor %6, %true : i1
    %46 = comb.and %45, %31 : i1
    %47 = comb.mux %11, %38, %s_last : i2
    %48 = comb.mux %6, %28, %47 : i2
    %49 = comb.xor %11, %true : i1
    %50 = comb.or %49, %31, %39 : i1
    %51 = comb.mux %6, %30, %50 : i1
    %52 = comb.concat %false_0, %level : i1, i8
    %53 = comb.concat %false_0, %c50_i8 : i1, i8
    %54 = comb.icmp slt %52, %53 : i9
    %55 = comb.and %3, %54 : i1
    %56 = comb.xor %54, %true : i1
    %57 = comb.and %3, %56 : i1
    %58 = comb.icmp sgt %52, %c200_i9 : i9
    %59 = comb.and %57, %58 : i1
    %60 = comb.xor %58, %true : i1
    %61 = comb.and %57, %60 : i1
    %62 = comb.and %55, %inlet_en : i1
    %63 = comb.and %55, %15 : i1
    %64 = comb.mux %63, %c-1_i2, %c0_i2 : i2
    %65 = comb.mux %62, %c1_i2, %64 : i2
    %66 = comb.xor %62, %true : i1
    %67 = comb.and %66, %63 : i1
    %68 = comb.mux %63, %c-1_i2, %s_last : i2
    %69 = comb.mux %62, %c1_i2, %68 : i2
    %70 = comb.xor %63, %true : i1
    %71 = comb.or %62, %70 : i1
    %72 = comb.and %59, %outlet_en : i1
    %73 = comb.and %59, %32 : i1
    %74 = comb.mux %73, %c-1_i2, %c0_i2 : i2
    %75 = comb.mux %72, %c-2_i2, %74 : i2
    %76 = comb.xor %72, %true : i1
    %77 = comb.mux %73, %c-1_i2, %s_last : i2
    %78 = comb.mux %72, %c-2_i2, %77 : i2
    %79 = comb.xor %73, %true : i1
    %80 = comb.icmp sgt %52, %c150_i9 : i9
    %81 = comb.and %61, %80 : i1
    %82 = comb.xor %80, %true : i1
    %83 = comb.and %61, %82 : i1
    %84 = comb.and %81, %outlet_en : i1
    %85 = comb.and %81, %32 : i1
    %86 = comb.mux %85, %c0_i2, %s_last : i2
    %87 = comb.mux %84, %c-2_i2, %86 : i2
    %88 = comb.mux %83, %c0_i2, %s_last : i2
    %89 = comb.mux %81, %87, %88 : i2
    %90 = comb.and %76, %73 : i1
    %91 = comb.mux %55, %67, %90 : i1
    %92 = comb.mux %84, %c-2_i2, %c0_i2 : i2
    %93 = comb.mux %59, %75, %92 : i2
    %94 = comb.mux %55, %65, %93 : i2
    %95 = comb.mux %59, %72, %84 : i1
    %96 = comb.xor %55, %true : i1
    %97 = comb.mux %61, %89, %s_last : i2
    %98 = comb.mux %59, %78, %97 : i2
    %99 = comb.mux %55, %69, %98 : i2
    %100 = comb.xor %59, %true : i1
    %101 = comb.or %100, %72, %79 : i1
    %102 = comb.mux %55, %71, %101 : i1
    %103 = comb.and %3, %91 : i1
    %104 = comb.mux %1, %41, %103 : i1
    %105 = comb.mux %1, %14, %62 : i1
    %106 = comb.mux %3, %94, %c0_i2 : i2
    %107 = comb.mux %1, %44, %106 : i2
    %108 = comb.and %3, %96, %95 : i1
    %109 = comb.mux %1, %46, %108 : i1
    %110 = comb.mux %3, %99, %s_last : i2
    %111 = comb.mux %1, %48, %110 : i2
    %112 = comb.xor %3, %true : i1
    %113 = comb.or %112, %102 : i1
    %114 = comb.mux %1, %51, %113 : i1
    %115 = comb.mux %114, %s_faults, %22 : i8
    %116 = comb.mux %sensor_ok, %104, %0 : i1
    %117 = comb.and %sensor_ok, %105 : i1
    %118 = comb.mux %0, %c-1_i2, %c0_i2 : i2
    %119 = comb.mux %sensor_ok, %107, %118 : i2
    %120 = comb.and %sensor_ok, %109 : i1
    %121 = comb.mux %0, %c-1_i2, %s_last : i2
    %122 = comb.mux %sensor_ok, %111, %121 : i2
    %123 = comb.mux %0, %22, %s_faults : i8
    %124 = comb.mux %sensor_ok, %115, %123 : i8
    %125 = comb.mux %rst, %c0_i2, %122 : i2
    %126 = comb.mux %rst, %c0_i8, %124 : i8
    hw.output %117, %120, %116, %119, %s_faults : i1, i1, i1, i2, i8
  }
  hw.module @TestStatusHoldBetweenCommands_Harness(in %clk : !seq.clock, in %rst : i1, in %alarm_poke_val : i1, in %alarm_poke_en : i1, in %fc_poke_val : i8, in %fc_poke_en : i1, in %inlet_en_poke_val : i1, in %inlet_en_poke_en : i1, in %inlet_open_poke_val : i1, in %inlet_open_poke_en : i1, in %level_poke_val : i8, in %level_poke_en : i1, in %manual_drain_poke_val : i1, in %manual_drain_poke_en : i1, in %manual_fill_poke_val : i1, in %manual_fill_poke_en : i1, in %manual_mode_poke_val : i1, in %manual_mode_poke_en : i1, in %outlet_en_poke_val : i1, in %outlet_en_poke_en : i1, in %outlet_open_poke_val : i1, in %outlet_open_poke_en : i1, in %sensor_ok_poke_val : i1, in %sensor_ok_poke_en : i1, in %status_poke_val : i2, in %status_poke_en : i1, out alarm : i1, out fc : i8, out inlet_en : i1, out inlet_open : i1, out level : i8, out manual_drain : i1, out manual_fill : i1, out manual_mode : i1, out outlet_en : i1, out outlet_open : i1, out sensor_ok : i1, out status : i2) {
    %true = hw.constant true {sv.namehint = "inlet_en_wire"}
    %c100_i8 = hw.constant 100 : i8
    %TankController_inst_681_1.inlet_open, %TankController_inst_681_1.outlet_open, %TankController_inst_681_1.alarm, %TankController_inst_681_1.status, %TankController_inst_681_1.fault_count = hw.instance "TankController_inst_681_1" sym @TankController_inst_681_1 @control_flow_when_nested_deep_TankController(clk: %clk: !seq.clock, rst: %rst: i1, sensor_ok: %14: i1, level: %5: i8, inlet_en: %3: i1, outlet_en: %11: i1, manual_mode: %9: i1, manual_fill: %7: i1, manual_drain: %6: i1) -> (inlet_open: i1, outlet_open: i1, alarm: i1, status: i2, fault_count: i8)
    %0 = comb.mux %alarm_poke_en, %alarm_poke_val, %TankController_inst_681_1.alarm : i1
    %1 = comb.mux %fc_poke_en, %fc_poke_val, %TankController_inst_681_1.fault_count : i8
    %2 = comb.xor %inlet_en_poke_en, %true : i1
    %3 = comb.or %2, %inlet_en_poke_val : i1
    %4 = comb.mux %inlet_open_poke_en, %inlet_open_poke_val, %TankController_inst_681_1.inlet_open : i1
    %5 = comb.mux %level_poke_en, %level_poke_val, %c100_i8 : i8
    %6 = comb.and %manual_drain_poke_en, %manual_drain_poke_val : i1
    %7 = comb.and %manual_fill_poke_en, %manual_fill_poke_val : i1
    %8 = comb.xor %manual_mode_poke_en, %true : i1
    %9 = comb.or %8, %manual_mode_poke_val : i1
    %10 = comb.xor %outlet_en_poke_en, %true : i1
    %11 = comb.or %10, %outlet_en_poke_val : i1
    %12 = comb.mux %outlet_open_poke_en, %outlet_open_poke_val, %TankController_inst_681_1.outlet_open : i1
    %13 = comb.xor %sensor_ok_poke_en, %true : i1
    %14 = comb.or %13, %sensor_ok_poke_val : i1
    %15 = comb.mux %status_poke_en, %status_poke_val, %TankController_inst_681_1.status : i2
    hw.output %0, %1, %3, %4, %5, %6, %7, %9, %11, %12, %14, %15 : i1, i8, i1, i1, i8, i1, i1, i1, i1, i1, i1, i2
  }
  func.func @entry() {
    %c2_i3 = hw.constant 2 : i3
    %c1_i2 = hw.constant 1 : i2
    %c0_i2 = hw.constant 0 : i2
    %c100_i8 = hw.constant 100 : i8
    %true = hw.constant true
    %false = hw.constant false
    %0 = seq.const_clock high
    %1 = seq.const_clock low
    arc.sim.instantiate @TestStatusHoldBetweenCommands_Harness as %arg0 {
      arc.sim.set_input %arg0, "alarm_poke_en" = %false : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.set_input %arg0, "fc_poke_en" = %false : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.set_input %arg0, "inlet_en_poke_en" = %false : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.set_input %arg0, "inlet_open_poke_en" = %false : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.set_input %arg0, "level_poke_en" = %false : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.set_input %arg0, "manual_drain_poke_en" = %false : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.set_input %arg0, "manual_fill_poke_en" = %false : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.set_input %arg0, "manual_mode_poke_en" = %false : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.set_input %arg0, "outlet_en_poke_en" = %false : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.set_input %arg0, "outlet_open_poke_en" = %false : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.set_input %arg0, "sensor_ok_poke_en" = %false : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.set_input %arg0, "status_poke_en" = %false : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.set_input %arg0, "sensor_ok_poke_val" = %true : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.set_input %arg0, "sensor_ok_poke_en" = %true : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.set_input %arg0, "level_poke_val" = %c100_i8 : i8, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.set_input %arg0, "level_poke_en" = %true : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.set_input %arg0, "inlet_en_poke_val" = %true : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.set_input %arg0, "inlet_en_poke_en" = %true : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.set_input %arg0, "outlet_en_poke_val" = %true : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.set_input %arg0, "outlet_en_poke_en" = %true : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.set_input %arg0, "manual_mode_poke_val" = %true : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.set_input %arg0, "manual_mode_poke_en" = %true : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.set_input %arg0, "manual_fill_poke_val" = %false : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.set_input %arg0, "manual_fill_poke_en" = %true : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.set_input %arg0, "manual_drain_poke_val" = %false : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.set_input %arg0, "manual_drain_poke_en" = %true : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.set_input %arg0, "rst" = %false : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      %2 = arc.sim.get_port %arg0, "status" : i2, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22status\22}", %2 : i2
      %3 = comb.concat %false, %2 : i1, i2
      %4 = comb.concat %false, %c0_i2 : i1, i2
      %5 = comb.icmp eq %3, %4 : i3
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22initial status holds 0\22, \22line\22: 700, \22column\22: 12, \22condition\22: \22status == 0 as u2\22, \22scope\22: \22TestStatusHoldBetweenCommands\22}", %5 : i1
      arc.sim.emit "DRIVER: poke manual_fill START", %true : i1
      arc.sim.set_input %arg0, "manual_fill_poke_val" = %true : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.set_input %arg0, "manual_fill_poke_en" = %true : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "DRIVER: poke manual_fill END", %true : i1
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      %6 = arc.sim.get_port %arg0, "inlet_en" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "inlet_en", %6 : i1
      %7 = arc.sim.get_port %arg0, "manual_mode" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "manual_mode", %7 : i1
      %8 = arc.sim.get_port %arg0, "fc" : i8, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "fc", %8 : i8
      %9 = arc.sim.get_port %arg0, "alarm" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "alarm", %9 : i1
      %10 = arc.sim.get_port %arg0, "inlet_open" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "inlet_open", %10 : i1
      %11 = arc.sim.get_port %arg0, "outlet_en" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "outlet_en", %11 : i1
      %12 = arc.sim.get_port %arg0, "manual_drain" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "manual_drain", %12 : i1
      %13 = arc.sim.get_port %arg0, "manual_fill" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "manual_fill", %13 : i1
      %14 = arc.sim.get_port %arg0, "sensor_ok" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "sensor_ok", %14 : i1
      %15 = arc.sim.get_port %arg0, "level" : i8, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "level", %15 : i8
      %16 = arc.sim.get_port %arg0, "status" : i2, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "status", %16 : i2
      %17 = arc.sim.get_port %arg0, "outlet_open" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "outlet_open", %17 : i1
      arc.sim.emit "DRIVER: poke manual_fill START", %false : i1
      arc.sim.set_input %arg0, "manual_fill_poke_val" = %false : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.set_input %arg0, "manual_fill_poke_en" = %true : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "DRIVER: poke manual_fill END", %false : i1
      %18 = arc.sim.get_port %arg0, "status" : i2, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22status\22}", %18 : i2
      %19 = comb.concat %false, %18 : i1, i2
      %20 = comb.concat %false, %c1_i2 : i1, i2
      %21 = comb.icmp eq %19, %20 : i3
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22status holds last committed: filling\22, \22line\22: 709, \22column\22: 12, \22condition\22: \22status == 1 as u2\22, \22scope\22: \22TestStatusHoldBetweenCommands\22}", %21 : i1
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      %22 = arc.sim.get_port %arg0, "inlet_en" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "inlet_en", %22 : i1
      %23 = arc.sim.get_port %arg0, "manual_mode" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "manual_mode", %23 : i1
      %24 = arc.sim.get_port %arg0, "fc" : i8, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "fc", %24 : i8
      %25 = arc.sim.get_port %arg0, "alarm" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "alarm", %25 : i1
      %26 = arc.sim.get_port %arg0, "inlet_open" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "inlet_open", %26 : i1
      %27 = arc.sim.get_port %arg0, "outlet_en" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "outlet_en", %27 : i1
      %28 = arc.sim.get_port %arg0, "manual_drain" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "manual_drain", %28 : i1
      %29 = arc.sim.get_port %arg0, "manual_fill" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "manual_fill", %29 : i1
      %30 = arc.sim.get_port %arg0, "sensor_ok" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "sensor_ok", %30 : i1
      %31 = arc.sim.get_port %arg0, "level" : i8, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "level", %31 : i8
      %32 = arc.sim.get_port %arg0, "status" : i2, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "status", %32 : i2
      %33 = arc.sim.get_port %arg0, "outlet_open" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "outlet_open", %33 : i1
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      %34 = arc.sim.get_port %arg0, "inlet_en" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "inlet_en", %34 : i1
      %35 = arc.sim.get_port %arg0, "manual_mode" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "manual_mode", %35 : i1
      %36 = arc.sim.get_port %arg0, "fc" : i8, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "fc", %36 : i8
      %37 = arc.sim.get_port %arg0, "alarm" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "alarm", %37 : i1
      %38 = arc.sim.get_port %arg0, "inlet_open" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "inlet_open", %38 : i1
      %39 = arc.sim.get_port %arg0, "outlet_en" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "outlet_en", %39 : i1
      %40 = arc.sim.get_port %arg0, "manual_drain" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "manual_drain", %40 : i1
      %41 = arc.sim.get_port %arg0, "manual_fill" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "manual_fill", %41 : i1
      %42 = arc.sim.get_port %arg0, "sensor_ok" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "sensor_ok", %42 : i1
      %43 = arc.sim.get_port %arg0, "level" : i8, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "level", %43 : i8
      %44 = arc.sim.get_port %arg0, "status" : i2, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "status", %44 : i2
      %45 = arc.sim.get_port %arg0, "outlet_open" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "outlet_open", %45 : i1
      %46 = arc.sim.get_port %arg0, "status" : i2, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22status\22}", %46 : i2
      %47 = comb.concat %false, %46 : i1, i2
      %48 = comb.icmp eq %47, %20 : i3
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22holds filling status across idle cycles\22, \22line\22: 712, \22column\22: 12, \22condition\22: \22status == 1 as u2\22, \22scope\22: \22TestStatusHoldBetweenCommands\22}", %48 : i1
      arc.sim.emit "DRIVER: poke manual_drain START", %true : i1
      arc.sim.set_input %arg0, "manual_drain_poke_val" = %true : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.set_input %arg0, "manual_drain_poke_en" = %true : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "DRIVER: poke manual_drain END", %true : i1
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      %49 = arc.sim.get_port %arg0, "inlet_en" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "inlet_en", %49 : i1
      %50 = arc.sim.get_port %arg0, "manual_mode" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "manual_mode", %50 : i1
      %51 = arc.sim.get_port %arg0, "fc" : i8, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "fc", %51 : i8
      %52 = arc.sim.get_port %arg0, "alarm" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "alarm", %52 : i1
      %53 = arc.sim.get_port %arg0, "inlet_open" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "inlet_open", %53 : i1
      %54 = arc.sim.get_port %arg0, "outlet_en" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "outlet_en", %54 : i1
      %55 = arc.sim.get_port %arg0, "manual_drain" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "manual_drain", %55 : i1
      %56 = arc.sim.get_port %arg0, "manual_fill" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "manual_fill", %56 : i1
      %57 = arc.sim.get_port %arg0, "sensor_ok" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "sensor_ok", %57 : i1
      %58 = arc.sim.get_port %arg0, "level" : i8, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "level", %58 : i8
      %59 = arc.sim.get_port %arg0, "status" : i2, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "status", %59 : i2
      %60 = arc.sim.get_port %arg0, "outlet_open" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "outlet_open", %60 : i1
      arc.sim.emit "DRIVER: poke manual_drain START", %false : i1
      arc.sim.set_input %arg0, "manual_drain_poke_val" = %false : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.set_input %arg0, "manual_drain_poke_en" = %true : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "DRIVER: poke manual_drain END", %false : i1
      %61 = arc.sim.get_port %arg0, "status" : i2, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22status\22}", %61 : i2
      %62 = comb.concat %false, %61 : i1, i2
      %63 = comb.icmp eq %62, %c2_i3 : i3
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22status holds last committed: draining\22, \22line\22: 720, \22column\22: 12, \22condition\22: \22status == 2 as u2\22, \22scope\22: \22TestStatusHoldBetweenCommands\22}", %63 : i1
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      %64 = arc.sim.get_port %arg0, "inlet_en" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "inlet_en", %64 : i1
      %65 = arc.sim.get_port %arg0, "manual_mode" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "manual_mode", %65 : i1
      %66 = arc.sim.get_port %arg0, "fc" : i8, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "fc", %66 : i8
      %67 = arc.sim.get_port %arg0, "alarm" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "alarm", %67 : i1
      %68 = arc.sim.get_port %arg0, "inlet_open" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "inlet_open", %68 : i1
      %69 = arc.sim.get_port %arg0, "outlet_en" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "outlet_en", %69 : i1
      %70 = arc.sim.get_port %arg0, "manual_drain" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "manual_drain", %70 : i1
      %71 = arc.sim.get_port %arg0, "manual_fill" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "manual_fill", %71 : i1
      %72 = arc.sim.get_port %arg0, "sensor_ok" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "sensor_ok", %72 : i1
      %73 = arc.sim.get_port %arg0, "level" : i8, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "level", %73 : i8
      %74 = arc.sim.get_port %arg0, "status" : i2, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "status", %74 : i2
      %75 = arc.sim.get_port %arg0, "outlet_open" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "outlet_open", %75 : i1
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      %76 = arc.sim.get_port %arg0, "inlet_en" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "inlet_en", %76 : i1
      %77 = arc.sim.get_port %arg0, "manual_mode" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "manual_mode", %77 : i1
      %78 = arc.sim.get_port %arg0, "fc" : i8, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "fc", %78 : i8
      %79 = arc.sim.get_port %arg0, "alarm" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "alarm", %79 : i1
      %80 = arc.sim.get_port %arg0, "inlet_open" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "inlet_open", %80 : i1
      %81 = arc.sim.get_port %arg0, "outlet_en" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "outlet_en", %81 : i1
      %82 = arc.sim.get_port %arg0, "manual_drain" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "manual_drain", %82 : i1
      %83 = arc.sim.get_port %arg0, "manual_fill" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "manual_fill", %83 : i1
      %84 = arc.sim.get_port %arg0, "sensor_ok" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "sensor_ok", %84 : i1
      %85 = arc.sim.get_port %arg0, "level" : i8, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "level", %85 : i8
      %86 = arc.sim.get_port %arg0, "status" : i2, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "status", %86 : i2
      %87 = arc.sim.get_port %arg0, "outlet_open" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "outlet_open", %87 : i1
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      %88 = arc.sim.get_port %arg0, "inlet_en" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "inlet_en", %88 : i1
      %89 = arc.sim.get_port %arg0, "manual_mode" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "manual_mode", %89 : i1
      %90 = arc.sim.get_port %arg0, "fc" : i8, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "fc", %90 : i8
      %91 = arc.sim.get_port %arg0, "alarm" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "alarm", %91 : i1
      %92 = arc.sim.get_port %arg0, "inlet_open" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "inlet_open", %92 : i1
      %93 = arc.sim.get_port %arg0, "outlet_en" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "outlet_en", %93 : i1
      %94 = arc.sim.get_port %arg0, "manual_drain" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "manual_drain", %94 : i1
      %95 = arc.sim.get_port %arg0, "manual_fill" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "manual_fill", %95 : i1
      %96 = arc.sim.get_port %arg0, "sensor_ok" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "sensor_ok", %96 : i1
      %97 = arc.sim.get_port %arg0, "level" : i8, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "level", %97 : i8
      %98 = arc.sim.get_port %arg0, "status" : i2, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "status", %98 : i2
      %99 = arc.sim.get_port %arg0, "outlet_open" : i1, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "outlet_open", %99 : i1
      %100 = arc.sim.get_port %arg0, "status" : i2, !arc.sim.instance<@TestStatusHoldBetweenCommands_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22status\22}", %100 : i2
      %101 = comb.concat %false, %100 : i1, i2
      %102 = comb.icmp eq %101, %c2_i3 : i3
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22holds draining status across idle cycles\22, \22line\22: 723, \22column\22: 12, \22condition\22: \22status == 2 as u2\22, \22scope\22: \22TestStatusHoldBetweenCommands\22}", %102 : i1
    }
    return
  }
}