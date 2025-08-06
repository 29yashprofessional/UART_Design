module baud_rate_tb;

    reg clk;
    reg rst;
    wire baud_tick;
    wire baud_tick_16x;

    uart_baud_generator #(
        .CLOCK_FREQ(1600000),  
        .BAUD_RATE(10000)
    ) uut (
        .clk(clk),
        .rst(rst),
        .baud_tick(baud_tick),
        .baud_tick_16x(baud_tick_16x)
    );
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  
    end

    initial begin
        $dumpfile("uart_baud_gen.vcd");
        $dumpvars(0, baud_rate_tb);
        
        rst = 1;
        #100;
        rst = 0;

        repeat(10) begin
            @(posedge baud_tick);
            $display("Baud tick at time %t", $time);
        end
        
        $display("Baud rate generator test completed");
        $finish;
    end
    
endmodule