module bin2gray4 (
    input [3:0] bin_in,
    output [3:0] gray_out
);
    assign gray_out = bin_in ^ (bin_in >> 1);
//    assign gray_out[3] = bin_in[3];
//    assign gray_out[2] = bin_in[3] ^ bin_in[2];
//    assign gray_out[1] = bin_in[2] ^ bin_in[1];
//    assign gray_out[0] = bin_in[1] ^ bin_in[0];
endmodule

// `timescale 1ns/1ps

// module tb_bin2gray4;
//     // Input
//     reg  [3:0] bin_in;

//     // DUT output
//     wire [3:0] gray_out;

//     // Expected output
//     reg  [3:0] expected_gray_out;

//     // Mismatch signal
//     wire mismatch = (gray_out !== expected_gray_out);

//     integer TOTAL_TEST_CASES = 0;
//     integer TOTAL_PASSED_TEST_CASES = 0;
//     integer TOTAL_FAILED_TEST_CASES = 0;

//     // Instantiate DUT
//     bin2gray4 dut (
//         .bin_in(bin_in),
//         .gray_out(gray_out)
//     );

//     // VCD dump (Inputs -> Outputs -> Expected -> mismatch)
//     initial begin
//         $dumpfile("tb_bin2gray4.vcd");
//         $dumpvars(0,
//             tb_bin2gray4.bin_in,             // input
//             tb_bin2gray4.gray_out,           // output
//             tb_bin2gray4.expected_gray_out,  // expected
//             tb_bin2gray4.mismatch            // mismatch flag
//         );
//     end

//     // Golden model (same vector formula)
//     task compute_expected;
//         input [3:0] t_bin;
//         begin
//             expected_gray_out = t_bin ^ (t_bin >> 1);
//         end
//     endtask

//     task run_one;
//         input [3:0] t_bin;
//         begin
//             bin_in = t_bin;
//             compute_expected(t_bin);
//             #1; // settle

//             TOTAL_TEST_CASES++;
//             if (!mismatch) begin
//                 TOTAL_PASSED_TEST_CASES++;
//             end else begin
//                 TOTAL_FAILED_TEST_CASES++;
//                 $display("FAILED: bin=%b | gray=%b expected=%b mismatch=%b",
//                          bin_in, gray_out, expected_gray_out, mismatch);
//             end
//         end
//     endtask

//     integer i;
//     initial begin
//         // Exhaustive: cover all 16 input values
//         for (i = 0; i < 16; i = i + 1)
//             run_one(i[3:0]);

//         // Print full truth table (≤ 16 lines)
//         $display("bin  -> gray");
//         $display("------------");
//         for (i = 0; i < 16; i = i + 1) begin
//             bin_in = i[3:0];
//             compute_expected(i[3:0]);
//             #1;
//             $display("%b -> %b (exp=%b mismatch=%b)",
//                      bin_in, gray_out, expected_gray_out, mismatch);
//         end

//         // Summary
//         $display("======================================");
//         $display("TOTAL_TEST_CASES=%0d", TOTAL_TEST_CASES);
//         $display("TOTAL_PASSED_TEST_CASES=%0d", TOTAL_PASSED_TEST_CASES);
//         $display("TOTAL_FAILED_TEST_CASES=%0d", TOTAL_FAILED_TEST_CASES);
//         $display("ALL_TEST_CASES_PASSED=%s",
//                  (TOTAL_FAILED_TEST_CASES==0) ? "true" : "false");
//         $display("======================================");
//         $finish;
//     end
// endmodule