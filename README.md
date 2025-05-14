# FPGA Trading Algorithm – Manual Switch Version (Basys 3)

This is the initial version of a simple trading algorithm implemented in Verilog and deployed on the Basys 3 FPGA board. It compares two 8-bit values: a market price and a threshold, both set manually using the board’s switches. It outputs a BUY or SELL signal using onboard LEDs.

## How It Works

- `price_in[7:0]` is set using switches SW0 through SW7
- `threshold[7:0]` is set using switches SW8 through SW15

Output behavior:
- LED1 turns on if `price_in` < `threshold` (BUY)
- LED0 turns on if `price_in` > `threshold` (SELL)
- No LED lights up if `price_in` == `threshold`

## How to Use (Vivado)

1. Create a new Vivado project
2. Choose the part: `xc7a35tcpg236-1` (Artix-7, used by Basys 3)
3. Add the following files:
   - `manual_switches.v` (Verilog module)
   - `manual_switches.xdc` (constraints file)
4. Set `manual_switches` as the top module
5. Run synthesis → implementation → generate bitstream
6. Open Hardware Manager and program the board
7. Test by flipping switches SW0–SW15 and observing LED0 and LED1

## Release Version

This is `v1.0`. Future versions will include alternate input methods (e.g., UART), displays, and more advanced logic.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

## Acknowledgments
Special thanks to [Professor Simon Levy](https://github.com/simondlevy) for his guidance and support throughout this project.

