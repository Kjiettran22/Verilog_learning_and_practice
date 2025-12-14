module rise_pulse(
    input  wire clk,
    input  wire rst,      // synchronous active-high reset
    input  wire sig_in,
    output reg  pulse
);
    reg prev;             // previous sampled value of sig_in
    always @(posedge clk) begin
        if (rst) begin  
            prev <= 1'b0; 
            pulse <= 1'b0;
        end
        else begin  
            pulse <= ~prev & sig_in;
            prev <= sig_in;
        end
    end
endmodule