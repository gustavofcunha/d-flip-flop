//implementacao comportamental do flip flop tipo d disparado por borda ascendente
module d_flip_flop(q, d, clk);
  input d, clk;
  output reg q;
  
  //sempre que ocorrer a borda positiva, o sinal de d eh amostrado na saida
  always @(posedge clk)
    q <= d;
  
endmodule

