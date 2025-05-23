## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

## UART RX (connect to USB-to-UART module or built-in UART)
set_property PACKAGE_PIN U1 [get_ports rx]
set_property IOSTANDARD LVCMOS33 [get_ports rx]

## LED Outputs
set_property PACKAGE_PIN U16 [get_ports LED0]
set_property IOSTANDARD LVCMOS33 [get_ports LED0]

set_property PACKAGE_PIN E19 [get_ports LED1]
set_property IOSTANDARD LVCMOS33 [get_ports LED1]

## LED2
set_property PACKAGE_PIN U19 [get_ports LED2]
set_property IOSTANDARD LVCMOS33 [get_ports LED2]

