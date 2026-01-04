module SIPO (
    input clk,rst,enb,data_in,
    output reg [3:0] data_out
);
    reg [3:0] temp;
    always @(posedge clk) begin
        if (rst) begin
            temp <= 4'b0000;
            data_out <= 4'b0000;
        end else if (enb) begin
            temp <= {data_in, temp[2:0]};
            data_out <= temp;
        end
    end
endmodule