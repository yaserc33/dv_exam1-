`timescale 1ns / 1ns

module test (
    input  logic        clk,
    output  logic        rst_n,
    output  logic        load,
    output  logic        start,
    output  logic [3:0]  A,
    output  logic [3:0]  B,
    input logic  [3:0]  sum,
    input logic   done
);


int err=0;


task disp;
@(negedge clk); $display(" rst_n:%0d start:%0d  load:%0d  a:%0d  b:%0d sum:%0d done:%0d at %0t ns ", rst_n,start,load,A,B,sum,done, $time);
endtask




task rst;
@(posedge clk);
rst_n <= 0 ;
@(negedge clk);
 start<=0; load<=0;  rst_n = 1 ; A =0; B=0 ; 
$display("\n\nrst---- done ✅");
disp();
endtask



task check (input A , input B , input sum );

if (A+B != sum) begin
err++;
$display("error A:%d   B:%d   sum:%d   should be:%d at %t" ,A,B,sum,A+B, $time);
end
endtask


function void result ();

if (err)
$display("----❌test failed❌----");
else 
$display("----✅test passed✅----");


endfunction






initial begin
rst();






$display("\n\n------test1----");
@(negedge clk)
A<= 4; B<=5; load<=1;
@(negedge clk)
 start<=1;
wait(done);
check(A,B,sum);

rst();



$display("\n\n------test2----");

@(negedge clk)
A<= 0; B<=0; load<=1;
@(negedge clk)
 start<=1;
wait(done);
check(A,B,sum);

rst();







$display("\n\n------test3----");

@(negedge clk)
A<= 6; B<=2; load<=1;
@(negedge clk)
disp();

rst();




$display("\n\n------test4----");


@(negedge clk)
A<= 'b1100; B<='b1011; load<=1;
@(negedge clk)
 start<=1;
wait(done);
check(A,B,sum);

rst();


$display("\n\n------test5----");

@(negedge clk)
A<= 'b1100; B<='b1011; load<=1;
@(negedge clk)
 start<=1;
 rst_n<=0;
disp();

rst();


$display("\n\n------test6----");


result();
$finish ; 





end



endmodule