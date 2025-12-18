`timescale 1ns/1ps
module tb;

    reg clk;
    reg rst_n;

    wire n_left_green;
    wire s_left_green;
    wire ns_green;
    wire ns_yellow;
    wire ns_red;
    wire n_red;
    wire s_red;
    wire ew_green;
    wire e_left_green;
    wire w_left_green;
    wire ew_yellow;
    wire ew_red;
    wire e_red;
    wire w_red;

    // DUT
    opt3 dut(
        .clk(clk),
        .rst_n(rst_n),
        .ns_green(ns_green),
        .n_left_green(n_left_green),
        .s_left_green(s_left_green),
        .ns_yellow(ns_yellow),
        .ns_red(ns_red),
        .n_red(n_red),
        .s_red(s_red),
        .ew_green(ew_green),
        .e_left_green(e_left_green),
        .w_left_green(w_left_green),
        .ew_yellow(ew_yellow),
        .ew_red(ew_red),
        .e_red(e_red),
        .w_red(w_red)
    );

    // CLOCK: 10ns period
    always #5 clk = ~clk;

    initial begin
        $dumpfile("tb_opt3.vcd");
        $dumpvars(0, tb);

        clk   = 0;
        rst_n = 0;         

        #50;             
        rst_n = 1;          

        #10000;            
        $finish;
    end

endmodule
