module tb;
    reg [2:0] a,b;
    wire [2:0] s;
    wire c;

    //goi dut de dua gia tri vao de test
    ripple_carry_3bit dut (a,b,s,c);

    initial begin
    a = 3'b111;
    b = 3'b110;

    $monitor("a = %b, b = %b, s = %b, c = %b ",a,b,s,c);
    end
endmodule