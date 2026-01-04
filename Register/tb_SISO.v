`timescale 1ns/1ps
module tb_SISO;

    reg clk;
    reg rst;
    reg enb;
    reg data_in;
    wire data_out;

    SISO uut (
        .clk(clk),
        .rst(rst),
        .enb(enb),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Clock 10ns
    always #5 clk = ~clk;

    initial begin
        $dumpfile("SISO.vcd");
        $dumpvars(0, tb_SISO);

        // ===== Khởi tạo =====
        clk = 0;
        rst = 1;
        enb = 0;
        data_in = 0;

        // ===== CASE 1: Reset =====
        #10;
        rst = 0;     // nhả reset

        // ===== CASE 2: Enable = 1, dịch chuỗi 1011 =====
        enb = 1;

        #10 data_in = 1;
        #10 data_in = 0;
        #10 data_in = 1;
        #10 data_in = 1;

        // ===== CASE 3: Enable = 0 (không được dịch) =====
        #10 enb = 0;
        #10 data_in = 0;
        #10 data_in = 1;

        // ===== CASE 4: Enable lại =====
        #10 enb = 1;
        #10 data_in = 1;

        // ===== CASE 5: Reset giữa chừng =====
        #10 rst = 1;
        #10 rst = 0;

        // ===== CASE 6: Chuỗi khác 1100 =====
        #10 data_in = 1;
        #10 data_in = 1;
        #10 data_in = 0;
        #10 data_in = 0;

        #30 $finish;
    end

endmodule
