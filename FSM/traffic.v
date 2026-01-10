module traffic (
    input clk,rst_n,push1,push2,
    output reg [7:0] cnt,
    output reg n_left_green,
    output reg s_left_green,
    output reg e_left_green,
    output reg w_left_green,
    output reg n_left_red,
    output reg s_left_red,
    output reg e_left_red,
    output reg w_left_red,
    output reg ns_yellow,
    output reg ew_yellow,
    output reg ns_green,
    output reg ew_green,
    output reg ns_red,
    output reg ew_red
);
    localparam S_INIT = 8'd0;
    localparam S_DELAY = 8'd1;
    localparam S0_N_LEFT = 8'd2;
    localparam S1_S_LEFT =  8'd3;
    localparam S2_NS_GREEN = 8'd4;
    localparam S3_NS_YELLOW = 8'd5;
    localparam S4_E_LEFT = 8'd6;
    localparam S5_W_LEFT = 8'd7;
    localparam S6_EW_GREEN = 8'd8;
    localparam S7_EW_YELLOW = 8'd9;
    reg [7:0] state,next_state,state_delay;

    reg [7:0] T_LEFT,T_GO,T_YELLOW;
    localparam T_DELAY = 8'd30;
    
    //timer
    reg load;
    reg [7:0] time_value;
    wire done;
    always @(posedge clk) begin
        if (!rst_n) begin
            cnt <= 0;
        end else if (load) begin
            cnt <= time_value;
        end else if (cnt > 0) begin
            cnt <= cnt - 1;
        end
    end
    assign done = (cnt == 8'd1);

    always @(posedge clk) begin
        if (!rst_n) begin
                T_LEFT = 8'd15;
                T_GO = 8'd25;
                T_YELLOW = 8'd5;
            end else begin
            case (push1)
                2'b00: begin
                    T_LEFT = 8'd15;
                    T_GO = 8'd25;
                    T_YELLOW = 8'd5;
                end
                2'b01: begin
                    T_LEFT = 8'd25;
                    T_GO = 8'd45;
                    T_YELLOW = 8'd5;
                end
                2'b10: begin
                    T_LEFT = 8'd35;
                    T_GO = 8'd60;
                    T_YELLOW = 8'd5;
                end
                default: begin
                    T_LEFT = 8'd15;
                    T_GO = 8'd25;
                    T_YELLOW = 8'd5;
                end
            endcase
        end
    end
    always @(posedge clk) begin
        if (push2) begin
            case (state)
                S0_N_LEFT: begin
                    if (done) begin
                        ns_red = 1; ew_red = 1;
                        next_state = S_DELAY;
                        time_value = T_DELAY;
                        state_delay = S1_S_LEFT;
                    end
                end
                S1_S_LEFT: begin
                    if (done) begin
                        ns_red = 1; ew_red = 1;
                        next_state = S_DELAY;
                        time_value = T_DELAY;
                        state_delay = S2_NS_GREEN;
                    end
                end
                S2_NS_GREEN: begin
                    if (done) begin
                        ns_red = 1; ew_red = 1;
                        next_state = S_DELAY;
                        time_value = T_DELAY;
                        state_delay = S3_NS_YELLOW;
                    end
                end
                S3_NS_YELLOW: begin
                    if (done) begin
                        ns_red = 1; ew_red = 1;
                        next_state = S_DELAY;
                        time_value = T_DELAY;
                        state_delay = S1_S_LEFT;
                    end
                end
                S4_E_LEFT: begin
                    if (done) begin
                        ns_red = 1; ew_red = 1;
                        next_state = S_DELAY;
                        time_value = T_DELAY;
                        state_delay = S5_W_LEFT;
                    end
                end
                S5_W_LEFT: begin
                    if (done) begin
                        ns_red = 1; ew_red = 1;
                        next_state = S_DELAY;
                        time_value = T_DELAY;
                        state_delay = S6_EW_GREEN;
                    end
                end
                S6_EW_GREEN: begin
                    if (done) begin
                        ns_red = 1; ew_red = 1;
                        next_state = S_DELAY;
                        time_value = T_DELAY;
                        state_delay = S7_EW_YELLOW;
                    end
                end
                default: begin
                    if (done) begin
                        ns_red = 1; ew_red = 1;
                        next_state = S_DELAY;
                        time_value = T_DELAY;
                        state_delay = S0_N_LEFT;
                    end                
                end
            endcase
        end
    end

    always @(posedge clk) begin
        if (!rst_n) begin
            state = S_INIT;
        end else begin
            n_left_green = 0; s_left_green = 0; e_left_green = 0; w_left_green = 0;
            n_left_red = 0; s_left_red = 0; ns_yellow =1; ew_yellow = 1; 
            case (state)
                S_INIT: begin
                   next_state = S0_N_LEFT; 
                end
                S0_N_LEFT: begin
                    n_left_green = 1; s_left_red = 1; ew_red = 1;
                    if (done) begin
                        load = 1;
                        time_value = T_LEFT;
                        next_state = S1_S_LEFT;
                    end 
                end
                S1_S_LEFT: begin
                    s_left_green = 1; n_left_red = 1; ew_red = 1;
                    if (done) begin
                        load = 1;
                        time_value = T_GO;
                        next_state = S2_NS_GREEN;
                    end
                end
                S2_NS_GREEN: begin
                    ns_green = 1; ew_red = 1;
                    if (done) begin
                        load = 1;
                        time_value = T_YELLOW;
                        next_state = S3_NS_YELLOW;
                    end
                end
                S3_NS_YELLOW: begin
                    ns_yellow = 1; ew_red = 1;
                    if (done) begin
                        load = 1;
                        time_value = T_LEFT;
                        next_state = S4_E_LEFT;
                    end
                end
                S4_E_LEFT: begin
                    e_left_green = 1; w_left_red = 1; ns_red = 1;
                    if (done) begin
                        load = 1;
                        time_value = T_LEFT;
                        next_state = S5_W_LEFT;
                    end
                end
                S5_W_LEFT: begin
                    w_left_green = 1; e_left_red = 1; ns_red = 1;
                    if (done) begin
                        load = 1;
                        time_value = T_GO;
                        next_state = S6_EW_GREEN;
                    end
                end
                S6_EW_GREEN: begin
                    ew_green = 1; ns_red = 1;
                    if (done) begin
                        load = 1;
                        time_value = T_YELLOW;
                        next_state = S7_EW_YELLOW;
                    end
                end
                S7_EW_YELLOW: begin
                    ew_yellow = 1; ns_red = 1;
                    if (done) begin
                        load = 1;
                        time_value = T_LEFT;
                        next_state = S0_N_LEFT;
                    end
                end
                default: begin
                    n_left_green = 1; s_left_red = 1; ew_red = 1;
                    if (done) begin
                        load = 1;
                        time_value = T_LEFT;
                        next_state = S1_S_LEFT;
                    end 
                end
            endcase
        end
    end
endmodule