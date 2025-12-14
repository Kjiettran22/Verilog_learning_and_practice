module elevator_floor16 (
    input [3:0] floor,
    output [15:0] leds
);
    assign leds = 16'b1 << floor;
endmodule

// `timescale 1ns/1ps

// module tb_elevator_floor16;
//     // Input
//     reg  [3:0]  floor;

//     // DUT output
//     wire [15:0] leds;

//     // Expected
//     reg  [15:0] expected_leds;

//     // Mismatch flag (high when DUT != expected)
//     wire mismatch = (leds !== expected_leds);

//     integer TOTAL_TEST_CASES        = 0;
//     integer TOTAL_PASSED_TEST_CASES = 0;
//     integer TOTAL_FAILED_TEST_CASES = 0;

//     // Instantiate DUT
//     elevator_floor16 dut (
//         .floor(floor),
//         .leds(leds)
//     );

//     // VCD dump (Inputs -> Outputs -> Expected -> mismatch)
//     initial begin
//         $dumpfile("tb_elevator_floor16.vcd");
//         $dumpvars(0,
//             tb_elevator_floor16.floor,        // input
//             tb_elevator_floor16.leds,         // output
//             tb_elevator_floor16.expected_leds,// expected
//             tb_elevator_floor16.mismatch      // mismatch
//         );
//     end

//     // Golden model: pure one-hot via shift
//     task compute_expected;
//         input [3:0] t_floor;
//         begin
//             expected_leds = (16'b0000_0000_0000_0001 << t_floor);
//         end
//     endtask

//     // Apply, check, print ONE row (no duplicates)
//     task run_and_show;
//         input [3:0] t_floor;
//         begin
//             floor = t_floor;
//             compute_expected(t_floor);
//             #1; // settle

//             TOTAL_TEST_CASES = TOTAL_TEST_CASES + 1;
//             if (!mismatch) TOTAL_PASSED_TEST_CASES = TOTAL_PASSED_TEST_CASES + 1;
//             else           TOTAL_FAILED_TEST_CASES = TOTAL_FAILED_TEST_CASES + 1;

//             $display("%2d    | %016b | %016b | %b",
//                      floor, leds, expected_leds, mismatch);
//         end
//     endtask

//     integer i;
//     initial begin
//         // Header
//         $display("floor |        leds(15..0)        |     expected_leds     | mismatch");
//         $display("----------------------------------------------------------------------");

//         // Single exhaustive loop: runs and prints each case exactly once
//         for (i = 0; i < 16; i = i + 1)
//             run_and_show(i[3:0]);

//         // Summary
//         $display("======================================");
//         $display("TOTAL_TEST_CASES=%0d",        TOTAL_TEST_CASES);
//         $display("TOTAL_PASSED_TEST_CASES=%0d", TOTAL_PASSED_TEST_CASES);
//         $display("TOTAL_FAILED_TEST_CASES=%0d", TOTAL_FAILED_TEST_CASES);
//         $display("ALL_TEST_CASES_PASSED=%s",
//                  (TOTAL_FAILED_TEST_CASES==0) ? "true" : "false");
//         $display("======================================");
//         $finish;
//     end
// endmodule