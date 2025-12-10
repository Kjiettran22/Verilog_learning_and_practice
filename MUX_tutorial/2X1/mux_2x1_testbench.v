`timescale 1ps/1ps

module testbench ;
    reg a_tb,b_tb,sel_tb;
    wire out;

    //module instant

    Mux_2x1 mux(
        .a(a_tb),
        .b(b_tb),
        .sel(sel_tb),
        .y(out)
    );

    initial begin
        $dumpfile("mux_2x1_test.vcd");
        $dumpvars(0, testbench);
        $monitor("Time = %d, a = %b, b = %b, select = %b, output =  %b",$time, a_tb, b_tb, sel_tb, out);
        //test case

        sel_tb = 0; a_tb = 0; b_tb = 0;
        #1;
        sel_tb = 0; a_tb = 0; b_tb = 1;
        #1;
        sel_tb = 0; a_tb = 1; b_tb = 0;
        #1
        sel_tb = 0; a_tb = 1; b_tb = 1;
        #1
        sel_tb = 1; a_tb = 0; b_tb = 0;
        #1
        sel_tb = 1; a_tb = 0; b_tb = 1;
        #1
        sel_tb = 1; a_tb = 1; b_tb = 0;
        #1
        sel_tb = 1; a_tb = 1; b_tb = 1;
        #1

        $finish;

    end
endmodule 