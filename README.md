# FPGA Trading Algorithm on Basys 3

This project demonstrates a simple hardware-based trading algorithm implemented in Verilog and deployed on the Basys 3 FPGA board. It compares a market price to a threshold and signals BUY or SELL using onboard LEDs.

Two versions of the algorithm are currently implemented.

---

## Version 1: Manual Switch Input (`v1.0-switch-input`)

Located in [`v1_manual_switch`](./v1_manual_switch)

### How It Works

- `price_in[7:0]` is set using switches SW0 through SW7
- `threshold[7:0]` is set using switches SW8 through SW15

**Output behavior**:
- LED1 turns on if `price_in < threshold` → **BUY**
- LED0 turns on if `price_in > threshold` → **SELL**
- No LED lights up if `price_in == threshold`

### How to Use (Vivado)

1. Create a new Vivado project
2. Choose the part: `xc7a35tcpg236-1` (Artix-7, used by Basys 3)
3. Add:
   - `manual_switches.v` (Verilog module)
   - `manual_switches.xdc` (constraints file)
4. Set `manual_switches` as the top module
5. Run synthesis → implementation → generate bitstream
6. Open Hardware Manager and program the board
7. Flip switches to test and observe LED0/LED1

---

## Version 2: UART Input (`v2.0-uart-input`)

Located in [`v2_uart_input`](./v2_uart_input)

### How It Works

- `price_in[7:0]` is received via UART (from a computer script)
- `threshold` is hardcoded in Verilog (`8'd100`)

**Output behavior**:
- LED1 turns on if `price_in < threshold` → **BUY**
- LED0 turns on if `price_in > threshold` → **SELL**
- LED2 flashes when new UART data is received (debug indicator)

### How to Use

1. Create a new Vivado project
2. Choose part: `xc7a35tcpg236-1`
3. Add:
   - `uart_trading.v` (top module)
   - `uart_rx.v` (UART receiver)
   - `uart_input.xdc` (constraints file)
4. Set `uart_trading` as top module
5. Run synthesis → implementation → generate bitstream
6. Open Hardware Manager and program the board
7. Use the included Python script (`send_price.py`) to transmit price data over `/dev/ttyUSB1`:
   ```bash
   python3 send_price.py
   ```

---

## Release Versions

- `v1.0-switch-input`: Manual switch version
- `v2.0-uart-input`: UART input with debug LED

More features such as UART threshold updates, displays, and FIFO buffering may be added in future versions.

---

## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.

---

## Acknowledgments

Special thanks to [Professor Simon Levy](https://github.com/simondlevy) for his guidance and support throughout this project.
