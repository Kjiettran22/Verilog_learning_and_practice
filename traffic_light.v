module traffic_light (
    input clk,
    input rst,
    output reg red,yellow,green
);
    //set value of default state
    parameter RED = 2'b00,
              YELLOW = 2'b01,
              GREEN = 2'b11;
    
    //store state and next_state
    reg [1:0] state, next_state;


    always @(posedge clk) begin
        if (rst) begin
            state <= RED;
        end
        else state <= next_state;
    end

    //set value of next_state
    always @(*) begin
        next_state = RED; // set default value, avoid case 2'b10
        case (state) 
            RED: next_state = GREEN;
            YELLOW: next_state = RED;
            GREEN: next_state = YELLOW;
        endcase
    end

    //output

    always @(*) begin
        red = 0; green = 0; yellow = 0;
        case (state) 
            RED : red = 1;
            YELLOW : yellow = 1;
            GREEN : green = 1;
        endcase
    end

endmodule