`timescale 1ps/1ps
module tb;
    reg j,k,clk,reset;
    wire out;

    //module instantiation

    jk_ff uut(
        .j(j),
        .k(k),
        .clk(clk),
        .reset(reset),
        .out(out)
    );


    initial begin

        $dumpfile("JK_FF.vcd");
        $dumpvars(0,tb);

        clk =1;
        reset = 0; 
        #10;
        $display("===========TEST_CASE=============");

        j=1'b0 ; k = 1'b0; #10;
        $display("j = %b, k = %b, out = %b", j,k,out);

        j=1'b0 ; k = 1'b1; #10;
        $display("j = %b, k = %b, out = %b", j,k,out);

        j=1'b1 ; k = 1'b0; #10;
        $display("j = %b, k = %b, out = %b", j,k,out);

        j=1'b1 ; k = 1'b1; #10;
        $display("j = %b, k = %b, out = %b", j,k,out);

        #40 reset = ~reset;
        
    end
    //set clock

    always #5 clk = ~clk;

endmodule