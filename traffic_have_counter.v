module traffic_light_cnt (
    input clk,
    input rst,
    output reg red,yellow,green
);
    reg [5:0] cnt; // max value is 32

    //set value of default state
    parameter RED = 2'b00,
              YELLOW = 2'b01,
              GREEN = 2'b11;
    
    reg [1:0] state,next_state;
always @(posedge clk) begin
    if (rst) begin
        state <= RED;
        cnt <= 0;
    end else begin
        cnt <= cnt + 1;
        case(state)
            RED:    if (cnt == 31) begin state <= GREEN; cnt <= 0; end
            GREEN:  if (cnt == 31) begin state <= YELLOW; cnt <= 0; end
            YELLOW: if (cnt == 5)  begin state <= RED; cnt <= 0; end
        endcase
    end
end


    // always @(*) begin
    //     next_state = RED;
    //     case (state) 
    //         RED: begin
    //                 if (cnt == 31) next_state = GREEN;
    //             end
    //         GREEN: begin  
    //                 if (cnt == 31) next_state = YELLOW;
    //             end
    //         YELLOW: begin
    //                 if (cnt == 5) next_state = RED;
    //             end
    //     endcase
    // end
    
    // always @(posedge clk) begin
    //     if (rst) begin
    //         state = RED;
    //         cnt = 0;
    //     end else begin
    //         if (state != next_state) // transition
    //         begin
    //             state <= next_state;
    //             cnt <= 0;
    //         end
    //         else begin
    //             state <= state;
    //             cnt <= cnt + 1;
    //         end
    //     end
    // end
    

    always @(*) begin
    red = 0; green = 0; yellow = 0;
        case (state) 
            RED : red = 1;
            YELLOW : yellow = 1;
            GREEN : green = 1;
        endcase
    end
endmodule