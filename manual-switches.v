// trading_algo.v
// Simple FPGA trading algorithm for Basys 3
// Shows BUY/SELL signal based on price vs. threshold

module trading_algo (
    input wire [7:0] price_in,     // Price input from SW0–SW7
    input wire [7:0] threshold,    // Threshold input from SW8–SW15
    output wire [1:0] leds         // LED[0] = SELL, LED[1] = BUY
);

    wire buy_signal;
    wire sell_signal;

    assign buy_signal = (price_in < threshold);
    assign sell_signal = (price_in > threshold);

    assign leds[0] = sell_signal;  // LED 0 → SELL
    assign leds[1] = buy_signal;   // LED 1 → BUY

endmodule
