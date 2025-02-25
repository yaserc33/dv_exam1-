// class trans ; 
// logic rst_n;
// rand  bit a;
// rand  logic b;
// logic z;
// rand logic eb;
// endclass
`timescale 1ns / 1ns

module test(
   input logic clk,
  output  logic rst_n,
  output  logic en,
  output  logic a,
  output  logic b,
  input   logic z
);






initial begin


//test1


$display("------rest----");
rst_n <= 1 ;
#10  en=0; a=0; b=0; rst_n = 0 ;
$display(" A:%d B:%d Z:%d EN:%d at %t s " , a,b,z,en , $time);





$display("------test1----");
@(negedge clk);en<=1; a<=1; b<=1;
@(negedge clk); $display(" A:%d B:%d Z:%d EN:%d at %t s " , a,b,z,en , $time);
@(negedge clk);en<=1; a<=1; b<=0;
@(negedge clk); $display(" A:%d B:%d Z:%d EN:%d at %t s " , a,b,z,en , $time);
@(negedge clk);en<=1; a<=0; b<=1;
@(negedge clk);$display(" A:%d B:%d Z:%d EN:%d at %t s " , a,b,z,en , $time);
@(negedge clk);en<=1; a<=0; b<=0;
@(negedge clk);$display(" A:%d B:%d Z:%d EN:%d at %t s " , a,b,z,en , $time);



$display("------test2----");
@(negedge clk);$display(" A:%d B:%d Z:%d EN:%d at %t s " , a,b,z,en , $time);
@(negedge clk); en<=0; a<=1; b<=1;
@(negedge clk);$display(" A:%d B:%d Z:%d EN:%d at %t s " , a,b,z,en , $time);
@(negedge clk);en<=0; a<=1; b<=0;
@(negedge clk);$display(" A:%d B:%d Z:%d EN:%d at %t s " , a,b,z,en , $time);
@(negedge clk); en<=0; a<=0; b<=1;
@(negedge clk);$display(" A:%d B:%d Z:%d EN:%d at %t s " , a,b,z,en , $time);
@(negedge clk); en<=0; a<=0; b<=0;
@(negedge clk); $display(" A:%d B:%d Z:%d EN:%d at %t s " , a,b,z,en , $time);



//test3




$display("------test3----");
 en=1; a=1; b=1; rst_n = 1; 
$display(" A:%d B:%d Z:%d EN:%d at %t s " , a,b,z,en , $time);
#10;rst_n = 0; 


@(posedge clk) en=1; a=1; b=1; rst_n = 1; 
$display(" A:%d B:%d Z:%d EN:%d at %t s " , a,b,z,en , $time);
#10;rst_n = 0; 





$display("------test4----");
@(negedge clk) en<=1; a<=1; b<=1;
$display(" A:%d B:%d Z:%d EN:%d at %t s " , a,b,z,en , $time);


$finish ; 




end
endmodule