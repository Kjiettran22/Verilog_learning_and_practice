module simu2 (
    input wire [2:0] in,
    output wire [1:0] out
);
    wire w1;
    assign w1 = (in[0] & in[1]);
    assign out[0] = (w1 | ~(in [2]));
    assign out[1] = ~in[2];

endmodule