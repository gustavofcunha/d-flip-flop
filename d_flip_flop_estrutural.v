//implementacao estrutural  do flip flop tipo d disparado por borda ascendente

//latch basica com portas nor
module basic_latch (q, ql, s, r);
  //entradas e saidas
  input s,r;
  output q, ql;
  
  nor (ql, s, q);
  nor (q, ql, r);
  
endmodule
  
//flip flop composto de duas latches tipo d, com duas portas and e uma latch basica cada
module d_flip_flop(q, ql, d, clk); 
  //entradas e saidas
  input d, clk;
  output q, ql;
  
  //fios
  wire s, r, p, np, clkl, nd, s2, r2;
  
  not (clkl, clk);
  not (nd, d);
  
  //primeira latch do tipo d
  and (r, nd, clkl);
  and (s, d, clkl);
  basic_latch bl1 (p, np, s, r);
  
  //segunda latch do tipo d, cujas entradas sao saidas da primeira
  and(r2, np, clk);
  and(s2, p, clk);
  basic_latch bl2 (q, ql, s2, r2);
  
endmodule