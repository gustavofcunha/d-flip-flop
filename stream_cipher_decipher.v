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




module stream_cipher(msg_c0, msg_c1, msg_c2, msg_c3, ch_0, ch_1, ch_2, ch_3, msg_0, msg_1, msg_2, msg_3, clk);
  
  input ch_0, ch_1, ch_2, ch_3, msg_0, msg_1, msg_2, msg_3, clk;
  output msg_c0, msg_c1, msg_c2, msg_c3;

  wire qc_0, qc_1, qc_2, qc_3;
  wire qm_0, qm_1, qm_2, qm_3;
  wire qmc_0, qmc_1, qmc_2, qmc_3;
  
  //armazenamento da chave em registrador
  simple_register c (qc_0, qc_1, qc_2, qc_3, ch_0, ch_1, ch_2, ch_3, clk);
  
   //armazenamento da mensagem em registrador
  simple_register m (qm_0, qm_1, qm_2, qm_3, msg_0, msg_1, msg_2, msg_3, clk);
  
  //cifragem dos bits da mensagem
  xor (qmc_0, qc_0, qm_0);
  xor (qmc_1, qc_1, qm_1); 
  xor (qmc_2, qc_2, qm_2); 
  xor (qmc_3, qc_3, qm_3); 

   //armazenamento da mensagem cifrada em registrador
  simple_register mc (msg_c0, msg_c1, msg_c2, msg_c3, qmc_0, qmc_1, qmc_2, qmc_3, clk);
  
endmodule





module stream_decipher(msg_0, msg_1, msg_2, msg_3, ch_0, ch_1, ch_2, ch_3, msg_c0, msg_c1, msg_c2, msg_c3, clk);
  
  input ch_0, ch_1, ch_2, ch_3, msg_c0, msg_c1, msg_c2, msg_c3, clk;
  output msg_0, msg_1, msg_2, msg_3;

  wire qc_0, qc_1, qc_2, qc_3;
  wire qm_0, qm_1, qm_2, qm_3;
  wire qmc_0, qmc_1, qmc_2, qmc_3;
  
  //armazenamento da chave em registrador
  simple_register c (qc_0, qc_1, qc_2, qc_3, ch_0, ch_1, ch_2, ch_3, clk);
  
   //armazenamento da mensagem cifrada em registrador
  simple_register mc (qmc_0, qmc_1, qmc_2, qmc_3, msg_c0, msg_c1, msg_c2, msg_c3, clk);
  
  //decifragem dos bits da mensagem
  xor (qm_0, qc_0, qmc_0);
  xor (qm_1, qc_1, qmc_1); 
  xor (qm_2, qc_2, qmc_2); 
  xor (qm_3, qc_3, qmc_3); 

   //armazenamento da mensagem decifrada em registrador
  simple_register m (msg_0, msg_1, msg_2, msg_3, qm_0, qm_1, qm_2, qm_3, clk);
  
endmodule