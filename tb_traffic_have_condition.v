module tb;
    reg clk;
    reg rst;
    reg condition;
    wire red,yellow,green;

    //module instantiation
    traffic_have_condition traffic(
        .clk(clk),
        .rst(rst),
        .condition(condition),
        .red(red),
        .yellow(yellow),
        .green(green)
    );

    always #5 clk = ~clk;
    initial begin
        $dumpfile("traffic_have_condition.vcd");
        $dumpvars(0,tb);
        clk = 0;
        rst = 1;
        condition = 0;
        #20 
        rst = 0;

        #1000;
        condition = 1;
        #1500;
        $finish; 
    end
endmodule