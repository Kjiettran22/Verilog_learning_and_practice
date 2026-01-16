module counter_4bit (
    input  wire clk,      // clock
    input  wire rst_n,    // reset active low
    output reg  [3:0] count
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        count <= 4'b0000;     // reset về 0
    else
        count <= count + 1'b1; // tăng 1 mỗi xung clock
end

endmodule
