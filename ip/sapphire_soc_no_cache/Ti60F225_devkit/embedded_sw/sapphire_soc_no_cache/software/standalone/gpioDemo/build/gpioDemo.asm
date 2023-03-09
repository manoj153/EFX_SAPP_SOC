
build/gpioDemo.elf:     file format elf32-littleriscv


Disassembly of section .init:

f9000000 <_start>:
f9000000:	00001197          	auipc	gp,0x1
f9000004:	e9018193          	addi	gp,gp,-368 # f9000e90 <__global_pointer$>

f9000008 <init>:
f9000008:	42018113          	addi	sp,gp,1056 # f90012b0 <__freertos_irq_stack_top>
f900000c:	00000517          	auipc	a0,0x0
f9000010:	54450513          	addi	a0,a0,1348 # f9000550 <__init_array_end>
f9000014:	00000597          	auipc	a1,0x0
f9000018:	53c58593          	addi	a1,a1,1340 # f9000550 <__init_array_end>
f900001c:	81c18613          	addi	a2,gp,-2020 # f90006ac <__bss_start>
f9000020:	00c5fc63          	bgeu	a1,a2,f9000038 <init+0x30>
f9000024:	00052283          	lw	t0,0(a0)
f9000028:	0055a023          	sw	t0,0(a1)
f900002c:	00450513          	addi	a0,a0,4
f9000030:	00458593          	addi	a1,a1,4
f9000034:	fec5e8e3          	bltu	a1,a2,f9000024 <init+0x1c>
f9000038:	81c18513          	addi	a0,gp,-2020 # f90006ac <__bss_start>
f900003c:	82018593          	addi	a1,gp,-2016 # f90006b0 <_end>
f9000040:	00b57863          	bgeu	a0,a1,f9000050 <init+0x48>
f9000044:	00052023          	sw	zero,0(a0)
f9000048:	00450513          	addi	a0,a0,4
f900004c:	feb56ce3          	bltu	a0,a1,f9000044 <init+0x3c>
f9000050:	010000ef          	jal	ra,f9000060 <__libc_init_array>
f9000054:	0a0000ef          	jal	ra,f90000f4 <main>

f9000058 <mainDone>:
f9000058:	0000006f          	j	f9000058 <mainDone>

f900005c <_init>:
f900005c:	00008067          	ret

Disassembly of section .text:

f9000060 <__libc_init_array>:
f9000060:	ff010113          	addi	sp,sp,-16
f9000064:	00812423          	sw	s0,8(sp)
f9000068:	01212023          	sw	s2,0(sp)
f900006c:	00000417          	auipc	s0,0x0
f9000070:	4e440413          	addi	s0,s0,1252 # f9000550 <__init_array_end>
f9000074:	00000917          	auipc	s2,0x0
f9000078:	4dc90913          	addi	s2,s2,1244 # f9000550 <__init_array_end>
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
f90000ac:	4a840413          	addi	s0,s0,1192 # f9000550 <__init_array_end>
f90000b0:	00000917          	auipc	s2,0x0
f90000b4:	4a090913          	addi	s2,s2,1184 # f9000550 <__init_array_end>
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

f90000f4 <main>:
f90000f4:	f9000537          	lui	a0,0xf9000
f90000f8:	ff010113          	addi	sp,sp,-16
f90000fc:	5f450513          	addi	a0,a0,1524 # f90005f4 <__freertos_irq_stack_top+0xfffff344>
f9000100:	00112623          	sw	ra,12(sp)
f9000104:	0a4000ef          	jal	ra,f90001a8 <bsp_printf>
f9000108:	f9000537          	lui	a0,0xf9000
f900010c:	60850513          	addi	a0,a0,1544 # f9000608 <__freertos_irq_stack_top+0xfffff358>
f9000110:	098000ef          	jal	ra,f90001a8 <bsp_printf>
f9000114:	f80157b7          	lui	a5,0xf8015
f9000118:	00e00713          	li	a4,14
f900011c:	00e7a423          	sw	a4,8(a5) # f8015008 <__freertos_irq_stack_top+0xff013d58>
f9000120:	00989737          	lui	a4,0x989
f9000124:	0007a223          	sw	zero,4(a5)
f9000128:	f80155b7          	lui	a1,0xf8015
f900012c:	03200793          	li	a5,50
f9000130:	f8b0c537          	lui	a0,0xf8b0c
f9000134:	68070713          	addi	a4,a4,1664 # 989680 <__stack_size+0x988a80>
f9000138:	0045a683          	lw	a3,4(a1) # f8015004 <__freertos_irq_stack_top+0xff013d54>
f900013c:	00e6c693          	xori	a3,a3,14
f9000140:	00d5a223          	sw	a3,4(a1)
f9000144:	ff852603          	lw	a2,-8(a0) # f8b0bff8 <__freertos_irq_stack_top+0xffb0ad48>
f9000148:	00e60633          	add	a2,a2,a4
f900014c:	ff852683          	lw	a3,-8(a0)
f9000150:	40d606b3          	sub	a3,a2,a3
f9000154:	fe06dce3          	bgez	a3,f900014c <main+0x58>
f9000158:	fff78793          	addi	a5,a5,-1
f900015c:	fc079ee3          	bnez	a5,f9000138 <main+0x44>
f9000160:	f9000537          	lui	a0,0xf9000
f9000164:	62450513          	addi	a0,a0,1572 # f9000624 <__freertos_irq_stack_top+0xfffff374>
f9000168:	040000ef          	jal	ra,f90001a8 <bsp_printf>
f900016c:	f9000537          	lui	a0,0xf9000
f9000170:	64050513          	addi	a0,a0,1600 # f9000640 <__freertos_irq_stack_top+0xfffff390>
f9000174:	034000ef          	jal	ra,f90001a8 <bsp_printf>
f9000178:	f9000537          	lui	a0,0xf9000
f900017c:	67050513          	addi	a0,a0,1648 # f9000670 <__freertos_irq_stack_top+0xfffff3c0>
f9000180:	028000ef          	jal	ra,f90001a8 <bsp_printf>
f9000184:	24c000ef          	jal	ra,f90003d0 <init>
f9000188:	0000006f          	j	f9000188 <main+0x94>

f900018c <uart_write.constprop.1>:
f900018c:	f8010737          	lui	a4,0xf8010
f9000190:	00472783          	lw	a5,4(a4) # f8010004 <__freertos_irq_stack_top+0xff00ed54>
f9000194:	0107d793          	srli	a5,a5,0x10
f9000198:	0ff7f793          	andi	a5,a5,255
f900019c:	fe078ae3          	beqz	a5,f9000190 <uart_write.constprop.1+0x4>
f90001a0:	00a72023          	sw	a0,0(a4)
f90001a4:	00008067          	ret

f90001a8 <bsp_printf>:
f90001a8:	f8010113          	addi	sp,sp,-128
f90001ac:	05312623          	sw	s3,76(sp)
f90001b0:	05412423          	sw	s4,72(sp)
f90001b4:	06f12a23          	sw	a5,116(sp)
f90001b8:	f90009b7          	lui	s3,0xf9000
f90001bc:	06410793          	addi	a5,sp,100
f90001c0:	f9000a37          	lui	s4,0xf9000
f90001c4:	05212823          	sw	s2,80(sp)
f90001c8:	05512223          	sw	s5,68(sp)
f90001cc:	05612023          	sw	s6,64(sp)
f90001d0:	03712e23          	sw	s7,60(sp)
f90001d4:	03812c23          	sw	s8,56(sp)
f90001d8:	04112e23          	sw	ra,92(sp)
f90001dc:	04812c23          	sw	s0,88(sp)
f90001e0:	04912a23          	sw	s1,84(sp)
f90001e4:	03912a23          	sw	s9,52(sp)
f90001e8:	00050a93          	mv	s5,a0
f90001ec:	06b12223          	sw	a1,100(sp)
f90001f0:	06c12423          	sw	a2,104(sp)
f90001f4:	06d12623          	sw	a3,108(sp)
f90001f8:	06e12823          	sw	a4,112(sp)
f90001fc:	07012c23          	sw	a6,120(sp)
f9000200:	07112e23          	sw	a7,124(sp)
f9000204:	00f12623          	sw	a5,12(sp)
f9000208:	00000913          	li	s2,0
f900020c:	02500b13          	li	s6,37
f9000210:	06300b93          	li	s7,99
f9000214:	f9000c37          	lui	s8,0xf9000
f9000218:	59c98993          	addi	s3,s3,1436 # f900059c <__freertos_irq_stack_top+0xfffff2ec>
f900021c:	5b0a0a13          	addi	s4,s4,1456 # f90005b0 <__freertos_irq_stack_top+0xfffff300>
f9000220:	012a87b3          	add	a5,s5,s2
f9000224:	0007c503          	lbu	a0,0(a5)
f9000228:	02051c63          	bnez	a0,f9000260 <bsp_printf+0xb8>
f900022c:	05c12083          	lw	ra,92(sp)
f9000230:	05812403          	lw	s0,88(sp)
f9000234:	05412483          	lw	s1,84(sp)
f9000238:	05012903          	lw	s2,80(sp)
f900023c:	04c12983          	lw	s3,76(sp)
f9000240:	04812a03          	lw	s4,72(sp)
f9000244:	04412a83          	lw	s5,68(sp)
f9000248:	04012b03          	lw	s6,64(sp)
f900024c:	03c12b83          	lw	s7,60(sp)
f9000250:	03812c03          	lw	s8,56(sp)
f9000254:	03412c83          	lw	s9,52(sp)
f9000258:	08010113          	addi	sp,sp,128
f900025c:	00008067          	ret
f9000260:	03651e63          	bne	a0,s6,f900029c <bsp_printf+0xf4>
f9000264:	07300713          	li	a4,115
f9000268:	06400693          	li	a3,100
f900026c:	05800613          	li	a2,88
f9000270:	07800593          	li	a1,120
f9000274:	06600513          	li	a0,102
f9000278:	00190913          	addi	s2,s2,1
f900027c:	012a87b3          	add	a5,s5,s2
f9000280:	0007c783          	lbu	a5,0(a5)
f9000284:	02078e63          	beqz	a5,f90002c0 <bsp_printf+0x118>
f9000288:	01779e63          	bne	a5,s7,f90002a4 <bsp_printf+0xfc>
f900028c:	00c12783          	lw	a5,12(sp)
f9000290:	0007c503          	lbu	a0,0(a5)
f9000294:	00478713          	addi	a4,a5,4
f9000298:	00e12623          	sw	a4,12(sp)
f900029c:	ef1ff0ef          	jal	ra,f900018c <uart_write.constprop.1>
f90002a0:	0200006f          	j	f90002c0 <bsp_printf+0x118>
f90002a4:	02e79863          	bne	a5,a4,f90002d4 <bsp_printf+0x12c>
f90002a8:	00c12783          	lw	a5,12(sp)
f90002ac:	0007a403          	lw	s0,0(a5)
f90002b0:	00478713          	addi	a4,a5,4
f90002b4:	00e12623          	sw	a4,12(sp)
f90002b8:	00044503          	lbu	a0,0(s0)
f90002bc:	00051663          	bnez	a0,f90002c8 <bsp_printf+0x120>
f90002c0:	00190913          	addi	s2,s2,1
f90002c4:	f5dff06f          	j	f9000220 <bsp_printf+0x78>
f90002c8:	00140413          	addi	s0,s0,1
f90002cc:	ec1ff0ef          	jal	ra,f900018c <uart_write.constprop.1>
f90002d0:	fe9ff06f          	j	f90002b8 <bsp_printf+0x110>
f90002d4:	06d79263          	bne	a5,a3,f9000338 <bsp_printf+0x190>
f90002d8:	00c12783          	lw	a5,12(sp)
f90002dc:	0007a483          	lw	s1,0(a5)
f90002e0:	00478713          	addi	a4,a5,4
f90002e4:	00e12623          	sw	a4,12(sp)
f90002e8:	0004d863          	bgez	s1,f90002f8 <bsp_printf+0x150>
f90002ec:	02d00513          	li	a0,45
f90002f0:	e9dff0ef          	jal	ra,f900018c <uart_write.constprop.1>
f90002f4:	409004b3          	neg	s1,s1
f90002f8:	01010413          	addi	s0,sp,16
f90002fc:	00040c93          	mv	s9,s0
f9000300:	00a00713          	li	a4,10
f9000304:	00049e63          	bnez	s1,f9000320 <bsp_printf+0x178>
f9000308:	01940c63          	beq	s0,s9,f9000320 <bsp_printf+0x178>
f900030c:	fff40413          	addi	s0,s0,-1
f9000310:	00044503          	lbu	a0,0(s0)
f9000314:	e79ff0ef          	jal	ra,f900018c <uart_write.constprop.1>
f9000318:	ff941ae3          	bne	s0,s9,f900030c <bsp_printf+0x164>
f900031c:	fa5ff06f          	j	f90002c0 <bsp_printf+0x118>
f9000320:	02e4e7b3          	rem	a5,s1,a4
f9000324:	00140413          	addi	s0,s0,1
f9000328:	03078793          	addi	a5,a5,48
f900032c:	fef40fa3          	sb	a5,-1(s0)
f9000330:	02e4c4b3          	div	s1,s1,a4
f9000334:	fd1ff06f          	j	f9000304 <bsp_printf+0x15c>
f9000338:	02c79e63          	bne	a5,a2,f9000374 <bsp_printf+0x1cc>
f900033c:	00c12783          	lw	a5,12(sp)
f9000340:	01c00413          	li	s0,28
f9000344:	ffc00493          	li	s1,-4
f9000348:	0007ac83          	lw	s9,0(a5)
f900034c:	00478713          	addi	a4,a5,4
f9000350:	00e12623          	sw	a4,12(sp)
f9000354:	008cd7b3          	srl	a5,s9,s0
f9000358:	00f7f793          	andi	a5,a5,15
f900035c:	00fa07b3          	add	a5,s4,a5
f9000360:	0007c503          	lbu	a0,0(a5)
f9000364:	ffc40413          	addi	s0,s0,-4
f9000368:	e25ff0ef          	jal	ra,f900018c <uart_write.constprop.1>
f900036c:	fe9414e3          	bne	s0,s1,f9000354 <bsp_printf+0x1ac>
f9000370:	f51ff06f          	j	f90002c0 <bsp_printf+0x118>
f9000374:	02b79e63          	bne	a5,a1,f90003b0 <bsp_printf+0x208>
f9000378:	00c12783          	lw	a5,12(sp)
f900037c:	01c00413          	li	s0,28
f9000380:	ffc00493          	li	s1,-4
f9000384:	0007ac83          	lw	s9,0(a5)
f9000388:	00478713          	addi	a4,a5,4
f900038c:	00e12623          	sw	a4,12(sp)
f9000390:	008cd7b3          	srl	a5,s9,s0
f9000394:	00f7f793          	andi	a5,a5,15
f9000398:	00f987b3          	add	a5,s3,a5
f900039c:	0007c503          	lbu	a0,0(a5)
f90003a0:	ffc40413          	addi	s0,s0,-4
f90003a4:	de9ff0ef          	jal	ra,f900018c <uart_write.constprop.1>
f90003a8:	fe9414e3          	bne	s0,s1,f9000390 <bsp_printf+0x1e8>
f90003ac:	f15ff06f          	j	f90002c0 <bsp_printf+0x118>
f90003b0:	eca794e3          	bne	a5,a0,f9000278 <bsp_printf+0xd0>
f90003b4:	550c0413          	addi	s0,s8,1360 # f9000550 <__freertos_irq_stack_top+0xfffff2a0>
f90003b8:	00c0006f          	j	f90003c4 <bsp_printf+0x21c>
f90003bc:	00140413          	addi	s0,s0,1
f90003c0:	dcdff0ef          	jal	ra,f900018c <uart_write.constprop.1>
f90003c4:	00044503          	lbu	a0,0(s0)
f90003c8:	fe051ae3          	bnez	a0,f90003bc <bsp_printf+0x214>
f90003cc:	ef5ff06f          	j	f90002c0 <bsp_printf+0x118>

f90003d0 <init>:
f90003d0:	f8e007b7          	lui	a5,0xf8e00
f90003d4:	0007a023          	sw	zero,0(a5) # f8e00000 <__freertos_irq_stack_top+0xffdfed50>
f90003d8:	f8c026b7          	lui	a3,0xf8c02
f90003dc:	0006a703          	lw	a4,0(a3) # f8c02000 <__freertos_irq_stack_top+0xffc00d50>
f90003e0:	000017b7          	lui	a5,0x1
f90003e4:	00f76733          	or	a4,a4,a5
f90003e8:	00e6a023          	sw	a4,0(a3)
f90003ec:	00100713          	li	a4,1
f90003f0:	f8c006b7          	lui	a3,0xf8c00
f90003f4:	02e6a823          	sw	a4,48(a3) # f8c00030 <__freertos_irq_stack_top+0xffbfed80>
f90003f8:	f80156b7          	lui	a3,0xf8015
f90003fc:	02e6a023          	sw	a4,32(a3) # f8015020 <__freertos_irq_stack_top+0xff013d70>
f9000400:	f9000737          	lui	a4,0xf9000
f9000404:	4c070713          	addi	a4,a4,1216 # f90004c0 <__freertos_irq_stack_top+0xfffff210>
f9000408:	30571073          	csrw	mtvec,a4
f900040c:	80078793          	addi	a5,a5,-2048 # 800 <CUSTOM1+0x7d5>
f9000410:	3047a073          	csrs	mie,a5
f9000414:	000027b7          	lui	a5,0x2
f9000418:	80878793          	addi	a5,a5,-2040 # 1808 <__stack_size+0xc08>
f900041c:	30079073          	csrw	mstatus,a5
f9000420:	00008067          	ret

f9000424 <crash>:
f9000424:	f9000537          	lui	a0,0xf9000
f9000428:	ff010113          	addi	sp,sp,-16
f900042c:	5c450513          	addi	a0,a0,1476 # f90005c4 <__freertos_irq_stack_top+0xfffff314>
f9000430:	00112623          	sw	ra,12(sp)
f9000434:	d75ff0ef          	jal	ra,f90001a8 <bsp_printf>
f9000438:	0000006f          	j	f9000438 <crash+0x14>

f900043c <externalInterrupt>:
f900043c:	ff010113          	addi	sp,sp,-16
f9000440:	00812423          	sw	s0,8(sp)
f9000444:	00912223          	sw	s1,4(sp)
f9000448:	01212023          	sw	s2,0(sp)
f900044c:	00112623          	sw	ra,12(sp)
f9000450:	f8e00437          	lui	s0,0xf8e00
f9000454:	00c00493          	li	s1,12
f9000458:	f9000937          	lui	s2,0xf9000
f900045c:	00442783          	lw	a5,4(s0) # f8e00004 <__freertos_irq_stack_top+0xffdfed54>
f9000460:	00079e63          	bnez	a5,f900047c <externalInterrupt+0x40>
f9000464:	00c12083          	lw	ra,12(sp)
f9000468:	00812403          	lw	s0,8(sp)
f900046c:	00412483          	lw	s1,4(sp)
f9000470:	00012903          	lw	s2,0(sp)
f9000474:	01010113          	addi	sp,sp,16
f9000478:	00008067          	ret
f900047c:	00979a63          	bne	a5,s1,f9000490 <externalInterrupt+0x54>
f9000480:	5d890513          	addi	a0,s2,1496 # f90005d8 <__freertos_irq_stack_top+0xfffff328>
f9000484:	d25ff0ef          	jal	ra,f90001a8 <bsp_printf>
f9000488:	00942223          	sw	s1,4(s0)
f900048c:	fd1ff06f          	j	f900045c <externalInterrupt+0x20>
f9000490:	f95ff0ef          	jal	ra,f9000424 <crash>

f9000494 <trap>:
f9000494:	ff010113          	addi	sp,sp,-16
f9000498:	00112623          	sw	ra,12(sp)
f900049c:	342027f3          	csrr	a5,mcause
f90004a0:	0007de63          	bgez	a5,f90004bc <trap+0x28>
f90004a4:	00f7f713          	andi	a4,a5,15
f90004a8:	00b00793          	li	a5,11
f90004ac:	00f71863          	bne	a4,a5,f90004bc <trap+0x28>
f90004b0:	00c12083          	lw	ra,12(sp)
f90004b4:	01010113          	addi	sp,sp,16
f90004b8:	f85ff06f          	j	f900043c <externalInterrupt>
f90004bc:	f69ff0ef          	jal	ra,f9000424 <crash>

f90004c0 <trap_entry>:
f90004c0:	fc010113          	addi	sp,sp,-64
f90004c4:	00112023          	sw	ra,0(sp)
f90004c8:	00512223          	sw	t0,4(sp)
f90004cc:	00612423          	sw	t1,8(sp)
f90004d0:	00712623          	sw	t2,12(sp)
f90004d4:	00a12823          	sw	a0,16(sp)
f90004d8:	00b12a23          	sw	a1,20(sp)
f90004dc:	00c12c23          	sw	a2,24(sp)
f90004e0:	00d12e23          	sw	a3,28(sp)
f90004e4:	02e12023          	sw	a4,32(sp)
f90004e8:	02f12223          	sw	a5,36(sp)
f90004ec:	03012423          	sw	a6,40(sp)
f90004f0:	03112623          	sw	a7,44(sp)
f90004f4:	03c12823          	sw	t3,48(sp)
f90004f8:	03d12a23          	sw	t4,52(sp)
f90004fc:	03e12c23          	sw	t5,56(sp)
f9000500:	03f12e23          	sw	t6,60(sp)
f9000504:	f91ff0ef          	jal	ra,f9000494 <trap>
f9000508:	00012083          	lw	ra,0(sp)
f900050c:	00412283          	lw	t0,4(sp)
f9000510:	00812303          	lw	t1,8(sp)
f9000514:	00c12383          	lw	t2,12(sp)
f9000518:	01012503          	lw	a0,16(sp)
f900051c:	01412583          	lw	a1,20(sp)
f9000520:	01812603          	lw	a2,24(sp)
f9000524:	01c12683          	lw	a3,28(sp)
f9000528:	02012703          	lw	a4,32(sp)
f900052c:	02412783          	lw	a5,36(sp)
f9000530:	02812803          	lw	a6,40(sp)
f9000534:	02c12883          	lw	a7,44(sp)
f9000538:	03012e03          	lw	t3,48(sp)
f900053c:	03412e83          	lw	t4,52(sp)
f9000540:	03812f03          	lw	t5,56(sp)
f9000544:	03c12f83          	lw	t6,60(sp)
f9000548:	04010113          	addi	sp,sp,64
f900054c:	30200073          	mret
