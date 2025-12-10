 `timescale 1ns/1ps

module tb_mux_8x1;

    reg  [0:7] in;
    reg  [2:0] sel;
    wire out;
 
    // Instantiate the DUT
    special_case uut (
        .in(in),
        .sel(sel),
        .out(out)
    );

    initial begin
        $dumpfile("8x1_waveform.vcd");
        $dumpvars(9,tb_mux_8x1);
        $display("=== TEST MUX 8x1 ===");

        // Gán giá trị cho input
        in = 8'b10110011;  

        // Test tất cả giá trị select
        sel = 3'b000; #10;
        $display("sel=%b => out=%b ", sel, out);

        sel = 3'b001; #10;
        $display("sel=%b => out=%b ", sel, out);

        sel = 3'b010; #10;
        $display("sel=%b => out=%b ", sel, out);

        sel = 3'b011; #10;
        $display("sel=%b => out=%b ", sel, out);

        sel = 3'b100; #10;
        $display("sel=%b => out=%b ", sel, out);

        sel = 3'b101; #10;
        $display("sel=%b => out=%b ", sel, out);

        sel = 3'b110; #10;
        $display("sel=%b => out=%b ", sel, out);

        sel = 3'b111; #10;
        $display("sel=%b => out=%b ", sel, out);

        $display("=== END TEST ===");
        $finish;
    end

endmodule
