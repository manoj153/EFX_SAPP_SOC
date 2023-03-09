
// Efinity Top-level template
// Version: 2022.M.288
// Date: 2023-03-07 02:31

// Copyright (C) 2017 - 2022 Efinix Inc. All rights reserved.

// This file may be used as a starting point for Efinity synthesis top-level target.
// The port list here matches what is expected by Efinity constraint files generated
// by the Efinity Interface Designer.

// To use this:
//     #1)  Save this file with a different name to a different directory, where source files are kept.
//              Example: you may wish to save as /media/manoj/5121/prj/efinity_1_copy/efinity_1/ip/sapphire_soc_no_cache/Ti60F225_devkit/soc.v
//     #2)  Add the newly saved file into Efinity project as design file
//     #3)  Edit the top level entity in Efinity project to:  soc
//     #4)  Insert design content.


module soc
(
  input system_uart_0_io_rxd,
  input systemClk_locked,
  input clk0,
  input io_systemClk,
  input io_memoryClk,
  input jtag_inst1_CAPTURE,
  input jtag_inst1_SEL,
  input jtag_inst1_SHIFT,
  input jtag_inst1_TCK,
  input jtag_inst1_TDI,
  input io_asyncResetn,
  input my_pll_pin,
  input [3:0] system_gpio_0_io_read,
  input system_spi_0_io_data_0_read,
  input system_spi_0_io_data_1_read,
  output system_uart_0_io_txd,
  output baseClk_pll_rstn,
  output systemClk_rstn,
  output jtag_inst1_TDO,
  output memoryCheckerPass,
  output [3:0] system_gpio_0_io_write,
  output [3:0] system_gpio_0_io_writeEnable,
  output system_spi_0_io_data_0_write,
  output system_spi_0_io_data_0_writeEnable,
  output system_spi_0_io_data_1_write,
  output system_spi_0_io_data_1_writeEnable,
  output system_spi_0_io_sclk_write,
  output system_spi_0_io_ss
);


endmodule

