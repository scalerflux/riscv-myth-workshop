\m5_TLV_version 1d: tl-x.org
\m5
   
\SV
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
 m4_include_lib(['https://raw.githubusercontent.com/stevehoover/LF-Building-a-RISC-V-CPU-Core/main/lib/calc_viz.tlv'])
\TLV
   |calc 
      @0
         $reset = *reset;
         
      ?$valid_or_reset = $reset || $valid;
         @1             
            $val1[31:0] = >>2$out;   
            $valid[0] = $reset ? 0 : (>>1$valid + 1);
           
            $sum[31:0] = $val1[31:0] + $val2[31:0];
            $diff[31:0] = $val1 - $val2;
            $prod[31:0] = $val1 * $val2;
            $quot[31:0] = $val1 / $val2;
         @2
            $out[31:0] = $reset ? 32'b0:
                         $op[1:0] == 2'b00 ? $sum :
                         $op == 2'b01 ? $diff :
                         $op == 2'b10 ? $prod :
                                         $quot;
   // Assert these to end simulation (before the cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
   m4+calc_viz(@2) 
\SV
   endmodule
