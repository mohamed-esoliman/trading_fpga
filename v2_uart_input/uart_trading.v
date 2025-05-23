module uart_trading(
    input clk,
    input rx,
    output reg LED0,
    output reg LED1
);
    wire [7:0] price_in;
    wire data_ready;

    reg [7:0] threshold = 8'd100;  // Hardcoded threshold

    uart_rx uart_inst (
        .clk(clk),
        .rx(rx),
        .data_out(price_in),
        .data_ready(data_ready)
    );

    always @(posedge clk) begin
        if (data_ready) begin
            if (price_in < threshold) begin
                LED1 <= 1;
                LED0 <= 0;
            end else if (price_in > threshold) begin
                LED0 <= 1;
                LED1 <= 0;
            end else begin
                LED0 <= 0;
                LED1 <= 0;
            end
        end
    end
endmodule
