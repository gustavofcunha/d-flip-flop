//implementacao comportamental do flip flop tipo d disparado por borda ascendente
module d_flip_flop(q, d, clk);
  input d, clk;
  output reg q;
  
  //sempre que ocorrer a borda positiva, o sinal de d eh amostrado na saida
  always @(posedge clk)
    q <= d;
  
endmodule

module simple_register (q0, q1, q2, q3, d0, d1, d2, d3, clk);
  input d0, d1, d2, d3, clk;
  output q0, q1, q2, q3;
  
  //quatro flip flops controlados por um unico clock
  //cada flip flop recebe uma entrada e possui uma saida
  //entradas e saidas em paralelo
  d_flip_flop f1 (q0, d0, clk);
  d_flip_flop f2 (q1, d1, clk);
  d_flip_flop f3 (q2, d2, clk);
  d_flip_flop f4 (q3, d3, clk);
  
endmodule 