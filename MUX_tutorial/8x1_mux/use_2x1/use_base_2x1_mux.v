module mux_8x1 (
    input wire [7:0] in,
    input wire [2:0] sel1,
    output reg out;
);
    wire [3:0] w1;
    wire [1:0] w2;
    
    //tang 1 4 khoi mux 
    Mux_2x1 mux1 (.a(in[0]),.b(in[1]),.sel(sel1[0]),.y(w1[0]));
    Mux_2x1 mux2 (.a(in[2]),.b(in[3]),.sel(sel1[0]),.y(w1[1]));
    Mux_2x1 mux3 (.a(in[4]),.b(in[5]),.sel(sel1[0]),.y(w1[2]));
    Mux_2x1 mux4 (.a(in[6]),.b(in[7]),.sel(sel1[0]),.y(w1[3]));

    //tang 2 2 khoi mux tong hop
    Mux_2x1 mux5 (.a(w1[0]),.b(w1[1]),.sel(sel1[1]),.y(w2[0]));
    Mux_2x1 mux6 (.a(w1[2]),.b(w1[3]),.sel(sel1[1]),.y(w2[1]));

    //mux final loc tin hieu
    Mux_2x1 mux7 (.a(w2[0]),.b(w2[1]),.sel(sel1[2]),.y(out));


endmodule


//built mux 8x1 using the base mux 2x1
module Mux_2x1 (a,b,sel,y);
    input wire a,b,sel;
    output reg y;

    always @(*) begin
        case (sel)
            1'b0: y = a;
            1'b1: y = b;
        endcase
    end

endmodule