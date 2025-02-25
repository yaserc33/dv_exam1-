`include "tb.sv"
`include "bit_serial_adder.sv"

`timescale 1ns / 1ns

module top;


     logic clk;
     logic rst_n;
     logic load;
     logic start;
     logic [3:0]  A;
     logic [3:0]  B;
     logic [3:0]  sum;
     logic  done;


bit_serial_adder dut (
    .clk      (clk),
    .rst_n    (rst_n),
    .load     (load),
    .start    (start),
    .A        (A),
    .B        (B),
    .sum      (sum),
    .done     (done)
);


test tb (
    .clk      (clk),
    .rst_n    (rst_n),
    .load     (load),
    .start    (start),
    .A        (A),
    .B        (B),
    .sum      (sum),
    .done     (done)
);





initial begin 
clk =0;
forever #5 clk = ~clk; 
end



initial begin
  $dumpfile("dump.vcd");
  $dumpvars;
end



    
endmodule