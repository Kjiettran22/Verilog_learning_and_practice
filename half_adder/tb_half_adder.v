    //timescale dinh nghia don gi thoi gian trong luc mo phong
    `timescale 1ps/1ps
module tb ;

    reg a_tb,b_tb;
    wire s_tb,c_out_tb;
    
    //half_adder ha (.*);
    
    //half_adder ha (a_tb,b_tb,s_tb,c_out_tb);
    
    //module instant
    half_adder ha (
        .a(a_tb),
        .b(b_tb),
        .s(s_tb),
        .c_out(c_out_tb)
    );

    //dung module initial de khoi tao gia tri testbench

    initial begin   
        //dung monitor de hien thi gia tri de xem gia tri cua module 
        $monitor("Times = %d, a = %b, b = %b, s = %b, c_out = %b",$time, a_tb, b_tb,s_tb,c_out_tb);

        a_tb = 0;b_tb = 0;
        #1;
        a_tb = 1;b_tb = 0;
        #1;
        a_tb = 0;b_tb = 1;
        #1;
        a_tb = 1;b_tb = 1;
        #3;

        $finish; 
        //dung finish de ket thuc monitor 

    end

endmodule