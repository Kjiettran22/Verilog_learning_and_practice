    //timescale dinh nghia don gi thoi gian trong luc mo phong
    `timescale 1ps/1ps
module tb ;

    reg a_tb,b_tb,c_in_tb;
    wire s_tb,c_out_tb;
    
    full_adder fa (
        .a(a_tb),
        .b(b_tb),
        .c_in(c_in_tb),
        .s(s_tb),
        .c_out(c_out_tb)
    );

    //dung module initial de khoi tao gia tri testbench

    initial begin   

        $dumpfile("dump.vcd");  // Đặt tên file VCD
        $dumpvars(0, tb); // Ghi tất cả các tín hiệu trong testbench vào file VCD

      $monitor("Times = %d, a = %b, b = %b,c_in = %b s = %b, c_out = %b",$time, a_tb, b_tb,c_in_tb,s_tb,c_out_tb);
        a_tb = 0;b_tb = 0;c_in_tb=0;
        #1;
        a_tb = 0;b_tb = 0;c_in_tb=1;
        #1;
        a_tb = 0;b_tb = 1;c_in_tb=0;
        #1;
        a_tb = 0;b_tb = 1;c_in_tb=1;
        #1;
        a_tb = 1;b_tb = 0;c_in_tb=0;
        #1;
        a_tb = 1;b_tb = 0;c_in_tb=1;
        #1;
        a_tb = 1;b_tb = 1;c_in_tb=0;
        #1;
        a_tb = 1;b_tb = 1;c_in_tb=1;
        #3;
        $finish; 


    end

endmodule