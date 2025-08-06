module uart_top_level #(
    parameter CLOCK_FREQ = 1600000,
    parameter BAUD_RATE = 10000
)(
    input wire clk,
    input wire rst,

    input wire [7:0] tx_data,
    input wire tx_start,
    output wire tx_serial,
    output wire tx_busy,
    output wire tx_done,

    input wire rx_serial,
    output wire [7:0] rx_data,
    output wire rx_ready,
    output wire rx_error
);

    wire baud_tick;
    wire baud_tick_16x;

    uart_baud_generator #(
        .CLOCK_FREQ(CLOCK_FREQ),
        .BAUD_RATE(BAUD_RATE)
    ) baud_generator_inst (
        .clk(clk),
        .rst(rst),
        .baud_tick(baud_tick),
        .baud_tick_16x(baud_tick_16x)
    );

    uart_transmitter transmitter_inst (
        .clk(clk),
        .rst(rst),
        .baud_tick(baud_tick),
        .tx_data(tx_data),
        .tx_start(tx_start),
        .tx_serial(tx_serial),
        .tx_busy(tx_busy),
        .tx_done(tx_done)
    );

    uart_receiver receiver_inst (
        .clk(clk),
        .rst(rst),
        .baud_tick_16x(baud_tick_16x),
        .rx_serial(rx_serial),
        .rx_data(rx_data),
        .rx_ready(rx_ready),
        .rx_error(rx_error)
    );

endmodule