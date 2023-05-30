module simple_register_testbench;
  reg d0 = 0;
  reg d1 = 0;
  reg d2 = 0;
  reg d3 = 0;
  reg clk = 0;
  wire _q0;
  wire _q1;
  wire _q2;
  wire _q3;
 
  //instanciacao do modulo
  simple_register sr (.q0(_q0), .q1(_q1), .q2(_q2), .q3(_q3), .d0(d0), .d1(d1), .d2(d2), .d3(d3), .clk(clk));
  
  //variacao do clock
  always #1 
    begin
      clk = ~clk;
    end
  
  //variacao das entradas, para teste
  always #2 
    begin
      d0 = ~d0;
    end
  
  always #3 
    begin
      d1 = ~d1;
    end
  
  always #4 
    begin
      d2 = ~d2;
    end

  always #5 
    begin
      d3 = ~d3;
    end
  
  //arquivo referente ao diagrama de tempo gerado
  initial begin
    $dumpfile("sr.vcd");
    $dumpvars(1);
    #10
    $finish;
  end
  
  //impressoes dos sinais no monitor para conferencia
  initial begin
    $monitor("time=%d: clk = %b q0 = %b q1 = %b q2 = %b q3 = %b,\n",$time,clk,_q0,_q1,_q2,_q3);
  end
  
endmodule