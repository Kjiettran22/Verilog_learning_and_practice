`timescale 1ns/1ps

module tb_traffic;

    reg clk;
    reg rst_n;
    reg [1:0] push1;
    reg push2;

    wire [7:0] cnt;
    wire n_left_green,s_left_green,e_left_green,w_left_green;
    wire e_left_red,w_left_red,n_left_red,s_left_red;
    wire ns_green,ew_green,ns_red,ew_red,ns_yellow,ew_yellow;

    traffic dut (
        .clk(clk),
        .rst_n(rst_n),
        .push1(push1),
        .push2(push2),
        .cnt(cnt),
        .n_left_green(n_left_green),
        .s_left_green(s_left_green),
        .e_left_green(e_left_green),
        .w_left_green(w_left_green),
        .n_left_red(n_left_red),
        .s_left_red(s_left_red),
        .e_left_red(e_left_red),
        .w_left_red(w_left_red),
        .ns_green(ns_green),
        .ew_green(ew_green),
        .ns_yellow(ns_yellow),
        .ew_yellow(ew_yellow),
        .ns_red(ns_red),
        .ew_red(ew_red)
    );

    always #5 clk = ~clk;
    initial begin
        $dumpfile("traffic.vcd");
        $dumpvars(0, tb_traffic);

        clk = 0;
        rst_n = 0;
        push1 = 2'b00;
        push2 = 0;
        // reset
        #20 rst_n = 1;
        #5000;
        push1 = 2'b01;
        #5000;
        push1 = 2'b10;
        #100;
        push2 = 1;
        #20;
        push2 = 0;
        #5000;
        $finish;
    end

endmodule