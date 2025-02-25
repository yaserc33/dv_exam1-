`include "tb.sv"
`include "and_ff.sv"


module top;


    logic clk;
    logic rst_n; 
    logic en;
    logic a;
    logic b; 
    logic z;


    
    test tb (.clk(clk) , .rst_n(rst_n) , .en(en) , .a(a) ,.b(b) , .z(z));
    and_ff DUT (.clk(clk) , .rst_n(rst_n) , .en(en) , .a(a) ,.b(b) , .z(z));

initial begin 
clk =0;
forever #5 clk = ~clk; 
end
    
endmodule