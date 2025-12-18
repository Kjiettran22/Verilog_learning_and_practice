// `timescale 1ps/1ps
// module tb ;
//     reg clk;
//     reg rst;
//     wire red;
//     wire yellow;
//     wire green; 
    
//     //module instantiation
//     traffic_light trafic(
//         .clk(clk),
//         .rst(rst),
//         .red(red),
//         .yellow(yellow),
//         .green(green)
//     );
//     //set clock
//     always #5 clk = ~clk;
//     initial begin
//         clk = 0;
//         rst = 1;

//         #20
//         rst = ~rst;

//         #200

//         $finish;
//     end  ;
//     initial begin
//         $monitor("red = %b, yellow = %b, green = %b",red,yellow,green );
//     end  

// endmodule


`timescale 1ns/1ps

module traffic_light_tb;

    reg clk;
    reg rst;
    wire red;
    wire yellow;
    wire green;

    // Instantiate DUT (Device Under Test)
    traffic_light_cnt dut (
        .clk(clk),
        .rst(rst),
        .red(red),
        .yellow(yellow),
        .green(green)
    );

    // Clock generation: period = 10ns
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;

        // Reset for 2 clock cycles
        #20;
        rst = 0;

        // Run simulation
        #10000;

        // Finish simulation
        $finish;
    end

    // Monitor signals
    initial begin
        $monitor(
            "Time=%0t | rst=%b | RED=%b YELLOW=%b GREEN=%b",
            $time, rst, red, yellow, green
        );
    end

    // Optional: dump waveform for GTKWave
    initial begin
        $dumpfile("traffic_light.vcd");
        $dumpvars(0, traffic_light_tb);
    end

endmodule
