// //viet = for

// module battery_led_bar (
//     input wire [3:0] level,
//     output reg [7:0] led_bar
// );
//     integer i;
//     always @(*) begin
//         //set default led_bar
//         led_bar = 8'b0;
//         for (i <= 0; i<8, i = i+1) begin    
//             if (i < level)
//                 led_bar[i] - 1'b1;
//     end
// endmodule





module battery_led_bar (
    input [3:0] level,
    output [7:0] led_bar
);
    assign led_bar = (1 << level ) -1;
endmodule

// `timescale 1ns/1ps

// module tb_battery_led_bar;
//     // Input
//     reg  [3:0] level;

//     // DUT output
//     wire [7:0] led_bar;

//     // Expected output
//     reg  [7:0] expected_led_bar;

//     // Mismatch signal
//     wire mismatch = (led_bar !== expected_led_bar);

//     integer TOTAL_TEST_CASES = 0;
//     integer TOTAL_PASSED_TEST_CASES = 0;
//     integer TOTAL_FAILED_TEST_CASES = 0;

//     // Instantiate DUT
//     battery_led_bar dut (
//         .level(level),
//         .led_bar(led_bar)
//     );

//     // VCD dump
//     initial begin
//         $dumpfile("tb_battery_led_bar.vcd");
//         $dumpvars(0,
//             tb_battery_led_bar.level,            // input
//             tb_battery_led_bar.led_bar,          // output
//             tb_battery_led_bar.expected_led_bar, // expected
//             tb_battery_led_bar.mismatch          // mismatch flag
//         );
//     end

//     // Golden model
//     task compute_expected;
//         input [3:0] t_level;
//         begin
//             expected_led_bar = ~(8'hFF << t_level);
//         end
//     endtask

//     task run_test;
//         input [3:0] t_level;
//         begin
//             level = t_level;
//             compute_expected(t_level);
//             #1;

//             TOTAL_TEST_CASES++;
//             if (!mismatch) begin
//                 TOTAL_PASSED_TEST_CASES++;
//             end else begin
//                 TOTAL_FAILED_TEST_CASES++;
//                 $display("FAILED: level=%0d | led_bar=%b expected=%b mismatch=%b",
//                          level, led_bar, expected_led_bar, mismatch);
//             end
//         end
//     endtask

//     integer i;
//     initial begin
//         // Exhaustive tests for all valid levels 0–8
//         for (i = 0; i <= 8; i = i + 1) begin
//             run_test(i[3:0]);
//         end

//         // Print truth table
//         $display("======================================");
//         $display("level | led_bar   | expected | mismatch");
//         $display("--------------------------------------");
//         for (i = 0; i <= 8; i = i + 1) begin
//             level = i;
//             compute_expected(i);
//             #1;
//             $display("%2d    | %b | %b | %b",
//                      level, led_bar, expected_led_bar, mismatch);
//         end
//         $display("======================================");

//         // Summary
//         $display("TOTAL_TEST_CASES=%0d", TOTAL_TEST_CASES);
//         $display("TOTAL_PASSED_TEST_CASES=%0d", TOTAL_PASSED_TEST_CASES);
//         $display("TOTAL_FAILED_TEST_CASES=%0d", TOTAL_FAILED_TEST_CASES);
//         $display("ALL_TEST_CASES_PASSED=%s",
//                  (TOTAL_FAILED_TEST_CASES==0) ? "true" : "false");
//         $finish;
//     end
// endmodule