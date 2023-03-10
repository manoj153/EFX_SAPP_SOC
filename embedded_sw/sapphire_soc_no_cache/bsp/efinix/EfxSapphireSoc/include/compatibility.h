#ifndef COMPATIBILITY_H 
#define COMPATIBILITY_H
#include "soc.h"

#ifdef SYSTEM_UART_0_IO_CTRL
    #define SYSTEM_UART_0_IO_APB SYSTEM_UART_0_IO_CTRL
#endif

#ifdef SYSTEM_UART_1_IO_CTRL
    #define SYSTEM_UART_1_IO_APB SYSTEM_UART_1_IO_CTRL
#endif

#ifdef SYSTEM_UART_2_IO_CTRL
    #define SYSTEM_UART_2_IO_APB SYSTEM_UART_2_IO_CTRL
#endif

#ifdef SYSTEM_SPI_0_IO_CTRL
    #define SYSTEM_SPI_0_IO_APB SYSTEM_SPI_0_IO_CTRL
#endif

#ifdef SYSTEM_SPI_1_IO_CTRL
    #define SYSTEM_SPI_1_IO_APB SYSTEM_SPI_1_IO_CTRL
#endif

#ifdef SYSTEM_SPI_2_IO_CTRL
    #define SYSTEM_SPI_2_IO_APB SYSTEM_SPI_2_IO_CTRL
#endif

#ifdef SYSTEM_I2C_0_IO_CTRL
    #define SYSTEM_I2C_0_IO_APB SYSTEM_I2C_0_IO_CTRL
#endif

#ifdef SYSTEM_I2C_1_IO_CTRL
    #define SYSTEM_I2C_1_IO_APB SYSTEM_I2C_1_IO_CTRL
#endif

#ifdef SYSTEM_I2C_2_IO_CTRL
    #define SYSTEM_I2C_2_IO_APB SYSTEM_I2C_2_IO_CTRL
#endif

#ifdef SYSTEM_BMB_PERIPHERAL_BMB
    #define SYSTEM_PERIPHERAL_BRIDGE_INPUT SYSTEM_BMB_PERIPHERAL_BMB
    #define SYSTEM_APB_DECODER_INPUT SYSTEM_BMB_PERIPHERAL_BMB
#endif

#ifdef SYSTEM_GPIO_0_IO_CTRL
    #define SYSTEM_GPIO_0_IO_APB SYSTEM_GPIO_0_IO_CTRL
#endif

#ifdef SYSTEM_GPIO_1_IO_CTRL
    #define SYSTEM_GPIO_1_IO_APB SYSTEM_GPIO_1_IO_CTRL
#endif

#ifdef IO_APB_SLAVE_0_INPUT
    #define IO_APB_SLAVE_0_APB IO_APB_SLAVE_0_INPUT
#endif

#ifdef IO_APB_SLAVE_1_INPUT
    #define IO_APB_SLAVE_1_APB IO_APB_SLAVE_1_INPUT
#endif

#ifdef IO_APB_SLAVE_2_INPUT
    #define IO_APB_SLAVE_2_APB IO_APB_SLAVE_2_INPUT
#endif

#ifdef IO_APB_SLAVE_3_INPUT
    #define IO_APB_SLAVE_3_APB IO_APB_SLAVE_3_INPUT
#endif

#ifdef IO_APB_SLAVE_4_INPUT
    #define IO_APB_SLAVE_4_APB IO_APB_SLAVE_4_INPUT
#endif

#ifdef SYSTEM_CLINT_CTRL
    #define SYSTEM_MACHINE_TIMER_APB SYSTEM_CLINT_CTRL
#endif

#ifdef SYSTEM_PLIC_CTRL
    #define SYSTEM_PLIC_APB SYSTEM_PLIC_CTRL
#endif

#ifdef SYSTEM_RAM_A_CTRL
    #define SYSTEM_RAM_A_BMB SYSTEM_RAM_A_CTRL
#endif

#ifdef SYSTEM_CORES_0_D_BUS
    #define SYSTEM_CPU_D_BUS SYSTEM_CORES_0_D_BUS
#endif

#ifdef SYSTEM_PLIC_SYSTEM_CORES_0_EXTERNAL_INTERRUPT
    #define SYSTEM_PLIC_SYSTEM_CPU_EXTERNAL_INTERRUPT SYSTEM_PLIC_SYSTEM_CORES_0_EXTERNAL_INTERRUPT
#endif

#ifdef SYSTEM_CLINT_HZ
    #define SYSTEM_MACHINE_TIMER_HZ SYSTEM_CLINT_HZ
#endif

#ifdef SYSTEM_AXI_A_BMB
    #define BMB SYSTEM_AXI_A_BMB
#endif

#endif
