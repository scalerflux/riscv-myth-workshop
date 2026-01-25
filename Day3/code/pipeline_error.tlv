\m5_TLV_version 1d: tl-x.org
\m5
   // Mohammed Omer(RISCV-MYTH workshop)
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
   
   |comp
      
      @1
         $err1 = $bad_input ||  $illegall_op;
      @2
         >>1$err1;
      @3
         $err2 = $err1 || $over_flow;
      @4
         >>1$err2;
      @5
         >>1$err2;
      @6
         $err3 = $err2 || $divide_by_zero;
   
   // Assert these to end simulation (before the cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
