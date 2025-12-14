module pwm4_basic (
    input clk,
    input rst,
    input [3:0] duty,
    output reg pwm_out
);
    reg [3:0] in_count;

    always @(posedge clk) begin
        if (rst) begin
            in_count <= 1'b0;
            pwm_out <= 1'b0;
        end
        else begin
            //increase counter
            in_count <= in_count +1 ;
            if (in_count < duty)
                pwm_out <= 1'b1;
            else 
                pwm_out <= 1'b0;
        end
    end
endmodule

// `timescale 1ns/1ps
// module tb_pwm4_basic;
//   reg        clk;
//   reg        rst;
//   reg  [3:0] duty;

//   wire       pwm_out;
//   wire       expected_pwm;
//   wire       mismatch;

//   pwm4_basic dut(.clk(clk), .rst(rst), .duty(duty), .pwm_out(pwm_out));

//   reg [3:0] exp_cnt;
//   reg       exp_pwm_q;
//   assign expected_pwm = exp_pwm_q;

//   always @(posedge clk) begin
//     exp_pwm_q <= rst ? 1'b0 : (exp_cnt < duty);
//     exp_cnt   <= rst ? 4'd0 : (exp_cnt + 4'd1);
//   end

//   assign mismatch = (pwm_out !== expected_pwm);

//   initial begin
//     clk = 1'b0;
//     forever #5 clk = ~clk;
//   end

//   initial begin
//     $dumpfile("tb_pwm4_basic.vcd");
//     $dumpvars(0, clk, rst, duty, pwm_out, expected_pwm, mismatch);
//   end

//   integer TOTAL_TEST_CASES, TOTAL_PASSED_TEST_CASES, TOTAL_FAILED_TEST_CASES;

//   task apply_cycles;
//     input integer n; integer i;
//     begin for (i=0;i<n;i=i+1) @(posedge clk); end
//   endtask

//   task run_frame_now;
//     input [3:0] val;
//     input [8*40-1:0] name;
//     integer i, highs; reg case_failed;
//     begin
//       duty = val;
//       highs = 0; case_failed = 0;
//       for (i=0;i<16;i=i+1) begin
//         @(posedge clk);
//         if (expected_pwm === 1'b1) highs = highs + 1;
//         if (mismatch) case_failed = 1;
//       end
//       $display("CASE=%s : duty=%0d highs=%0d expected_highs=%0d %s",
//                name, val, highs, val, case_failed ? "MISMATCH" : "OK");
//       TOTAL_TEST_CASES = TOTAL_TEST_CASES + 1;
//       if (!case_failed && highs==val) TOTAL_PASSED_TEST_CASES = TOTAL_PASSED_TEST_CASES + 1;
//       else TOTAL_FAILED_TEST_CASES = TOTAL_FAILED_TEST_CASES + 1;
//     end
//   endtask

//   task run_frame_next;
//     input [3:0] val;
//     input [8*40-1:0] name;
//     integer i, highs; reg case_failed;
//     begin
//       @(negedge clk); duty = val;
//       highs = 0; case_failed = 0;
//       for (i=0;i<16;i=i+1) begin
//         @(posedge clk);
//         if (expected_pwm === 1'b1) highs = highs + 1;
//         if (mismatch) case_failed = 1;
//       end
//       $display("CASE=%s : duty=%0d highs=%0d expected_highs=%0d %s",
//                name, val, highs, val, case_failed ? "MISMATCH" : "OK");
//       TOTAL_TEST_CASES = TOTAL_TEST_CASES + 1;
//       if (!case_failed && highs==val) TOTAL_PASSED_TEST_CASES = TOTAL_PASSED_TEST_CASES + 1;
//       else TOTAL_FAILED_TEST_CASES = TOTAL_FAILED_TEST_CASES + 1;
//     end
//   endtask

//   initial begin
//     TOTAL_TEST_CASES = 0; TOTAL_PASSED_TEST_CASES = 0; TOTAL_FAILED_TEST_CASES = 0;

//     rst = 1'b1; duty = 4'd0; apply_cycles(4);
//     @(negedge clk) rst = 1'b0;

//     run_frame_now (4'd0 , "duty_0_percent");
//     run_frame_next(4'd1 , "duty_min_nonzero");
//     run_frame_next(4'd4 , "duty_25_percent");
//     run_frame_next(4'd8 , "duty_50_percent");
//     run_frame_next(4'd12, "duty_75_percent_minus");
//     run_frame_next(4'd15, "duty_max");

//     $display("TOTAL_TEST_CASES=%0d",        TOTAL_TEST_CASES);
//     $display("TOTAL_PASSED_TEST_CASES=%0d", TOTAL_PASSED_TEST_CASES);
//     $display("TOTAL_FAILED_TEST_CASES=%0d", TOTAL_FAILED_TEST_CASES);
//     $display("ALL_TEST_CASES_PASSED=%s",    (TOTAL_FAILED_TEST_CASES==0) ? "true" : "false");
//     $finish;
//   end
// endmodule