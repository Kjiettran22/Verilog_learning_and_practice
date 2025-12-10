module demux_4x1 (
    input wire i,
    input wire [1:0] sel,
    output reg [3:0] out
);
    always @(*) begin
        //reset output
        out = 4'b0000;
        //chon gia tri i gan cho tung out
       case (sel)
            2'b00: out[0] = i;
            2'b01: out[1] = i;
            2'b10: out[2] = i;
            2'b11: out[3] = i;
       endcase 
    end
    
endmodule