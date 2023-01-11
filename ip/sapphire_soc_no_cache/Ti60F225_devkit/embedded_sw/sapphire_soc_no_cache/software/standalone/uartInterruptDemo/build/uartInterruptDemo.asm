
build/uartInterruptDemo.elf:     file format elf32-littleriscv


Disassembly of section .init:

f9000000 <_start>:

_start:
#ifdef USE_GP
.option push
.option norelax
	la gp, __global_pointer$
f9000000:	00001197          	auipc	gp,0x1
f9000004:	1f018193          	addi	gp,gp,496 # f90011f0 <__global_pointer$>

f9000008 <init>:
	sw a0, smp_lottery_lock, a1
    ret
#endif

init:
	la sp, _sp
f9000008:	42018113          	addi	sp,gp,1056 # f9001610 <__freertos_irq_stack_top>

	/* Load data section */
	la a0, _data_lma
f900000c:	00001517          	auipc	a0,0x1
f9000010:	8bc50513          	addi	a0,a0,-1860 # f90008c8 <__init_array_end>
	la a1, _data
f9000014:	00001597          	auipc	a1,0x1
f9000018:	8b458593          	addi	a1,a1,-1868 # f90008c8 <__init_array_end>
	la a2, _edata
f900001c:	81c18613          	addi	a2,gp,-2020 # f9000a0c <__bss_start>
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
f9000038:	81c18513          	addi	a0,gp,-2020 # f9000a0c <__bss_start>
	la a1, _end
f900003c:	82018593          	addi	a1,gp,-2016 # f9000a10 <_end>
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
f9000054:	798000ef          	jal	ra,f90007ec <main>

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
f900006c:	00001417          	auipc	s0,0x1
f9000070:	85c40413          	addi	s0,s0,-1956 # f90008c8 <__init_array_end>
f9000074:	00001917          	auipc	s2,0x1
f9000078:	85490913          	addi	s2,s2,-1964 # f90008c8 <__init_array_end>
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
f90000a8:	00001417          	auipc	s0,0x1
f90000ac:	82040413          	addi	s0,s0,-2016 # f90008c8 <__init_array_end>
f90000b0:	00001917          	auipc	s2,0x1
f90000b4:	81890913          	addi	s2,s2,-2024 # f90008c8 <__init_array_end>
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

f90000f4 <plic_set_priority>:
#define PLIC_CLAIM_BASE         0x200004
#define PLIC_ENABLE_PER_HART    0x80
#define PLIC_CONTEXT_PER_HART   0x1000

    static void plic_set_priority(u32 plic, u32 gateway, u32 priority){
        write_u32(priority, plic + PLIC_PRIORITY_BASE + gateway*4);
f90000f4:	00259593          	slli	a1,a1,0x2
f90000f8:	00a585b3          	add	a1,a1,a0
    static inline u32 read_u32(u32 address){
        return *((volatile u32*) address);
    }
    
    static inline void write_u32(u32 data, u32 address){
        *((volatile u32*) address) = data;
f90000fc:	00c5a023          	sw	a2,0(a1)
    }
f9000100:	00008067          	ret

f9000104 <plic_set_enable>:
    static u32 plic_get_priority(u32 plic, u32 gateway){
        return read_u32(plic + PLIC_PRIORITY_BASE + gateway*4);
    }
    
    static void plic_set_enable(u32 plic, u32 target,u32 gateway, u32 enable){
        u32 word = plic + PLIC_ENABLE_BASE + target * PLIC_ENABLE_PER_HART + (gateway / 32 * 4);
f9000104:	00759593          	slli	a1,a1,0x7
f9000108:	00a58533          	add	a0,a1,a0
f900010c:	00565593          	srli	a1,a2,0x5
f9000110:	00259593          	slli	a1,a1,0x2
f9000114:	00b50533          	add	a0,a0,a1
f9000118:	000025b7          	lui	a1,0x2
f900011c:	00b50533          	add	a0,a0,a1
        u32 mask = 1 << (gateway % 32);
f9000120:	00100793          	li	a5,1
f9000124:	00c797b3          	sll	a5,a5,a2
        if (enable)
f9000128:	00068a63          	beqz	a3,f900013c <plic_set_enable+0x38>
        return *((volatile u32*) address);
f900012c:	00052603          	lw	a2,0(a0)
            write_u32(read_u32(word) | mask, word);
f9000130:	00c7e7b3          	or	a5,a5,a2
        *((volatile u32*) address) = data;
f9000134:	00f52023          	sw	a5,0(a0)
f9000138:	00008067          	ret
        return *((volatile u32*) address);
f900013c:	00052603          	lw	a2,0(a0)
        else
            write_u32(read_u32(word) & ~mask, word);
f9000140:	fff7c793          	not	a5,a5
f9000144:	00c7f7b3          	and	a5,a5,a2
        *((volatile u32*) address) = data;
f9000148:	00f52023          	sw	a5,0(a0)
    }
f900014c:	00008067          	ret

f9000150 <plic_set_threshold>:
    
    static void plic_set_threshold(u32 plic, u32 target, u32 threshold){
        write_u32(threshold, plic + PLIC_THRESHOLD_BASE + target*PLIC_CONTEXT_PER_HART);
f9000150:	00c59593          	slli	a1,a1,0xc
f9000154:	00a585b3          	add	a1,a1,a0
f9000158:	00200537          	lui	a0,0x200
f900015c:	00a585b3          	add	a1,a1,a0
f9000160:	00c5a023          	sw	a2,0(a1) # 2000 <__stack_size+0x1400>
    }
f9000164:	00008067          	ret

f9000168 <plic_claim>:
    static u32 plic_get_threshold(u32 plic, u32 target){
        return read_u32(plic + PLIC_THRESHOLD_BASE + target*PLIC_CONTEXT_PER_HART);
    }
    
    static u32 plic_claim(u32 plic, u32 target){
        return read_u32(plic + PLIC_CLAIM_BASE + target*PLIC_CONTEXT_PER_HART);
f9000168:	00c59593          	slli	a1,a1,0xc
f900016c:	00a585b3          	add	a1,a1,a0
f9000170:	00200537          	lui	a0,0x200
f9000174:	00450513          	addi	a0,a0,4 # 200004 <__stack_size+0x1ff404>
f9000178:	00a585b3          	add	a1,a1,a0
        return *((volatile u32*) address);
f900017c:	0005a503          	lw	a0,0(a1)
    }
f9000180:	00008067          	ret

f9000184 <plic_release>:
    
    static void plic_release(u32 plic, u32 target, u32 gateway){
        write_u32(gateway,plic + PLIC_CLAIM_BASE + target*PLIC_CONTEXT_PER_HART);
f9000184:	00c59593          	slli	a1,a1,0xc
f9000188:	00a585b3          	add	a1,a1,a0
f900018c:	00200537          	lui	a0,0x200
f9000190:	00450513          	addi	a0,a0,4 # 200004 <__stack_size+0x1ff404>
f9000194:	00a585b3          	add	a1,a1,a0
        *((volatile u32*) address) = data;
f9000198:	00c5a023          	sw	a2,0(a1)
    }
f900019c:	00008067          	ret

f90001a0 <uart_writeAvailability>:
        return *((volatile u32*) address);
f90001a0:	00452503          	lw	a0,4(a0)
        enum UartStop stop;
        u32 clockDivider;
    } Uart_Config;
    
    static u32 uart_writeAvailability(u32 reg){
        return (read_u32(reg + UART_STATUS) >> 16) & 0xFF;
f90001a4:	01055513          	srli	a0,a0,0x10
    }
f90001a8:	0ff57513          	andi	a0,a0,255
f90001ac:	00008067          	ret

f90001b0 <uart_readOccupancy>:
f90001b0:	00452503          	lw	a0,4(a0)
    static u32 uart_readOccupancy(u32 reg){
        return read_u32(reg + UART_STATUS) >> 24;
    }
f90001b4:	01855513          	srli	a0,a0,0x18
f90001b8:	00008067          	ret

f90001bc <uart_write>:
    
    static void uart_write(u32 reg, char data){
f90001bc:	ff010113          	addi	sp,sp,-16
f90001c0:	00112623          	sw	ra,12(sp)
f90001c4:	00812423          	sw	s0,8(sp)
f90001c8:	00912223          	sw	s1,4(sp)
f90001cc:	00050413          	mv	s0,a0
f90001d0:	00058493          	mv	s1,a1
        while(uart_writeAvailability(reg) == 0);
f90001d4:	00040513          	mv	a0,s0
f90001d8:	fc9ff0ef          	jal	ra,f90001a0 <uart_writeAvailability>
f90001dc:	fe050ce3          	beqz	a0,f90001d4 <uart_write+0x18>
        *((volatile u32*) address) = data;
f90001e0:	00942023          	sw	s1,0(s0)
        write_u32(data, reg + UART_DATA);
    }
f90001e4:	00c12083          	lw	ra,12(sp)
f90001e8:	00812403          	lw	s0,8(sp)
f90001ec:	00412483          	lw	s1,4(sp)
f90001f0:	01010113          	addi	sp,sp,16
f90001f4:	00008067          	ret

f90001f8 <uart_read>:
    
    static void uart_writeStr(u32 reg, const char* str){
        while(*str) uart_write(reg, *str++);
    }
    
    static char uart_read(u32 reg){
f90001f8:	ff010113          	addi	sp,sp,-16
f90001fc:	00112623          	sw	ra,12(sp)
f9000200:	00812423          	sw	s0,8(sp)
f9000204:	00050413          	mv	s0,a0
        while(uart_readOccupancy(reg) == 0);
f9000208:	00040513          	mv	a0,s0
f900020c:	fa5ff0ef          	jal	ra,f90001b0 <uart_readOccupancy>
f9000210:	fe050ce3          	beqz	a0,f9000208 <uart_read+0x10>
        return *((volatile u32*) address);
f9000214:	00042503          	lw	a0,0(s0)
        return read_u32(reg + UART_DATA);
    }
f9000218:	0ff57513          	andi	a0,a0,255
f900021c:	00c12083          	lw	ra,12(sp)
f9000220:	00812403          	lw	s0,8(sp)
f9000224:	01010113          	addi	sp,sp,16
f9000228:	00008067          	ret

f900022c <uart_applyConfig>:
    
    static void uart_applyConfig(u32 reg, Uart_Config *config){
        write_u32(config->clockDivider, reg + UART_CLOCK_DIVIDER);
f900022c:	00c5a783          	lw	a5,12(a1)
        *((volatile u32*) address) = data;
f9000230:	00f52423          	sw	a5,8(a0)
        write_u32(((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16), reg + UART_FRAME_CONFIG);
f9000234:	0005a783          	lw	a5,0(a1)
f9000238:	fff78793          	addi	a5,a5,-1
f900023c:	0045a703          	lw	a4,4(a1)
f9000240:	00871713          	slli	a4,a4,0x8
f9000244:	00e7e7b3          	or	a5,a5,a4
f9000248:	0085a703          	lw	a4,8(a1)
f900024c:	01071713          	slli	a4,a4,0x10
f9000250:	00e7e7b3          	or	a5,a5,a4
f9000254:	00f52623          	sw	a5,12(a0)
    }
f9000258:	00008067          	ret

f900025c <uart_status_read>:
        return *((volatile u32*) address);
f900025c:	00452503          	lw	a0,4(a0)
    }
    
    static u32 uart_status_read(u32 reg)
     {
    	 return read_u32(reg+UART_STATUS);
     }
f9000260:	00008067          	ret

f9000264 <uart_status_write>:
        *((volatile u32*) address) = data;
f9000264:	00b52223          	sw	a1,4(a0)
    
    static void uart_status_write(u32 reg, char data)
    {
    	write_u32(data ,reg+UART_STATUS);
    }
f9000268:	00008067          	ret

f900026c <uart_RX_NotemptyInterruptEna>:
    
    static void uart_TX_emptyInterruptEna(u32 reg, char Ena){
    	uart_status_write(reg,(uart_status_read(reg) & 0xFFFFFFFE) | (Ena & 0x01));	
    }
    
    static void uart_RX_NotemptyInterruptEna(u32 reg, char Ena){
f900026c:	ff010113          	addi	sp,sp,-16
f9000270:	00112623          	sw	ra,12(sp)
f9000274:	00812423          	sw	s0,8(sp)
f9000278:	00912223          	sw	s1,4(sp)
f900027c:	00050493          	mv	s1,a0
f9000280:	00058413          	mv	s0,a1
    	uart_status_write(reg,(uart_status_read(reg) & 0xFFFFFFFD) | (Ena << 1));	
f9000284:	fd9ff0ef          	jal	ra,f900025c <uart_status_read>
f9000288:	0fd57593          	andi	a1,a0,253
f900028c:	00141413          	slli	s0,s0,0x1
f9000290:	0ff47413          	andi	s0,s0,255
f9000294:	0085e5b3          	or	a1,a1,s0
f9000298:	00048513          	mv	a0,s1
f900029c:	fc9ff0ef          	jal	ra,f9000264 <uart_status_write>
    }
f90002a0:	00c12083          	lw	ra,12(sp)
f90002a4:	00812403          	lw	s0,8(sp)
f90002a8:	00412483          	lw	s1,4(sp)
f90002ac:	01010113          	addi	sp,sp,16
f90002b0:	00008067          	ret

f90002b4 <bsp_printHex>:
#define ENABLE_BRIDGE_FULL_TO_LITE          1 // If this is enabled, bsp_printf_full can be called with bsp_printf. Enabling both ENABLE_BSP_PRINTF and ENABLE_BSP_PRINTF_FULL, bsp_printf_full will be remained as bsp_printf_full. Default: Enable
#define ENABLE_PRINTF_WARNING               1 // Print warning when the specifier not supported. Default: Enable

    //bsp_printHex is used in BSP_PRINTF
    static void bsp_printHex(uint32_t val)
    {
f90002b4:	ff010113          	addi	sp,sp,-16
f90002b8:	00112623          	sw	ra,12(sp)
f90002bc:	00812423          	sw	s0,8(sp)
f90002c0:	00912223          	sw	s1,4(sp)
f90002c4:	00050493          	mv	s1,a0
        uint32_t digits;
        digits =8;

        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f90002c8:	01c00413          	li	s0,28
f90002cc:	0280006f          	j	f90002f4 <bsp_printHex+0x40>
            uart_write(BSP_UART_TERMINAL, "0123456789ABCDEF"[(val >> i) % 16]);
f90002d0:	0084d7b3          	srl	a5,s1,s0
f90002d4:	00f7f713          	andi	a4,a5,15
f90002d8:	f90017b7          	lui	a5,0xf9001
f90002dc:	8c878793          	addi	a5,a5,-1848 # f90008c8 <__freertos_irq_stack_top+0xfffff2b8>
f90002e0:	00e787b3          	add	a5,a5,a4
f90002e4:	0007c583          	lbu	a1,0(a5)
f90002e8:	f8010537          	lui	a0,0xf8010
f90002ec:	ed1ff0ef          	jal	ra,f90001bc <uart_write>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f90002f0:	ffc40413          	addi	s0,s0,-4
f90002f4:	fc045ee3          	bgez	s0,f90002d0 <bsp_printHex+0x1c>
        }
    }
f90002f8:	00c12083          	lw	ra,12(sp)
f90002fc:	00812403          	lw	s0,8(sp)
f9000300:	00412483          	lw	s1,4(sp)
f9000304:	01010113          	addi	sp,sp,16
f9000308:	00008067          	ret

f900030c <bsp_printHex_lower>:

    static void bsp_printHex_lower(uint32_t val)
        {
f900030c:	ff010113          	addi	sp,sp,-16
f9000310:	00112623          	sw	ra,12(sp)
f9000314:	00812423          	sw	s0,8(sp)
f9000318:	00912223          	sw	s1,4(sp)
f900031c:	00050493          	mv	s1,a0
            uint32_t digits;
            digits =8;

            for (int i = (4*digits)-4; i >= 0; i -= 4) {
f9000320:	01c00413          	li	s0,28
f9000324:	0280006f          	j	f900034c <bsp_printHex_lower+0x40>
                uart_write(BSP_UART_TERMINAL, "0123456789abcdef"[(val >> i) % 16]);
f9000328:	0084d7b3          	srl	a5,s1,s0
f900032c:	00f7f713          	andi	a4,a5,15
f9000330:	f90017b7          	lui	a5,0xf9001
f9000334:	8dc78793          	addi	a5,a5,-1828 # f90008dc <__freertos_irq_stack_top+0xfffff2cc>
f9000338:	00e787b3          	add	a5,a5,a4
f900033c:	0007c583          	lbu	a1,0(a5)
f9000340:	f8010537          	lui	a0,0xf8010
f9000344:	e79ff0ef          	jal	ra,f90001bc <uart_write>
            for (int i = (4*digits)-4; i >= 0; i -= 4) {
f9000348:	ffc40413          	addi	s0,s0,-4
f900034c:	fc045ee3          	bgez	s0,f9000328 <bsp_printHex_lower+0x1c>
            }
        }
f9000350:	00c12083          	lw	ra,12(sp)
f9000354:	00812403          	lw	s0,8(sp)
f9000358:	00412483          	lw	s1,4(sp)
f900035c:	01010113          	addi	sp,sp,16
f9000360:	00008067          	ret

f9000364 <bsp_printf_c>:
    }

    #endif //#if (ENABLE_FLOATING_POINT_SUPPORT)

    static void bsp_printf_c(int c)
    {
f9000364:	ff010113          	addi	sp,sp,-16
f9000368:	00112623          	sw	ra,12(sp)
        bsp_putChar(c);
f900036c:	0ff57593          	andi	a1,a0,255
f9000370:	f8010537          	lui	a0,0xf8010
f9000374:	e49ff0ef          	jal	ra,f90001bc <uart_write>
    }
f9000378:	00c12083          	lw	ra,12(sp)
f900037c:	01010113          	addi	sp,sp,16
f9000380:	00008067          	ret

f9000384 <bsp_printf_s>:
    
    static void bsp_printf_s(char *p)
    {
f9000384:	ff010113          	addi	sp,sp,-16
f9000388:	00112623          	sw	ra,12(sp)
f900038c:	00812423          	sw	s0,8(sp)
f9000390:	00050413          	mv	s0,a0
        while (*p)
f9000394:	00044583          	lbu	a1,0(s0)
f9000398:	00058a63          	beqz	a1,f90003ac <bsp_printf_s+0x28>
            bsp_putChar(*(p++));
f900039c:	00140413          	addi	s0,s0,1
f90003a0:	f8010537          	lui	a0,0xf8010
f90003a4:	e19ff0ef          	jal	ra,f90001bc <uart_write>
f90003a8:	fedff06f          	j	f9000394 <bsp_printf_s+0x10>
    }
f90003ac:	00c12083          	lw	ra,12(sp)
f90003b0:	00812403          	lw	s0,8(sp)
f90003b4:	01010113          	addi	sp,sp,16
f90003b8:	00008067          	ret

f90003bc <bsp_printf_d>:
    
    static void bsp_printf_d(int val)
    {
f90003bc:	fd010113          	addi	sp,sp,-48
f90003c0:	02112623          	sw	ra,44(sp)
f90003c4:	02812423          	sw	s0,40(sp)
f90003c8:	02912223          	sw	s1,36(sp)
f90003cc:	00050493          	mv	s1,a0
        char buffer[32];
        char *p = buffer;
        if (val < 0) {
f90003d0:	00054663          	bltz	a0,f90003dc <bsp_printf_d+0x20>
    {
f90003d4:	00010413          	mv	s0,sp
f90003d8:	02c0006f          	j	f9000404 <bsp_printf_d+0x48>
            bsp_printf_c('-');
f90003dc:	02d00513          	li	a0,45
f90003e0:	f85ff0ef          	jal	ra,f9000364 <bsp_printf_c>
            val = -val;
f90003e4:	409004b3          	neg	s1,s1
f90003e8:	fedff06f          	j	f90003d4 <bsp_printf_d+0x18>
        }
        while (val || p == buffer) {
            *(p++) = '0' + val % 10;
f90003ec:	00a00713          	li	a4,10
f90003f0:	02e4e7b3          	rem	a5,s1,a4
f90003f4:	03078793          	addi	a5,a5,48
f90003f8:	00f40023          	sb	a5,0(s0)
            val = val / 10;
f90003fc:	02e4c4b3          	div	s1,s1,a4
            *(p++) = '0' + val % 10;
f9000400:	00140413          	addi	s0,s0,1
        while (val || p == buffer) {
f9000404:	fe0494e3          	bnez	s1,f90003ec <bsp_printf_d+0x30>
f9000408:	00010793          	mv	a5,sp
f900040c:	fef400e3          	beq	s0,a5,f90003ec <bsp_printf_d+0x30>
f9000410:	0100006f          	j	f9000420 <bsp_printf_d+0x64>
        }
        while (p != buffer)
            bsp_printf_c(*(--p));
f9000414:	fff40413          	addi	s0,s0,-1
f9000418:	00044503          	lbu	a0,0(s0)
f900041c:	f49ff0ef          	jal	ra,f9000364 <bsp_printf_c>
        while (p != buffer)
f9000420:	00010793          	mv	a5,sp
f9000424:	fef418e3          	bne	s0,a5,f9000414 <bsp_printf_d+0x58>
    }
f9000428:	02c12083          	lw	ra,44(sp)
f900042c:	02812403          	lw	s0,40(sp)
f9000430:	02412483          	lw	s1,36(sp)
f9000434:	03010113          	addi	sp,sp,48
f9000438:	00008067          	ret

f900043c <bsp_printf_x>:
    
    static void bsp_printf_x(int val)
    {
f900043c:	ff010113          	addi	sp,sp,-16
f9000440:	00112623          	sw	ra,12(sp)
        int i,digi=2;
    
        for(i=0;i<8;i++)
f9000444:	00000713          	li	a4,0
f9000448:	00700793          	li	a5,7
f900044c:	02e7c063          	blt	a5,a4,f900046c <bsp_printf_x+0x30>
        {
            if((val & (0xFFFFFFF0 <<(4*i))) == 0)
f9000450:	00271693          	slli	a3,a4,0x2
f9000454:	ff000793          	li	a5,-16
f9000458:	00d797b3          	sll	a5,a5,a3
f900045c:	00f577b3          	and	a5,a0,a5
f9000460:	00078663          	beqz	a5,f900046c <bsp_printf_x+0x30>
        for(i=0;i<8;i++)
f9000464:	00170713          	addi	a4,a4,1
f9000468:	fe1ff06f          	j	f9000448 <bsp_printf_x+0xc>
            {
                digi=i+1;
                break;
            }
        }
        bsp_printHex_lower(val);
f900046c:	ea1ff0ef          	jal	ra,f900030c <bsp_printHex_lower>
    }
f9000470:	00c12083          	lw	ra,12(sp)
f9000474:	01010113          	addi	sp,sp,16
f9000478:	00008067          	ret

f900047c <bsp_printf_X>:
    
    static void bsp_printf_X(int val)
        {
f900047c:	ff010113          	addi	sp,sp,-16
f9000480:	00112623          	sw	ra,12(sp)
            int i,digi=2;

            for(i=0;i<8;i++)
f9000484:	00000713          	li	a4,0
f9000488:	00700793          	li	a5,7
f900048c:	02e7c063          	blt	a5,a4,f90004ac <bsp_printf_X+0x30>
            {
                if((val & (0xFFFFFFF0 <<(4*i))) == 0)
f9000490:	00271693          	slli	a3,a4,0x2
f9000494:	ff000793          	li	a5,-16
f9000498:	00d797b3          	sll	a5,a5,a3
f900049c:	00f577b3          	and	a5,a0,a5
f90004a0:	00078663          	beqz	a5,f90004ac <bsp_printf_X+0x30>
            for(i=0;i<8;i++)
f90004a4:	00170713          	addi	a4,a4,1
f90004a8:	fe1ff06f          	j	f9000488 <bsp_printf_X+0xc>
                {
                    digi=i+1;
                    break;
                }
            }
            bsp_printHex(val);
f90004ac:	e09ff0ef          	jal	ra,f90002b4 <bsp_printHex>
        }
f90004b0:	00c12083          	lw	ra,12(sp)
f90004b4:	01010113          	addi	sp,sp,16
f90004b8:	00008067          	ret

f90004bc <bsp_printf>:

    static void bsp_printf(const char *format, ...)
    {
f90004bc:	fc010113          	addi	sp,sp,-64
f90004c0:	00112e23          	sw	ra,28(sp)
f90004c4:	00812c23          	sw	s0,24(sp)
f90004c8:	00912a23          	sw	s1,20(sp)
f90004cc:	00050493          	mv	s1,a0
f90004d0:	02b12223          	sw	a1,36(sp)
f90004d4:	02c12423          	sw	a2,40(sp)
f90004d8:	02d12623          	sw	a3,44(sp)
f90004dc:	02e12823          	sw	a4,48(sp)
f90004e0:	02f12a23          	sw	a5,52(sp)
f90004e4:	03012c23          	sw	a6,56(sp)
f90004e8:	03112e23          	sw	a7,60(sp)
        int i;
        va_list ap;
    
        va_start(ap, format);
f90004ec:	02410793          	addi	a5,sp,36
f90004f0:	00f12623          	sw	a5,12(sp)
    
        for (i = 0; format[i]; i++)
f90004f4:	00000413          	li	s0,0
f90004f8:	01c0006f          	j	f9000514 <bsp_printf+0x58>
            if (format[i] == '%') {
                while (format[++i]) {
                    if (format[i] == 'c') {
                        bsp_printf_c(va_arg(ap,int));
f90004fc:	00c12783          	lw	a5,12(sp)
f9000500:	00478713          	addi	a4,a5,4
f9000504:	00e12623          	sw	a4,12(sp)
f9000508:	0007a503          	lw	a0,0(a5)
f900050c:	e59ff0ef          	jal	ra,f9000364 <bsp_printf_c>
        for (i = 0; format[i]; i++)
f9000510:	00140413          	addi	s0,s0,1
f9000514:	008487b3          	add	a5,s1,s0
f9000518:	0007c503          	lbu	a0,0(a5)
f900051c:	0c050263          	beqz	a0,f90005e0 <bsp_printf+0x124>
            if (format[i] == '%') {
f9000520:	02500793          	li	a5,37
f9000524:	06f50663          	beq	a0,a5,f9000590 <bsp_printf+0xd4>
                        break;
                    }
#endif //#if (ENABLE_FLOATING_POINT_SUPPORT)
                }
            } else
                bsp_printf_c(format[i]);
f9000528:	e3dff0ef          	jal	ra,f9000364 <bsp_printf_c>
f900052c:	fe5ff06f          	j	f9000510 <bsp_printf+0x54>
                        bsp_printf_s(va_arg(ap,char*));
f9000530:	00c12783          	lw	a5,12(sp)
f9000534:	00478713          	addi	a4,a5,4
f9000538:	00e12623          	sw	a4,12(sp)
f900053c:	0007a503          	lw	a0,0(a5)
f9000540:	e45ff0ef          	jal	ra,f9000384 <bsp_printf_s>
                        break;
f9000544:	fcdff06f          	j	f9000510 <bsp_printf+0x54>
                        bsp_printf_d(va_arg(ap,int));
f9000548:	00c12783          	lw	a5,12(sp)
f900054c:	00478713          	addi	a4,a5,4
f9000550:	00e12623          	sw	a4,12(sp)
f9000554:	0007a503          	lw	a0,0(a5)
f9000558:	e65ff0ef          	jal	ra,f90003bc <bsp_printf_d>
                        break;
f900055c:	fb5ff06f          	j	f9000510 <bsp_printf+0x54>
                        bsp_printf_X(va_arg(ap,int));
f9000560:	00c12783          	lw	a5,12(sp)
f9000564:	00478713          	addi	a4,a5,4
f9000568:	00e12623          	sw	a4,12(sp)
f900056c:	0007a503          	lw	a0,0(a5)
f9000570:	f0dff0ef          	jal	ra,f900047c <bsp_printf_X>
                        break;
f9000574:	f9dff06f          	j	f9000510 <bsp_printf+0x54>
                        bsp_printf_x(va_arg(ap,int));
f9000578:	00c12783          	lw	a5,12(sp)
f900057c:	00478713          	addi	a4,a5,4
f9000580:	00e12623          	sw	a4,12(sp)
f9000584:	0007a503          	lw	a0,0(a5)
f9000588:	eb5ff0ef          	jal	ra,f900043c <bsp_printf_x>
                        break;
f900058c:	f85ff06f          	j	f9000510 <bsp_printf+0x54>
                while (format[++i]) {
f9000590:	00140413          	addi	s0,s0,1
f9000594:	008487b3          	add	a5,s1,s0
f9000598:	0007c783          	lbu	a5,0(a5)
f900059c:	f6078ae3          	beqz	a5,f9000510 <bsp_printf+0x54>
                    if (format[i] == 'c') {
f90005a0:	06300713          	li	a4,99
f90005a4:	f4e78ce3          	beq	a5,a4,f90004fc <bsp_printf+0x40>
                    else if (format[i] == 's') {
f90005a8:	07300713          	li	a4,115
f90005ac:	f8e782e3          	beq	a5,a4,f9000530 <bsp_printf+0x74>
                    else if (format[i] == 'd') {
f90005b0:	06400713          	li	a4,100
f90005b4:	f8e78ae3          	beq	a5,a4,f9000548 <bsp_printf+0x8c>
                    else if (format[i] == 'X') {
f90005b8:	05800713          	li	a4,88
f90005bc:	fae782e3          	beq	a5,a4,f9000560 <bsp_printf+0xa4>
                    else if (format[i] == 'x') {
f90005c0:	07800713          	li	a4,120
f90005c4:	fae78ae3          	beq	a5,a4,f9000578 <bsp_printf+0xbc>
                    else if (format[i] == 'f') {
f90005c8:	06600713          	li	a4,102
f90005cc:	fce792e3          	bne	a5,a4,f9000590 <bsp_printf+0xd4>
                        bsp_printf_s("<Floating point printing not enable. Please Enable it at bsp.h first...>");
f90005d0:	f9001537          	lui	a0,0xf9001
f90005d4:	8f050513          	addi	a0,a0,-1808 # f90008f0 <__freertos_irq_stack_top+0xfffff2e0>
f90005d8:	dadff0ef          	jal	ra,f9000384 <bsp_printf_s>
                        break;
f90005dc:	f35ff06f          	j	f9000510 <bsp_printf+0x54>
    
        va_end(ap);
    }
f90005e0:	01c12083          	lw	ra,28(sp)
f90005e4:	01812403          	lw	s0,24(sp)
f90005e8:	01412483          	lw	s1,20(sp)
f90005ec:	04010113          	addi	sp,sp,64
f90005f0:	00008067          	ret

f90005f4 <init>:
void UartInterrupt();

#define UART_A_SAMPLE_PER_BAUD 8
#define CORE_HZ BSP_CLINT_HZ

void init(){
f90005f4:	fe010113          	addi	sp,sp,-32
f90005f8:	00112e23          	sw	ra,28(sp)
    //UART init
    Uart_Config uartA;
    uartA.dataLength = BITS_8; 
f90005fc:	00800793          	li	a5,8
f9000600:	00f12023          	sw	a5,0(sp)
    uartA.parity = NONE;
f9000604:	00012223          	sw	zero,4(sp)
    uartA.stop = ONE;
f9000608:	00012423          	sw	zero,8(sp)
    uartA.clockDivider = CORE_HZ/(115200*UART_A_SAMPLE_PER_BAUD)-1;
f900060c:	06b00793          	li	a5,107
f9000610:	00f12623          	sw	a5,12(sp)
    uart_applyConfig(BSP_UART_TERMINAL, &uartA);
f9000614:	00010593          	mv	a1,sp
f9000618:	f8010537          	lui	a0,0xf8010
f900061c:	c11ff0ef          	jal	ra,f900022c <uart_applyConfig>

    // TX FIFO empty interrupt enable
    //uart_TX_emptyInterruptEna(BSP_UART_TERMINAL,1);   
    
    // RX FIFO not empty interrupt enable
    uart_RX_NotemptyInterruptEna(BSP_UART_TERMINAL,1);  
f9000620:	00100593          	li	a1,1
f9000624:	f8010537          	lui	a0,0xf8010
f9000628:	c45ff0ef          	jal	ra,f900026c <uart_RX_NotemptyInterruptEna>

    //configure PLIC
    //cpu 0 accept all interrupts with priority above 0
    plic_set_threshold(BSP_PLIC, BSP_PLIC_CPU_0, 0); 
f900062c:	00000613          	li	a2,0
f9000630:	00000593          	li	a1,0
f9000634:	f8c00537          	lui	a0,0xf8c00
f9000638:	b19ff0ef          	jal	ra,f9000150 <plic_set_threshold>

    //enable SYSTEM_PLIC_USER_INTERRUPT_A_INTERRUPT rising edge interrupt
    plic_set_enable(BSP_PLIC, BSP_PLIC_CPU_0, SYSTEM_PLIC_SYSTEM_UART_0_IO_INTERRUPT, 1);
f900063c:	00100693          	li	a3,1
f9000640:	00100613          	li	a2,1
f9000644:	00000593          	li	a1,0
f9000648:	f8c00537          	lui	a0,0xf8c00
f900064c:	ab9ff0ef          	jal	ra,f9000104 <plic_set_enable>
    plic_set_priority(BSP_PLIC, SYSTEM_PLIC_SYSTEM_UART_0_IO_INTERRUPT, 1);
f9000650:	00100613          	li	a2,1
f9000654:	00100593          	li	a1,1
f9000658:	f8c00537          	lui	a0,0xf8c00
f900065c:	a99ff0ef          	jal	ra,f90000f4 <plic_set_priority>

    //enable interrupts
    csr_write(mtvec, trap_entry); //Set the machine trap vector (../common/trap.S)
f9000660:	f90017b7          	lui	a5,0xf9001
f9000664:	83878793          	addi	a5,a5,-1992 # f9000838 <__freertos_irq_stack_top+0xfffff228>
f9000668:	30579073          	csrw	mtvec,a5
    csr_set(mie, MIE_MEIE); //Enable external interrupts
f900066c:	000017b7          	lui	a5,0x1
f9000670:	80078793          	addi	a5,a5,-2048 # 800 <CUSTOM1+0x7d5>
f9000674:	3047a073          	csrs	mie,a5
    csr_write(mstatus, MSTATUS_MPP | MSTATUS_MIE);
f9000678:	000027b7          	lui	a5,0x2
f900067c:	80878793          	addi	a5,a5,-2040 # 1808 <__stack_size+0xc08>
f9000680:	30079073          	csrw	mstatus,a5
}
f9000684:	01c12083          	lw	ra,28(sp)
f9000688:	02010113          	addi	sp,sp,32
f900068c:	00008067          	ret

f9000690 <UartInterrupt_Sub>:
        crash();
    }
}

void UartInterrupt_Sub()
{
f9000690:	ff010113          	addi	sp,sp,-16
f9000694:	00112623          	sw	ra,12(sp)
    if (uart_status_read(BSP_UART_TERMINAL) & 0x00000100){
f9000698:	f8010537          	lui	a0,0xf8010
f900069c:	bc1ff0ef          	jal	ra,f900025c <uart_status_read>
f90006a0:	10057513          	andi	a0,a0,256
f90006a4:	04050463          	beqz	a0,f90006ec <UartInterrupt_Sub+0x5c>
        
        bsp_printf("\nuart 0 tx fifo empty interrupt routine \r\n");
f90006a8:	f9001537          	lui	a0,0xf9001
f90006ac:	93c50513          	addi	a0,a0,-1732 # f900093c <__freertos_irq_stack_top+0xfffff32c>
f90006b0:	e0dff0ef          	jal	ra,f90004bc <bsp_printf>
        // TX FIFO empty interrupt Disable
        uart_status_write(BSP_UART_TERMINAL,uart_status_read(BSP_UART_TERMINAL) & 0xFFFFFFFE);  
f90006b4:	f8010537          	lui	a0,0xf8010
f90006b8:	ba5ff0ef          	jal	ra,f900025c <uart_status_read>
f90006bc:	0fe57593          	andi	a1,a0,254
f90006c0:	f8010537          	lui	a0,0xf8010
f90006c4:	ba1ff0ef          	jal	ra,f9000264 <uart_status_write>
        // TX FIFO empty interrupt enable
        uart_status_write(BSP_UART_TERMINAL,uart_status_read(BSP_UART_TERMINAL) | 0x01); 
f90006c8:	f8010537          	lui	a0,0xf8010
f90006cc:	b91ff0ef          	jal	ra,f900025c <uart_status_read>
f90006d0:	00156593          	ori	a1,a0,1
f90006d4:	0ff5f593          	andi	a1,a1,255
f90006d8:	f8010537          	lui	a0,0xf8010
f90006dc:	b89ff0ef          	jal	ra,f9000264 <uart_status_write>
        //Dummy Read Clear FIFO
        uart_write(BSP_UART_TERMINAL, uart_read(BSP_UART_TERMINAL));    
        // RX FIFO not empty interrupt enable
        uart_status_write(BSP_UART_TERMINAL,uart_status_read(BSP_UART_TERMINAL) | 0x02);                    
    }
}
f90006e0:	00c12083          	lw	ra,12(sp)
f90006e4:	01010113          	addi	sp,sp,16
f90006e8:	00008067          	ret
    else if (uart_status_read(BSP_UART_TERMINAL) & 0x00000200){
f90006ec:	f8010537          	lui	a0,0xf8010
f90006f0:	b6dff0ef          	jal	ra,f900025c <uart_status_read>
f90006f4:	20057513          	andi	a0,a0,512
f90006f8:	fe0504e3          	beqz	a0,f90006e0 <UartInterrupt_Sub+0x50>
        bsp_printf("\nuart 0 rx fifo not empty interrupt routine \r\n");
f90006fc:	f9001537          	lui	a0,0xf9001
f9000700:	96850513          	addi	a0,a0,-1688 # f9000968 <__freertos_irq_stack_top+0xfffff358>
f9000704:	db9ff0ef          	jal	ra,f90004bc <bsp_printf>
        uart_status_write(BSP_UART_TERMINAL,uart_status_read(BSP_UART_TERMINAL) & 0xFFFFFFFD);          
f9000708:	f8010537          	lui	a0,0xf8010
f900070c:	b51ff0ef          	jal	ra,f900025c <uart_status_read>
f9000710:	0fd57593          	andi	a1,a0,253
f9000714:	f8010537          	lui	a0,0xf8010
f9000718:	b4dff0ef          	jal	ra,f9000264 <uart_status_write>
        uart_write(BSP_UART_TERMINAL, uart_read(BSP_UART_TERMINAL));    
f900071c:	f8010537          	lui	a0,0xf8010
f9000720:	ad9ff0ef          	jal	ra,f90001f8 <uart_read>
f9000724:	00050593          	mv	a1,a0
f9000728:	f8010537          	lui	a0,0xf8010
f900072c:	a91ff0ef          	jal	ra,f90001bc <uart_write>
        uart_status_write(BSP_UART_TERMINAL,uart_status_read(BSP_UART_TERMINAL) | 0x02);                    
f9000730:	f8010537          	lui	a0,0xf8010
f9000734:	b29ff0ef          	jal	ra,f900025c <uart_status_read>
f9000738:	00256593          	ori	a1,a0,2
f900073c:	0ff5f593          	andi	a1,a1,255
f9000740:	f8010537          	lui	a0,0xf8010
f9000744:	b21ff0ef          	jal	ra,f9000264 <uart_status_write>
}
f9000748:	f99ff06f          	j	f90006e0 <UartInterrupt_Sub+0x50>

f900074c <crash>:
        //unmask the claimed interrupt
        plic_release(BSP_PLIC, BSP_PLIC_CPU_0, claim); 
    }
}

void crash(){
f900074c:	ff010113          	addi	sp,sp,-16
f9000750:	00112623          	sw	ra,12(sp)
    bsp_printf("\r\n*** CRASH ***\r\n");
f9000754:	f9001537          	lui	a0,0xf9001
f9000758:	99850513          	addi	a0,a0,-1640 # f9000998 <__freertos_irq_stack_top+0xfffff388>
f900075c:	d61ff0ef          	jal	ra,f90004bc <bsp_printf>
    while(1);
f9000760:	0000006f          	j	f9000760 <crash+0x14>

f9000764 <UartInterrupt>:
{
f9000764:	ff010113          	addi	sp,sp,-16
f9000768:	00112623          	sw	ra,12(sp)
f900076c:	00812423          	sw	s0,8(sp)
    while(claim = plic_claim(BSP_PLIC, BSP_PLIC_CPU_0)){
f9000770:	00000593          	li	a1,0
f9000774:	f8c00537          	lui	a0,0xf8c00
f9000778:	9f1ff0ef          	jal	ra,f9000168 <plic_claim>
f900077c:	00050413          	mv	s0,a0
f9000780:	02050463          	beqz	a0,f90007a8 <UartInterrupt+0x44>
        switch(claim){
f9000784:	00100793          	li	a5,1
f9000788:	00f41e63          	bne	s0,a5,f90007a4 <UartInterrupt+0x40>
        case SYSTEM_PLIC_SYSTEM_UART_0_IO_INTERRUPT: UartInterrupt_Sub(); break;
f900078c:	f05ff0ef          	jal	ra,f9000690 <UartInterrupt_Sub>
        plic_release(BSP_PLIC, BSP_PLIC_CPU_0, claim); 
f9000790:	00040613          	mv	a2,s0
f9000794:	00000593          	li	a1,0
f9000798:	f8c00537          	lui	a0,0xf8c00
f900079c:	9e9ff0ef          	jal	ra,f9000184 <plic_release>
f90007a0:	fd1ff06f          	j	f9000770 <UartInterrupt+0xc>
        default: crash(); break;
f90007a4:	fa9ff0ef          	jal	ra,f900074c <crash>
}
f90007a8:	00c12083          	lw	ra,12(sp)
f90007ac:	00812403          	lw	s0,8(sp)
f90007b0:	01010113          	addi	sp,sp,16
f90007b4:	00008067          	ret

f90007b8 <trap>:
void trap(){
f90007b8:	ff010113          	addi	sp,sp,-16
f90007bc:	00112623          	sw	ra,12(sp)
    int32_t mcause = csr_read(mcause);
f90007c0:	342027f3          	csrr	a5,mcause
    if(interrupt){
f90007c4:	0207d263          	bgez	a5,f90007e8 <trap+0x30>
f90007c8:	00f7f713          	andi	a4,a5,15
        switch(cause){
f90007cc:	00b00793          	li	a5,11
f90007d0:	00f71a63          	bne	a4,a5,f90007e4 <trap+0x2c>
        case CAUSE_MACHINE_EXTERNAL: UartInterrupt(); break;
f90007d4:	f91ff0ef          	jal	ra,f9000764 <UartInterrupt>
}
f90007d8:	00c12083          	lw	ra,12(sp)
f90007dc:	01010113          	addi	sp,sp,16
f90007e0:	00008067          	ret
        default: crash(); break;
f90007e4:	f69ff0ef          	jal	ra,f900074c <crash>
        crash();
f90007e8:	f65ff0ef          	jal	ra,f900074c <crash>

f90007ec <main>:
}

void main() {
f90007ec:	ff010113          	addi	sp,sp,-16
f90007f0:	00112623          	sw	ra,12(sp)
    init();
f90007f4:	e01ff0ef          	jal	ra,f90005f4 <init>

    bsp_printf("uart 0 interrupt demo ! \r\n");
f90007f8:	f9001537          	lui	a0,0xf9001
f90007fc:	9ac50513          	addi	a0,a0,-1620 # f90009ac <__freertos_irq_stack_top+0xfffff39c>
f9000800:	cbdff0ef          	jal	ra,f90004bc <bsp_printf>
    bsp_printf("start typing on terminal to interrupt uart... \r\n");
f9000804:	f9001537          	lui	a0,0xf9001
f9000808:	9c850513          	addi	a0,a0,-1592 # f90009c8 <__freertos_irq_stack_top+0xfffff3b8>
f900080c:	cb1ff0ef          	jal	ra,f90004bc <bsp_printf>
f9000810:	0180006f          	j	f9000828 <main+0x3c>
    while(1){
        while(uart_readOccupancy(BSP_UART_TERMINAL)){
            uart_write(BSP_UART_TERMINAL, uart_read(BSP_UART_TERMINAL));
f9000814:	f8010537          	lui	a0,0xf8010
f9000818:	9e1ff0ef          	jal	ra,f90001f8 <uart_read>
f900081c:	00050593          	mv	a1,a0
f9000820:	f8010537          	lui	a0,0xf8010
f9000824:	999ff0ef          	jal	ra,f90001bc <uart_write>
        while(uart_readOccupancy(BSP_UART_TERMINAL)){
f9000828:	f8010537          	lui	a0,0xf8010
f900082c:	985ff0ef          	jal	ra,f90001b0 <uart_readOccupancy>
f9000830:	fe050ce3          	beqz	a0,f9000828 <main+0x3c>
f9000834:	fe1ff06f          	j	f9000814 <main+0x28>

f9000838 <trap_entry>:
.global  trap_entry
.align(2) //mtvec require 32 bits allignement
trap_entry:
  addi sp,sp, -16*4
f9000838:	fc010113          	addi	sp,sp,-64
  sw x1,   0*4(sp)
f900083c:	00112023          	sw	ra,0(sp)
  sw x5,   1*4(sp)
f9000840:	00512223          	sw	t0,4(sp)
  sw x6,   2*4(sp)
f9000844:	00612423          	sw	t1,8(sp)
  sw x7,   3*4(sp)
f9000848:	00712623          	sw	t2,12(sp)
  sw x10,  4*4(sp)
f900084c:	00a12823          	sw	a0,16(sp)
  sw x11,  5*4(sp)
f9000850:	00b12a23          	sw	a1,20(sp)
  sw x12,  6*4(sp)
f9000854:	00c12c23          	sw	a2,24(sp)
  sw x13,  7*4(sp)
f9000858:	00d12e23          	sw	a3,28(sp)
  sw x14,  8*4(sp)
f900085c:	02e12023          	sw	a4,32(sp)
  sw x15,  9*4(sp)
f9000860:	02f12223          	sw	a5,36(sp)
  sw x16, 10*4(sp)
f9000864:	03012423          	sw	a6,40(sp)
  sw x17, 11*4(sp)
f9000868:	03112623          	sw	a7,44(sp)
  sw x28, 12*4(sp)
f900086c:	03c12823          	sw	t3,48(sp)
  sw x29, 13*4(sp)
f9000870:	03d12a23          	sw	t4,52(sp)
  sw x30, 14*4(sp)
f9000874:	03e12c23          	sw	t5,56(sp)
  sw x31, 15*4(sp)
f9000878:	03f12e23          	sw	t6,60(sp)
  call trap
f900087c:	f3dff0ef          	jal	ra,f90007b8 <trap>
  lw x1 ,  0*4(sp)
f9000880:	00012083          	lw	ra,0(sp)
  lw x5,   1*4(sp)
f9000884:	00412283          	lw	t0,4(sp)
  lw x6,   2*4(sp)
f9000888:	00812303          	lw	t1,8(sp)
  lw x7,   3*4(sp)
f900088c:	00c12383          	lw	t2,12(sp)
  lw x10,  4*4(sp)
f9000890:	01012503          	lw	a0,16(sp)
  lw x11,  5*4(sp)
f9000894:	01412583          	lw	a1,20(sp)
  lw x12,  6*4(sp)
f9000898:	01812603          	lw	a2,24(sp)
  lw x13,  7*4(sp)
f900089c:	01c12683          	lw	a3,28(sp)
  lw x14,  8*4(sp)
f90008a0:	02012703          	lw	a4,32(sp)
  lw x15,  9*4(sp)
f90008a4:	02412783          	lw	a5,36(sp)
  lw x16, 10*4(sp)
f90008a8:	02812803          	lw	a6,40(sp)
  lw x17, 11*4(sp)
f90008ac:	02c12883          	lw	a7,44(sp)
  lw x28, 12*4(sp)
f90008b0:	03012e03          	lw	t3,48(sp)
  lw x29, 13*4(sp)
f90008b4:	03412e83          	lw	t4,52(sp)
  lw x30, 14*4(sp)
f90008b8:	03812f03          	lw	t5,56(sp)
  lw x31, 15*4(sp)
f90008bc:	03c12f83          	lw	t6,60(sp)
  addi sp,sp, 16*4
f90008c0:	04010113          	addi	sp,sp,64
  mret
f90008c4:	30200073          	mret
