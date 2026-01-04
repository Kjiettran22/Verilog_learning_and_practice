module SISO (
    input clk,rst,enb,data_in,
    output reg data_out
);
    reg [3:0] temp;
    always @(posedge clk) begin
        if (rst) begin
            temp <= 4'b0000;
        end if (enb) begin
            //left_shift
            // temp <= {temp[2:0], data_in};
            //right_shift
            temp <= {data_in,temp[2:0]}
            temp[3] <= data_in;
            data_out <= temp[0];
        end
    end
endmodule