module jk_ff (
    input wire j,
    input wire k,
    input wire clk,
    input wire reset,
    output reg out
);

    always @(posedge clk, posedge reset) begin  
        if (reset)  
            out <= 1'b0;
        else begin
        case ({j,k}) 
            2'b00: out <= out;
            2'b01: out <= 1'b0;
            2'b10: out <= 1'b1;
            2'b11: out <= ~out;
        endcase
        end
    end
    
endmodule