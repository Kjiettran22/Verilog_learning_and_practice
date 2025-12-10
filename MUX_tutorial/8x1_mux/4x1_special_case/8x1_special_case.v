module  special_case (
    input wire [7:0] in,
    input wire [2:0] sel,
    output wire out
);
    wire low_case;
    wire high_case;
    //module instantiation
    //mux low case 0 -> 3
    mux_4x1 m1 (
        .in(in[3:0]),
        .sel(sel[1:0]),
        .out(low_case)
    );

    //mux high case 4 -> 7
    mux_4x1 m2 (
        .in(in[7:4]),
        .sel(sel[1:0]),
        .out(high_case)
    );

    //final 2 to 1 select
    assign out = sel[2] ? low_case : high_case;
    
endmodule 

module mux_4x1 (
    input wire [3:0] in,
    input wire [1:0] sel,
    output wire out
);
    assign out = in[sel];
    
endmodule