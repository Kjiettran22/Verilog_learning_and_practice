    //timescale dinh nghia don gi thoi gian trong luc mo phong
    `timescale 1ps/1ps
module tb ;

    reg [2:0] in;
    wire [1:0] out;
    
    simu2 uut(
        .in(in),
        .out(out)
    );


    initial begin   

        $dumpfile("simu2.vcd");  // Đặt tên file VCD
        $dumpvars(0, tb); // Ghi tất cả các tín hiệu trong testbench vào file VCD

        $display("================TEST_CASE==================");
        in = 3'b000; #10;
        $display("in = %b, out = %b", in, out);

        in = 3'b001; #10;
        $display("in = %b, out = %b", in, out);

        in = 3'b010; #10;
        $display("in = %b, out = %b", in, out);

        in = 3'b011; #10;
        $display("in = %b, out = %b", in, out);

        in = 3'b100; #10;
        $display("in = %b, out = %b", in, out);

        in = 3'b101; #10;
        $display("in = %b, out = %b", in, out);

        in = 3'b110; #10;
        $display("in = %b, out = %b", in, out);

        in = 3'b111; #10;
        $display("in = %b, out = %b", in, out);

        $display("================END_TEST====================");

        $finish; 


    end

endmodule