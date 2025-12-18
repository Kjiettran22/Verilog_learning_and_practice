module opt3 (
    input clk,
    input rst_n,
    output reg ns_green,
    output reg n_left_green,
    output reg s_left_green,
    output reg ns_yellow,
    output reg n_red,
    output reg s_red,
    output reg ns_red,
    output reg ew_green,
    output reg e_left_green,
    output reg w_left_green,
    output reg ew_yellow,
    output reg e_red,
    output reg w_red,
    output reg ew_red
);
    //state definition
    localparam  S0_N_LEFT      = 3'd0,
                S1_S_LEFT      = 3'd1, 
                S2_NS_GREEN    = 3'd2,
                S3_NS_YELLOW   = 3'd3,
                S4_E_LEFT      = 3'd4,
                S5_W_LEFT      = 3'd5, 
                S6_EW_GREEN    = 3'd6,
                S7_EW_YELLOW   = 3'd7;

    reg [2:0] state;


    //time parameter
    localparam  T_LEFT = 5'd10;
    localparam  T_GO   = 5'd31;
    localparam  T_YELLOW = 5'd5;

    reg [4:0] timer;
    //timer and transition
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            timer <= T_LEFT - 1;
            state <= S0_N_LEFT;
        end else if (timer == 0) begin
            case (state)
                S0_N_LEFT: begin state <= S1_S_LEFT; timer <= T_LEFT - 1; end
                S1_S_LEFT: begin state <= S2_NS_GREEN; timer <= T_GO - 1; end
                S2_NS_GREEN: begin state <= S3_NS_YELLOW; timer <= T_YELLOW - 1; end
                S3_NS_YELLOW: begin state <= S4_E_LEFT; timer <= T_LEFT - 1; end
                S4_E_LEFT: begin state <= S5_W_LEFT; timer <= T_LEFT - 1; end
                S5_W_LEFT: begin state <= S6_EW_GREEN; timer <= T_GO - 1; end
                S6_EW_GREEN: begin state <= S7_EW_YELLOW; timer <= T_YELLOW - 1; end
                S7_EW_YELLOW: begin state <= S0_N_LEFT; timer <= T_LEFT -1; end
                default : begin state <= S0_N_LEFT; timer <= T_LEFT - 1; end
            endcase
        end else if (timer > 0) timer <= timer -1 ;
    end

    always @(*) begin
        ns_green = 0;n_left_green = 0;s_left_green = 0;ns_yellow = 0;n_red = 0;s_red = 0;ns_red = 0;
        ew_green = 0;e_left_green = 0;w_left_green = 0;ew_yellow = 0;e_red = 0;w_red = 0;ew_red = 0;
        case (state)
            S0_N_LEFT:begin
                n_left_green = 1;
                s_red = 1;
                ew_red = 1;
                ns_red = 1;
            end 
            S1_S_LEFT:begin
                s_left_green = 1;
                n_red = 1;
                ew_red = 1;
                ns_red = 1;
            end 
            S2_NS_GREEN:begin
                ns_green = 1;
                ew_red = 1;
                n_red = 1;
                s_red = 1;
            end 
            S3_NS_YELLOW: begin
                ns_yellow = 1;
                ew_red = 1;
            end 
            S4_E_LEFT:begin
                e_left_green = 1;
                w_red = 1;
                ns_red = 1;
                ew_red = 1;
            end 
            S5_W_LEFT:begin
                w_left_green = 1;
                e_red = 1;
                ns_red = 1;
                ew_red = 1;
            end
            S6_EW_GREEN: begin
                ew_green = 1;
                ns_red = 1;
                e_red = 1;
                w_red = 1;
            end
            S7_EW_YELLOW: begin
                ew_yellow = 1;
                ns_red = 1;
            end
            default: begin
                n_left_green = 1;
                s_red = 1;
                ew_red = 1;
            end
        endcase 
    end
endmodule