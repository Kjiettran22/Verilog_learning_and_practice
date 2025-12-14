module simulation (
    input wire [6:0] in,
    output wire out
);

    wire [2:0] w;
    assign w[0] = ~(in[0] & in[1]);
    assign w[1] = (in[2] & ~(in[3] & in[4]));
    assign w[2] = ~(in[5] | in[6]);
    assign out = ~(w[0] & w[1] & w[2]);

endmodule