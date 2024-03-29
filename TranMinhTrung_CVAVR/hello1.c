/*****************************************************
This program was produced by the
CodeWizardAVR V2.05.0 Professional
Automatic Program Generator
� Copyright 1998-2010 Pavel Haiduc, HP InfoTech s.r.l.
http://www.hpinfotech.com

Project : 
Version : 
Date    : 12/21/2023
Author  : NeVaDa
Company : 
Comments: 


Chip type               : ATmega16
Program type            : Application
AVR Core Clock frequency: 8.000000 MHz
Memory model            : Small
External RAM size       : 0
Data Stack size         : 256
*****************************************************/

#include <mega16.h>
#include <string.h>
#include <delay.h>

// External Interrupt 0 service routine
unsigned int cnt_int = 0; // bien diem ngat interrupt
unsigned int value_reg1 = 225;  // bien luu gia tri chua thanh ghi timer TCNT1H
unsigned int value_reg2 = 123;  // bien luu gia tri chua thanh ghi timer TCNT1L

// Standard Input/Output functions
#include <stdio.h>

// Timer1 overflow interrupt service routine
interrupt [TIM1_OVF] void timer1_ovf_isr(void)
{
// Place your code here
    PORTC.0 = !PORTC.0; // dao trang thai cua led khi xay ra ngat timer
    TCNT1H=value_reg1;  // thanh ghi 8 bit High luu gia tri cau hinh thoi gian timer
    TCNT1L=value_reg1;  // thanh ghi 8 bit Low luu gia tri cau hinh thoi gian timer
}

#define ADC_VREF_TYPE 0x00
unsigned long ADC_OUT = 0; // bien luu gia tri analog khi doc nhiet do
unsigned long voltage; // bien dung de tinh gia tri cua volte
unsigned long temperature; // bien luu gia tri nhiet do
unsigned char tram, chuc, donvi; // khai bao bien tram, chuc, donvi de hien thi so lieu

// Read the AD conversion result
unsigned int read_adc(unsigned char adc_input)
{
// Chon dau v�o dien ap tham chieu ADC th�ng qua thanh ghi ADMUX
ADMUX=adc_input | (ADC_VREF_TYPE & 0xff);
// Delay needed for the stabilization of the ADC input voltage
delay_us(10);
// Start the AD conversion
ADCSRA|=0x40; // 0x40 la set bit ADSC len 1 de bat dau qua trinh chuyen doi ADC
// Wait for the AD conversion to complete
while ((ADCSRA & 0x10)==0); // doi cho qua trinh chuyen doi hoan tat de bat dau chuyen doi gia tri tiep theo
ADCSRA|=0x10; // dat co bit ADIF xac nhan qua trinh chuyen doi thanh cong
return ADCW;  // tra ve gia tri ADC
}

// ham truyen uart 1 ky tu
void uart_char_send(unsigned char chr) {
    while (!(UCSRA & (1<<UDRE))) {};  // ham cho den khi UDR tro thanh trong
    UDR=chr; // ghi ky tu vao UDR
}

// ham truyen uart 1 chuoi ky tu
void uart_string_send(unsigned char *txt) {
    unsigned int n, i;
    n = strlen(txt); // lay do dai cua chuoi ky tu
    for (i = 0; i < n; i++) {
        uart_char_send(txt[i]);
    }
}

char buffer[5]; // mot mang 5 ky tu buffer dung de luu 4 ky tu truyen tu app
int i = 0;  // bien dem de xet du 4 ky tu
// ham ngat nhan uart khi nhan duoc ky tu truyen tu app hoac phan cung
interrupt [USART_RXC] void usart_rx_isr(void)
{
   char data;   // bien luu tru 1 ky tu
   data = UDR;  // ghi ky tu tu UDR sang bien data
   
   // phan dieu chinh gia tri cho thanh ghi timer
   // neu nhu bien data nam trong ma ascii truyen tu app ve thi luu vao buffer
   if (data >= '0' && data <= '9' || data >= 'A' && data <= 'F') {
        buffer[i] = data;
        i++;
   }
    
   // sau khi du 4 ki tu trong buffer thi xet buffer
   if (i == 4) {
        //uart_string_send(buffer);
        //uart_char_send(13);
   
        if (strcmp(buffer, "F0BD") == 0) { // neu nhu 4 ky tu trung voi F0BD tuc la timer 0.5s
            value_reg1 = 240; // bien luu gia tri he 10 cho thanh ghi timer TCNT1H : F0 = 240
            value_reg2 = 189; // bien luu gia tri he 10 cho thanh ghi timer TCNT1L : F0 = 189
        } else if (strcmp(buffer, "E17B") == 0) { // neu nhu 4 ky tu trung voi F0BD tuc la timer 1s
            value_reg1 = 225; // bien luu gia tri he 10 cho thanh ghi timer TCNT1H : F0 = 225
            value_reg2 = 123; // bien luu gia tri he 10 cho thanh ghi timer TCNT1L : F0 = 123
        } else if (strcmp(buffer, "D239") == 0) { // neu nhu 4 ky tu trung voi F0BD tuc la timer 1.5s
            value_reg1 = 210;
            value_reg2 = 57;
        } else if (strcmp(buffer, "C2F6") == 0) { // neu nhu 4 ky tu trung voi F0BD tuc la timer 2s
            value_reg1 = 194;
            value_reg2 = 246;
        } else if (strcmp(buffer, "B3B4") == 0) { // neu nhu 4 ky tu trung voi F0BD tuc la timer 2.5s
            value_reg1 = 179;
            value_reg2 = 180;
        } else if (strcmp(buffer, "A472") == 0) { // neu nhu 4 ky tu trung voi F0BD tuc la timer 3s
            value_reg1 = 164;
            value_reg2 = 114;
        } else if (strcmp(buffer, "9530") == 0) { // neu nhu 4 ky tu trung voi F0BD tuc la timer 3.5s
            value_reg1 = 149;
            value_reg2 = 48;
        } else if (strcmp(buffer, "85ED") == 0) { // neu nhu 4 ky tu trung voi F0BD tuc la timer 4s
            value_reg1 = 133;
            value_reg2 = 237;
        } else if (strcmp(buffer, "76AB") == 0) { // neu nhu 4 ky tu trung voi F0BD tuc la timer 4.5s
            value_reg1 = 118;
            value_reg2 = 171;
        } else if (strcmp(buffer, "6769") == 0) { // neu nhu 4 ky tu trung voi F0BD tuc la timer 5s
            value_reg1 = 103;
            value_reg2 = 105;
        } else {
   
        }
   }
   // neu nhu xet du 4 ky ty thi reset mang i = 0
   if (i == 4)
   {
        i = 0;
   }
   
   
   // phan bat/tat 8 den led bang ky tu gui ve tu app
   switch (data) {
        case 'a': // neu nhu bien data = a thi den PORTB.0 doi trang thai
            PORTB.0 = !PORTB.0;
            //uart_char_send(data);
            //uart_char_send(13);
            break;
        
        case 'b':
            PORTB.1 = !PORTB.1;
            //uart_char_send(data);
            //uart_char_send(13);
            break;
        
        case 'c':
            PORTB.2 = !PORTB.2;
            //uart_char_send(data);
            //uart_char_send(13);
            break;
        
        case 'd':
            PORTB.3 = !PORTB.3;
            //uart_char_send(data);
            //uart_char_send(13);
            break;
        
        case 'e':
            PORTB.4 = !PORTB.4;
            //uart_char_send(data);
            //uart_char_send(13);
            break;
        
        case 'f':
            PORTB.5 = !PORTB.5;
            //uart_char_send(data);
            //uart_char_send(13);
            break;
        
        case 'g':
            PORTB.6 = !PORTB.6;
            //uart_char_send(data);
            //uart_char_send(13);
            break;
        
        case 'h':
            PORTB.7 = !PORTB.7;
            //uart_char_send(data);
            //uart_char_send(13);
            break;     
   }
}

// ham ngat ngoai khi an nut nhan
interrupt [EXT_INT0] void ext_int0_isr(void)
{
// Place your code here
    cnt_int++; //bien dem so lan ngat ngoai
    chuc = cnt_int / 10;  // bien chuc luu tru hang chuc bien dem
    donvi = cnt_int % 10; // bien donvi luu tru hang don vi bien dem 
    // ham gui so lan ngat len app thong qua uart
    uart_string_send("Interrupt Counter: ");
    uart_char_send(chuc+0x30);
    uart_char_send(donvi+0x30);
    uart_char_send(10);
    uart_char_send(13);
}

// Declare your global variables here

// ham cau hinh thanh ghi
void main(void)
{
// Declare your local variables here

// Input/Output Ports initialization
// Port A initialization
// Func7=Out Func6=Out Func5=Out Func4=Out Func3=Out Func2=Out Func1=Out Func0=In 
// State7=0 State6=0 State5=0 State4=0 State3=0 State2=0 State1=0 State0=T 
PORTA=0x00; // cau hinh nhu dien ap thap/cao
DDRA=0xFE;  // cau hinh input/ouput

// Port B initialization
// Func7=Out Func6=Out Func5=Out Func4=Out Func3=Out Func2=Out Func1=Out Func0=Out 
// State7=0 State6=0 State5=0 State4=0 State3=0 State2=0 State1=0 State0=0 
PORTB=0x00;
DDRB=0xFF;

// Port C initialization
// Func7=Out Func6=Out Func5=Out Func4=Out Func3=Out Func2=Out Func1=Out Func0=Out 
// State7=0 State6=0 State5=0 State4=0 State3=0 State2=0 State1=0 State0=0 
PORTC=0x00;
DDRC=0xFF;

// Port D initialization
// Func7=In Func6=In Func5=In Func4=In Func3=In Func2=In Func1=Out Func0=In 
// State7=T State6=T State5=T State4=T State3=T State2=P State1=0 State0=T 
PORTD=0x04;
DDRD=0x02;

// Timer/Counter 0 initialization
// Clock source: System Clock
// Clock value: Timer 0 Stopped
// Mode: Normal top=0xFF
// OC0 output: Disconnected
TCCR0=0x00;
TCNT0=0x00;
OCR0=0x00;

// Timer/Counter 1 initialization
// Clock source: System Clock
// Clock value: Timer1 Stopped
// Mode: Normal top=0xFFFF
// OC1A output: Discon.
// OC1B output: Discon.
// Noise Canceler: On
// Input Capture on Falling Edge
// Timer1 Overflow Interrupt: On
// Input Capture Interrupt: Off
// Compare A Match Interrupt: Off
// Compare B Match Interrupt: Off
TCCR1A=0x00;
TCCR1B=0x05; // 8MHz / 1024 = 128 microsencond per tick

//tick 0.5s / 128us = 3906 tick lan tu (65535-3906) den 65535 = 0.5 ms
TCNT1H=value_reg1;  //0b11000010
TCNT1L=value_reg2;  //0b11110110

ICR1H=0x00;
ICR1L=0x00;

OCR1AH=0x00;
OCR1AL=0x00;

OCR1BH=0x00;
OCR1BL=0x00;

// Timer(s)/Counter(s) Interrupt(s) initialization
TIMSK=0x04; // bit quy dinh ngat tran cho thanh ghi timer counter TIMSK

// Timer/Counter 2 initialization
// Clock source: System Clock
// Clock value: Timer2 Stopped
// Mode: Normal top=0xFF
// OC2 output: Disconnected
ASSR=0x00;
TCCR2=0x00;
TCNT2=0x00;
OCR2=0x00;

// External Interrupt(s) initialization
// INT0: On
// INT0 Mode: Falling Edge
// INT1: Off
// INT2: Off
GICR|=0x40;  // thanh ghi cho phep ngat ngoai
MCUCR=0x02;  // thanh ghi cau hinh ngat suon xuong: falling
MCUCSR=0x00;
GIFR=0x40;   // cho phep ngat INT0

// USART initialization
// Communication Parameters: 8 Data, 1 Stop, No Parity
// USART Receiver: On
// USART Transmitter: On
// USART Mode: Asynchronous
// USART Baud Rate: 9600
UCSRA=0x00;
UCSRB=0x98;  // cau hinh bat Rx, Tx va ngat Rx
UCSRC=0x86;  // cau hinh truyen du lieu dong bo va khung truyen 8 bit   
UBRRH=0x00;
UBRRL=0x33;

// Analog Comparator initialization
// Analog Comparator: Off
// Analog Comparator Input Capture by Timer/Counter 1: Off
ACSR=0x80;
SFIOR=0x00;

// ADC initialization
// ADC Clock frequency: 1000.000 kHz
// ADC Voltage Reference: AREF pin
// ADC Auto Trigger Source: ADC Stopped
ADMUX=ADC_VREF_TYPE & 0xff;
ADCSRA=0x83;

// SPI initialization
// SPI disabled
SPCR=0x00;

// TWI initialization
// TWI disabled
TWCR=0x00;

// Global enable interrupts
#asm("sei")

while (1)
      {
      // Place your code here
        ADC_OUT = read_adc(0); // Luu gia tri analog tu cam bien
        voltage = ADC_OUT * 5000 / 1023; // dien ap = gia tri doc tu cam bien * dien ap tham chieu 5000mV / do phan giai 10 bit: 2^10
        temperature = voltage / 10; // do gia tri nhiet do bang dien ap chia cho 10
        
        chuc = temperature / 10; // lay so hang chuc cua nhiet do
        donvi = temperature % 10; // lay so hang don vi cua nhiet do
        uart_char_send(chuc+0x30); // truyen uart ky tu chuc va hien thi len app
        uart_char_send(donvi+0x30); // truyen uart ky tu donvi va hien thi len app
        uart_char_send(10);
        uart_char_send(13);
        delay_ms(200);
      }
}
