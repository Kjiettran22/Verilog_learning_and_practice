module tb;
    reg i;
    reg [1:0] sel;
    wire [3:0] out;

    //module instantiation
    demux_4x1 uut (
        .i(i),
        .sel(sel),
        .out(out)
    );

    initial begin

        $dumpfile("4x1_tb_demux.vcd");
        $dumpvars(0,tb);
        $display ("--------------TEST_Case----------------");

        //set value for input 
        i = 1'b1;


        // Test all case of select or golden test
        sel = 2'b00; #10;
        $display("sel=%b => out=%b ", sel, out);

        sel = 2'b01; #10;
        $display("sel=%b => out=%b ", sel, out);

        sel = 2'b10; #10;
        $display("sel=%b => out=%b ", sel, out);

        sel = 2'b11; #10;
        $display("sel=%b => out=%b ", sel, out);


        $display("=== END TEST ===");
        $finish;
    end

endmodule