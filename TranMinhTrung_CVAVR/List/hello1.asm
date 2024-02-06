
;CodeVisionAVR C Compiler V2.05.0 Professional
;(C) Copyright 1998-2010 Pavel Haiduc, HP InfoTech s.r.l.
;http://www.hpinfotech.com

;Chip type                : ATmega16
;Program type             : Application
;Clock frequency          : 8.000000 MHz
;Memory model             : Small
;Optimize for             : Size
;(s)printf features       : int, width
;(s)scanf features        : int, width
;External RAM size        : 0
;Data Stack size          : 256 byte(s)
;Heap size                : 0 byte(s)
;Promote 'char' to 'int'  : Yes
;'char' is unsigned       : Yes
;8 bit enums              : Yes
;global 'const' stored in FLASH: No
;Enhanced core instructions    : On
;Smart register allocation     : On
;Automatic register allocation : On

	#pragma AVRPART ADMIN PART_NAME ATmega16
	#pragma AVRPART MEMORY PROG_FLASH 16384
	#pragma AVRPART MEMORY EEPROM 512
	#pragma AVRPART MEMORY INT_SRAM SIZE 1119
	#pragma AVRPART MEMORY INT_SRAM START_ADDR 0x60

	#define CALL_SUPPORTED 1

	.LISTMAC
	.EQU UDRE=0x5
	.EQU RXC=0x7
	.EQU USR=0xB
	.EQU UDR=0xC
	.EQU SPSR=0xE
	.EQU SPDR=0xF
	.EQU EERE=0x0
	.EQU EEWE=0x1
	.EQU EEMWE=0x2
	.EQU EECR=0x1C
	.EQU EEDR=0x1D
	.EQU EEARL=0x1E
	.EQU EEARH=0x1F
	.EQU WDTCR=0x21
	.EQU MCUCR=0x35
	.EQU GICR=0x3B
	.EQU SPL=0x3D
	.EQU SPH=0x3E
	.EQU SREG=0x3F

	.DEF R0X0=R0
	.DEF R0X1=R1
	.DEF R0X2=R2
	.DEF R0X3=R3
	.DEF R0X4=R4
	.DEF R0X5=R5
	.DEF R0X6=R6
	.DEF R0X7=R7
	.DEF R0X8=R8
	.DEF R0X9=R9
	.DEF R0XA=R10
	.DEF R0XB=R11
	.DEF R0XC=R12
	.DEF R0XD=R13
	.DEF R0XE=R14
	.DEF R0XF=R15
	.DEF R0X10=R16
	.DEF R0X11=R17
	.DEF R0X12=R18
	.DEF R0X13=R19
	.DEF R0X14=R20
	.DEF R0X15=R21
	.DEF R0X16=R22
	.DEF R0X17=R23
	.DEF R0X18=R24
	.DEF R0X19=R25
	.DEF R0X1A=R26
	.DEF R0X1B=R27
	.DEF R0X1C=R28
	.DEF R0X1D=R29
	.DEF R0X1E=R30
	.DEF R0X1F=R31

	.EQU __SRAM_START=0x0060
	.EQU __SRAM_END=0x045F
	.EQU __DSTACK_SIZE=0x0100
	.EQU __HEAP_SIZE=0x0000
	.EQU __CLEAR_SRAM_SIZE=__SRAM_END-__SRAM_START+1

	.MACRO __CPD1N
	CPI  R30,LOW(@0)
	LDI  R26,HIGH(@0)
	CPC  R31,R26
	LDI  R26,BYTE3(@0)
	CPC  R22,R26
	LDI  R26,BYTE4(@0)
	CPC  R23,R26
	.ENDM

	.MACRO __CPD2N
	CPI  R26,LOW(@0)
	LDI  R30,HIGH(@0)
	CPC  R27,R30
	LDI  R30,BYTE3(@0)
	CPC  R24,R30
	LDI  R30,BYTE4(@0)
	CPC  R25,R30
	.ENDM

	.MACRO __CPWRR
	CP   R@0,R@2
	CPC  R@1,R@3
	.ENDM

	.MACRO __CPWRN
	CPI  R@0,LOW(@2)
	LDI  R30,HIGH(@2)
	CPC  R@1,R30
	.ENDM

	.MACRO __ADDB1MN
	SUBI R30,LOW(-@0-(@1))
	.ENDM

	.MACRO __ADDB2MN
	SUBI R26,LOW(-@0-(@1))
	.ENDM

	.MACRO __ADDW1MN
	SUBI R30,LOW(-@0-(@1))
	SBCI R31,HIGH(-@0-(@1))
	.ENDM

	.MACRO __ADDW2MN
	SUBI R26,LOW(-@0-(@1))
	SBCI R27,HIGH(-@0-(@1))
	.ENDM

	.MACRO __ADDW1FN
	SUBI R30,LOW(-2*@0-(@1))
	SBCI R31,HIGH(-2*@0-(@1))
	.ENDM

	.MACRO __ADDD1FN
	SUBI R30,LOW(-2*@0-(@1))
	SBCI R31,HIGH(-2*@0-(@1))
	SBCI R22,BYTE3(-2*@0-(@1))
	.ENDM

	.MACRO __ADDD1N
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	SBCI R22,BYTE3(-@0)
	SBCI R23,BYTE4(-@0)
	.ENDM

	.MACRO __ADDD2N
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	SBCI R24,BYTE3(-@0)
	SBCI R25,BYTE4(-@0)
	.ENDM

	.MACRO __SUBD1N
	SUBI R30,LOW(@0)
	SBCI R31,HIGH(@0)
	SBCI R22,BYTE3(@0)
	SBCI R23,BYTE4(@0)
	.ENDM

	.MACRO __SUBD2N
	SUBI R26,LOW(@0)
	SBCI R27,HIGH(@0)
	SBCI R24,BYTE3(@0)
	SBCI R25,BYTE4(@0)
	.ENDM

	.MACRO __ANDBMNN
	LDS  R30,@0+(@1)
	ANDI R30,LOW(@2)
	STS  @0+(@1),R30
	.ENDM

	.MACRO __ANDWMNN
	LDS  R30,@0+(@1)
	ANDI R30,LOW(@2)
	STS  @0+(@1),R30
	LDS  R30,@0+(@1)+1
	ANDI R30,HIGH(@2)
	STS  @0+(@1)+1,R30
	.ENDM

	.MACRO __ANDD1N
	ANDI R30,LOW(@0)
	ANDI R31,HIGH(@0)
	ANDI R22,BYTE3(@0)
	ANDI R23,BYTE4(@0)
	.ENDM

	.MACRO __ANDD2N
	ANDI R26,LOW(@0)
	ANDI R27,HIGH(@0)
	ANDI R24,BYTE3(@0)
	ANDI R25,BYTE4(@0)
	.ENDM

	.MACRO __ORBMNN
	LDS  R30,@0+(@1)
	ORI  R30,LOW(@2)
	STS  @0+(@1),R30
	.ENDM

	.MACRO __ORWMNN
	LDS  R30,@0+(@1)
	ORI  R30,LOW(@2)
	STS  @0+(@1),R30
	LDS  R30,@0+(@1)+1
	ORI  R30,HIGH(@2)
	STS  @0+(@1)+1,R30
	.ENDM

	.MACRO __ORD1N
	ORI  R30,LOW(@0)
	ORI  R31,HIGH(@0)
	ORI  R22,BYTE3(@0)
	ORI  R23,BYTE4(@0)
	.ENDM

	.MACRO __ORD2N
	ORI  R26,LOW(@0)
	ORI  R27,HIGH(@0)
	ORI  R24,BYTE3(@0)
	ORI  R25,BYTE4(@0)
	.ENDM

	.MACRO __DELAY_USB
	LDI  R24,LOW(@0)
__DELAY_USB_LOOP:
	DEC  R24
	BRNE __DELAY_USB_LOOP
	.ENDM

	.MACRO __DELAY_USW
	LDI  R24,LOW(@0)
	LDI  R25,HIGH(@0)
__DELAY_USW_LOOP:
	SBIW R24,1
	BRNE __DELAY_USW_LOOP
	.ENDM

	.MACRO __GETD1S
	LDD  R30,Y+@0
	LDD  R31,Y+@0+1
	LDD  R22,Y+@0+2
	LDD  R23,Y+@0+3
	.ENDM

	.MACRO __GETD2S
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	LDD  R24,Y+@0+2
	LDD  R25,Y+@0+3
	.ENDM

	.MACRO __PUTD1S
	STD  Y+@0,R30
	STD  Y+@0+1,R31
	STD  Y+@0+2,R22
	STD  Y+@0+3,R23
	.ENDM

	.MACRO __PUTD2S
	STD  Y+@0,R26
	STD  Y+@0+1,R27
	STD  Y+@0+2,R24
	STD  Y+@0+3,R25
	.ENDM

	.MACRO __PUTDZ2
	STD  Z+@0,R26
	STD  Z+@0+1,R27
	STD  Z+@0+2,R24
	STD  Z+@0+3,R25
	.ENDM

	.MACRO __CLRD1S
	STD  Y+@0,R30
	STD  Y+@0+1,R30
	STD  Y+@0+2,R30
	STD  Y+@0+3,R30
	.ENDM

	.MACRO __POINTB1MN
	LDI  R30,LOW(@0+(@1))
	.ENDM

	.MACRO __POINTW1MN
	LDI  R30,LOW(@0+(@1))
	LDI  R31,HIGH(@0+(@1))
	.ENDM

	.MACRO __POINTD1M
	LDI  R30,LOW(@0)
	LDI  R31,HIGH(@0)
	LDI  R22,BYTE3(@0)
	LDI  R23,BYTE4(@0)
	.ENDM

	.MACRO __POINTW1FN
	LDI  R30,LOW(2*@0+(@1))
	LDI  R31,HIGH(2*@0+(@1))
	.ENDM

	.MACRO __POINTD1FN
	LDI  R30,LOW(2*@0+(@1))
	LDI  R31,HIGH(2*@0+(@1))
	LDI  R22,BYTE3(2*@0+(@1))
	LDI  R23,BYTE4(2*@0+(@1))
	.ENDM

	.MACRO __POINTB2MN
	LDI  R26,LOW(@0+(@1))
	.ENDM

	.MACRO __POINTW2MN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	.ENDM

	.MACRO __POINTBRM
	LDI  R@0,LOW(@1)
	.ENDM

	.MACRO __POINTWRM
	LDI  R@0,LOW(@2)
	LDI  R@1,HIGH(@2)
	.ENDM

	.MACRO __POINTBRMN
	LDI  R@0,LOW(@1+(@2))
	.ENDM

	.MACRO __POINTWRMN
	LDI  R@0,LOW(@2+(@3))
	LDI  R@1,HIGH(@2+(@3))
	.ENDM

	.MACRO __POINTWRFN
	LDI  R@0,LOW(@2*2+(@3))
	LDI  R@1,HIGH(@2*2+(@3))
	.ENDM

	.MACRO __GETD1N
	LDI  R30,LOW(@0)
	LDI  R31,HIGH(@0)
	LDI  R22,BYTE3(@0)
	LDI  R23,BYTE4(@0)
	.ENDM

	.MACRO __GETD2N
	LDI  R26,LOW(@0)
	LDI  R27,HIGH(@0)
	LDI  R24,BYTE3(@0)
	LDI  R25,BYTE4(@0)
	.ENDM

	.MACRO __GETB1MN
	LDS  R30,@0+(@1)
	.ENDM

	.MACRO __GETB1HMN
	LDS  R31,@0+(@1)
	.ENDM

	.MACRO __GETW1MN
	LDS  R30,@0+(@1)
	LDS  R31,@0+(@1)+1
	.ENDM

	.MACRO __GETD1MN
	LDS  R30,@0+(@1)
	LDS  R31,@0+(@1)+1
	LDS  R22,@0+(@1)+2
	LDS  R23,@0+(@1)+3
	.ENDM

	.MACRO __GETBRMN
	LDS  R@0,@1+(@2)
	.ENDM

	.MACRO __GETWRMN
	LDS  R@0,@2+(@3)
	LDS  R@1,@2+(@3)+1
	.ENDM

	.MACRO __GETWRZ
	LDD  R@0,Z+@2
	LDD  R@1,Z+@2+1
	.ENDM

	.MACRO __GETD2Z
	LDD  R26,Z+@0
	LDD  R27,Z+@0+1
	LDD  R24,Z+@0+2
	LDD  R25,Z+@0+3
	.ENDM

	.MACRO __GETB2MN
	LDS  R26,@0+(@1)
	.ENDM

	.MACRO __GETW2MN
	LDS  R26,@0+(@1)
	LDS  R27,@0+(@1)+1
	.ENDM

	.MACRO __GETD2MN
	LDS  R26,@0+(@1)
	LDS  R27,@0+(@1)+1
	LDS  R24,@0+(@1)+2
	LDS  R25,@0+(@1)+3
	.ENDM

	.MACRO __PUTB1MN
	STS  @0+(@1),R30
	.ENDM

	.MACRO __PUTW1MN
	STS  @0+(@1),R30
	STS  @0+(@1)+1,R31
	.ENDM

	.MACRO __PUTD1MN
	STS  @0+(@1),R30
	STS  @0+(@1)+1,R31
	STS  @0+(@1)+2,R22
	STS  @0+(@1)+3,R23
	.ENDM

	.MACRO __PUTB1EN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	CALL __EEPROMWRB
	.ENDM

	.MACRO __PUTW1EN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	CALL __EEPROMWRW
	.ENDM

	.MACRO __PUTD1EN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	CALL __EEPROMWRD
	.ENDM

	.MACRO __PUTBR0MN
	STS  @0+(@1),R0
	.ENDM

	.MACRO __PUTBMRN
	STS  @0+(@1),R@2
	.ENDM

	.MACRO __PUTWMRN
	STS  @0+(@1),R@2
	STS  @0+(@1)+1,R@3
	.ENDM

	.MACRO __PUTBZR
	STD  Z+@1,R@0
	.ENDM

	.MACRO __PUTWZR
	STD  Z+@2,R@0
	STD  Z+@2+1,R@1
	.ENDM

	.MACRO __GETW1R
	MOV  R30,R@0
	MOV  R31,R@1
	.ENDM

	.MACRO __GETW2R
	MOV  R26,R@0
	MOV  R27,R@1
	.ENDM

	.MACRO __GETWRN
	LDI  R@0,LOW(@2)
	LDI  R@1,HIGH(@2)
	.ENDM

	.MACRO __PUTW1R
	MOV  R@0,R30
	MOV  R@1,R31
	.ENDM

	.MACRO __PUTW2R
	MOV  R@0,R26
	MOV  R@1,R27
	.ENDM

	.MACRO __ADDWRN
	SUBI R@0,LOW(-@2)
	SBCI R@1,HIGH(-@2)
	.ENDM

	.MACRO __ADDWRR
	ADD  R@0,R@2
	ADC  R@1,R@3
	.ENDM

	.MACRO __SUBWRN
	SUBI R@0,LOW(@2)
	SBCI R@1,HIGH(@2)
	.ENDM

	.MACRO __SUBWRR
	SUB  R@0,R@2
	SBC  R@1,R@3
	.ENDM

	.MACRO __ANDWRN
	ANDI R@0,LOW(@2)
	ANDI R@1,HIGH(@2)
	.ENDM

	.MACRO __ANDWRR
	AND  R@0,R@2
	AND  R@1,R@3
	.ENDM

	.MACRO __ORWRN
	ORI  R@0,LOW(@2)
	ORI  R@1,HIGH(@2)
	.ENDM

	.MACRO __ORWRR
	OR   R@0,R@2
	OR   R@1,R@3
	.ENDM

	.MACRO __EORWRR
	EOR  R@0,R@2
	EOR  R@1,R@3
	.ENDM

	.MACRO __GETWRS
	LDD  R@0,Y+@2
	LDD  R@1,Y+@2+1
	.ENDM

	.MACRO __PUTBSR
	STD  Y+@1,R@0
	.ENDM

	.MACRO __PUTWSR
	STD  Y+@2,R@0
	STD  Y+@2+1,R@1
	.ENDM

	.MACRO __MOVEWRR
	MOV  R@0,R@2
	MOV  R@1,R@3
	.ENDM

	.MACRO __INWR
	IN   R@0,@2
	IN   R@1,@2+1
	.ENDM

	.MACRO __OUTWR
	OUT  @2+1,R@1
	OUT  @2,R@0
	.ENDM

	.MACRO __CALL1MN
	LDS  R30,@0+(@1)
	LDS  R31,@0+(@1)+1
	ICALL
	.ENDM

	.MACRO __CALL1FN
	LDI  R30,LOW(2*@0+(@1))
	LDI  R31,HIGH(2*@0+(@1))
	CALL __GETW1PF
	ICALL
	.ENDM

	.MACRO __CALL2EN
	LDI  R26,LOW(@0+(@1))
	LDI  R27,HIGH(@0+(@1))
	CALL __EEPROMRDW
	ICALL
	.ENDM

	.MACRO __GETW1STACK
	IN   R26,SPL
	IN   R27,SPH
	ADIW R26,@0+1
	LD   R30,X+
	LD   R31,X
	.ENDM

	.MACRO __GETD1STACK
	IN   R26,SPL
	IN   R27,SPH
	ADIW R26,@0+1
	LD   R30,X+
	LD   R31,X+
	LD   R22,X
	.ENDM

	.MACRO __NBST
	BST  R@0,@1
	IN   R30,SREG
	LDI  R31,0x40
	EOR  R30,R31
	OUT  SREG,R30
	.ENDM


	.MACRO __PUTB1SN
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SN
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SN
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1SNS
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	ADIW R26,@1
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SNS
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	ADIW R26,@1
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SNS
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	ADIW R26,@1
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1PMN
	LDS  R26,@0
	LDS  R27,@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1PMN
	LDS  R26,@0
	LDS  R27,@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1PMN
	LDS  R26,@0
	LDS  R27,@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1PMNS
	LDS  R26,@0
	LDS  R27,@0+1
	ADIW R26,@1
	ST   X,R30
	.ENDM

	.MACRO __PUTW1PMNS
	LDS  R26,@0
	LDS  R27,@0+1
	ADIW R26,@1
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1PMNS
	LDS  R26,@0
	LDS  R27,@0+1
	ADIW R26,@1
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RN
	MOVW R26,R@0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RN
	MOVW R26,R@0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RN
	MOVW R26,R@0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RNS
	MOVW R26,R@0
	ADIW R26,@1
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RNS
	MOVW R26,R@0
	ADIW R26,@1
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RNS
	MOVW R26,R@0
	ADIW R26,@1
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RON
	MOV  R26,R@0
	MOV  R27,R@1
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RON
	MOV  R26,R@0
	MOV  R27,R@1
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RON
	MOV  R26,R@0
	MOV  R27,R@1
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	CALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RONS
	MOV  R26,R@0
	MOV  R27,R@1
	ADIW R26,@2
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RONS
	MOV  R26,R@0
	MOV  R27,R@1
	ADIW R26,@2
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RONS
	MOV  R26,R@0
	MOV  R27,R@1
	ADIW R26,@2
	CALL __PUTDP1
	.ENDM


	.MACRO __GETB1SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R30,Z
	.ENDM

	.MACRO __GETB1HSX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R31,Z
	.ENDM

	.MACRO __GETW1SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R0,Z+
	LD   R31,Z
	MOV  R30,R0
	.ENDM

	.MACRO __GETD1SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R0,Z+
	LD   R1,Z+
	LD   R22,Z+
	LD   R23,Z
	MOVW R30,R0
	.ENDM

	.MACRO __GETB2SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R26,X
	.ENDM

	.MACRO __GETW2SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	.ENDM

	.MACRO __GETD2SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R1,X+
	LD   R24,X+
	LD   R25,X
	MOVW R26,R0
	.ENDM

	.MACRO __GETBRSX
	MOVW R30,R28
	SUBI R30,LOW(-@1)
	SBCI R31,HIGH(-@1)
	LD   R@0,Z
	.ENDM

	.MACRO __GETWRSX
	MOVW R30,R28
	SUBI R30,LOW(-@2)
	SBCI R31,HIGH(-@2)
	LD   R@0,Z+
	LD   R@1,Z
	.ENDM

	.MACRO __GETBRSX2
	MOVW R26,R28
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	LD   R@0,X
	.ENDM

	.MACRO __GETWRSX2
	MOVW R26,R28
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	LD   R@0,X+
	LD   R@1,X
	.ENDM

	.MACRO __LSLW8SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R31,Z
	CLR  R30
	.ENDM

	.MACRO __PUTB1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X+,R31
	ST   X+,R22
	ST   X,R23
	.ENDM

	.MACRO __CLRW1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X,R30
	.ENDM

	.MACRO __CLRD1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X+,R30
	ST   X+,R30
	ST   X,R30
	.ENDM

	.MACRO __PUTB2SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	ST   Z,R26
	.ENDM

	.MACRO __PUTW2SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	ST   Z+,R26
	ST   Z,R27
	.ENDM

	.MACRO __PUTD2SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	ST   Z+,R26
	ST   Z+,R27
	ST   Z+,R24
	ST   Z,R25
	.ENDM

	.MACRO __PUTBSRX
	MOVW R30,R28
	SUBI R30,LOW(-@1)
	SBCI R31,HIGH(-@1)
	ST   Z,R@0
	.ENDM

	.MACRO __PUTWSRX
	MOVW R30,R28
	SUBI R30,LOW(-@2)
	SBCI R31,HIGH(-@2)
	ST   Z+,R@0
	ST   Z,R@1
	.ENDM

	.MACRO __PUTB1SNX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SNX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SNX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X+,R31
	ST   X+,R22
	ST   X,R23
	.ENDM

	.MACRO __MULBRR
	MULS R@0,R@1
	MOVW R30,R0
	.ENDM

	.MACRO __MULBRRU
	MUL  R@0,R@1
	MOVW R30,R0
	.ENDM

	.MACRO __MULBRR0
	MULS R@0,R@1
	.ENDM

	.MACRO __MULBRRU0
	MUL  R@0,R@1
	.ENDM

	.MACRO __MULBNWRU
	LDI  R26,@2
	MUL  R26,R@0
	MOVW R30,R0
	MUL  R26,R@1
	ADD  R31,R0
	.ENDM

;NAME DEFINITIONS FOR GLOBAL VARIABLES ALLOCATED TO REGISTERS
	.DEF _cnt_int=R4
	.DEF _value_reg1=R6
	.DEF _value_reg2=R8
	.DEF _tram=R11
	.DEF _chuc=R10
	.DEF _donvi=R13

	.CSEG
	.ORG 0x00

;START OF CODE MARKER
__START_OF_CODE:

;INTERRUPT VECTORS
	JMP  __RESET
	JMP  _ext_int0_isr
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  _timer1_ovf_isr
	JMP  0x00
	JMP  0x00
	JMP  _usart_rx_isr
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00
	JMP  0x00

_tbl10_G101:
	.DB  0x10,0x27,0xE8,0x3,0x64,0x0,0xA,0x0
	.DB  0x1,0x0
_tbl16_G101:
	.DB  0x0,0x10,0x0,0x1,0x10,0x0,0x1,0x0

_0x4D:
	.DB  0x0,0x0,0xE1,0x0,0x7B,0x0
_0x0:
	.DB  0x46,0x30,0x42,0x44,0x0,0x45,0x31,0x37
	.DB  0x42,0x0,0x44,0x32,0x33,0x39,0x0,0x43
	.DB  0x32,0x46,0x36,0x0,0x42,0x33,0x42,0x34
	.DB  0x0,0x41,0x34,0x37,0x32,0x0,0x39,0x35
	.DB  0x33,0x30,0x0,0x38,0x35,0x45,0x44,0x0
	.DB  0x37,0x36,0x41,0x42,0x0,0x36,0x37,0x36
	.DB  0x39,0x0,0x49,0x6E,0x74,0x65,0x72,0x72
	.DB  0x75,0x70,0x74,0x20,0x43,0x6F,0x75,0x6E
	.DB  0x74,0x65,0x72,0x3A,0x20,0x0

__GLOBAL_INI_TBL:
	.DW  0x05
	.DW  _0x17
	.DW  _0x0*2

	.DW  0x05
	.DW  _0x17+5
	.DW  _0x0*2+5

	.DW  0x05
	.DW  _0x17+10
	.DW  _0x0*2+10

	.DW  0x05
	.DW  _0x17+15
	.DW  _0x0*2+15

	.DW  0x05
	.DW  _0x17+20
	.DW  _0x0*2+20

	.DW  0x05
	.DW  _0x17+25
	.DW  _0x0*2+25

	.DW  0x05
	.DW  _0x17+30
	.DW  _0x0*2+30

	.DW  0x05
	.DW  _0x17+35
	.DW  _0x0*2+35

	.DW  0x05
	.DW  _0x17+40
	.DW  _0x0*2+40

	.DW  0x05
	.DW  _0x17+45
	.DW  _0x0*2+45

	.DW  0x14
	.DW  _0x47
	.DW  _0x0*2+50

	.DW  0x06
	.DW  0x04
	.DW  _0x4D*2

_0xFFFFFFFF:
	.DW  0

__RESET:
	CLI
	CLR  R30
	OUT  EECR,R30

;INTERRUPT VECTORS ARE PLACED
;AT THE START OF FLASH
	LDI  R31,1
	OUT  GICR,R31
	OUT  GICR,R30
	OUT  MCUCR,R30

;DISABLE WATCHDOG
	LDI  R31,0x18
	OUT  WDTCR,R31
	OUT  WDTCR,R30

;CLEAR R2-R14
	LDI  R24,(14-2)+1
	LDI  R26,2
	CLR  R27
__CLEAR_REG:
	ST   X+,R30
	DEC  R24
	BRNE __CLEAR_REG

;CLEAR SRAM
	LDI  R24,LOW(__CLEAR_SRAM_SIZE)
	LDI  R25,HIGH(__CLEAR_SRAM_SIZE)
	LDI  R26,__SRAM_START
__CLEAR_SRAM:
	ST   X+,R30
	SBIW R24,1
	BRNE __CLEAR_SRAM

;GLOBAL VARIABLES INITIALIZATION
	LDI  R30,LOW(__GLOBAL_INI_TBL*2)
	LDI  R31,HIGH(__GLOBAL_INI_TBL*2)
__GLOBAL_INI_NEXT:
	LPM  R24,Z+
	LPM  R25,Z+
	SBIW R24,0
	BREQ __GLOBAL_INI_END
	LPM  R26,Z+
	LPM  R27,Z+
	LPM  R0,Z+
	LPM  R1,Z+
	MOVW R22,R30
	MOVW R30,R0
__GLOBAL_INI_LOOP:
	LPM  R0,Z+
	ST   X+,R0
	SBIW R24,1
	BRNE __GLOBAL_INI_LOOP
	MOVW R30,R22
	RJMP __GLOBAL_INI_NEXT
__GLOBAL_INI_END:

;HARDWARE STACK POINTER INITIALIZATION
	LDI  R30,LOW(__SRAM_END-__HEAP_SIZE)
	OUT  SPL,R30
	LDI  R30,HIGH(__SRAM_END-__HEAP_SIZE)
	OUT  SPH,R30

;DATA STACK POINTER INITIALIZATION
	LDI  R28,LOW(__SRAM_START+__DSTACK_SIZE)
	LDI  R29,HIGH(__SRAM_START+__DSTACK_SIZE)

	JMP  _main

	.ESEG
	.ORG 0

	.DSEG
	.ORG 0x160

	.CSEG
;/*****************************************************
;This program was produced by the
;CodeWizardAVR V2.05.0 Professional
;Automatic Program Generator
;© Copyright 1998-2010 Pavel Haiduc, HP InfoTech s.r.l.
;http://www.hpinfotech.com
;
;Project :
;Version :
;Date    : 12/21/2023
;Author  : NeVaDa
;Company :
;Comments:
;
;
;Chip type               : ATmega16
;Program type            : Application
;AVR Core Clock frequency: 8.000000 MHz
;Memory model            : Small
;External RAM size       : 0
;Data Stack size         : 256
;*****************************************************/
;
;#include <mega16.h>
	#ifndef __SLEEP_DEFINED__
	#define __SLEEP_DEFINED__
	.EQU __se_bit=0x40
	.EQU __sm_mask=0xB0
	.EQU __sm_powerdown=0x20
	.EQU __sm_powersave=0x30
	.EQU __sm_standby=0xA0
	.EQU __sm_ext_standby=0xB0
	.EQU __sm_adc_noise_red=0x10
	.SET power_ctrl_reg=mcucr
	#endif
;#include <string.h>
;#include <delay.h>
;
;// External Interrupt 0 service routine
;unsigned int cnt_int = 0; // bien diem ngat interrupt
;unsigned int value_reg1 = 225;  // bien luu gia tri chua thanh ghi timer TCNT1H
;unsigned int value_reg2 = 123;  // bien luu gia tri chua thanh ghi timer TCNT1L
;
;// Standard Input/Output functions
;#include <stdio.h>
;
;// Timer1 overflow interrupt service routine
;interrupt [TIM1_OVF] void timer1_ovf_isr(void)
; 0000 0026 {

	.CSEG
_timer1_ovf_isr:
; 0000 0027 // Place your code here
; 0000 0028     PORTC.0 = !PORTC.0; // dao trang thai cua led khi xay ra ngat timer
	SBIS 0x15,0
	RJMP _0x3
	CBI  0x15,0
	RJMP _0x4
_0x3:
	SBI  0x15,0
_0x4:
; 0000 0029     TCNT1H=value_reg1;  // thanh ghi 8 bit High luu gia tri cau hinh thoi gian timer
	OUT  0x2D,R6
; 0000 002A     TCNT1L=value_reg1;  // thanh ghi 8 bit Low luu gia tri cau hinh thoi gian timer
	OUT  0x2C,R6
; 0000 002B }
	RETI
;
;#define ADC_VREF_TYPE 0x00
;unsigned long ADC_OUT = 0; // bien luu gia tri analog khi doc nhiet do
;unsigned long voltage; // bien dung de tinh gia tri cua volte
;unsigned long temperature; // bien luu gia tri nhiet do
;unsigned char tram, chuc, donvi; // khai bao bien tram, chuc, donvi de hien thi so lieu
;
;// Read the AD conversion result
;unsigned int read_adc(unsigned char adc_input)
; 0000 0035 {
_read_adc:
; 0000 0036 // Chon dau vào dien ap tham chieu ADC thông qua thanh ghi ADMUX
; 0000 0037 ADMUX=adc_input | (ADC_VREF_TYPE & 0xff);
;	adc_input -> Y+0
	LD   R30,Y
	OUT  0x7,R30
; 0000 0038 // Delay needed for the stabilization of the ADC input voltage
; 0000 0039 delay_us(10);
	__DELAY_USB 27
; 0000 003A // Start the AD conversion
; 0000 003B ADCSRA|=0x40; // 0x40 la set bit ADSC len 1 de bat dau qua trinh chuyen doi ADC
	SBI  0x6,6
; 0000 003C // Wait for the AD conversion to complete
; 0000 003D while ((ADCSRA & 0x10)==0); // doi cho qua trinh chuyen doi hoan tat de bat dau chuyen doi gia tri tiep theo
_0x5:
	SBIS 0x6,4
	RJMP _0x5
; 0000 003E ADCSRA|=0x10; // dat co bit ADIF xac nhan qua trinh chuyen doi thanh cong
	SBI  0x6,4
; 0000 003F return ADCW;  // tra ve gia tri ADC
	IN   R30,0x4
	IN   R31,0x4+1
	RJMP _0x2060001
; 0000 0040 }
;
;// ham truyen uart 1 ky tu
;void uart_char_send(unsigned char chr) {
; 0000 0043 void uart_char_send(unsigned char chr) {
_uart_char_send:
; 0000 0044     while (!(UCSRA & (1<<UDRE))) {};  // ham cho den khi UDR tro thanh trong
;	chr -> Y+0
_0x8:
	SBIS 0xB,5
	RJMP _0x8
; 0000 0045     UDR=chr; // ghi ky tu vao UDR
	LD   R30,Y
	OUT  0xC,R30
; 0000 0046 }
_0x2060001:
	ADIW R28,1
	RET
;
;// ham truyen uart 1 chuoi ky tu
;void uart_string_send(unsigned char *txt) {
; 0000 0049 void uart_string_send(unsigned char *txt) {
_uart_string_send:
; 0000 004A     unsigned int n, i;
; 0000 004B     n = strlen(txt); // lay do dai cua chuoi ky tu
	CALL __SAVELOCR4
;	*txt -> Y+4
;	n -> R16,R17
;	i -> R18,R19
	LDD  R30,Y+4
	LDD  R31,Y+4+1
	ST   -Y,R31
	ST   -Y,R30
	CALL _strlen
	MOVW R16,R30
; 0000 004C     for (i = 0; i < n; i++) {
	__GETWRN 18,19,0
_0xC:
	__CPWRR 18,19,16,17
	BRSH _0xD
; 0000 004D         uart_char_send(txt[i]);
	MOVW R30,R18
	LDD  R26,Y+4
	LDD  R27,Y+4+1
	ADD  R26,R30
	ADC  R27,R31
	LD   R30,X
	ST   -Y,R30
	RCALL _uart_char_send
; 0000 004E     }
	__ADDWRN 18,19,1
	RJMP _0xC
_0xD:
; 0000 004F }
	CALL __LOADLOCR4
	ADIW R28,6
	RET
;
;char buffer[5]; // mot mang 5 ky tu buffer dung de luu 4 ky tu truyen tu app
;int i = 0;  // bien dem de xet du 4 ky tu
;// ham ngat nhan uart khi nhan duoc ky tu truyen tu app hoac phan cung
;interrupt [USART_RXC] void usart_rx_isr(void)
; 0000 0055 {
_usart_rx_isr:
	CALL SUBOPT_0x0
; 0000 0056    char data;   // bien luu tru 1 ky tu
; 0000 0057    data = UDR;  // ghi ky tu tu UDR sang bien data
	ST   -Y,R17
;	data -> R17
	IN   R17,12
; 0000 0058 
; 0000 0059    // phan dieu chinh gia tri cho thanh ghi timer
; 0000 005A    // neu nhu bien data nam trong ma ascii truyen tu app ve thi luu vao buffer
; 0000 005B    if (data >= '0' && data <= '9' || data >= 'A' && data <= 'F') {
	CPI  R17,48
	BRLO _0xF
	CPI  R17,58
	BRLO _0x11
_0xF:
	CPI  R17,65
	BRLO _0x12
	CPI  R17,71
	BRLO _0x11
_0x12:
	RJMP _0xE
_0x11:
; 0000 005C         buffer[i] = data;
	LDS  R30,_i
	LDS  R31,_i+1
	SUBI R30,LOW(-_buffer)
	SBCI R31,HIGH(-_buffer)
	ST   Z,R17
; 0000 005D         i++;
	LDI  R26,LOW(_i)
	LDI  R27,HIGH(_i)
	LD   R30,X+
	LD   R31,X+
	ADIW R30,1
	ST   -X,R31
	ST   -X,R30
; 0000 005E    }
; 0000 005F 
; 0000 0060    // sau khi du 4 ki tu trong buffer thi xet buffer
; 0000 0061    if (i == 4) {
_0xE:
	LDS  R26,_i
	LDS  R27,_i+1
	SBIW R26,4
	BREQ PC+3
	JMP _0x15
; 0000 0062         //uart_string_send(buffer);
; 0000 0063         //uart_char_send(13);
; 0000 0064 
; 0000 0065         if (strcmp(buffer, "F0BD") == 0) { // neu nhu 4 ky tu trung voi F0BD tuc la timer 0.5s
	CALL SUBOPT_0x1
	__POINTW1MN _0x17,0
	CALL SUBOPT_0x2
	BRNE _0x16
; 0000 0066             value_reg1 = 240; // bien luu gia tri he 10 cho thanh ghi timer TCNT1H : F0 = 240
	LDI  R30,LOW(240)
	LDI  R31,HIGH(240)
	MOVW R6,R30
; 0000 0067             value_reg2 = 189; // bien luu gia tri he 10 cho thanh ghi timer TCNT1L : F0 = 189
	LDI  R30,LOW(189)
	LDI  R31,HIGH(189)
	MOVW R8,R30
; 0000 0068         } else if (strcmp(buffer, "E17B") == 0) { // neu nhu 4 ky tu trung voi F0BD tuc la timer 1s
	RJMP _0x18
_0x16:
	CALL SUBOPT_0x1
	__POINTW1MN _0x17,5
	CALL SUBOPT_0x2
	BRNE _0x19
; 0000 0069             value_reg1 = 225; // bien luu gia tri he 10 cho thanh ghi timer TCNT1H : F0 = 225
	LDI  R30,LOW(225)
	LDI  R31,HIGH(225)
	MOVW R6,R30
; 0000 006A             value_reg2 = 123; // bien luu gia tri he 10 cho thanh ghi timer TCNT1L : F0 = 123
	LDI  R30,LOW(123)
	LDI  R31,HIGH(123)
	MOVW R8,R30
; 0000 006B         } else if (strcmp(buffer, "D239") == 0) { // neu nhu 4 ky tu trung voi F0BD tuc la timer 1.5s
	RJMP _0x1A
_0x19:
	CALL SUBOPT_0x1
	__POINTW1MN _0x17,10
	CALL SUBOPT_0x2
	BRNE _0x1B
; 0000 006C             value_reg1 = 210;
	LDI  R30,LOW(210)
	LDI  R31,HIGH(210)
	MOVW R6,R30
; 0000 006D             value_reg2 = 57;
	LDI  R30,LOW(57)
	LDI  R31,HIGH(57)
	MOVW R8,R30
; 0000 006E         } else if (strcmp(buffer, "C2F6") == 0) { // neu nhu 4 ky tu trung voi F0BD tuc la timer 2s
	RJMP _0x1C
_0x1B:
	CALL SUBOPT_0x1
	__POINTW1MN _0x17,15
	CALL SUBOPT_0x2
	BRNE _0x1D
; 0000 006F             value_reg1 = 194;
	LDI  R30,LOW(194)
	LDI  R31,HIGH(194)
	MOVW R6,R30
; 0000 0070             value_reg2 = 246;
	LDI  R30,LOW(246)
	LDI  R31,HIGH(246)
	MOVW R8,R30
; 0000 0071         } else if (strcmp(buffer, "B3B4") == 0) { // neu nhu 4 ky tu trung voi F0BD tuc la timer 2.5s
	RJMP _0x1E
_0x1D:
	CALL SUBOPT_0x1
	__POINTW1MN _0x17,20
	CALL SUBOPT_0x2
	BRNE _0x1F
; 0000 0072             value_reg1 = 179;
	LDI  R30,LOW(179)
	LDI  R31,HIGH(179)
	MOVW R6,R30
; 0000 0073             value_reg2 = 180;
	LDI  R30,LOW(180)
	LDI  R31,HIGH(180)
	MOVW R8,R30
; 0000 0074         } else if (strcmp(buffer, "A472") == 0) { // neu nhu 4 ky tu trung voi F0BD tuc la timer 3s
	RJMP _0x20
_0x1F:
	CALL SUBOPT_0x1
	__POINTW1MN _0x17,25
	CALL SUBOPT_0x2
	BRNE _0x21
; 0000 0075             value_reg1 = 164;
	LDI  R30,LOW(164)
	LDI  R31,HIGH(164)
	MOVW R6,R30
; 0000 0076             value_reg2 = 114;
	LDI  R30,LOW(114)
	LDI  R31,HIGH(114)
	MOVW R8,R30
; 0000 0077         } else if (strcmp(buffer, "9530") == 0) { // neu nhu 4 ky tu trung voi F0BD tuc la timer 3.5s
	RJMP _0x22
_0x21:
	CALL SUBOPT_0x1
	__POINTW1MN _0x17,30
	CALL SUBOPT_0x2
	BRNE _0x23
; 0000 0078             value_reg1 = 149;
	LDI  R30,LOW(149)
	LDI  R31,HIGH(149)
	MOVW R6,R30
; 0000 0079             value_reg2 = 48;
	LDI  R30,LOW(48)
	LDI  R31,HIGH(48)
	MOVW R8,R30
; 0000 007A         } else if (strcmp(buffer, "85ED") == 0) { // neu nhu 4 ky tu trung voi F0BD tuc la timer 4s
	RJMP _0x24
_0x23:
	CALL SUBOPT_0x1
	__POINTW1MN _0x17,35
	CALL SUBOPT_0x2
	BRNE _0x25
; 0000 007B             value_reg1 = 133;
	LDI  R30,LOW(133)
	LDI  R31,HIGH(133)
	MOVW R6,R30
; 0000 007C             value_reg2 = 237;
	LDI  R30,LOW(237)
	LDI  R31,HIGH(237)
	MOVW R8,R30
; 0000 007D         } else if (strcmp(buffer, "76AB") == 0) { // neu nhu 4 ky tu trung voi F0BD tuc la timer 4.5s
	RJMP _0x26
_0x25:
	CALL SUBOPT_0x1
	__POINTW1MN _0x17,40
	CALL SUBOPT_0x2
	BRNE _0x27
; 0000 007E             value_reg1 = 118;
	LDI  R30,LOW(118)
	LDI  R31,HIGH(118)
	MOVW R6,R30
; 0000 007F             value_reg2 = 171;
	LDI  R30,LOW(171)
	LDI  R31,HIGH(171)
	MOVW R8,R30
; 0000 0080         } else if (strcmp(buffer, "6769") == 0) { // neu nhu 4 ky tu trung voi F0BD tuc la timer 5s
	RJMP _0x28
_0x27:
	CALL SUBOPT_0x1
	__POINTW1MN _0x17,45
	CALL SUBOPT_0x2
	BRNE _0x29
; 0000 0081             value_reg1 = 103;
	LDI  R30,LOW(103)
	LDI  R31,HIGH(103)
	MOVW R6,R30
; 0000 0082             value_reg2 = 105;
	LDI  R30,LOW(105)
	LDI  R31,HIGH(105)
	MOVW R8,R30
; 0000 0083         } else {
_0x29:
; 0000 0084 
; 0000 0085         }
_0x28:
_0x26:
_0x24:
_0x22:
_0x20:
_0x1E:
_0x1C:
_0x1A:
_0x18:
; 0000 0086    }
; 0000 0087    // neu nhu xet du 4 ky ty thi reset mang i = 0
; 0000 0088    if (i == 4)
_0x15:
	LDS  R26,_i
	LDS  R27,_i+1
	SBIW R26,4
	BRNE _0x2B
; 0000 0089    {
; 0000 008A         i = 0;
	LDI  R30,LOW(0)
	STS  _i,R30
	STS  _i+1,R30
; 0000 008B    }
; 0000 008C 
; 0000 008D 
; 0000 008E    // phan bat/tat 8 den led bang ky tu gui ve tu app
; 0000 008F    switch (data) {
_0x2B:
	MOV  R30,R17
	LDI  R31,0
; 0000 0090         case 'a': // neu nhu bien data = a thi den PORTB.0 doi trang thai
	CPI  R30,LOW(0x61)
	LDI  R26,HIGH(0x61)
	CPC  R31,R26
	BRNE _0x2F
; 0000 0091             PORTB.0 = !PORTB.0;
	SBIS 0x18,0
	RJMP _0x30
	CBI  0x18,0
	RJMP _0x31
_0x30:
	SBI  0x18,0
_0x31:
; 0000 0092             //uart_char_send(data);
; 0000 0093             //uart_char_send(13);
; 0000 0094             break;
	RJMP _0x2E
; 0000 0095 
; 0000 0096         case 'b':
_0x2F:
	CPI  R30,LOW(0x62)
	LDI  R26,HIGH(0x62)
	CPC  R31,R26
	BRNE _0x32
; 0000 0097             PORTB.1 = !PORTB.1;
	SBIS 0x18,1
	RJMP _0x33
	CBI  0x18,1
	RJMP _0x34
_0x33:
	SBI  0x18,1
_0x34:
; 0000 0098             //uart_char_send(data);
; 0000 0099             //uart_char_send(13);
; 0000 009A             break;
	RJMP _0x2E
; 0000 009B 
; 0000 009C         case 'c':
_0x32:
	CPI  R30,LOW(0x63)
	LDI  R26,HIGH(0x63)
	CPC  R31,R26
	BRNE _0x35
; 0000 009D             PORTB.2 = !PORTB.2;
	SBIS 0x18,2
	RJMP _0x36
	CBI  0x18,2
	RJMP _0x37
_0x36:
	SBI  0x18,2
_0x37:
; 0000 009E             //uart_char_send(data);
; 0000 009F             //uart_char_send(13);
; 0000 00A0             break;
	RJMP _0x2E
; 0000 00A1 
; 0000 00A2         case 'd':
_0x35:
	CPI  R30,LOW(0x64)
	LDI  R26,HIGH(0x64)
	CPC  R31,R26
	BRNE _0x38
; 0000 00A3             PORTB.3 = !PORTB.3;
	SBIS 0x18,3
	RJMP _0x39
	CBI  0x18,3
	RJMP _0x3A
_0x39:
	SBI  0x18,3
_0x3A:
; 0000 00A4             //uart_char_send(data);
; 0000 00A5             //uart_char_send(13);
; 0000 00A6             break;
	RJMP _0x2E
; 0000 00A7 
; 0000 00A8         case 'e':
_0x38:
	CPI  R30,LOW(0x65)
	LDI  R26,HIGH(0x65)
	CPC  R31,R26
	BRNE _0x3B
; 0000 00A9             PORTB.4 = !PORTB.4;
	SBIS 0x18,4
	RJMP _0x3C
	CBI  0x18,4
	RJMP _0x3D
_0x3C:
	SBI  0x18,4
_0x3D:
; 0000 00AA             //uart_char_send(data);
; 0000 00AB             //uart_char_send(13);
; 0000 00AC             break;
	RJMP _0x2E
; 0000 00AD 
; 0000 00AE         case 'f':
_0x3B:
	CPI  R30,LOW(0x66)
	LDI  R26,HIGH(0x66)
	CPC  R31,R26
	BRNE _0x3E
; 0000 00AF             PORTB.5 = !PORTB.5;
	SBIS 0x18,5
	RJMP _0x3F
	CBI  0x18,5
	RJMP _0x40
_0x3F:
	SBI  0x18,5
_0x40:
; 0000 00B0             //uart_char_send(data);
; 0000 00B1             //uart_char_send(13);
; 0000 00B2             break;
	RJMP _0x2E
; 0000 00B3 
; 0000 00B4         case 'g':
_0x3E:
	CPI  R30,LOW(0x67)
	LDI  R26,HIGH(0x67)
	CPC  R31,R26
	BRNE _0x41
; 0000 00B5             PORTB.6 = !PORTB.6;
	SBIS 0x18,6
	RJMP _0x42
	CBI  0x18,6
	RJMP _0x43
_0x42:
	SBI  0x18,6
_0x43:
; 0000 00B6             //uart_char_send(data);
; 0000 00B7             //uart_char_send(13);
; 0000 00B8             break;
	RJMP _0x2E
; 0000 00B9 
; 0000 00BA         case 'h':
_0x41:
	CPI  R30,LOW(0x68)
	LDI  R26,HIGH(0x68)
	CPC  R31,R26
	BRNE _0x2E
; 0000 00BB             PORTB.7 = !PORTB.7;
	SBIS 0x18,7
	RJMP _0x45
	CBI  0x18,7
	RJMP _0x46
_0x45:
	SBI  0x18,7
_0x46:
; 0000 00BC             //uart_char_send(data);
; 0000 00BD             //uart_char_send(13);
; 0000 00BE             break;
; 0000 00BF    }
_0x2E:
; 0000 00C0 }
	LD   R17,Y+
	RJMP _0x4C

	.DSEG
_0x17:
	.BYTE 0x32
;
;// ham ngat ngoai khi an nut nhan
;interrupt [EXT_INT0] void ext_int0_isr(void)
; 0000 00C4 {

	.CSEG
_ext_int0_isr:
	CALL SUBOPT_0x0
; 0000 00C5 // Place your code here
; 0000 00C6     cnt_int++; //bien dem so lan ngat ngoai
	MOVW R30,R4
	ADIW R30,1
	MOVW R4,R30
; 0000 00C7     chuc = cnt_int / 10;  // bien chuc luu tru hang chuc bien dem
	MOVW R26,R4
	LDI  R30,LOW(10)
	LDI  R31,HIGH(10)
	CALL __DIVW21U
	MOV  R10,R30
; 0000 00C8     donvi = cnt_int % 10; // bien donvi luu tru hang don vi bien dem
	MOVW R26,R4
	LDI  R30,LOW(10)
	LDI  R31,HIGH(10)
	CALL __MODW21U
	MOV  R13,R30
; 0000 00C9     // ham gui so lan ngat len app thong qua uart
; 0000 00CA     uart_string_send("Interrupt Counter: ");
	__POINTW1MN _0x47,0
	ST   -Y,R31
	ST   -Y,R30
	RCALL _uart_string_send
; 0000 00CB     uart_char_send(chuc+0x30);
	CALL SUBOPT_0x3
; 0000 00CC     uart_char_send(donvi+0x30);
; 0000 00CD     uart_char_send(10);
; 0000 00CE     uart_char_send(13);
; 0000 00CF }
_0x4C:
	LD   R30,Y+
	OUT  SREG,R30
	LD   R31,Y+
	LD   R30,Y+
	LD   R27,Y+
	LD   R26,Y+
	LD   R25,Y+
	LD   R24,Y+
	LD   R23,Y+
	LD   R22,Y+
	LD   R15,Y+
	LD   R1,Y+
	LD   R0,Y+
	RETI

	.DSEG
_0x47:
	.BYTE 0x14
;
;// Declare your global variables here
;
;// ham cau hinh thanh ghi
;void main(void)
; 0000 00D5 {

	.CSEG
_main:
; 0000 00D6 // Declare your local variables here
; 0000 00D7 
; 0000 00D8 // Input/Output Ports initialization
; 0000 00D9 // Port A initialization
; 0000 00DA // Func7=Out Func6=Out Func5=Out Func4=Out Func3=Out Func2=Out Func1=Out Func0=In
; 0000 00DB // State7=0 State6=0 State5=0 State4=0 State3=0 State2=0 State1=0 State0=T
; 0000 00DC PORTA=0x00; // cau hinh nhu dien ap thap/cao
	LDI  R30,LOW(0)
	OUT  0x1B,R30
; 0000 00DD DDRA=0xFE;  // cau hinh input/ouput
	LDI  R30,LOW(254)
	OUT  0x1A,R30
; 0000 00DE 
; 0000 00DF // Port B initialization
; 0000 00E0 // Func7=Out Func6=Out Func5=Out Func4=Out Func3=Out Func2=Out Func1=Out Func0=Out
; 0000 00E1 // State7=0 State6=0 State5=0 State4=0 State3=0 State2=0 State1=0 State0=0
; 0000 00E2 PORTB=0x00;
	LDI  R30,LOW(0)
	OUT  0x18,R30
; 0000 00E3 DDRB=0xFF;
	LDI  R30,LOW(255)
	OUT  0x17,R30
; 0000 00E4 
; 0000 00E5 // Port C initialization
; 0000 00E6 // Func7=Out Func6=Out Func5=Out Func4=Out Func3=Out Func2=Out Func1=Out Func0=Out
; 0000 00E7 // State7=0 State6=0 State5=0 State4=0 State3=0 State2=0 State1=0 State0=0
; 0000 00E8 PORTC=0x00;
	LDI  R30,LOW(0)
	OUT  0x15,R30
; 0000 00E9 DDRC=0xFF;
	LDI  R30,LOW(255)
	OUT  0x14,R30
; 0000 00EA 
; 0000 00EB // Port D initialization
; 0000 00EC // Func7=In Func6=In Func5=In Func4=In Func3=In Func2=In Func1=Out Func0=In
; 0000 00ED // State7=T State6=T State5=T State4=T State3=T State2=P State1=0 State0=T
; 0000 00EE PORTD=0x04;
	LDI  R30,LOW(4)
	OUT  0x12,R30
; 0000 00EF DDRD=0x02;
	LDI  R30,LOW(2)
	OUT  0x11,R30
; 0000 00F0 
; 0000 00F1 // Timer/Counter 0 initialization
; 0000 00F2 // Clock source: System Clock
; 0000 00F3 // Clock value: Timer 0 Stopped
; 0000 00F4 // Mode: Normal top=0xFF
; 0000 00F5 // OC0 output: Disconnected
; 0000 00F6 TCCR0=0x00;
	LDI  R30,LOW(0)
	OUT  0x33,R30
; 0000 00F7 TCNT0=0x00;
	OUT  0x32,R30
; 0000 00F8 OCR0=0x00;
	OUT  0x3C,R30
; 0000 00F9 
; 0000 00FA // Timer/Counter 1 initialization
; 0000 00FB // Clock source: System Clock
; 0000 00FC // Clock value: Timer1 Stopped
; 0000 00FD // Mode: Normal top=0xFFFF
; 0000 00FE // OC1A output: Discon.
; 0000 00FF // OC1B output: Discon.
; 0000 0100 // Noise Canceler: On
; 0000 0101 // Input Capture on Falling Edge
; 0000 0102 // Timer1 Overflow Interrupt: On
; 0000 0103 // Input Capture Interrupt: Off
; 0000 0104 // Compare A Match Interrupt: Off
; 0000 0105 // Compare B Match Interrupt: Off
; 0000 0106 TCCR1A=0x00;
	OUT  0x2F,R30
; 0000 0107 TCCR1B=0x05; // 8MHz / 1024 = 128 microsencond per tick
	LDI  R30,LOW(5)
	OUT  0x2E,R30
; 0000 0108 
; 0000 0109 //tick 0.5s / 128us = 3906 tick lan tu (65535-3906) den 65535 = 0.5 ms
; 0000 010A TCNT1H=value_reg1;  //0b11000010
	OUT  0x2D,R6
; 0000 010B TCNT1L=value_reg2;  //0b11110110
	OUT  0x2C,R8
; 0000 010C 
; 0000 010D ICR1H=0x00;
	LDI  R30,LOW(0)
	OUT  0x27,R30
; 0000 010E ICR1L=0x00;
	OUT  0x26,R30
; 0000 010F 
; 0000 0110 OCR1AH=0x00;
	OUT  0x2B,R30
; 0000 0111 OCR1AL=0x00;
	OUT  0x2A,R30
; 0000 0112 
; 0000 0113 OCR1BH=0x00;
	OUT  0x29,R30
; 0000 0114 OCR1BL=0x00;
	OUT  0x28,R30
; 0000 0115 
; 0000 0116 // Timer(s)/Counter(s) Interrupt(s) initialization
; 0000 0117 TIMSK=0x04; // bit quy dinh ngat tran cho thanh ghi timer counter TIMSK
	LDI  R30,LOW(4)
	OUT  0x39,R30
; 0000 0118 
; 0000 0119 // Timer/Counter 2 initialization
; 0000 011A // Clock source: System Clock
; 0000 011B // Clock value: Timer2 Stopped
; 0000 011C // Mode: Normal top=0xFF
; 0000 011D // OC2 output: Disconnected
; 0000 011E ASSR=0x00;
	LDI  R30,LOW(0)
	OUT  0x22,R30
; 0000 011F TCCR2=0x00;
	OUT  0x25,R30
; 0000 0120 TCNT2=0x00;
	OUT  0x24,R30
; 0000 0121 OCR2=0x00;
	OUT  0x23,R30
; 0000 0122 
; 0000 0123 // External Interrupt(s) initialization
; 0000 0124 // INT0: On
; 0000 0125 // INT0 Mode: Falling Edge
; 0000 0126 // INT1: Off
; 0000 0127 // INT2: Off
; 0000 0128 GICR|=0x40;  // thanh ghi cho phep ngat ngoai
	IN   R30,0x3B
	ORI  R30,0x40
	OUT  0x3B,R30
; 0000 0129 MCUCR=0x02;  // thanh ghi cau hinh ngat suon xuong: falling
	LDI  R30,LOW(2)
	OUT  0x35,R30
; 0000 012A MCUCSR=0x00;
	LDI  R30,LOW(0)
	OUT  0x34,R30
; 0000 012B GIFR=0x40;   // cho phep ngat INT0
	LDI  R30,LOW(64)
	OUT  0x3A,R30
; 0000 012C 
; 0000 012D // USART initialization
; 0000 012E // Communication Parameters: 8 Data, 1 Stop, No Parity
; 0000 012F // USART Receiver: On
; 0000 0130 // USART Transmitter: On
; 0000 0131 // USART Mode: Asynchronous
; 0000 0132 // USART Baud Rate: 9600
; 0000 0133 UCSRA=0x00;
	LDI  R30,LOW(0)
	OUT  0xB,R30
; 0000 0134 UCSRB=0x98;  // cau hinh bat Rx, Tx va ngat Rx
	LDI  R30,LOW(152)
	OUT  0xA,R30
; 0000 0135 UCSRC=0x86;  // cau hinh truyen du lieu dong bo va khung truyen 8 bit
	LDI  R30,LOW(134)
	OUT  0x20,R30
; 0000 0136 UBRRH=0x00;
	LDI  R30,LOW(0)
	OUT  0x20,R30
; 0000 0137 UBRRL=0x33;
	LDI  R30,LOW(51)
	OUT  0x9,R30
; 0000 0138 
; 0000 0139 // Analog Comparator initialization
; 0000 013A // Analog Comparator: Off
; 0000 013B // Analog Comparator Input Capture by Timer/Counter 1: Off
; 0000 013C ACSR=0x80;
	LDI  R30,LOW(128)
	OUT  0x8,R30
; 0000 013D SFIOR=0x00;
	LDI  R30,LOW(0)
	OUT  0x30,R30
; 0000 013E 
; 0000 013F // ADC initialization
; 0000 0140 // ADC Clock frequency: 1000.000 kHz
; 0000 0141 // ADC Voltage Reference: AREF pin
; 0000 0142 // ADC Auto Trigger Source: ADC Stopped
; 0000 0143 ADMUX=ADC_VREF_TYPE & 0xff;
	OUT  0x7,R30
; 0000 0144 ADCSRA=0x83;
	LDI  R30,LOW(131)
	OUT  0x6,R30
; 0000 0145 
; 0000 0146 // SPI initialization
; 0000 0147 // SPI disabled
; 0000 0148 SPCR=0x00;
	LDI  R30,LOW(0)
	OUT  0xD,R30
; 0000 0149 
; 0000 014A // TWI initialization
; 0000 014B // TWI disabled
; 0000 014C TWCR=0x00;
	OUT  0x36,R30
; 0000 014D 
; 0000 014E // Global enable interrupts
; 0000 014F #asm("sei")
	sei
; 0000 0150 
; 0000 0151 while (1)
_0x48:
; 0000 0152       {
; 0000 0153       // Place your code here
; 0000 0154         ADC_OUT = read_adc(0); // Luu gia tri analog tu cam bien
	LDI  R30,LOW(0)
	ST   -Y,R30
	RCALL _read_adc
	CLR  R22
	CLR  R23
	STS  _ADC_OUT,R30
	STS  _ADC_OUT+1,R31
	STS  _ADC_OUT+2,R22
	STS  _ADC_OUT+3,R23
; 0000 0155         voltage = ADC_OUT * 5000 / 1023; // dien ap = gia tri doc tu cam bien * dien ap tham chieu 5000mV / do phan giai 10 bit: 2^10
	__GETD2N 0x1388
	CALL __MULD12U
	MOVW R26,R30
	MOVW R24,R22
	__GETD1N 0x3FF
	CALL __DIVD21U
	STS  _voltage,R30
	STS  _voltage+1,R31
	STS  _voltage+2,R22
	STS  _voltage+3,R23
; 0000 0156         temperature = voltage / 10; // do gia tri nhiet do bang dien ap chia cho 10
	LDS  R26,_voltage
	LDS  R27,_voltage+1
	LDS  R24,_voltage+2
	LDS  R25,_voltage+3
	CALL SUBOPT_0x4
	STS  _temperature,R30
	STS  _temperature+1,R31
	STS  _temperature+2,R22
	STS  _temperature+3,R23
; 0000 0157 
; 0000 0158         chuc = temperature / 10; // lay so hang chuc cua nhiet do
	CALL SUBOPT_0x5
	CALL SUBOPT_0x4
	MOV  R10,R30
; 0000 0159         donvi = temperature % 10; // lay so hang don vi cua nhiet do
	CALL SUBOPT_0x5
	__GETD1N 0xA
	CALL __MODD21U
	MOV  R13,R30
; 0000 015A         uart_char_send(chuc+0x30); // truyen uart ky tu chuc va hien thi len app
	CALL SUBOPT_0x3
; 0000 015B         uart_char_send(donvi+0x30); // truyen uart ky tu donvi va hien thi len app
; 0000 015C         uart_char_send(10);
; 0000 015D         uart_char_send(13);
; 0000 015E         delay_ms(200);
	LDI  R30,LOW(200)
	LDI  R31,HIGH(200)
	ST   -Y,R31
	ST   -Y,R30
	CALL _delay_ms
; 0000 015F       }
	RJMP _0x48
; 0000 0160 }
_0x4B:
	RJMP _0x4B

	.CSEG
_strcmp:
    ld   r30,y+
    ld   r31,y+
    ld   r26,y+
    ld   r27,y+
strcmp0:
    ld   r22,x+
    ld   r23,z+
    cp   r22,r23
    brne strcmp1
    tst  r22
    brne strcmp0
strcmp3:
    clr  r30
    ret
strcmp1:
    sub  r22,r23
    breq strcmp3
    ldi  r30,1
    brcc strcmp2
    subi r30,2
strcmp2:
    ret
_strlen:
    ld   r26,y+
    ld   r27,y+
    clr  r30
    clr  r31
strlen0:
    ld   r22,x+
    tst  r22
    breq strlen1
    adiw r30,1
    rjmp strlen0
strlen1:
    ret
	#ifndef __SLEEP_DEFINED__
	#define __SLEEP_DEFINED__
	.EQU __se_bit=0x40
	.EQU __sm_mask=0xB0
	.EQU __sm_powerdown=0x20
	.EQU __sm_powersave=0x30
	.EQU __sm_standby=0xA0
	.EQU __sm_ext_standby=0xB0
	.EQU __sm_adc_noise_red=0x10
	.SET power_ctrl_reg=mcucr
	#endif

	.CSEG

	.CSEG

	.DSEG
_ADC_OUT:
	.BYTE 0x4
_voltage:
	.BYTE 0x4
_temperature:
	.BYTE 0x4
_buffer:
	.BYTE 0x5
_i:
	.BYTE 0x2

	.CSEG
;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:8 WORDS
SUBOPT_0x0:
	ST   -Y,R0
	ST   -Y,R1
	ST   -Y,R15
	ST   -Y,R22
	ST   -Y,R23
	ST   -Y,R24
	ST   -Y,R25
	ST   -Y,R26
	ST   -Y,R27
	ST   -Y,R30
	ST   -Y,R31
	IN   R30,SREG
	ST   -Y,R30
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 10 TIMES, CODE SIZE REDUCTION:15 WORDS
SUBOPT_0x1:
	LDI  R30,LOW(_buffer)
	LDI  R31,HIGH(_buffer)
	ST   -Y,R31
	ST   -Y,R30
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 10 TIMES, CODE SIZE REDUCTION:24 WORDS
SUBOPT_0x2:
	ST   -Y,R31
	ST   -Y,R30
	CALL _strcmp
	CPI  R30,0
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:13 WORDS
SUBOPT_0x3:
	MOV  R30,R10
	SUBI R30,-LOW(48)
	ST   -Y,R30
	CALL _uart_char_send
	MOV  R30,R13
	SUBI R30,-LOW(48)
	ST   -Y,R30
	CALL _uart_char_send
	LDI  R30,LOW(10)
	ST   -Y,R30
	CALL _uart_char_send
	LDI  R30,LOW(13)
	ST   -Y,R30
	JMP  _uart_char_send

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x4:
	__GETD1N 0xA
	CALL __DIVD21U
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:3 WORDS
SUBOPT_0x5:
	LDS  R26,_temperature
	LDS  R27,_temperature+1
	LDS  R24,_temperature+2
	LDS  R25,_temperature+3
	RET


	.CSEG
_delay_ms:
	ld   r30,y+
	ld   r31,y+
	adiw r30,0
	breq __delay_ms1
__delay_ms0:
	__DELAY_USW 0x7D0
	wdr
	sbiw r30,1
	brne __delay_ms0
__delay_ms1:
	ret

__MULD12U:
	MUL  R23,R26
	MOV  R23,R0
	MUL  R22,R27
	ADD  R23,R0
	MUL  R31,R24
	ADD  R23,R0
	MUL  R30,R25
	ADD  R23,R0
	MUL  R22,R26
	MOV  R22,R0
	ADD  R23,R1
	MUL  R31,R27
	ADD  R22,R0
	ADC  R23,R1
	MUL  R30,R24
	ADD  R22,R0
	ADC  R23,R1
	CLR  R24
	MUL  R31,R26
	MOV  R31,R0
	ADD  R22,R1
	ADC  R23,R24
	MUL  R30,R27
	ADD  R31,R0
	ADC  R22,R1
	ADC  R23,R24
	MUL  R30,R26
	MOV  R30,R0
	ADD  R31,R1
	ADC  R22,R24
	ADC  R23,R24
	RET

__DIVW21U:
	CLR  R0
	CLR  R1
	LDI  R25,16
__DIVW21U1:
	LSL  R26
	ROL  R27
	ROL  R0
	ROL  R1
	SUB  R0,R30
	SBC  R1,R31
	BRCC __DIVW21U2
	ADD  R0,R30
	ADC  R1,R31
	RJMP __DIVW21U3
__DIVW21U2:
	SBR  R26,1
__DIVW21U3:
	DEC  R25
	BRNE __DIVW21U1
	MOVW R30,R26
	MOVW R26,R0
	RET

__DIVD21U:
	PUSH R19
	PUSH R20
	PUSH R21
	CLR  R0
	CLR  R1
	CLR  R20
	CLR  R21
	LDI  R19,32
__DIVD21U1:
	LSL  R26
	ROL  R27
	ROL  R24
	ROL  R25
	ROL  R0
	ROL  R1
	ROL  R20
	ROL  R21
	SUB  R0,R30
	SBC  R1,R31
	SBC  R20,R22
	SBC  R21,R23
	BRCC __DIVD21U2
	ADD  R0,R30
	ADC  R1,R31
	ADC  R20,R22
	ADC  R21,R23
	RJMP __DIVD21U3
__DIVD21U2:
	SBR  R26,1
__DIVD21U3:
	DEC  R19
	BRNE __DIVD21U1
	MOVW R30,R26
	MOVW R22,R24
	MOVW R26,R0
	MOVW R24,R20
	POP  R21
	POP  R20
	POP  R19
	RET

__MODW21U:
	RCALL __DIVW21U
	MOVW R30,R26
	RET

__MODD21U:
	RCALL __DIVD21U
	MOVW R30,R26
	MOVW R22,R24
	RET

__SAVELOCR4:
	ST   -Y,R19
__SAVELOCR3:
	ST   -Y,R18
__SAVELOCR2:
	ST   -Y,R17
	ST   -Y,R16
	RET

__LOADLOCR4:
	LDD  R19,Y+3
__LOADLOCR3:
	LDD  R18,Y+2
__LOADLOCR2:
	LDD  R17,Y+1
	LD   R16,Y
	RET

;END OF CODE MARKER
__END_OF_CODE:
