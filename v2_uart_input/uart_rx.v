module uart_rx(
    input clk,
    input rx,
    output reg [7:0] data_out,
    output reg data_ready
);
    parameter CLK_FREQ = 100_000_000;  // 100 MHz
    parameter BAUD_RATE = 9600;
    localparam CLKS_PER_BIT = CLK_FREQ / BAUD_RATE;

    reg [3:0] bit_index = 0;
    reg [12:0] clk_count = 0;
    reg [7:0] rx_shift = 0;
    reg receiving = 0;
    reg rx_d1 = 1, rx_d2 = 1;

    always @(posedge clk) begin
        rx_d1 <= rx;
        rx_d2 <= rx_d1;

        if (!receiving && rx_d2 == 0) begin
            receiving <= 1;
            clk_count <= CLKS_PER_BIT / 2;
            bit_index <= 0;
        end else if (receiving) begin
            clk_count <= clk_count + 1;

            if (clk_count >= CLKS_PER_BIT) begin
                clk_count <= 0;

                if (bit_index < 8) begin
                    rx_shift[bit_index] <= rx_d2;
                    bit_index <= bit_index + 1;
                end else begin
                    data_out <= rx_shift;
                    data_ready <= 1;
                    receiving <= 0;
                end
            end
        end else begin
            data_ready <= 0;
        end
    end
endmodule
