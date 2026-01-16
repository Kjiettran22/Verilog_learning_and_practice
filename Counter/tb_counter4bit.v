`timescale 1ns/1ps

module tb_counter_4bit;

    // 1. Khai báo tín hiệu testbench
    reg clk;
    reg rst_n;
    wire [3:0] count;

    // 2. Instantiate DUT (Design Under Test)
    counter_4bit dut (
        .clk   (clk),
        .rst_n (rst_n),
        .count (count)
    );

    // 3. Tạo clock 100 MHz (chu kỳ 10 ns)
    always #5 clk = ~clk;

    // 4. Stimulus
    initial begin
        $dumpfile("counter.vcd");
        $dumpvars(0,tb_counter_4bit);
        // Khởi tạo
        clk   = 0;
        rst_n = 0;

        // Giữ reset 20 ns
        #20;
        rst_n = 1;

        // Chạy 200 ns để quan sát counter
        #200;

        // Kết thúc mô phỏng
        $finish;
    end

endmodule
