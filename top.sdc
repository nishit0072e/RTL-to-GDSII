create_clock -name CLK -period 1000 [get_ports CLK]
set_input_delay 5 -clock CLK [get_ports RST]
set_output_delay 5 -clock CLK [get_ports OUT]

