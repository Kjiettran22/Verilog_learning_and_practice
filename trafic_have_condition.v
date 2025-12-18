module traffic_have_condition (
    input clk,
    input rst,
    input condition,
    output reg red,green,yellow
);
    parameter RED = 2'b00,
              GREEN = 2'b01,
              YELLOW = 2'b10;
    reg [1:0] state;
    reg [5:0] cnt;
    
    //set max_cnt
    wire [5:0] max_cnt;
    assign max_cnt = (state == YELLOW) ? 6'd4 :
                     (condition) ? 6'd63 : 6'd31 ; 

    always @(posedge clk) begin
        if (rst) begin
            cnt <= 0;
            state <= RED;
        end else if (cnt == max_cnt) begin
            cnt <= 0;
            //transition
            case (state)  
                RED: state <= GREEN;
                GREEN: state <= YELLOW;
                YELLOW: state <= RED;
                default: state <= RED;
            endcase
        end else begin cnt <= cnt + 1; end // if not transition, increase cnt
    end

    always @(*) begin
        red = 0; yellow = 0; green = 0;
        case (state)
            RED: red = 1;
            YELLOW: yellow = 1;
            GREEN: green = 1;
        endcase
    end
    
endmodule