`include "tb.sv"
`include "updown-counter.sv"

`timescale 1ns / 1ns


module top;


    logic clk;
    logic rst_n; 
    logic en;
    logic m;
    logic load;
    logic [7:0] data_in; 
    logic [7:0] count;


   
    updown_counter DUT (
    .clk        (clk),
    .rst_n      (rst_n),
    .en         (en),
    .m          (m),
    .load       (load),
    .data_in    (data_in),
    .count      (count)
);




test tb (
    .clk      (clk),
    .rst_n    (rst_n),
    .en       (en),
    .m        (m),
    .load     (load),
    .din      (data_in),
    .count    (count)
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