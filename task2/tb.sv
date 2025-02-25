`timescale 1ns / 1ns


module test(
   input logic clk,
  output  logic rst_n,
  output  logic en,
  output  logic m,
  output  logic load,
  output  logic [7:0] din , 
    input logic [7:0] count

);



task disp;
@(negedge clk); $display(" rst_n:%0d en:%0d  load:%0d  din:%0d  m:%0d count:%0d at %0t ns " ,rst_n, en,load,din,m,count, $time);
endtask




task rst;
$display("\n\nrst---- done ✅");
@(posedge clk);
rst_n <= 0 ;
@(negedge clk);
 en<=0; load<=0;  rst_n = 1 ; din =0; m=0 ; 
disp();

endtask





initial begin

rst();





$display("\n\n------test1----");
@(negedge clk);
din<=100; load<=1; 
disp();

rst();


$display("\n\n------test2----");

@(negedge clk);
en<=1; load<=0;

disp();

rst();







$display("\n\n------test3----");
@(negedge clk);
din<=200; load<=1; 
@(negedge clk);
load<=0; m<=0; en<=1;


disp();
rst();






$display("\n\n------test4----");
@(negedge clk);
din<=5; load<=1; 
@(negedge clk);
load<=0; m<=1; en<=1;


disp();
rst();



$display("\n\n------test5----");
@(negedge clk);
din<='hff; load<=1; 
@(negedge clk);
load<=0; m<=0; en<=1;


disp();
rst();


$display("\n\n------test6----");
@(negedge clk);
din<=0; load<=1; 
@(negedge clk);
load<=0; m<=1; en<=1;


disp();
rst();


$display("\n\n------test7----");


$display("posedge rst---- ");
@(negedge clk);
din<=5; load<=1; 
disp();

@(posedge clk); rst_n <= 0 ;
disp();

rst();


$display("\n\nnegedge rst---- ");
@(negedge clk);
din<=5; load<=1; 
disp();

@(negedge clk); rst_n <= 0 ;
disp();









$finish ; 





end
endmodule