
build/uartEchoDemo.elf:     file format elf32-littleriscv


Disassembly of section .init:

f9000000 <_start>:

_start:
#ifdef USE_GP
.option push
.option norelax
	la gp, __global_pointer$
f9000000:	00001197          	auipc	gp,0x1
f9000004:	dd018193          	addi	gp,gp,-560 # f9000dd0 <__global_pointer$>

f9000008 <init>:
	sw a0, smp_lottery_lock, a1
    ret
#endif

init:
	la sp, _sp
f9000008:	42018113          	addi	sp,gp,1056 # f90011f0 <__freertos_irq_stack_top>

	/* Load data section */
	la a0, _data_lma
f900000c:	00000517          	auipc	a0,0x0
f9000010:	50050513          	addi	a0,a0,1280 # f900050c <__init_array_end>
	la a1, _data
f9000014:	00000597          	auipc	a1,0x0
f9000018:	4f858593          	addi	a1,a1,1272 # f900050c <__init_array_end>
	la a2, _edata
f900001c:	81c18613          	addi	a2,gp,-2020 # f90005ec <__bss_start>
	bgeu a1, a2, 2f
f9000020:	00c5fc63          	bgeu	a1,a2,f9000038 <init+0x30>
1:
	lw t0, (a0)
f9000024:	00052283          	lw	t0,0(a0)
	sw t0, (a1)
f9000028:	0055a023          	sw	t0,0(a1)
	addi a0, a0, 4
f900002c:	00450513          	addi	a0,a0,4
	addi a1, a1, 4
f9000030:	00458593          	addi	a1,a1,4
	bltu a1, a2, 1b
f9000034:	fec5e8e3          	bltu	a1,a2,f9000024 <init+0x1c>
2:

	/* Clear bss section */
	la a0, __bss_start
f9000038:	81c18513          	addi	a0,gp,-2020 # f90005ec <__bss_start>
	la a1, _end
f900003c:	82018593          	addi	a1,gp,-2016 # f90005f0 <_end>
	bgeu a0, a1, 2f
f9000040:	00b57863          	bgeu	a0,a1,f9000050 <init+0x48>
1:
	sw zero, (a0)
f9000044:	00052023          	sw	zero,0(a0)
	addi a0, a0, 4
f9000048:	00450513          	addi	a0,a0,4
	bltu a0, a1, 1b
f900004c:	feb56ce3          	bltu	a0,a1,f9000044 <init+0x3c>
2:

#ifndef NO_LIBC_INIT_ARRAY
	call __libc_init_array
f9000050:	010000ef          	jal	ra,f9000060 <__libc_init_array>
#endif

	call main
f9000054:	46c000ef          	jal	ra,f90004c0 <main>

f9000058 <mainDone>:
mainDone:
    j mainDone
f9000058:	0000006f          	j	f9000058 <mainDone>

f900005c <_init>:


	.globl _init
_init:
    ret
f900005c:	00008067          	ret

Disassembly of section .text:

f9000060 <__libc_init_array>:
f9000060:	ff010113          	addi	sp,sp,-16
f9000064:	00812423          	sw	s0,8(sp)
f9000068:	01212023          	sw	s2,0(sp)
f900006c:	00000417          	auipc	s0,0x0
f9000070:	4a040413          	addi	s0,s0,1184 # f900050c <__init_array_end>
f9000074:	00000917          	auipc	s2,0x0
f9000078:	49890913          	addi	s2,s2,1176 # f900050c <__init_array_end>
f900007c:	40890933          	sub	s2,s2,s0
f9000080:	00112623          	sw	ra,12(sp)
f9000084:	00912223          	sw	s1,4(sp)
f9000088:	40295913          	srai	s2,s2,0x2
f900008c:	00090e63          	beqz	s2,f90000a8 <__libc_init_array+0x48>
f9000090:	00000493          	li	s1,0
f9000094:	00042783          	lw	a5,0(s0)
f9000098:	00148493          	addi	s1,s1,1
f900009c:	00440413          	addi	s0,s0,4
f90000a0:	000780e7          	jalr	a5
f90000a4:	fe9918e3          	bne	s2,s1,f9000094 <__libc_init_array+0x34>
f90000a8:	00000417          	auipc	s0,0x0
f90000ac:	46440413          	addi	s0,s0,1124 # f900050c <__init_array_end>
f90000b0:	00000917          	auipc	s2,0x0
f90000b4:	45c90913          	addi	s2,s2,1116 # f900050c <__init_array_end>
f90000b8:	40890933          	sub	s2,s2,s0
f90000bc:	40295913          	srai	s2,s2,0x2
f90000c0:	00090e63          	beqz	s2,f90000dc <__libc_init_array+0x7c>
f90000c4:	00000493          	li	s1,0
f90000c8:	00042783          	lw	a5,0(s0)
f90000cc:	00148493          	addi	s1,s1,1
f90000d0:	00440413          	addi	s0,s0,4
f90000d4:	000780e7          	jalr	a5
f90000d8:	fe9918e3          	bne	s2,s1,f90000c8 <__libc_init_array+0x68>
f90000dc:	00c12083          	lw	ra,12(sp)
f90000e0:	00812403          	lw	s0,8(sp)
f90000e4:	00412483          	lw	s1,4(sp)
f90000e8:	00012903          	lw	s2,0(sp)
f90000ec:	01010113          	addi	sp,sp,16
f90000f0:	00008067          	ret

f90000f4 <uart_writeAvailability>:
#include "type.h"
#include "soc.h"


    static inline u32 read_u32(u32 address){
        return *((volatile u32*) address);
f90000f4:	00452503          	lw	a0,4(a0)
        enum UartStop stop;
        u32 clockDivider;
    } Uart_Config;
    
    static u32 uart_writeAvailability(u32 reg){
        return (read_u32(reg + UART_STATUS) >> 16) & 0xFF;
f90000f8:	01055513          	srli	a0,a0,0x10
    }
f90000fc:	0ff57513          	andi	a0,a0,255
f9000100:	00008067          	ret

f9000104 <uart_readOccupancy>:
f9000104:	00452503          	lw	a0,4(a0)
    static u32 uart_readOccupancy(u32 reg){
        return read_u32(reg + UART_STATUS) >> 24;
    }
f9000108:	01855513          	srli	a0,a0,0x18
f900010c:	00008067          	ret

f9000110 <uart_write>:
    
    static void uart_write(u32 reg, char data){
f9000110:	ff010113          	addi	sp,sp,-16
f9000114:	00112623          	sw	ra,12(sp)
f9000118:	00812423          	sw	s0,8(sp)
f900011c:	00912223          	sw	s1,4(sp)
f9000120:	00050413          	mv	s0,a0
f9000124:	00058493          	mv	s1,a1
        while(uart_writeAvailability(reg) == 0);
f9000128:	00040513          	mv	a0,s0
f900012c:	fc9ff0ef          	jal	ra,f90000f4 <uart_writeAvailability>
f9000130:	fe050ce3          	beqz	a0,f9000128 <uart_write+0x18>
    }
    
    static inline void write_u32(u32 data, u32 address){
        *((volatile u32*) address) = data;
f9000134:	00942023          	sw	s1,0(s0)
        write_u32(data, reg + UART_DATA);
    }
f9000138:	00c12083          	lw	ra,12(sp)
f900013c:	00812403          	lw	s0,8(sp)
f9000140:	00412483          	lw	s1,4(sp)
f9000144:	01010113          	addi	sp,sp,16
f9000148:	00008067          	ret

f900014c <uart_read>:
    
    static void uart_writeStr(u32 reg, const char* str){
        while(*str) uart_write(reg, *str++);
    }
    
    static char uart_read(u32 reg){
f900014c:	ff010113          	addi	sp,sp,-16
f9000150:	00112623          	sw	ra,12(sp)
f9000154:	00812423          	sw	s0,8(sp)
f9000158:	00050413          	mv	s0,a0
        while(uart_readOccupancy(reg) == 0);
f900015c:	00040513          	mv	a0,s0
f9000160:	fa5ff0ef          	jal	ra,f9000104 <uart_readOccupancy>
f9000164:	fe050ce3          	beqz	a0,f900015c <uart_read+0x10>
        return *((volatile u32*) address);
f9000168:	00042503          	lw	a0,0(s0)
        return read_u32(reg + UART_DATA);
    }
f900016c:	0ff57513          	andi	a0,a0,255
f9000170:	00c12083          	lw	ra,12(sp)
f9000174:	00812403          	lw	s0,8(sp)
f9000178:	01010113          	addi	sp,sp,16
f900017c:	00008067          	ret

f9000180 <bsp_printHex>:
#define ENABLE_BRIDGE_FULL_TO_LITE          1 // If this is enabled, bsp_printf_full can be called with bsp_printf. Enabling both ENABLE_BSP_PRINTF and ENABLE_BSP_PRINTF_FULL, bsp_printf_full will be remained as bsp_printf_full. Default: Enable
#define ENABLE_PRINTF_WARNING               1 // Print warning when the specifier not supported. Default: Enable

    //bsp_printHex is used in BSP_PRINTF
    static void bsp_printHex(uint32_t val)
    {
f9000180:	ff010113          	addi	sp,sp,-16
f9000184:	00112623          	sw	ra,12(sp)
f9000188:	00812423          	sw	s0,8(sp)
f900018c:	00912223          	sw	s1,4(sp)
f9000190:	00050493          	mv	s1,a0
        uint32_t digits;
        digits =8;

        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f9000194:	01c00413          	li	s0,28
f9000198:	0280006f          	j	f90001c0 <bsp_printHex+0x40>
            uart_write(BSP_UART_TERMINAL, "0123456789ABCDEF"[(val >> i) % 16]);
f900019c:	0084d7b3          	srl	a5,s1,s0
f90001a0:	00f7f713          	andi	a4,a5,15
f90001a4:	f90007b7          	lui	a5,0xf9000
f90001a8:	50c78793          	addi	a5,a5,1292 # f900050c <__freertos_irq_stack_top+0xfffff31c>
f90001ac:	00e787b3          	add	a5,a5,a4
f90001b0:	0007c583          	lbu	a1,0(a5)
f90001b4:	f8010537          	lui	a0,0xf8010
f90001b8:	f59ff0ef          	jal	ra,f9000110 <uart_write>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f90001bc:	ffc40413          	addi	s0,s0,-4
f90001c0:	fc045ee3          	bgez	s0,f900019c <bsp_printHex+0x1c>
        }
    }
f90001c4:	00c12083          	lw	ra,12(sp)
f90001c8:	00812403          	lw	s0,8(sp)
f90001cc:	00412483          	lw	s1,4(sp)
f90001d0:	01010113          	addi	sp,sp,16
f90001d4:	00008067          	ret

f90001d8 <bsp_printHex_lower>:

    static void bsp_printHex_lower(uint32_t val)
        {
f90001d8:	ff010113          	addi	sp,sp,-16
f90001dc:	00112623          	sw	ra,12(sp)
f90001e0:	00812423          	sw	s0,8(sp)
f90001e4:	00912223          	sw	s1,4(sp)
f90001e8:	00050493          	mv	s1,a0
            uint32_t digits;
            digits =8;

            for (int i = (4*digits)-4; i >= 0; i -= 4) {
f90001ec:	01c00413          	li	s0,28
f90001f0:	0280006f          	j	f9000218 <bsp_printHex_lower+0x40>
                uart_write(BSP_UART_TERMINAL, "0123456789abcdef"[(val >> i) % 16]);
f90001f4:	0084d7b3          	srl	a5,s1,s0
f90001f8:	00f7f713          	andi	a4,a5,15
f90001fc:	f90007b7          	lui	a5,0xf9000
f9000200:	52078793          	addi	a5,a5,1312 # f9000520 <__freertos_irq_stack_top+0xfffff330>
f9000204:	00e787b3          	add	a5,a5,a4
f9000208:	0007c583          	lbu	a1,0(a5)
f900020c:	f8010537          	lui	a0,0xf8010
f9000210:	f01ff0ef          	jal	ra,f9000110 <uart_write>
            for (int i = (4*digits)-4; i >= 0; i -= 4) {
f9000214:	ffc40413          	addi	s0,s0,-4
f9000218:	fc045ee3          	bgez	s0,f90001f4 <bsp_printHex_lower+0x1c>
            }
        }
f900021c:	00c12083          	lw	ra,12(sp)
f9000220:	00812403          	lw	s0,8(sp)
f9000224:	00412483          	lw	s1,4(sp)
f9000228:	01010113          	addi	sp,sp,16
f900022c:	00008067          	ret

f9000230 <bsp_printf_c>:
    }

    #endif //#if (ENABLE_FLOATING_POINT_SUPPORT)

    static void bsp_printf_c(int c)
    {
f9000230:	ff010113          	addi	sp,sp,-16
f9000234:	00112623          	sw	ra,12(sp)
        bsp_putChar(c);
f9000238:	0ff57593          	andi	a1,a0,255
f900023c:	f8010537          	lui	a0,0xf8010
f9000240:	ed1ff0ef          	jal	ra,f9000110 <uart_write>
    }
f9000244:	00c12083          	lw	ra,12(sp)
f9000248:	01010113          	addi	sp,sp,16
f900024c:	00008067          	ret

f9000250 <bsp_printf_s>:
    
    static void bsp_printf_s(char *p)
    {
f9000250:	ff010113          	addi	sp,sp,-16
f9000254:	00112623          	sw	ra,12(sp)
f9000258:	00812423          	sw	s0,8(sp)
f900025c:	00050413          	mv	s0,a0
        while (*p)
f9000260:	00044583          	lbu	a1,0(s0)
f9000264:	00058a63          	beqz	a1,f9000278 <bsp_printf_s+0x28>
            bsp_putChar(*(p++));
f9000268:	00140413          	addi	s0,s0,1
f900026c:	f8010537          	lui	a0,0xf8010
f9000270:	ea1ff0ef          	jal	ra,f9000110 <uart_write>
f9000274:	fedff06f          	j	f9000260 <bsp_printf_s+0x10>
    }
f9000278:	00c12083          	lw	ra,12(sp)
f900027c:	00812403          	lw	s0,8(sp)
f9000280:	01010113          	addi	sp,sp,16
f9000284:	00008067          	ret

f9000288 <bsp_printf_d>:
    
    static void bsp_printf_d(int val)
    {
f9000288:	fd010113          	addi	sp,sp,-48
f900028c:	02112623          	sw	ra,44(sp)
f9000290:	02812423          	sw	s0,40(sp)
f9000294:	02912223          	sw	s1,36(sp)
f9000298:	00050493          	mv	s1,a0
        char buffer[32];
        char *p = buffer;
        if (val < 0) {
f900029c:	00054663          	bltz	a0,f90002a8 <bsp_printf_d+0x20>
    {
f90002a0:	00010413          	mv	s0,sp
f90002a4:	02c0006f          	j	f90002d0 <bsp_printf_d+0x48>
            bsp_printf_c('-');
f90002a8:	02d00513          	li	a0,45
f90002ac:	f85ff0ef          	jal	ra,f9000230 <bsp_printf_c>
            val = -val;
f90002b0:	409004b3          	neg	s1,s1
f90002b4:	fedff06f          	j	f90002a0 <bsp_printf_d+0x18>
        }
        while (val || p == buffer) {
            *(p++) = '0' + val % 10;
f90002b8:	00a00713          	li	a4,10
f90002bc:	02e4e7b3          	rem	a5,s1,a4
f90002c0:	03078793          	addi	a5,a5,48
f90002c4:	00f40023          	sb	a5,0(s0)
            val = val / 10;
f90002c8:	02e4c4b3          	div	s1,s1,a4
            *(p++) = '0' + val % 10;
f90002cc:	00140413          	addi	s0,s0,1
        while (val || p == buffer) {
f90002d0:	fe0494e3          	bnez	s1,f90002b8 <bsp_printf_d+0x30>
f90002d4:	00010793          	mv	a5,sp
f90002d8:	fef400e3          	beq	s0,a5,f90002b8 <bsp_printf_d+0x30>
f90002dc:	0100006f          	j	f90002ec <bsp_printf_d+0x64>
        }
        while (p != buffer)
            bsp_printf_c(*(--p));
f90002e0:	fff40413          	addi	s0,s0,-1
f90002e4:	00044503          	lbu	a0,0(s0)
f90002e8:	f49ff0ef          	jal	ra,f9000230 <bsp_printf_c>
        while (p != buffer)
f90002ec:	00010793          	mv	a5,sp
f90002f0:	fef418e3          	bne	s0,a5,f90002e0 <bsp_printf_d+0x58>
    }
f90002f4:	02c12083          	lw	ra,44(sp)
f90002f8:	02812403          	lw	s0,40(sp)
f90002fc:	02412483          	lw	s1,36(sp)
f9000300:	03010113          	addi	sp,sp,48
f9000304:	00008067          	ret

f9000308 <bsp_printf_x>:
    
    static void bsp_printf_x(int val)
    {
f9000308:	ff010113          	addi	sp,sp,-16
f900030c:	00112623          	sw	ra,12(sp)
        int i,digi=2;
    
        for(i=0;i<8;i++)
f9000310:	00000713          	li	a4,0
f9000314:	00700793          	li	a5,7
f9000318:	02e7c063          	blt	a5,a4,f9000338 <bsp_printf_x+0x30>
        {
            if((val & (0xFFFFFFF0 <<(4*i))) == 0)
f900031c:	00271693          	slli	a3,a4,0x2
f9000320:	ff000793          	li	a5,-16
f9000324:	00d797b3          	sll	a5,a5,a3
f9000328:	00f577b3          	and	a5,a0,a5
f900032c:	00078663          	beqz	a5,f9000338 <bsp_printf_x+0x30>
        for(i=0;i<8;i++)
f9000330:	00170713          	addi	a4,a4,1
f9000334:	fe1ff06f          	j	f9000314 <bsp_printf_x+0xc>
            {
                digi=i+1;
                break;
            }
        }
        bsp_printHex_lower(val);
f9000338:	ea1ff0ef          	jal	ra,f90001d8 <bsp_printHex_lower>
    }
f900033c:	00c12083          	lw	ra,12(sp)
f9000340:	01010113          	addi	sp,sp,16
f9000344:	00008067          	ret

f9000348 <bsp_printf_X>:
    
    static void bsp_printf_X(int val)
        {
f9000348:	ff010113          	addi	sp,sp,-16
f900034c:	00112623          	sw	ra,12(sp)
            int i,digi=2;

            for(i=0;i<8;i++)
f9000350:	00000713          	li	a4,0
f9000354:	00700793          	li	a5,7
f9000358:	02e7c063          	blt	a5,a4,f9000378 <bsp_printf_X+0x30>
            {
                if((val & (0xFFFFFFF0 <<(4*i))) == 0)
f900035c:	00271693          	slli	a3,a4,0x2
f9000360:	ff000793          	li	a5,-16
f9000364:	00d797b3          	sll	a5,a5,a3
f9000368:	00f577b3          	and	a5,a0,a5
f900036c:	00078663          	beqz	a5,f9000378 <bsp_printf_X+0x30>
            for(i=0;i<8;i++)
f9000370:	00170713          	addi	a4,a4,1
f9000374:	fe1ff06f          	j	f9000354 <bsp_printf_X+0xc>
                {
                    digi=i+1;
                    break;
                }
            }
            bsp_printHex(val);
f9000378:	e09ff0ef          	jal	ra,f9000180 <bsp_printHex>
        }
f900037c:	00c12083          	lw	ra,12(sp)
f9000380:	01010113          	addi	sp,sp,16
f9000384:	00008067          	ret

f9000388 <bsp_printf>:

    static void bsp_printf(const char *format, ...)
    {
f9000388:	fc010113          	addi	sp,sp,-64
f900038c:	00112e23          	sw	ra,28(sp)
f9000390:	00812c23          	sw	s0,24(sp)
f9000394:	00912a23          	sw	s1,20(sp)
f9000398:	00050493          	mv	s1,a0
f900039c:	02b12223          	sw	a1,36(sp)
f90003a0:	02c12423          	sw	a2,40(sp)
f90003a4:	02d12623          	sw	a3,44(sp)
f90003a8:	02e12823          	sw	a4,48(sp)
f90003ac:	02f12a23          	sw	a5,52(sp)
f90003b0:	03012c23          	sw	a6,56(sp)
f90003b4:	03112e23          	sw	a7,60(sp)
        int i;
        va_list ap;
    
        va_start(ap, format);
f90003b8:	02410793          	addi	a5,sp,36
f90003bc:	00f12623          	sw	a5,12(sp)
    
        for (i = 0; format[i]; i++)
f90003c0:	00000413          	li	s0,0
f90003c4:	01c0006f          	j	f90003e0 <bsp_printf+0x58>
            if (format[i] == '%') {
                while (format[++i]) {
                    if (format[i] == 'c') {
                        bsp_printf_c(va_arg(ap,int));
f90003c8:	00c12783          	lw	a5,12(sp)
f90003cc:	00478713          	addi	a4,a5,4
f90003d0:	00e12623          	sw	a4,12(sp)
f90003d4:	0007a503          	lw	a0,0(a5)
f90003d8:	e59ff0ef          	jal	ra,f9000230 <bsp_printf_c>
        for (i = 0; format[i]; i++)
f90003dc:	00140413          	addi	s0,s0,1
f90003e0:	008487b3          	add	a5,s1,s0
f90003e4:	0007c503          	lbu	a0,0(a5)
f90003e8:	0c050263          	beqz	a0,f90004ac <bsp_printf+0x124>
            if (format[i] == '%') {
f90003ec:	02500793          	li	a5,37
f90003f0:	06f50663          	beq	a0,a5,f900045c <bsp_printf+0xd4>
                        break;
                    }
#endif //#if (ENABLE_FLOATING_POINT_SUPPORT)
                }
            } else
                bsp_printf_c(format[i]);
f90003f4:	e3dff0ef          	jal	ra,f9000230 <bsp_printf_c>
f90003f8:	fe5ff06f          	j	f90003dc <bsp_printf+0x54>
                        bsp_printf_s(va_arg(ap,char*));
f90003fc:	00c12783          	lw	a5,12(sp)
f9000400:	00478713          	addi	a4,a5,4
f9000404:	00e12623          	sw	a4,12(sp)
f9000408:	0007a503          	lw	a0,0(a5)
f900040c:	e45ff0ef          	jal	ra,f9000250 <bsp_printf_s>
                        break;
f9000410:	fcdff06f          	j	f90003dc <bsp_printf+0x54>
                        bsp_printf_d(va_arg(ap,int));
f9000414:	00c12783          	lw	a5,12(sp)
f9000418:	00478713          	addi	a4,a5,4
f900041c:	00e12623          	sw	a4,12(sp)
f9000420:	0007a503          	lw	a0,0(a5)
f9000424:	e65ff0ef          	jal	ra,f9000288 <bsp_printf_d>
                        break;
f9000428:	fb5ff06f          	j	f90003dc <bsp_printf+0x54>
                        bsp_printf_X(va_arg(ap,int));
f900042c:	00c12783          	lw	a5,12(sp)
f9000430:	00478713          	addi	a4,a5,4
f9000434:	00e12623          	sw	a4,12(sp)
f9000438:	0007a503          	lw	a0,0(a5)
f900043c:	f0dff0ef          	jal	ra,f9000348 <bsp_printf_X>
                        break;
f9000440:	f9dff06f          	j	f90003dc <bsp_printf+0x54>
                        bsp_printf_x(va_arg(ap,int));
f9000444:	00c12783          	lw	a5,12(sp)
f9000448:	00478713          	addi	a4,a5,4
f900044c:	00e12623          	sw	a4,12(sp)
f9000450:	0007a503          	lw	a0,0(a5)
f9000454:	eb5ff0ef          	jal	ra,f9000308 <bsp_printf_x>
                        break;
f9000458:	f85ff06f          	j	f90003dc <bsp_printf+0x54>
                while (format[++i]) {
f900045c:	00140413          	addi	s0,s0,1
f9000460:	008487b3          	add	a5,s1,s0
f9000464:	0007c783          	lbu	a5,0(a5)
f9000468:	f6078ae3          	beqz	a5,f90003dc <bsp_printf+0x54>
                    if (format[i] == 'c') {
f900046c:	06300713          	li	a4,99
f9000470:	f4e78ce3          	beq	a5,a4,f90003c8 <bsp_printf+0x40>
                    else if (format[i] == 's') {
f9000474:	07300713          	li	a4,115
f9000478:	f8e782e3          	beq	a5,a4,f90003fc <bsp_printf+0x74>
                    else if (format[i] == 'd') {
f900047c:	06400713          	li	a4,100
f9000480:	f8e78ae3          	beq	a5,a4,f9000414 <bsp_printf+0x8c>
                    else if (format[i] == 'X') {
f9000484:	05800713          	li	a4,88
f9000488:	fae782e3          	beq	a5,a4,f900042c <bsp_printf+0xa4>
                    else if (format[i] == 'x') {
f900048c:	07800713          	li	a4,120
f9000490:	fae78ae3          	beq	a5,a4,f9000444 <bsp_printf+0xbc>
                    else if (format[i] == 'f') {
f9000494:	06600713          	li	a4,102
f9000498:	fce792e3          	bne	a5,a4,f900045c <bsp_printf+0xd4>
                        bsp_printf_s("<Floating point printing not enable. Please Enable it at bsp.h first...>");
f900049c:	f9000537          	lui	a0,0xf9000
f90004a0:	53450513          	addi	a0,a0,1332 # f9000534 <__freertos_irq_stack_top+0xfffff344>
f90004a4:	dadff0ef          	jal	ra,f9000250 <bsp_printf_s>
                        break;
f90004a8:	f35ff06f          	j	f90003dc <bsp_printf+0x54>
    
        va_end(ap);
    }
f90004ac:	01c12083          	lw	ra,28(sp)
f90004b0:	01812403          	lw	s0,24(sp)
f90004b4:	01412483          	lw	s1,20(sp)
f90004b8:	04010113          	addi	sp,sp,64
f90004bc:	00008067          	ret

f90004c0 <main>:
//
////////////////////////////////////////////////////////////////////////////////
#include <stdint.h>
#include "bsp.h"

void main() {
f90004c0:	ff010113          	addi	sp,sp,-16
f90004c4:	00112623          	sw	ra,12(sp)
    uint8_t dat;

    bsp_init();
    bsp_printf("Uart echo demo ! \r\n");
f90004c8:	f9000537          	lui	a0,0xf9000
f90004cc:	58050513          	addi	a0,a0,1408 # f9000580 <__freertos_irq_stack_top+0xfffff390>
f90004d0:	eb9ff0ef          	jal	ra,f9000388 <bsp_printf>
    bsp_printf("Start typing on terminal to send character... \r\n");
f90004d4:	f9000537          	lui	a0,0xf9000
f90004d8:	59450513          	addi	a0,a0,1428 # f9000594 <__freertos_irq_stack_top+0xfffff3a4>
f90004dc:	eadff0ef          	jal	ra,f9000388 <bsp_printf>
f90004e0:	01c0006f          	j	f90004fc <main+0x3c>
    while(1)
    {
        while(uart_readOccupancy(BSP_UART_TERMINAL)){
            dat=uart_read(BSP_UART_TERMINAL);
f90004e4:	f8010537          	lui	a0,0xf8010
f90004e8:	c65ff0ef          	jal	ra,f900014c <uart_read>
            bsp_printf("echo character: %c \r\n", dat);
f90004ec:	00050593          	mv	a1,a0
f90004f0:	f9000537          	lui	a0,0xf9000
f90004f4:	5c850513          	addi	a0,a0,1480 # f90005c8 <__freertos_irq_stack_top+0xfffff3d8>
f90004f8:	e91ff0ef          	jal	ra,f9000388 <bsp_printf>
        while(uart_readOccupancy(BSP_UART_TERMINAL)){
f90004fc:	f8010537          	lui	a0,0xf8010
f9000500:	c05ff0ef          	jal	ra,f9000104 <uart_readOccupancy>
f9000504:	fe050ce3          	beqz	a0,f90004fc <main+0x3c>
f9000508:	fddff06f          	j	f90004e4 <main+0x24>
