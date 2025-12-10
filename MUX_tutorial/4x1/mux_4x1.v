//continuous ver
module mux_4x1 (
    input wire [3:0] i,
    input wire [1:0] sel,
    output wire out
);
    assign out =i[sel];
endmodule

//newbie ver
 
// module mux_4x1 (
//     input wire [3:0] i,
//     input wire [1:0] sel,
//     output reg out
// );
//     always @(*) begin
//         case (sel)
//             2'b00: out = i[0];
//             2'b01: out = i[1];
//             2'b10: out = i[2];
//             2'b11: out = i[3];
//         endcase
//     end
// endmodule