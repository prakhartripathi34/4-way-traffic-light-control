module Traffic_Light_Controller_TB;
    reg clk, rst;
    wire [2:0] light_path_left;        
    wire [2:0] light_path_right  ;           
    wire [2:0] light_straight;           
    wire [2:0] light_back ;            

    Traffic_Light_Controller_new dut (
        .clk(clk), 
        .rst(rst), 
        .light_path_left(light_path_left), 
        .light_path_right(light_path_right),  
        .light_straight(light_straight),
        .light_back(light_back)
    );

    // Clock generation
    initial begin
        clk = 1'b0;
        forever #10 clk = ~clk; // 20ns period (50 MHz clock)
    end

    initial begin
        $dumpfile("traffic_new.vcd");
        $dumpvars(0, Traffic_Light_Controller_TB);
    end

    initial begin
        $monitor("At time %t: light_left=%b, light_right=%b, light_straight=%b, light_back=%b", 
                  $time, light_path_left, light_path_right, light_straight, light_back);
    end

    initial begin
        // Initial reset
        rst = 1;
        #20;
        rst = 0;

        // Allow the simulation to run for a sufficient time to observe behavior
        #10000; // Adjust time as needed to observe the full cycle
        $finish;
    end
endmodule
