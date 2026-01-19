\m5_TLV_version 1d: tl-x.org
\m5
   
   // ============================================
   // Welcome, new visitors! Try the "Learn" menu.
   // ============================================
   
   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   $reset = *reset;
  
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
                         $op[2:0] == 3'b000 ? $sum :
                         $op == 3'b001 ? $diff :
                         $op == 3'b010 ? $prod :
                         $op == 3'b011 ? $quot :
                         $op == 3'b100 ? >>2$mem[31:0]:
                                         >>2$out;
                                   
            $mem[31:0] = $reset ? 32'b0 : >>2$val1[310];
   // Assert these to end simulation (before the cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
