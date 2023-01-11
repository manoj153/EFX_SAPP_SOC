
# Efinity Interface Designer SDC
# Version: 2022.M.288
# Date: 2023-01-10 18:11

# Copyright (C) 2017 - 2022 Efinix Inc. All rights reserved.

# Device: Ti60F225
# Project: soc
# Timing Model: C4 (final)

# PLL Constraints
#################
create_clock -period 40.0000 clk0
create_clock -period 10.0000 io_memoryClk
create_clock -period 10.0000 io_systemClk

# GPIO Constraints
####################
# set_input_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -max <MAX CALCULATION> [get_ports {system_uart_0_io_rxd}]
# set_input_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -min <MIN CALCULATION> [get_ports {system_uart_0_io_rxd}]
# set_output_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -max <MAX CALCULATION> [get_ports {system_uart_0_io_txd}]
# set_output_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -min <MIN CALCULATION> [get_ports {system_uart_0_io_txd}]

# JTAG Constraints
####################
# create_clock -period <USER_PERIOD> [get_ports {jtag_inst1_TCK}]
set_output_delay -clock jtag_inst1_TCK -max 0.117 [get_ports {jtag_inst1_TDO}]
set_output_delay -clock jtag_inst1_TCK -min -0.075 [get_ports {jtag_inst1_TDO}]
set_input_delay -clock_fall -clock jtag_inst1_TCK -max 0.280 [get_ports {jtag_inst1_CAPTURE}]
set_input_delay -clock_fall -clock jtag_inst1_TCK -min 0.187 [get_ports {jtag_inst1_CAPTURE}]
set_input_delay -clock_fall -clock jtag_inst1_TCK -max 0.243 [get_ports {jtag_inst1_SEL}]
set_input_delay -clock_fall -clock jtag_inst1_TCK -min 0.162 [get_ports {jtag_inst1_SEL}]
set_input_delay -clock_fall -clock jtag_inst1_TCK -max 0.337 [get_ports {jtag_inst1_SHIFT}]
set_input_delay -clock_fall -clock jtag_inst1_TCK -min 0.225 [get_ports {jtag_inst1_SHIFT}]

# HSIO GPIO Constraints
#########################
# set_input_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -max <MAX CALCULATION> [get_ports {io_asyncResetn}]
# set_input_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -min <MIN CALCULATION> [get_ports {io_asyncResetn}]
# set_output_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -max <MAX CALCULATION> [get_ports {memoryCheckerPass}]
# set_output_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -min <MIN CALCULATION> [get_ports {memoryCheckerPass}]
set_output_delay -clock io_systemClk -reference_pin [get_ports {io_systemClk~CLKOUT~1~31}] -max 0.263 [get_ports {system_spi_0_io_sclk_write}]
set_output_delay -clock io_systemClk -reference_pin [get_ports {io_systemClk~CLKOUT~1~31}] -min -0.140 [get_ports {system_spi_0_io_sclk_write}]
set_output_delay -clock io_systemClk -reference_pin [get_ports {io_systemClk~CLKOUT~1~30}] -max 0.263 [get_ports {system_spi_0_io_ss}]
set_output_delay -clock io_systemClk -reference_pin [get_ports {io_systemClk~CLKOUT~1~30}] -min -0.140 [get_ports {system_spi_0_io_ss}]
# set_input_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -max <MAX CALCULATION> [get_ports {system_gpio_0_io_read[0]}]
# set_input_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -min <MIN CALCULATION> [get_ports {system_gpio_0_io_read[0]}]
# set_output_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -max <MAX CALCULATION> [get_ports {system_gpio_0_io_write[0]}]
# set_output_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -min <MIN CALCULATION> [get_ports {system_gpio_0_io_write[0]}]
# set_output_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -max <MAX CALCULATION> [get_ports {system_gpio_0_io_writeEnable[0]}]
# set_output_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -min <MIN CALCULATION> [get_ports {system_gpio_0_io_writeEnable[0]}]
# set_input_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -max <MAX CALCULATION> [get_ports {system_gpio_0_io_read[1]}]
# set_input_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -min <MIN CALCULATION> [get_ports {system_gpio_0_io_read[1]}]
# set_output_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -max <MAX CALCULATION> [get_ports {system_gpio_0_io_write[1]}]
# set_output_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -min <MIN CALCULATION> [get_ports {system_gpio_0_io_write[1]}]
# set_output_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -max <MAX CALCULATION> [get_ports {system_gpio_0_io_writeEnable[1]}]
# set_output_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -min <MIN CALCULATION> [get_ports {system_gpio_0_io_writeEnable[1]}]
# set_input_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -max <MAX CALCULATION> [get_ports {system_gpio_0_io_read[2]}]
# set_input_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -min <MIN CALCULATION> [get_ports {system_gpio_0_io_read[2]}]
# set_output_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -max <MAX CALCULATION> [get_ports {system_gpio_0_io_write[2]}]
# set_output_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -min <MIN CALCULATION> [get_ports {system_gpio_0_io_write[2]}]
# set_output_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -max <MAX CALCULATION> [get_ports {system_gpio_0_io_writeEnable[2]}]
# set_output_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -min <MIN CALCULATION> [get_ports {system_gpio_0_io_writeEnable[2]}]
# set_input_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -max <MAX CALCULATION> [get_ports {system_gpio_0_io_read[3]}]
# set_input_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -min <MIN CALCULATION> [get_ports {system_gpio_0_io_read[3]}]
# set_output_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -max <MAX CALCULATION> [get_ports {system_gpio_0_io_write[3]}]
# set_output_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -min <MIN CALCULATION> [get_ports {system_gpio_0_io_write[3]}]
# set_output_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -max <MAX CALCULATION> [get_ports {system_gpio_0_io_writeEnable[3]}]
# set_output_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -min <MIN CALCULATION> [get_ports {system_gpio_0_io_writeEnable[3]}]
set_input_delay -clock io_systemClk -reference_pin [get_ports {io_systemClk~CLKOUT~1~59}] -max 0.414 [get_ports {system_spi_0_io_data_0_read}]
set_input_delay -clock io_systemClk -reference_pin [get_ports {io_systemClk~CLKOUT~1~59}] -min 0.276 [get_ports {system_spi_0_io_data_0_read}]
set_output_delay -clock io_systemClk -reference_pin [get_ports {io_systemClk~CLKOUT~1~61}] -max 0.263 [get_ports {system_spi_0_io_data_0_write}]
set_output_delay -clock io_systemClk -reference_pin [get_ports {io_systemClk~CLKOUT~1~61}] -min -0.140 [get_ports {system_spi_0_io_data_0_write}]
set_output_delay -clock io_systemClk -reference_pin [get_ports {io_systemClk~CLKOUT~1~61}] -max 0.263 [get_ports {system_spi_0_io_data_0_writeEnable}]
set_output_delay -clock io_systemClk -reference_pin [get_ports {io_systemClk~CLKOUT~1~61}] -min -0.140 [get_ports {system_spi_0_io_data_0_writeEnable}]
set_input_delay -clock io_systemClk -reference_pin [get_ports {io_systemClk~CLKOUT~1~60}] -max 0.414 [get_ports {system_spi_0_io_data_1_read}]
set_input_delay -clock io_systemClk -reference_pin [get_ports {io_systemClk~CLKOUT~1~60}] -min 0.276 [get_ports {system_spi_0_io_data_1_read}]
set_output_delay -clock io_systemClk -reference_pin [get_ports {io_systemClk~CLKOUT~1~62}] -max 0.263 [get_ports {system_spi_0_io_data_1_write}]
set_output_delay -clock io_systemClk -reference_pin [get_ports {io_systemClk~CLKOUT~1~62}] -min -0.140 [get_ports {system_spi_0_io_data_1_write}]
set_output_delay -clock io_systemClk -reference_pin [get_ports {io_systemClk~CLKOUT~1~62}] -max 0.263 [get_ports {system_spi_0_io_data_1_writeEnable}]
set_output_delay -clock io_systemClk -reference_pin [get_ports {io_systemClk~CLKOUT~1~62}] -min -0.140 [get_ports {system_spi_0_io_data_1_writeEnable}]

# Clockout Interface
######################
# system_spi_0_io_data_0 -clock io_systemClk -reference_pin [get_ports {io_systemClk~CLKOUT~1~59}]
# system_spi_0_io_data_0 -clock io_systemClk -reference_pin [get_ports {io_systemClk~CLKOUT~1~61}]
# system_spi_0_io_data_1 -clock io_systemClk -reference_pin [get_ports {io_systemClk~CLKOUT~1~60}]
# system_spi_0_io_data_1 -clock io_systemClk -reference_pin [get_ports {io_systemClk~CLKOUT~1~62}]
# system_spi_0_io_sclk_write -clock io_systemClk -reference_pin [get_ports {io_systemClk~CLKOUT~1~31}]
# system_spi_0_io_ss -clock io_systemClk -reference_pin [get_ports {io_systemClk~CLKOUT~1~30}]
