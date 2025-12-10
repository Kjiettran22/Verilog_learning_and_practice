 `timescale 1ns/1ps

module tb_mux_8x1;

    reg  [7:0] in;
    reg  [2:0] sel1;
    wire out;
 
    // Instantiate the DUT
    mux_8x1 uut (
        .in(in),
        .sel1(sel1),
        .out(out)
    );

    initial begin
        $display("=== TEST MUX 8x1 ===");

        // Gán giá trị cho input
        in = 8'b10110011;  // bạn có thể đổi giá trị này

        // Test tất cả giá trị select
        sel1 = 3'b000; #10;
        $display("sel=%b => out=%b (expected in[0]=%b)", sel1, out, in[0]);

        sel1 = 3'b001; #10;
        $display("sel=%b => out=%b (expected in[1]=%b)", sel1, out, in[1]);

        sel1 = 3'b010; #10;
        $display("sel=%b => out=%b (expected in[2]=%b)", sel1, out, in[2]);

        sel1 = 3'b011; #10;
        $display("sel=%b => out=%b (expected in[3]=%b)", sel1, out, in[3]);

        sel1 = 3'b100; #10;
        $display("sel=%b => out=%b (expected in[4]=%b)", sel1, out, in[4]);

        sel1 = 3'b101; #10;
        $display("sel=%b => out=%b (expected in[5]=%b)", sel1, out, in[5]);

        sel1 = 3'b110; #10;
        $display("sel=%b => out=%b (expected in[6]=%b)", sel1, out, in[6]);

        sel1 = 3'b111; #10;
        $display("sel=%b => out=%b (expected in[7]=%b)", sel1, out, in[7]);

        $display("=== END TEST ===");
        $finish;
    end

endmodule
