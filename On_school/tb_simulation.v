    //timescale dinh nghia don gi thoi gian trong luc mo phong
    `timescale 1ps/1ps
module tb ;

    reg [6:0] in;
    wire out;
    
    simulation uut(
        .in(in),
        .out(out)
    );


    initial begin   

        $dumpfile("simulation.vcd");  // Đặt tên file VCD
        $dumpvars(0, tb); // Ghi tất cả các tín hiệu trong testbench vào file VCD

        $display("================TEST_CASE==================");
        in = 7'b0000000; #10;
        $display("in = %b, out = %b", in, out);

        in = 7'b1111111; #10;
        $display("in = %b, out = %b", in, out);

        in = 7'b1010101; #10;
        $display("in = %b, out = %b", in, out);

        in = 7'b1111000; #10;
        $display("in = %b, out = %b", in, out);

        in = 7'b0101010; #10;
        $display("in = %b, out = %b", in, out);

        in = 7'b0010100; #10;
        $display("in = %b, out = %b", in, out);

        $display("================END_TEST====================");

        $finish; 


    end

endmodule