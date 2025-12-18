`timescale 1ns/1ps
module tb;

    reg clk;
    reg rst_n;

    wire ns_left_green;
    wire ns_green;
    wire ns_yellow;
    wire ns_red;
    wire ew_green;
    wire ew_left_green;
    wire ew_yellow;
    wire ew_red;

    // DUT
    traffic_keke dut(
        .clk(clk),
        .rst_n(rst_n),
        .ns_green(ns_green),
        .ns_left_green(ns_left_green),
        .ns_yellow(ns_yellow),
        .ns_red(ns_red),
        .ew_green(ew_green),
        .ew_left_green(ew_left_green),
        .ew_yellow(ew_yellow),
        .ew_red(ew_red)
    );

    // CLOCK: 10ns period
    always #5 clk = ~clk;

    initial begin
        $dumpfile("tb_traffic_hehehe.vcd");
        $dumpvars(0, tb);

        clk   = 0;
        rst_n = 0;          // ✅ RESET ĐÚNG (active-low)

        #50;                // giữ reset vài chu kỳ clock
        rst_n = 1;          // ✅ NHẢ RESET

        #5000;              // chạy đủ lâu để thấy đổi state
        $finish;
    end

endmodule
