module testebench_stream_cipher_decipher;
  //chave aleatoria
  reg ch_0 = 0;
  reg ch_1 = 1;
  reg ch_2 = 1;
  reg ch_3 = 1;
  
  //mensagem escolhida
  reg msg_0 = 0;
  reg msg_1 = 0;
  reg msg_2 = 0;
  reg msg_3 = 1;
  
  //mensagem (a ser) cifrada
  wire msg_c0, msg_c1, msg_c2, msg_c3;
  
  //clock iniciando em 0
  reg clk = 0;
  
  //instanciacao do modulo de cifragem
  stream_cipher cipher (.msg_c0(msg_c0), .msg_c1(msg_c1), .msg_c2(msg_c2), .msg_c3(msg_c3), 
  .ch_0(ch_0), .ch_1(ch_1), .ch_2(ch_2), .ch_3(ch_3), .msg_0(msg_0), .msg_1(msg_1), 
  .msg_2(msg_2), .msg_3(msg_3), .clk(clk));
  
  //variacao do clock
  always #1
    begin
      clk = ~clk;
   end
  
  //arquivo referente ao diagrama de tempo gerado
  initial begin
    $dumpfile("ss.vcd");
    $dumpvars(1);
    #7
    $finish;
  end
  
  
  //mensagem (a ser) decifrada
  wire _msg_0, _msg_1, _msg_2, _msg_3;
  
  //instanciacao do modulo de decifragem
  stream_decipher decipher (.msg_0(_msg_0), .msg_1(_msg_1), .msg_2(_msg_2), .msg_3(_msg_3), 
  .ch_0(ch_0), .ch_1(ch_1), .ch_2(ch_2), .ch_3(ch_3), .msg_c0(msg_c0), .msg_c1(msg_c1), 
  .msg_c2(msg_c2), .msg_c3(msg_c3), .clk(clk));
  
    //impressoes dos sinais no monitor para conferencia da decifragem
  initial begin
    $monitor("time=%d: mensagem cifrada: %b %b %b %b mensagem decifrada: %b %b %b %b clk = %b,\n",
    $time, msg_c0, msg_c1, msg_c2, msg_c3, _msg_0, _msg_1, _msg_2, _msg_3, clk); 
  end
  
endmodule