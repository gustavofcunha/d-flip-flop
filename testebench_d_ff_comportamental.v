module ff_testbench;
  reg d = 0;
  reg clk = 0;
  wire q;
 
  //instanciacao do modulo
  d_flip_flop dff (.q(q),.d(d),.clk(clk));
  
  //variacao do clock
  always #1 
    begin
      clk = ~clk;
    end
  
  //variacao da entrada d, para teste
  always #2 
    begin
      d = ~d;
    end

  //arquivo referente ao diagrama de tempo gerado
  initial begin
    $dumpfile("ff.vcd");
    $dumpvars(1);
    #10
    $finish;
  end
  
  //impressoes dos sinais no monitor para conferencia
  initial begin
    $monitor("time=%d: d= %b clk = %b q = %b,\n",$time,d,clk,q);
  end
  
endmodule

