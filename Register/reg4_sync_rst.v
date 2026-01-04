module reg4_sync_reset (
    input        CLK,
    input        RST,
    input  [3:0] D,
    output reg [3:0] Q
);
    always @(posedge CLK) begin
        if (RST) begin
            Q <= 4'b0000;
        end else Q <= D;
    end

endmodule