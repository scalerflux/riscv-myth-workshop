\m5_TLV_version 1d: tl-x.org
\m5
// Done by Mohammed Omer(RISCV-MYTH workshop)
   // ============================================
   // Welcome, new visitors! Try the "Learn" menu.
   // ============================================
   
   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
   m4_include_lib(['https://raw.githubusercontent.com/stevehoover/LF-Building-a-RISC-V-CPU-Core/main/lib/calc_viz.tlv'])
\TLV
   $reset = *reset;
  |calc 
      @1             
         $val1[31:0] = >>2$out;   
         $cnt = reset ? 0 : (>>1$cnt + 1);  
         $valid = ! $cnt;
   
         $sum[31:0] = $val1[31:0] + $val2[31:0];
         $diff[31:0] = $val1 - $val2;
         $prod[31:0] = $val1 * $val2;
         $quot[31:0] = $val1 / $val2;
      @2
         $out[31:0] = ($reset || $valid) ? 32'b0:
                      $op == 2'b00 ? $sum :
                      $op == 2'b01 ? $diff :
                      $op == 2'b10 ? $prod :
                                      $quot;
