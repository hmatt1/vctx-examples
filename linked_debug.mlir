module {



  hw.module private @gameboy_alu8_ALU8(in %clk : !seq.clock, in %rst : i1, in %a : i8, in %b : i8, in %op : i8, in %c_in : i1, in %fz_in : i1, in %fn_in : i1, in %fh_in : i1, in %fc_in : i1, out result : i8, out z : i1, out n : i1, out h : i1, out c : i1) {
    %c-1_i8 = hw.constant -1 : i8
    %false = hw.constant false
    %c-12_i5 = hw.constant -12 : i5
    %c-13_i5 = hw.constant -13 : i5
    %c-14_i5 = hw.constant -14 : i5
    %c-15_i5 = hw.constant -15 : i5
    %c-2_i4 = hw.constant -2 : i4
    %c-3_i4 = hw.constant -3 : i4
    %c-4_i4 = hw.constant -4 : i4
    %c-5_i4 = hw.constant -5 : i4
    %c-6_i4 = hw.constant -6 : i4
    %c-7_i4 = hw.constant -7 : i4
    %c-8_i4 = hw.constant -8 : i4
    %c-2_i3 = hw.constant -2 : i3
    %c-3_i3 = hw.constant -3 : i3
    %c-4_i3 = hw.constant -4 : i3
    %c-1_i2 = hw.constant -1 : i2
    %c-2_i2 = hw.constant -2 : i2
    %c0_i8 = hw.constant 0 : i8
    %c-1_i3 = hw.constant -1 : i3
    %c-1_i4 = hw.constant -1 : i4
    %c-1_i8_0 = hw.constant -1 : i8
    %true = hw.constant true
    %c-16_i5 = hw.constant -16 : i5
    %false_1 = hw.constant false
    %c0_i7 = hw.constant 0 : i7
    %0 = comb.concat %c0_i7, %c_in : i7, i1
    %c0_i7_2 = hw.constant 0 : i7
    %1 = comb.concat %c0_i7_2, %fc_in : i7, i1
    %c0_i8_3 = hw.constant 0 : i8
    %2 = comb.concat %c0_i8_3, %a : i8, i8
    %c0_i8_4 = hw.constant 0 : i8
    %3 = comb.concat %c0_i8_4, %b : i8, i8
    %false_5 = hw.constant false
    %4 = comb.concat %false_5, %2 : i1, i16
    %false_6 = hw.constant false
    %5 = comb.concat %false_6, %3 : i1, i16
    %false_7 = hw.constant false
    %6 = comb.concat %false_7, %4 : i1, i17
    %false_8 = hw.constant false
    %7 = comb.concat %false_8, %5 : i1, i17
    %8 = comb.add %6, %7 : i18
    %9 = comb.extract %8 from 0 : (i18) -> i17
    %c0_i9 = hw.constant 0 : i9
    %10 = comb.concat %c0_i9, %a : i9, i8
    %c0_i9_9 = hw.constant 0 : i9
    %11 = comb.concat %c0_i9_9, %b : i9, i8
    %false_10 = hw.constant false
    %12 = comb.concat %false_10, %10 : i1, i17
    %false_11 = hw.constant false
    %13 = comb.concat %false_11, %11 : i1, i17
    %14 = comb.add %12, %13 : i18
    %15 = comb.extract %14 from 0 : (i18) -> i17
    %c0_i16 = hw.constant 0 : i16
    %16 = comb.concat %c0_i16, %c_in : i16, i1
    %false_12 = hw.constant false
    %17 = comb.concat %false_12, %15 : i1, i17
    %false_13 = hw.constant false
    %18 = comb.concat %false_13, %16 : i1, i17
    %19 = comb.add %17, %18 : i18
    %20 = comb.extract %19 from 0 : (i18) -> i17
    %c0_i16_14 = hw.constant 0 : i16
    %21 = comb.concat %c0_i16_14, %false_1 : i16, i1
    %22 = comb.shru %9, %21 : i17
    %23 = comb.extract %22 from 0 : (i17) -> i8
    %24 = comb.shru %20, %21 : i17
    %25 = comb.extract %24 from 0 : (i17) -> i8
    %26 = comb.extract %9 from 8 : (i17) -> i1
    %27 = comb.extract %20 from 8 : (i17) -> i1
    %false_15 = hw.constant false
    %28 = comb.concat %false_15, %a : i1, i8
    %false_16 = hw.constant false
    %29 = comb.concat %false_16, %b : i1, i8
    %30 = comb.extract %28 from 8 : (i9) -> i1
    %31 = comb.concat %30, %28 : i1, i9
    %32 = comb.extract %29 from 8 : (i9) -> i1
    %33 = comb.concat %32, %29 : i1, i9
    %34 = comb.sub %31, %33 : i10
    %35 = comb.extract %34 from 0 : (i10) -> i9
    %c0_i8_17 = hw.constant 0 : i8
    %36 = comb.concat %c0_i8_17, %false_1 : i8, i1
    %37 = comb.shru %35, %36 : i9
    %38 = comb.extract %37 from 0 : (i9) -> i8
    %false_18 = hw.constant false
    %39 = comb.concat %false_18, %a : i1, i8
    %false_19 = hw.constant false
    %40 = comb.concat %false_19, %b : i1, i8
    %false_20 = hw.constant false
    %41 = comb.concat %false_20, %39 : i1, i9
    %false_21 = hw.constant false
    %42 = comb.concat %false_21, %40 : i1, i9
    %43 = comb.sub %41, %42 : i10
    %44 = comb.extract %43 from 0 : (i10) -> i9
    %false_22 = hw.constant false
    %45 = comb.concat %false_22, %0 : i1, i8
    %false_23 = hw.constant false
    %46 = comb.concat %false_23, %44 : i1, i9
    %false_24 = hw.constant false
    %47 = comb.concat %false_24, %45 : i1, i9
    %48 = comb.sub %46, %47 : i10
    %49 = comb.extract %48 from 0 : (i10) -> i9
    %50 = comb.shru %49, %36 : i9
    %51 = comb.extract %50 from 0 : (i9) -> i8
    %52 = comb.icmp slt %28, %29 : i9
    %false_25 = hw.constant false
    %53 = comb.concat %false_25, %40 : i1, i9
    %false_26 = hw.constant false
    %54 = comb.concat %false_26, %45 : i1, i9
    %55 = comb.add %53, %54 : i10
    %56 = comb.extract %55 from 0 : (i10) -> i9
    %c0_i2 = hw.constant 0 : i2
    %57 = comb.concat %c0_i2, %a : i2, i8
    %false_27 = hw.constant false
    %58 = comb.concat %false_27, %56 : i1, i9
    %59 = comb.icmp slt %57, %58 : i10
    %60 = comb.xor %a, %b, %23 : i8
    %c0_i3 = hw.constant 0 : i3
    %61 = comb.concat %c0_i3, %c-16_i5 : i3, i5
    %62 = comb.and %60, %61 : i8
    %false_28 = hw.constant false
    %63 = comb.concat %false_28, %62 : i1, i8
    %c0_i4 = hw.constant 0 : i4
    %64 = comb.concat %c0_i4, %c-16_i5 : i4, i5
    %65 = comb.icmp eq %63, %64 : i9
    %66 = comb.xor %a, %b, %25 : i8
    %67 = comb.and %66, %61 : i8
    %false_29 = hw.constant false
    %68 = comb.concat %false_29, %67 : i1, i8
    %69 = comb.icmp eq %68, %64 : i9
    %70 = comb.xor %a, %b, %38 : i8
    %71 = comb.and %70, %61 : i8
    %false_30 = hw.constant false
    %72 = comb.concat %false_30, %71 : i1, i8
    %73 = comb.icmp eq %72, %64 : i9
    %74 = comb.xor %a, %b, %51 : i8
    %75 = comb.and %74, %61 : i8
    %false_31 = hw.constant false
    %76 = comb.concat %false_31, %75 : i1, i8
    %77 = comb.icmp eq %76, %64 : i9
    %c0_i8_32 = hw.constant 0 : i8
    %78 = comb.concat %c0_i8_32, %true : i8, i1
    %false_33 = hw.constant false
    %79 = comb.concat %false_33, %39 : i1, i9
    %false_34 = hw.constant false
    %80 = comb.concat %false_34, %78 : i1, i9
    %81 = comb.add %79, %80 : i10
    %82 = comb.extract %81 from 0 : (i10) -> i9
    %83 = comb.shru %82, %36 : i9
    %84 = comb.extract %83 from 0 : (i9) -> i8
    %false_35 = hw.constant false
    %85 = comb.concat %false_35, %c-1_i8_0 : i1, i8
    %false_36 = hw.constant false
    %86 = comb.concat %false_36, %39 : i1, i9
    %false_37 = hw.constant false
    %87 = comb.concat %false_37, %85 : i1, i9
    %88 = comb.add %86, %87 : i10
    %89 = comb.extract %88 from 0 : (i10) -> i9
    %90 = comb.shru %89, %36 : i9
    %91 = comb.extract %90 from 0 : (i9) -> i8
    %c0_i4_38 = hw.constant 0 : i4
    %92 = comb.concat %c0_i4_38, %c-1_i4 : i4, i4
    %93 = comb.and %a, %92 : i8
    %false_39 = hw.constant false
    %94 = comb.concat %false_39, %93 : i1, i8
    %c0_i5 = hw.constant 0 : i5
    %95 = comb.concat %c0_i5, %c-1_i4 : i5, i4
    %96 = comb.icmp eq %94, %95 : i9
    %c0_i8_40 = hw.constant 0 : i8
    %97 = comb.concat %c0_i8_40, %false_1 : i8, i1
    %98 = comb.icmp eq %94, %97 : i9
    %c0_i7_41 = hw.constant 0 : i7
    %99 = comb.concat %c0_i7_41, %true : i7, i1
    %100 = comb.shl %a, %99 : i8
    %c0_i5_42 = hw.constant 0 : i5
    %101 = comb.concat %c0_i5_42, %c-1_i3 : i5, i3
    %102 = comb.shru %a, %101 : i8
    %103 = comb.or %100, %102 : i8
    %104 = comb.shru %a, %99 : i8
    %105 = comb.shl %a, %101 : i8
    %106 = comb.or %104, %105 : i8
    %107 = comb.or %100, %1 : i8
    %108 = comb.shl %1, %101 : i8
    %109 = comb.or %104, %108 : i8
    %false_43 = hw.constant false
    %110 = comb.concat %false_43, %op : i1, i8
    %111 = comb.icmp eq %110, %97 : i9
    %112 = comb.xor %111, %true : i1
    %c0_i8_44 = hw.constant 0 : i8
    %113 = comb.concat %c0_i8_44, %true : i8, i1
    %114 = comb.icmp eq %110, %113 : i9
    %115 = comb.and %112, %114 : i1
    %116 = comb.xor %114, %true : i1
    %117 = comb.and %112, %116 : i1
    %c0_i7_45 = hw.constant 0 : i7
    %118 = comb.concat %c0_i7_45, %c-2_i2 : i7, i2
    %119 = comb.icmp eq %110, %118 : i9
    %120 = comb.and %117, %119 : i1
    %121 = comb.xor %119, %true : i1
    %122 = comb.and %117, %121 : i1
    %c0_i7_46 = hw.constant 0 : i7
    %123 = comb.concat %c0_i7_46, %c-1_i2 : i7, i2
    %124 = comb.icmp eq %110, %123 : i9
    %125 = comb.and %122, %124 : i1
    %126 = comb.xor %124, %true : i1
    %127 = comb.and %122, %126 : i1
    %c0_i6 = hw.constant 0 : i6
    %128 = comb.concat %c0_i6, %c-4_i3 : i6, i3
    %129 = comb.icmp eq %110, %128 : i9
    %130 = comb.and %127, %129 : i1
    %131 = comb.xor %129, %true : i1
    %132 = comb.and %127, %131 : i1
    %c0_i6_47 = hw.constant 0 : i6
    %133 = comb.concat %c0_i6_47, %c-3_i3 : i6, i3
    %134 = comb.icmp eq %110, %133 : i9
    %135 = comb.and %132, %134 : i1
    %136 = comb.xor %134, %true : i1
    %137 = comb.and %132, %136 : i1
    %c0_i6_48 = hw.constant 0 : i6
    %138 = comb.concat %c0_i6_48, %c-2_i3 : i6, i3
    %139 = comb.icmp eq %110, %138 : i9
    %140 = comb.and %137, %139 : i1
    %141 = comb.xor %139, %true : i1
    %142 = comb.and %137, %141 : i1
    %c0_i6_49 = hw.constant 0 : i6
    %143 = comb.concat %c0_i6_49, %c-1_i3 : i6, i3
    %144 = comb.icmp eq %110, %143 : i9
    %145 = comb.and %142, %144 : i1
    %146 = comb.xor %144, %true : i1
    %147 = comb.and %142, %146 : i1
    %c0_i5_50 = hw.constant 0 : i5
    %148 = comb.concat %c0_i5_50, %c-8_i4 : i5, i4
    %149 = comb.icmp eq %110, %148 : i9
    %150 = comb.and %147, %149 : i1
    %151 = comb.xor %149, %true : i1
    %152 = comb.and %147, %151 : i1
    %c0_i5_51 = hw.constant 0 : i5
    %153 = comb.concat %c0_i5_51, %c-7_i4 : i5, i4
    %154 = comb.icmp eq %110, %153 : i9
    %155 = comb.and %152, %154 : i1
    %156 = comb.xor %154, %true : i1
    %157 = comb.and %152, %156 : i1
    %c0_i5_52 = hw.constant 0 : i5
    %158 = comb.concat %c0_i5_52, %c-6_i4 : i5, i4
    %159 = comb.icmp eq %110, %158 : i9
    %160 = comb.and %157, %159 : i1
    %161 = comb.xor %159, %true : i1
    %162 = comb.and %157, %161 : i1
    %c0_i5_53 = hw.constant 0 : i5
    %163 = comb.concat %c0_i5_53, %c-5_i4 : i5, i4
    %164 = comb.icmp eq %110, %163 : i9
    %165 = comb.and %162, %164 : i1
    %166 = comb.xor %164, %true : i1
    %167 = comb.and %162, %166 : i1
    %c0_i5_54 = hw.constant 0 : i5
    %168 = comb.concat %c0_i5_54, %c-4_i4 : i5, i4
    %169 = comb.icmp eq %110, %168 : i9
    %170 = comb.and %167, %169 : i1
    %171 = comb.xor %169, %true : i1
    %172 = comb.and %167, %171 : i1
    %c0_i5_55 = hw.constant 0 : i5
    %173 = comb.concat %c0_i5_55, %c-3_i4 : i5, i4
    %174 = comb.icmp eq %110, %173 : i9
    %175 = comb.and %172, %174 : i1
    %176 = comb.xor %174, %true : i1
    %177 = comb.and %172, %176 : i1
    %c0_i5_56 = hw.constant 0 : i5
    %178 = comb.concat %c0_i5_56, %c-2_i4 : i5, i4
    %179 = comb.icmp eq %110, %178 : i9
    %180 = comb.and %177, %179 : i1
    %181 = comb.xor %179, %true : i1
    %182 = comb.and %177, %181 : i1
    %183 = comb.icmp eq %110, %95 : i9
    %184 = comb.and %182, %183 : i1
    %185 = comb.xor %183, %true : i1
    %186 = comb.and %182, %185 : i1
    %187 = comb.icmp eq %110, %64 : i9
    %188 = comb.and %186, %187 : i1
    %189 = comb.xor %187, %true : i1
    %190 = comb.and %186, %189 : i1
    %c0_i4_57 = hw.constant 0 : i4
    %191 = comb.concat %c0_i4_57, %c-15_i5 : i4, i5
    %192 = comb.icmp eq %110, %191 : i9
    %193 = comb.and %190, %192 : i1
    %194 = comb.xor %192, %true : i1
    %195 = comb.and %190, %194 : i1
    %c0_i4_58 = hw.constant 0 : i4
    %196 = comb.concat %c0_i4_58, %c-14_i5 : i4, i5
    %197 = comb.icmp eq %110, %196 : i9
    %198 = comb.and %195, %197 : i1
    %199 = comb.xor %197, %true : i1
    %200 = comb.and %195, %199 : i1
    %c0_i4_59 = hw.constant 0 : i4
    %201 = comb.concat %c0_i4_59, %c-13_i5 : i4, i5
    %202 = comb.icmp eq %110, %201 : i9
    %203 = comb.and %200, %202 : i1
    %204 = comb.xor %202, %true : i1
    %c0_i4_60 = hw.constant 0 : i4
    %205 = comb.concat %c0_i4_60, %c-12_i5 : i4, i5
    %206 = comb.icmp eq %110, %205 : i9
    %207 = comb.and %200, %204, %206 : i1
    %208 = comb.icmp eq %fc_in, %false : i1
    %209 = comb.and %207, %208 : i1
    %210 = comb.or %203, %209 : i1
    %211 = comb.mux %198, %fc_in, %210 : i1
    %212 = comb.extract %a from 0 : (i8) -> i1
    %213 = comb.mux %193, %212, %211 : i1
    %214 = comb.extract %a from 7 : (i8) -> i1
    %215 = comb.mux %188, %214, %213 : i1
    %216 = comb.mux %184, %212, %215 : i1
    %217 = comb.mux %180, %214, %216 : i1
    %218 = comb.mux %175, %212, %217 : i1
    %219 = comb.mux %170, %214, %218 : i1
    %220 = comb.mux %165, %212, %219 : i1
    %221 = comb.mux %160, %214, %220 : i1
    %222 = comb.or %150, %155 : i1
    %223 = comb.mux %222, %fc_in, %221 : i1
    %224 = comb.xor %145, %true : i1
    %225 = comb.xor %140, %true : i1
    %226 = comb.xor %135, %true : i1
    %227 = comb.and %226, %225, %224, %223 : i1
    %228 = comb.mux %130, %52, %227 : i1
    %229 = comb.mux %125, %59, %228 : i1
    %230 = comb.mux %120, %52, %229 : i1
    %231 = comb.mux %115, %27, %230 : i1
    %232 = comb.mux %111, %26, %231 : i1
    %233 = comb.xor %193, %true : i1
    %234 = comb.xor %188, %true : i1
    %235 = comb.xor %184, %true : i1
    %236 = comb.xor %180, %true : i1
    %237 = comb.xor %175, %true : i1
    %238 = comb.xor %170, %true : i1
    %239 = comb.xor %165, %true : i1
    %240 = comb.xor %160, %true : i1
    %241 = comb.and %240, %239, %238, %237, %236, %235, %234, %233, %198 : i1
    %242 = comb.or %155, %241 : i1
    %243 = comb.xor %150, %true : i1
    %244 = comb.xor %145, %true : i1
    %245 = comb.xor %140, %true : i1
    %246 = comb.xor %135, %true : i1
    %247 = comb.and %246, %245, %244, %243, %242 : i1
    %248 = comb.or %120, %125, %130, %247 : i1
    %249 = comb.xor %115, %true : i1
    %250 = comb.xor %111, %true : i1
    %251 = comb.and %250, %249, %248 : i1
    %252 = comb.or %203, %207 : i1
    %253 = comb.mux %252, %a, %c0_i8 : i8
    %false_61 = hw.constant false
    %254 = comb.concat %false_61, %c-1_i8 : i1, i8
    %false_62 = hw.constant false
    %255 = comb.concat %false_62, %a : i1, i8
    %256 = comb.sub %254, %255 : i9
    %257 = comb.extract %256 from 0 : (i9) -> i8
    %258 = comb.mux %198, %257, %253 : i8
    %259 = comb.mux %193, %109, %258 : i8
    %260 = comb.mux %188, %107, %259 : i8
    %261 = comb.mux %184, %106, %260 : i8
    %262 = comb.mux %180, %103, %261 : i8
    %263 = comb.mux %175, %109, %262 : i8
    %264 = comb.mux %170, %107, %263 : i8
    %265 = comb.mux %165, %106, %264 : i8
    %266 = comb.mux %160, %103, %265 : i8
    %267 = comb.mux %155, %91, %266 : i8
    %268 = comb.mux %150, %84, %267 : i8
    %269 = comb.xor %a, %b : i8
    %270 = comb.mux %145, %269, %268 : i8
    %271 = comb.or %a, %b : i8
    %272 = comb.mux %140, %271, %270 : i8
    %273 = comb.and %a, %b : i8
    %274 = comb.mux %135, %273, %272 : i8
    %275 = comb.mux %130, %38, %274 : i8
    %276 = comb.mux %125, %51, %275 : i8
    %277 = comb.mux %120, %38, %276 : i8
    %278 = comb.mux %115, %25, %277 : i8
    %279 = comb.mux %111, %23, %278 : i8
    %280 = comb.or %198, %203, %207 : i1
    %281 = comb.and %280, %fz_in : i1
    %false_63 = hw.constant false
    %282 = comb.concat %false_63, %109 : i1, i8
    %283 = comb.icmp eq %282, %97 : i9
    %284 = comb.mux %193, %283, %281 : i1
    %false_64 = hw.constant false
    %285 = comb.concat %false_64, %107 : i1, i8
    %286 = comb.icmp eq %285, %97 : i9
    %287 = comb.mux %188, %286, %284 : i1
    %false_65 = hw.constant false
    %288 = comb.concat %false_65, %106 : i1, i8
    %289 = comb.icmp eq %288, %97 : i9
    %290 = comb.mux %184, %289, %287 : i1
    %false_66 = hw.constant false
    %291 = comb.concat %false_66, %103 : i1, i8
    %292 = comb.icmp eq %291, %97 : i9
    %293 = comb.mux %180, %292, %290 : i1
    %294 = comb.xor %175, %true : i1
    %295 = comb.xor %170, %true : i1
    %296 = comb.xor %165, %true : i1
    %297 = comb.xor %160, %true : i1
    %298 = comb.and %297, %296, %295, %294, %293 : i1
    %false_67 = hw.constant false
    %299 = comb.concat %false_67, %91 : i1, i8
    %300 = comb.icmp eq %299, %97 : i9
    %301 = comb.mux %155, %300, %298 : i1
    %false_68 = hw.constant false
    %302 = comb.concat %false_68, %84 : i1, i8
    %303 = comb.icmp eq %302, %97 : i9
    %304 = comb.mux %150, %303, %301 : i1
    %false_69 = hw.constant false
    %305 = comb.concat %false_69, %269 : i1, i8
    %306 = comb.icmp eq %305, %97 : i9
    %307 = comb.mux %145, %306, %304 : i1
    %false_70 = hw.constant false
    %308 = comb.concat %false_70, %271 : i1, i8
    %309 = comb.icmp eq %308, %97 : i9
    %310 = comb.mux %140, %309, %307 : i1
    %false_71 = hw.constant false
    %311 = comb.concat %false_71, %273 : i1, i8
    %312 = comb.icmp eq %311, %97 : i9
    %313 = comb.mux %135, %312, %310 : i1
    %false_72 = hw.constant false
    %314 = comb.concat %false_72, %38 : i1, i8
    %315 = comb.icmp eq %314, %97 : i9
    %316 = comb.mux %130, %315, %313 : i1
    %false_73 = hw.constant false
    %317 = comb.concat %false_73, %51 : i1, i8
    %318 = comb.icmp eq %317, %97 : i9
    %319 = comb.mux %125, %318, %316 : i1
    %320 = comb.mux %120, %315, %319 : i1
    %false_74 = hw.constant false
    %321 = comb.concat %false_74, %25 : i1, i8
    %322 = comb.icmp eq %321, %97 : i9
    %323 = comb.mux %115, %322, %320 : i1
    %false_75 = hw.constant false
    %324 = comb.concat %false_75, %23 : i1, i8
    %325 = comb.icmp eq %324, %97 : i9
    %326 = comb.mux %111, %325, %323 : i1
    %327 = comb.mux %155, %98, %241 : i1
    %328 = comb.mux %150, %96, %327 : i1
    %329 = comb.xor %145, %true : i1
    %330 = comb.xor %140, %true : i1
    %331 = comb.and %330, %329, %328 : i1
    %332 = comb.or %135, %331 : i1
    %333 = comb.mux %130, %73, %332 : i1
    %334 = comb.mux %125, %77, %333 : i1
    %335 = comb.mux %120, %73, %334 : i1
    %336 = comb.mux %115, %69, %335 : i1
    %337 = comb.mux %111, %65, %336 : i1
    hw.output %279, %326, %251, %337, %232 : i8, i1, i1, i1, i1
  }
  hw.module @TestScfCcf_Harness(in %clk : !seq.clock, in %rst : i1, in %a : i8, in %b : i8, in %c_in : i1, in %fc_in : i1, in %fh_in : i1, in %fn_in : i1, in %fz_in : i1, in %op_ccf : i8, in %op_scf : i8, out a : i8, out b : i8, out c1 : i1, out c2 : i1, out c_in : i1, out fc_in : i1, out fh_in : i1, out fn_in : i1, out fz_in : i1, out h1 : i1, out h2 : i1, out n1 : i1, out n2 : i1, out op_ccf : i8, out op_scf : i8, out r1 : i8, out r2 : i8, out z1 : i1, out z2 : i1) {
    %ALU8_inst_401_1.result, %ALU8_inst_401_1.z, %ALU8_inst_401_1.n, %ALU8_inst_401_1.h, %ALU8_inst_401_1.c = hw.instance "ALU8_inst_401_1" sym @ALU8_inst_401_1 @gameboy_alu8_ALU8(clk: %clk: !seq.clock, rst: %rst: i1, a: %a: i8, b: %b: i8, op: %op_scf: i8, c_in: %c_in: i1, fz_in: %fz_in: i1, fn_in: %fn_in: i1, fh_in: %fh_in: i1, fc_in: %fc_in: i1) -> (result: i8, z: i1, n: i1, h: i1, c: i1)
    %ALU8_inst_401_1.result_0, %ALU8_inst_401_1.z_1, %ALU8_inst_401_1.n_2, %ALU8_inst_401_1.h_3, %ALU8_inst_401_1.c_4 = hw.instance "ALU8_inst_401_1" sym @ALU8_inst_401_1 @gameboy_alu8_ALU8(clk: %clk: !seq.clock, rst: %rst: i1, a: %a: i8, b: %b: i8, op: %op_ccf: i8, c_in: %c_in: i1, fz_in: %fz_in: i1, fn_in: %fn_in: i1, fh_in: %fh_in: i1, fc_in: %ALU8_inst_401_1.c: i1) -> (result: i8, z: i1, n: i1, h: i1, c: i1)
    hw.output %a, %b, %ALU8_inst_401_1.c, %ALU8_inst_401_1.c_4, %c_in, %fc_in, %fh_in, %fn_in, %fz_in, %ALU8_inst_401_1.h, %ALU8_inst_401_1.h_3, %ALU8_inst_401_1.n, %ALU8_inst_401_1.n_2, %op_ccf, %op_scf, %ALU8_inst_401_1.result, %ALU8_inst_401_1.result_0, %ALU8_inst_401_1.z, %ALU8_inst_401_1.z_1 : i8, i8, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i8, i8, i8, i8, i1, i1
  }
  func.func @entry() {
    %c-43_i7 = hw.constant -43 : i7
    %c20_i8 = hw.constant 20 : i8
    %c19_i8 = hw.constant 19 : i8
    %c0_i8 = hw.constant 0 : i8
    %c85_i8 = hw.constant 85 : i8
    %true = hw.constant true
    %false = hw.constant false
    %0 = seq.const_clock high
    %1 = seq.const_clock low
    arc.sim.instantiate @TestScfCcf_Harness as %arg0 {
      arc.sim.set_input %arg0, "rst" = %true : i1, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.set_input %arg0, "a" = %c85_i8 : i8, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.set_input %arg0, "b" = %c0_i8 : i8, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.set_input %arg0, "op_scf" = %c19_i8 : i8, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.set_input %arg0, "op_ccf" = %c20_i8 : i8, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.set_input %arg0, "c_in" = %false : i1, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.set_input %arg0, "fz_in" = %true : i1, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.set_input %arg0, "fn_in" = %false : i1, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.set_input %arg0, "fh_in" = %false : i1, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.set_input %arg0, "fc_in" = %false : i1, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.set_input %arg0, "rst" = %false : i1, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestScfCcf_Harness>
      %2 = arc.sim.get_port %arg0, "n1" : i1, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.emit "n1", %2 : i1
      %3 = arc.sim.get_port %arg0, "c_in" : i1, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.emit "c_in", %3 : i1
      %4 = arc.sim.get_port %arg0, "h1" : i1, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.emit "h1", %4 : i1
      %5 = arc.sim.get_port %arg0, "fz_in" : i1, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.emit "fz_in", %5 : i1
      %6 = arc.sim.get_port %arg0, "h2" : i1, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.emit "h2", %6 : i1
      %7 = arc.sim.get_port %arg0, "fn_in" : i1, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.emit "fn_in", %7 : i1
      %8 = arc.sim.get_port %arg0, "z2" : i1, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.emit "z2", %8 : i1
      %9 = arc.sim.get_port %arg0, "b" : i8, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.emit "b", %9 : i8
      %10 = arc.sim.get_port %arg0, "a" : i8, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.emit "a", %10 : i8
      %11 = arc.sim.get_port %arg0, "c2" : i1, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.emit "c2", %11 : i1
      %12 = arc.sim.get_port %arg0, "fc_in" : i1, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.emit "fc_in", %12 : i1
      %13 = arc.sim.get_port %arg0, "op_ccf" : i8, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.emit "op_ccf", %13 : i8
      %14 = arc.sim.get_port %arg0, "fh_in" : i1, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.emit "fh_in", %14 : i1
      %15 = arc.sim.get_port %arg0, "r2" : i8, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.emit "r2", %15 : i8
      %16 = arc.sim.get_port %arg0, "op_scf" : i8, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.emit "op_scf", %16 : i8
      %17 = arc.sim.get_port %arg0, "c1" : i1, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.emit "c1", %17 : i1
      %18 = arc.sim.get_port %arg0, "n2" : i1, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.emit "n2", %18 : i1
      %19 = arc.sim.get_port %arg0, "r1" : i8, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.emit "r1", %19 : i8
      %20 = arc.sim.get_port %arg0, "z1" : i1, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.emit "z1", %20 : i1
      %21 = arc.sim.get_port %arg0, "r1" : i8, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22r1\22}", %21 : i8
      %false_0 = hw.constant false
      %22 = comb.concat %false_0, %21 : i1, i8
      %c0_i2 = hw.constant 0 : i2
      %23 = comb.concat %c0_i2, %c-43_i7 : i2, i7
      %24 = comb.icmp eq %22, %23 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22SCF keeps A\22, \22line\22: 423, \22column\22: 12, \22condition\22: \22r1 == 0x55\22, \22scope\22: \22TestScfCcf\22}", %24 : i1
      %25 = arc.sim.get_port %arg0, "c1" : i1, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22c1\22}", %25 : i1
      %false_1 = hw.constant false
      %26 = comb.concat %false_1, %25 : i1, i1
      %false_2 = hw.constant false
      %27 = comb.concat %false_2, %true : i1, i1
      %28 = comb.icmp eq %26, %27 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22SCF sets C\22, \22line\22: 424, \22column\22: 12, \22condition\22: \22c1 == true\22, \22scope\22: \22TestScfCcf\22}", %28 : i1
      %29 = arc.sim.get_port %arg0, "z1" : i1, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22z1\22}", %29 : i1
      %false_3 = hw.constant false
      %30 = comb.concat %false_3, %29 : i1, i1
      %31 = comb.icmp eq %30, %27 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22Z preserved\22, \22line\22: 425, \22column\22: 12, \22condition\22: \22z1 == true\22, \22scope\22: \22TestScfCcf\22}", %31 : i1
      arc.sim.set_input %arg0, "clk" = %1 : !seq.clock, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.set_input %arg0, "clk" = %0 : !seq.clock, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.step %arg0 : !arc.sim.instance<@TestScfCcf_Harness>
      %32 = arc.sim.get_port %arg0, "n1" : i1, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.emit "n1", %32 : i1
      %33 = arc.sim.get_port %arg0, "c_in" : i1, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.emit "c_in", %33 : i1
      %34 = arc.sim.get_port %arg0, "h1" : i1, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.emit "h1", %34 : i1
      %35 = arc.sim.get_port %arg0, "fz_in" : i1, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.emit "fz_in", %35 : i1
      %36 = arc.sim.get_port %arg0, "h2" : i1, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.emit "h2", %36 : i1
      %37 = arc.sim.get_port %arg0, "fn_in" : i1, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.emit "fn_in", %37 : i1
      %38 = arc.sim.get_port %arg0, "z2" : i1, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.emit "z2", %38 : i1
      %39 = arc.sim.get_port %arg0, "b" : i8, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.emit "b", %39 : i8
      %40 = arc.sim.get_port %arg0, "a" : i8, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.emit "a", %40 : i8
      %41 = arc.sim.get_port %arg0, "c2" : i1, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.emit "c2", %41 : i1
      %42 = arc.sim.get_port %arg0, "fc_in" : i1, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.emit "fc_in", %42 : i1
      %43 = arc.sim.get_port %arg0, "op_ccf" : i8, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.emit "op_ccf", %43 : i8
      %44 = arc.sim.get_port %arg0, "fh_in" : i1, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.emit "fh_in", %44 : i1
      %45 = arc.sim.get_port %arg0, "r2" : i8, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.emit "r2", %45 : i8
      %46 = arc.sim.get_port %arg0, "op_scf" : i8, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.emit "op_scf", %46 : i8
      %47 = arc.sim.get_port %arg0, "c1" : i1, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.emit "c1", %47 : i1
      %48 = arc.sim.get_port %arg0, "n2" : i1, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.emit "n2", %48 : i1
      %49 = arc.sim.get_port %arg0, "r1" : i8, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.emit "r1", %49 : i8
      %50 = arc.sim.get_port %arg0, "z1" : i1, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.emit "z1", %50 : i1
      %51 = arc.sim.get_port %arg0, "c2" : i1, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22c2\22}", %51 : i1
      %false_4 = hw.constant false
      %52 = comb.concat %false_4, %51 : i1, i1
      %false_5 = hw.constant false
      %53 = comb.concat %false_5, %false : i1, i1
      %54 = comb.icmp eq %52, %53 : i2
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22CCF toggles C\22, \22line\22: 429, \22column\22: 12, \22condition\22: \22c2 == false\22, \22scope\22: \22TestScfCcf\22}", %54 : i1
      %55 = arc.sim.get_port %arg0, "r2" : i8, !arc.sim.instance<@TestScfCcf_Harness>
      arc.sim.emit "{\22type\22: \22value\22, \22name\22: \22r2\22}", %55 : i8
      %false_6 = hw.constant false
      %56 = comb.concat %false_6, %55 : i1, i8
      %57 = comb.icmp eq %56, %23 : i9
      arc.sim.emit "{\22type\22: \22assert\22, \22message\22: \22CCF keeps A\22, \22line\22: 430, \22column\22: 12, \22condition\22: \22r2 == 0x55\22, \22scope\22: \22TestScfCcf\22}", %57 : i1
    }
    return
  }
}