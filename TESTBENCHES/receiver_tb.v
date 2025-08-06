module receiver_tb;

    reg clk;
    reg rst;
    reg baud_tick_16x;
    reg rx_serial;
    wire [7:0] rx_data;
    wire rx_ready;
    wire rx_error;

    uart_receiver uut (
        .clk(clk),
        .rst(rst),
        .baud_tick_16x(baud_tick_16x),
        .rx_serial(rx_serial),
        .rx_data(rx_data),
        .rx_ready(rx_ready),
        .rx_error(rx_error)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        baud_tick_16x = 0;
        forever #32.5 baud_tick_16x = ~baud_tick_16x;  
    end

    task send_byte;
        input [7:0] data;
        integer i;
        begin

            rx_serial = 0;
            repeat(16) @(posedge baud_tick_16x);

            for (i = 0; i < 8; i = i + 1) begin
                rx_serial = data[i];
                repeat(16) @(posedge baud_tick_16x);
            end
            
            // Stop bit
            rx_serial = 1;
            repeat(16) @(posedge baud_tick_16x);
        end
    endtask

    initial begin
        $dumpfile("uart_rx.vcd");
        $dumpvars(0, receiver_tb);
        
        rst = 1;
        rx_serial = 1;
        #100;
        rst = 0;
        #100;

        send_byte(8'h41);
        
        @(posedge rx_ready);
        $display("Received data: 0x%02X at time %t", rx_data, $time);
        
        #1000;

        send_byte(8'h42);
        
        @(posedge rx_ready);
        $display("Received data: 0x%02X at time %t", rx_data, $time);
        
        #1000;
        $display("UART receiver test completed");
        $finish;
    end
    
endmodule