//vi full_adder la bo cong tu 2 bo half_adder nen viet dua tren bo half_adder da co tu truoc
module full_adder (a,b,c_in,s,c_out);
    input wire a,b,c_in;
    output wire s,c_out;

    wire w2,w1,w3;
    //viet instant module de dung half_adder 
    half_adder ha1 (.a(a),.b(b),.s(w2),.c_out(w1));
    half_adder ha2 (.a(w2),.b(c_in),.s(s),.c_out(w3));

	assign c_out = w1 | w3;
endmodule
    // wire [2:0] w; 
    // half_adder ha1 (.a(a),.b(b),.s(w[2]),.c_cout(w[1]));
    // half_adder ha2 (.a(w2),.b(c_in),.s(s),.c_cout(w[3]));

    // always @(w[1],w[3]) begin  
    //     c_out = w[1] | w[3];
    // end


module half_adder (a,b,s,c_out);
    input wire a,b;
    output reg s,c_out;

    //assign s = a ^ b;
    //assign c_out = a & b;

    //procedural form -> use reg as output 
    always @(a,b) begin
       s = a ^ b;
       c_out = a & b; 
    end

endmodule