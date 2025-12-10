module tb;
    reg [3:0] w;
    reg [1:0] sel_test;
    wire out_tb;

    //module instant
    mux_4x1 mux (
        .sel(sel_test),
        .i(w),
        .out(out_tb)       
    );

    initial begin
        $dumpfile("mux_4x1_wave.vcd");
        $dumpvars(0,tb);
        $monitor("Time = %d,select = %b,i = %b, output = %b",$time,sel_test,w,out_tb);

        //test sequences
        w = 4'b1010;
        sel_test = 2'b00; #1;
        sel_test = 2'b01; #1;
        sel_test = 2'b10; #1;
        sel_test = 2'b11; #1;

        $finish;
    end

endmodule