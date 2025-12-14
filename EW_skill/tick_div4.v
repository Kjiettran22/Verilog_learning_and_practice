module fan_out (
    input wire in,
    output wire out[2:0]
);
    assign out = in;
    
endmodule