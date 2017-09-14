Sensors_PWM_TIM4_Set_Duty_Wrapper:
;selfparkingcars.h,37 :: 		static void PWM_TIM4_Set_Duty_Wrapper(unsigned int ratio) {
; ratio start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; ratio end address is: 0 (R0)
; ratio start address is: 0 (R0)
;selfparkingcars.h,38 :: 		PWM_TIM4_Set_Duty(ratio, _PWM_INVERTED, _PWM_CHANNEL1);
MOVS	R2, #0
MOVS	R1, #1
; ratio end address is: 0 (R0)
BL	_PWM_TIM4_Set_Duty+0
;selfparkingcars.h,39 :: 		}
L_end_PWM_TIM4_Set_Duty_Wrapper:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of Sensors_PWM_TIM4_Set_Duty_Wrapper
Sensors_PWM_TIM9_Set_Duty_Wrapper:
;selfparkingcars.h,42 :: 		static void PWM_TIM9_Set_Duty_Wrapper(unsigned int ratio) {
; ratio start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; ratio end address is: 0 (R0)
; ratio start address is: 0 (R0)
;selfparkingcars.h,43 :: 		PWM_TIM9_Set_Duty(ratio, _PWM_INVERTED, _PWM_CHANNEL1);
MOVS	R2, #0
MOVS	R1, #1
; ratio end address is: 0 (R0)
BL	_PWM_TIM9_Set_Duty+0
;selfparkingcars.h,44 :: 		}
L_end_PWM_TIM9_Set_Duty_Wrapper:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of Sensors_PWM_TIM9_Set_Duty_Wrapper
Sensors_PWM_TIM10_Set_Duty_Wrapper:
;selfparkingcars.h,47 :: 		static void PWM_TIM10_Set_Duty_Wrapper(unsigned int ratio) {
; ratio start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; ratio end address is: 0 (R0)
; ratio start address is: 0 (R0)
;selfparkingcars.h,48 :: 		PWM_TIM10_Set_Duty(ratio, _PWM_NON_INVERTED, _PWM_CHANNEL1);
MOVS	R2, #0
MOVS	R1, #0
; ratio end address is: 0 (R0)
BL	_PWM_TIM10_Set_Duty+0
;selfparkingcars.h,49 :: 		}
L_end_PWM_TIM10_Set_Duty_Wrapper:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of Sensors_PWM_TIM10_Set_Duty_Wrapper
Sensors_PWM_TIM11_Set_Duty_Wrapper:
;selfparkingcars.h,52 :: 		static void PWM_TIM11_Set_Duty_Wrapper(unsigned int ratio) {
; ratio start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; ratio end address is: 0 (R0)
; ratio start address is: 0 (R0)
;selfparkingcars.h,53 :: 		PWM_TIM11_Set_Duty(ratio, _PWM_NON_INVERTED, _PWM_CHANNEL1);
MOVS	R2, #0
MOVS	R1, #0
; ratio end address is: 0 (R0)
BL	_PWM_TIM11_Set_Duty+0
;selfparkingcars.h,54 :: 		}
L_end_PWM_TIM11_Set_Duty_Wrapper:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of Sensors_PWM_TIM11_Set_Duty_Wrapper
_RotateFrontSensorFront:
;Sensors.c,4 :: 		void RotateFrontSensorFront()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Sensors.c,6 :: 		ChangeDuty[BACK_SENSOR](sensorPositions[12]);
MOVW	R0, #6510
MOVW	R4, #lo_addr(Sensors_ChangeDuty+12)
MOVT	R4, #hi_addr(Sensors_ChangeDuty+12)
LDR	R4, [R4, #0]
BLX	R4
;Sensors.c,7 :: 		}
L_end_RotateFrontSensorFront:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RotateFrontSensorFront
_AlignRightSensors:
;Sensors.c,9 :: 		void AlignRightSensors()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Sensors.c,11 :: 		ChangeDuty[FRONT_SENSOR](sensorPositions[10]);
MOVW	R0, #5859
MOVW	R4, #lo_addr(Sensors_ChangeDuty+8)
MOVT	R4, #hi_addr(Sensors_ChangeDuty+8)
LDR	R4, [R4, #0]
BLX	R4
;Sensors.c,12 :: 		ChangeDuty[BACK_SENSOR](sensorPositions[2]);
MOVW	R0, #3255
MOVW	R4, #lo_addr(Sensors_ChangeDuty+12)
MOVT	R4, #hi_addr(Sensors_ChangeDuty+12)
LDR	R4, [R4, #0]
BLX	R4
;Sensors.c,13 :: 		}
L_end_AlignRightSensors:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _AlignRightSensors
_TriggerFrontSensorMeasurement:
;Sensors.c,14 :: 		void TriggerFrontSensorMeasurement()
SUB	SP, SP, #4
;Sensors.c,16 :: 		ODR10_GPIOD_ODR_bit = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR10_GPIOD_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOD_ODR_bit+0)
STR	R1, [R0, #0]
;Sensors.c,17 :: 		Delay_us(40);
MOVW	R7, #1598
MOVT	R7, #0
NOP
NOP
L_TriggerFrontSensorMeasurement0:
SUBS	R7, R7, #1
BNE	L_TriggerFrontSensorMeasurement0
NOP
NOP
NOP
;Sensors.c,18 :: 		ODR10_GPIOD_ODR_bit = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR10_GPIOD_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOD_ODR_bit+0)
STR	R1, [R0, #0]
;Sensors.c,19 :: 		Delay_ms(60);
MOVW	R7, #40702
MOVT	R7, #36
NOP
NOP
L_TriggerFrontSensorMeasurement2:
SUBS	R7, R7, #1
BNE	L_TriggerFrontSensorMeasurement2
NOP
NOP
NOP
;Sensors.c,20 :: 		}
L_end_TriggerFrontSensorMeasurement:
ADD	SP, SP, #4
BX	LR
; end of _TriggerFrontSensorMeasurement
_TriggerBackSensorMeasurement:
;Sensors.c,22 :: 		void TriggerBackSensorMeasurement()
SUB	SP, SP, #4
;Sensors.c,24 :: 		ODR11_GPIOD_ODR_bit = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR11_GPIOD_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOD_ODR_bit+0)
STR	R1, [R0, #0]
;Sensors.c,25 :: 		Delay_us(40);
MOVW	R7, #1598
MOVT	R7, #0
NOP
NOP
L_TriggerBackSensorMeasurement4:
SUBS	R7, R7, #1
BNE	L_TriggerBackSensorMeasurement4
NOP
NOP
NOP
;Sensors.c,26 :: 		ODR11_GPIOD_ODR_bit = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR11_GPIOD_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOD_ODR_bit+0)
STR	R1, [R0, #0]
;Sensors.c,27 :: 		Delay_ms(60);
MOVW	R7, #40702
MOVT	R7, #36
NOP
NOP
L_TriggerBackSensorMeasurement6:
SUBS	R7, R7, #1
BNE	L_TriggerBackSensorMeasurement6
NOP
NOP
NOP
;Sensors.c,28 :: 		}
L_end_TriggerBackSensorMeasurement:
ADD	SP, SP, #4
BX	LR
; end of _TriggerBackSensorMeasurement
_InitBackServoPWM_Timer10_CH1_PB8:
;Sensors.c,36 :: 		void InitBackServoPWM_Timer10_CH1_PB8()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Sensors.c,38 :: 		pwmPeriod[BACK_SENSOR] =  PWM_TIM10_Init(INITIAL_SENSOR_FREQUENCY);
MOVS	R0, #50
BL	_PWM_TIM10_Init+0
MOVW	R1, #lo_addr(Sensors_pwmPeriod+6)
MOVT	R1, #hi_addr(Sensors_pwmPeriod+6)
STRH	R0, [R1, #0]
;Sensors.c,39 :: 		pwmDuty[BACK_SENSOR] = sensorPositions[0];
MOVW	R1, #2604
SXTH	R1, R1
MOVW	R0, #lo_addr(Sensors_pwmDuty+6)
MOVT	R0, #hi_addr(Sensors_pwmDuty+6)
STRH	R1, [R0, #0]
;Sensors.c,40 :: 		ChangeDuty[BACK_SENSOR](pwmDuty[BACK_SENSOR]);
MOVW	R4, #2604
UXTH	R0, R4
MOVW	R4, #lo_addr(Sensors_ChangeDuty+12)
MOVT	R4, #hi_addr(Sensors_ChangeDuty+12)
LDR	R4, [R4, #0]
BLX	R4
;Sensors.c,41 :: 		PWM_TIM10_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM10_CH1_PB8);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM10_CH1_PB8+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM10_CH1_PB8+0)
MOVS	R0, #0
BL	_PWM_TIM10_Start+0
;Sensors.c,42 :: 		}
L_end_InitBackServoPWM_Timer10_CH1_PB8:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitBackServoPWM_Timer10_CH1_PB8
_InitFrontServoPWM_Timer11_CH1_PB9:
;Sensors.c,44 :: 		void InitFrontServoPWM_Timer11_CH1_PB9()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Sensors.c,46 :: 		pwmPeriod[FRONT_SENSOR]  = PWM_TIM11_Init(INITIAL_SENSOR_FREQUENCY);
MOVS	R0, #50
BL	_PWM_TIM11_Init+0
MOVW	R1, #lo_addr(Sensors_pwmPeriod+4)
MOVT	R1, #hi_addr(Sensors_pwmPeriod+4)
STRH	R0, [R1, #0]
;Sensors.c,47 :: 		pwmDuty[FRONT_SENSOR] = sensorPositions[0];
MOVW	R1, #2604
SXTH	R1, R1
MOVW	R0, #lo_addr(Sensors_pwmDuty+4)
MOVT	R0, #hi_addr(Sensors_pwmDuty+4)
STRH	R1, [R0, #0]
;Sensors.c,48 :: 		ChangeDuty[FRONT_SENSOR](pwmDuty[FRONT_SENSOR]);  // 1ms = 6484 2 ms =   12 973
MOVW	R4, #2604
UXTH	R0, R4
MOVW	R4, #lo_addr(Sensors_ChangeDuty+8)
MOVT	R4, #hi_addr(Sensors_ChangeDuty+8)
LDR	R4, [R4, #0]
BLX	R4
;Sensors.c,49 :: 		PWM_TIM11_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM11_CH1_PB9);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM11_CH1_PB9+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM11_CH1_PB9+0)
MOVS	R0, #0
BL	_PWM_TIM11_Start+0
;Sensors.c,50 :: 		}
L_end_InitFrontServoPWM_Timer11_CH1_PB9:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitFrontServoPWM_Timer11_CH1_PB9
_Timer:
;Sensors.c,60 :: 		void Timer()
SUB	SP, SP, #4
;Sensors.c,62 :: 		RCC_APB1ENR.TIM2EN = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;Sensors.c,63 :: 		TIM2_CR1.CEN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Sensors.c,64 :: 		TIM2_PSC = 5; // Prescaller+1    (120 Mhz / prescaller+1 represents frequency of Timer calls)
MOVS	R1, #5
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;Sensors.c,65 :: 		TIM2_ARR = 65535;
MOVW	R1, #65535
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;Sensors.c,66 :: 		}
L_end_Timer:
ADD	SP, SP, #4
BX	LR
; end of _Timer
_InitializeSensors:
;Sensors.c,68 :: 		void InitializeSensors()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Sensors.c,70 :: 		Timer();
BL	_Timer+0
;Sensors.c,72 :: 		InitBackServoPWM_Timer10_CH1_PB8();
BL	_InitBackServoPWM_Timer10_CH1_PB8+0
;Sensors.c,73 :: 		InitFrontServoPWM_Timer11_CH1_PB9();
BL	_InitFrontServoPWM_Timer11_CH1_PB9+0
;Sensors.c,76 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_11); // Front sensor Trigger: PD11
MOVW	R1, #2048
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;Sensors.c,77 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_10); // Back sensor Trigger : PD10
MOVW	R1, #1024
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;Sensors.c,80 :: 		GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_3); // Back sensor Echo : PC3
MOVW	R1, #8
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Input+0
;Sensors.c,81 :: 		GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_4); // Front sensor Echo: PC4
MOVW	R1, #16
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Input+0
;Sensors.c,84 :: 		SYSCFGEN_bit = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(SYSCFGEN_bit+0)
MOVT	R0, #hi_addr(SYSCFGEN_bit+0)
STR	R1, [R0, #0]
;Sensors.c,87 :: 		EXTI_RTSR |=        0x8         | 0x10;              // Set interrupt on Rising edge
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #24
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
STR	R1, [R0, #0]
;Sensors.c,88 :: 		EXTI_FTSR |=        0x8         | 0x10;              // Set interrupt on Falling edge
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #24
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
STR	R1, [R0, #0]
;Sensors.c,89 :: 		EXTI_IMR |=         0x8         | 0x10;              // Set mask
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #24
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;Sensors.c,90 :: 		SYSCFG_EXTICR1 |=   0x2000;       SYSCFG_EXTICR2 |= 0x2;
MOVW	R0, #lo_addr(SYSCFG_EXTICR1+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8192
MOVW	R0, #lo_addr(SYSCFG_EXTICR1+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR1+0)
STR	R1, [R0, #0]
MOVW	R0, #lo_addr(SYSCFG_EXTICR2+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR2+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2
MOVW	R0, #lo_addr(SYSCFG_EXTICR2+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR2+0)
STR	R1, [R0, #0]
;Sensors.c,91 :: 		NVIC_IntEnable(IVT_INT_EXTI3);    NVIC_IntEnable(IVT_INT_EXTI4);
MOVW	R0, #25
BL	_NVIC_IntEnable+0
MOVW	R0, #26
BL	_NVIC_IntEnable+0
;Sensors.c,92 :: 		}
L_end_InitializeSensors:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitializeSensors
_GetResultsInCM:
;Sensors.c,93 :: 		double GetResultsInCM(unsigned long distance)
; distance start address is: 0 (R0)
SUB	SP, SP, #4
; distance end address is: 0 (R0)
; distance start address is: 0 (R0)
;Sensors.c,95 :: 		return distance/580.0;
VMOV	S1, R0
VCVT.F32	#0, S1, S1
; distance end address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #17425
VMOV	S0, R1
VDIV.F32	S0, S1, S0
;Sensors.c,96 :: 		}
L_end_GetResultsInCM:
ADD	SP, SP, #4
BX	LR
; end of _GetResultsInCM
_GetFrontSensorDistance:
;Sensors.c,99 :: 		double GetFrontSensorDistance()
SUB	SP, SP, #4
;Sensors.c,101 :: 		return rez2;
MOVW	R0, #lo_addr(_rez2+0)
MOVT	R0, #hi_addr(_rez2+0)
VLDR	#1, S0, [R0, #0]
;Sensors.c,102 :: 		}
L_end_GetFrontSensorDistance:
ADD	SP, SP, #4
BX	LR
; end of _GetFrontSensorDistance
_GetBackSensorDistance:
;Sensors.c,103 :: 		double GetBackSensorDistance()
SUB	SP, SP, #4
;Sensors.c,105 :: 		return rez;
MOVW	R0, #lo_addr(_rez+0)
MOVT	R0, #hi_addr(_rez+0)
VLDR	#1, S0, [R0, #0]
;Sensors.c,106 :: 		}
L_end_GetBackSensorDistance:
ADD	SP, SP, #4
BX	LR
; end of _GetBackSensorDistance
_FrontSensorEcho:
;Sensors.c,108 :: 		void FrontSensorEcho() iv IVT_INT_EXTI4 ics ICS_AUTO {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Sensors.c,109 :: 		EXTI_PR.B4 = 1;                     // clear flag
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;Sensors.c,110 :: 		ODR15_GPIOE_ODR_bit = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR15_GPIOE_ODR_bit+0)
MOVT	R0, #hi_addr(ODR15_GPIOE_ODR_bit+0)
STR	R1, [R0, #0]
;Sensors.c,111 :: 		if(IDR4_GPIOC_IDR_bit == 1)
MOVW	R1, #lo_addr(IDR4_GPIOC_IDR_bit+0)
MOVT	R1, #hi_addr(IDR4_GPIOC_IDR_bit+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_FrontSensorEcho8
;Sensors.c,113 :: 		TIM2_CR1.CEN = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Sensors.c,114 :: 		};
L_FrontSensorEcho8:
;Sensors.c,116 :: 		if(IDR4_GPIOC_IDR_bit == 0)
MOVW	R1, #lo_addr(IDR4_GPIOC_IDR_bit+0)
MOVT	R1, #hi_addr(IDR4_GPIOC_IDR_bit+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_FrontSensorEcho9
;Sensors.c,118 :: 		TIM2_CR1.CEN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Sensors.c,119 :: 		merenje = TIM2_CNT;
MOVW	R0, #lo_addr(TIM2_CNT+0)
MOVT	R0, #hi_addr(TIM2_CNT+0)
LDR	R0, [R0, #0]
MOVW	R2, #lo_addr(_merenje+0)
MOVT	R2, #hi_addr(_merenje+0)
STR	R0, [R2, #0]
;Sensors.c,120 :: 		TIM2_CNT = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM2_CNT+0)
MOVT	R0, #hi_addr(TIM2_CNT+0)
STR	R1, [R0, #0]
;Sensors.c,121 :: 		if (merenje >= 4000)
MOV	R0, R2
LDR	R0, [R0, #0]
CMP	R0, #4000
IT	CC
BCC	L_FrontSensorEcho10
;Sensors.c,123 :: 		ODR15_GPIOE_ODR_bit = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR15_GPIOE_ODR_bit+0)
MOVT	R0, #hi_addr(ODR15_GPIOE_ODR_bit+0)
STR	R1, [R0, #0]
;Sensors.c,124 :: 		}
L_FrontSensorEcho10:
;Sensors.c,125 :: 		rez2 = GetResultsInCM(merenje);
MOVW	R0, #lo_addr(_merenje+0)
MOVT	R0, #hi_addr(_merenje+0)
LDR	R0, [R0, #0]
BL	_GetResultsInCM+0
MOVW	R0, #lo_addr(_rez2+0)
MOVT	R0, #hi_addr(_rez2+0)
VSTR	#1, S0, [R0, #0]
;Sensors.c,128 :: 		}
L_FrontSensorEcho9:
;Sensors.c,129 :: 		}
L_end_FrontSensorEcho:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _FrontSensorEcho
_BackSensorEcho:
;Sensors.c,131 :: 		void BackSensorEcho() iv IVT_INT_EXTI3 ics ICS_AUTO {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Sensors.c,132 :: 		EXTI_PR.B3 = 1;                     // clear flag
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;Sensors.c,133 :: 		ODR15_GPIOE_ODR_bit = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR15_GPIOE_ODR_bit+0)
MOVT	R0, #hi_addr(ODR15_GPIOE_ODR_bit+0)
STR	R1, [R0, #0]
;Sensors.c,134 :: 		if(IDR3_GPIOC_IDR_bit == 1)
MOVW	R1, #lo_addr(IDR3_GPIOC_IDR_bit+0)
MOVT	R1, #hi_addr(IDR3_GPIOC_IDR_bit+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_BackSensorEcho11
;Sensors.c,136 :: 		TIM2_CR1.CEN = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Sensors.c,137 :: 		};
L_BackSensorEcho11:
;Sensors.c,139 :: 		if(IDR3_GPIOC_IDR_bit == 0)
MOVW	R1, #lo_addr(IDR3_GPIOC_IDR_bit+0)
MOVT	R1, #hi_addr(IDR3_GPIOC_IDR_bit+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_BackSensorEcho12
;Sensors.c,141 :: 		TIM2_CR1.CEN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Sensors.c,142 :: 		merenjee = TIM2_CNT;
MOVW	R0, #lo_addr(TIM2_CNT+0)
MOVT	R0, #hi_addr(TIM2_CNT+0)
LDR	R0, [R0, #0]
MOVW	R2, #lo_addr(_merenjee+0)
MOVT	R2, #hi_addr(_merenjee+0)
STR	R0, [R2, #0]
;Sensors.c,143 :: 		TIM2_CNT = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM2_CNT+0)
MOVT	R0, #hi_addr(TIM2_CNT+0)
STR	R1, [R0, #0]
;Sensors.c,144 :: 		rez = GetResultsInCM(merenjee);
MOV	R0, R2
LDR	R0, [R0, #0]
BL	_GetResultsInCM+0
MOVW	R0, #lo_addr(_rez+0)
MOVT	R0, #hi_addr(_rez+0)
VSTR	#1, S0, [R0, #0]
;Sensors.c,146 :: 		}
L_BackSensorEcho12:
;Sensors.c,147 :: 		}
L_end_BackSensorEcho:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _BackSensorEcho
