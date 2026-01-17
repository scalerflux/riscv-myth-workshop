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
