_PWM_TIM4_Set_Duty_Wrapper:
;selfparkingcars.h,30 :: 		void PWM_TIM4_Set_Duty_Wrapper(unsigned int ratio) {
; ratio start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; ratio end address is: 0 (R0)
; ratio start address is: 0 (R0)
;selfparkingcars.h,31 :: 		PWM_TIM4_Set_Duty(ratio, _PWM_INVERTED, _PWM_CHANNEL1);
MOVS	R2, #0
MOVS	R1, #1
; ratio end address is: 0 (R0)
BL	_PWM_TIM4_Set_Duty+0
;selfparkingcars.h,32 :: 		}
L_end_PWM_TIM4_Set_Duty_Wrapper:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _PWM_TIM4_Set_Duty_Wrapper
_PWM_TIM9_Set_Duty_Wrapper:
;selfparkingcars.h,35 :: 		void PWM_TIM9_Set_Duty_Wrapper(unsigned int ratio) {
; ratio start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; ratio end address is: 0 (R0)
; ratio start address is: 0 (R0)
;selfparkingcars.h,36 :: 		PWM_TIM9_Set_Duty(ratio, _PWM_INVERTED, _PWM_CHANNEL1);
MOVS	R2, #0
MOVS	R1, #1
; ratio end address is: 0 (R0)
BL	_PWM_TIM9_Set_Duty+0
;selfparkingcars.h,37 :: 		}
L_end_PWM_TIM9_Set_Duty_Wrapper:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _PWM_TIM9_Set_Duty_Wrapper
_PWM_TIM10_Set_Duty_Wrapper:
;selfparkingcars.h,40 :: 		void PWM_TIM10_Set_Duty_Wrapper(unsigned int ratio) {
; ratio start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; ratio end address is: 0 (R0)
; ratio start address is: 0 (R0)
;selfparkingcars.h,41 :: 		PWM_TIM10_Set_Duty(ratio, _PWM_NON_INVERTED, _PWM_CHANNEL1);
MOVS	R2, #0
MOVS	R1, #0
; ratio end address is: 0 (R0)
BL	_PWM_TIM10_Set_Duty+0
;selfparkingcars.h,42 :: 		}
L_end_PWM_TIM10_Set_Duty_Wrapper:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _PWM_TIM10_Set_Duty_Wrapper
_PWM_TIM11_Set_Duty_Wrapper:
;selfparkingcars.h,45 :: 		void PWM_TIM11_Set_Duty_Wrapper(unsigned int ratio) {
; ratio start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; ratio end address is: 0 (R0)
; ratio start address is: 0 (R0)
;selfparkingcars.h,46 :: 		PWM_TIM11_Set_Duty(ratio, _PWM_NON_INVERTED, _PWM_CHANNEL1);
MOVS	R2, #0
MOVS	R1, #0
; ratio end address is: 0 (R0)
BL	_PWM_TIM11_Set_Duty+0
;selfparkingcars.h,47 :: 		}
L_end_PWM_TIM11_Set_Duty_Wrapper:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _PWM_TIM11_Set_Duty_Wrapper
_InitExternIntRisingEdge_PC1_PC2:
;SelfParkingCars.c,16 :: 		void InitExternIntRisingEdge_PC1_PC2()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,18 :: 		GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_1);
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Input+0
;SelfParkingCars.c,19 :: 		GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_2);
MOVW	R1, #4
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Input+0
;SelfParkingCars.c,20 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_12);
MOVW	R1, #4096
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;SelfParkingCars.c,21 :: 		SYSCFGEN_bit = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(SYSCFGEN_bit+0)
MOVT	R0, #hi_addr(SYSCFGEN_bit+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,22 :: 		SYSCFG_EXTICR1 |= LEFT_WHEEL_EXT_INT_CR1_PC1 | RIGHT_WHEEL_EXT_INT_CR1_PC2;
MOVW	R0, #lo_addr(SYSCFG_EXTICR1+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #544
MOVW	R0, #lo_addr(SYSCFG_EXTICR1+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR1+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,23 :: 		EXTI_RTSR |= RISING_TRIGGER_PC1 | RISING_TRIGGER_PC2;
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #6
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,24 :: 		EXTI_FTSR |= RISING_TRIGGER_PC1 | RISING_TRIGGER_PC2;
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #6
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,25 :: 		EXTI_IMR  |=  RISING_TRIGGER_PC1 |  RISING_TRIGGER_PC2;
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #6
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,26 :: 		NVIC_IntEnable(IVT_INT_EXTI1);
MOVW	R0, #23
BL	_NVIC_IntEnable+0
;SelfParkingCars.c,27 :: 		NVIC_IntEnable(IVT_INT_EXTI2);
MOVW	R0, #24
BL	_NVIC_IntEnable+0
;SelfParkingCars.c,28 :: 		}
L_end_InitExternIntRisingEdge_PC1_PC2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitExternIntRisingEdge_PC1_PC2
_RightWheel_Interrupt:
;SelfParkingCars.c,31 :: 		void RightWheel_Interrupt() iv IVT_INT_EXTI2 ics ICS_AUTO
;SelfParkingCars.c,32 :: 		{      EXTI_PR.B2 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,33 :: 		stepsRight++;
MOVW	R1, #lo_addr(_stepsRight+0)
MOVT	R1, #hi_addr(_stepsRight+0)
LDRSH	R0, [R1, #0]
ADDS	R2, R0, #1
SXTH	R2, R2
STRH	R2, [R1, #0]
;SelfParkingCars.c,34 :: 		if (stepsRight%10 == 0)
MOVS	R1, #10
SXTH	R1, R1
SDIV	R0, R2, R1
MLS	R0, R1, R0, R2
SXTH	R0, R0
CMP	R0, #0
IT	NE
BNE	L_RightWheel_Interrupt0
;SelfParkingCars.c,37 :: 		}
L_RightWheel_Interrupt0:
;SelfParkingCars.c,46 :: 		}
L_end_RightWheel_Interrupt:
BX	LR
; end of _RightWheel_Interrupt
_AdjustWheelsPWM:
;SelfParkingCars.c,48 :: 		void AdjustWheelsPWM(double distanceWheelLeft,double distanceWheelRight)
SUB	SP, SP, #4
;SelfParkingCars.c,59 :: 		}
L_end_AdjustWheelsPWM:
ADD	SP, SP, #4
BX	LR
; end of _AdjustWheelsPWM
_LeftWheel_Interrupt:
;SelfParkingCars.c,60 :: 		void LeftWheel_Interrupt() iv IVT_INT_EXTI1 ics ICS_AUTO
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,61 :: 		{      EXTI_PR.B1 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,62 :: 		stepsLeft++;
MOVW	R1, #lo_addr(_stepsLeft+0)
MOVT	R1, #hi_addr(_stepsLeft+0)
LDRSH	R0, [R1, #0]
ADDS	R2, R0, #1
SXTH	R2, R2
STRH	R2, [R1, #0]
;SelfParkingCars.c,63 :: 		if (stepsLeft%5 == 0 )
MOVS	R1, #5
SXTH	R1, R1
SDIV	R0, R2, R1
MLS	R0, R1, R0, R2
SXTH	R0, R0
CMP	R0, #0
IT	NE
BNE	L_LeftWheel_Interrupt1
;SelfParkingCars.c,66 :: 		}
L_LeftWheel_Interrupt1:
;SelfParkingCars.c,67 :: 		if (!faza2) return;
MOVW	R0, #lo_addr(_faza2+0)
MOVT	R0, #hi_addr(_faza2+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_LeftWheel_Interrupt2
IT	AL
BAL	L_end_LeftWheel_Interrupt
L_LeftWheel_Interrupt2:
;SelfParkingCars.c,68 :: 		--wheelInterruptCount[RIGHT_WHEEL];
MOVW	R1, #lo_addr(_wheelInterruptCount+2)
MOVT	R1, #hi_addr(_wheelInterruptCount+2)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;SelfParkingCars.c,69 :: 		if (wheelInterruptCount[RIGHT_WHEEL] <  0)
CMP	R0, #0
IT	GE
BGE	L_LeftWheel_Interrupt3
;SelfParkingCars.c,71 :: 		ChangeDuty[RIGHT_WHEEL](0);
MOVS	R0, #0
MOVW	R4, #lo_addr(_ChangeDuty+4)
MOVT	R4, #hi_addr(_ChangeDuty+4)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,73 :: 		}
L_LeftWheel_Interrupt3:
;SelfParkingCars.c,74 :: 		}
L_end_LeftWheel_Interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _LeftWheel_Interrupt
_InitLeftWheelPWM_Timer4_CH1_PB6:
;SelfParkingCars.c,80 :: 		void InitLeftWheelPWM_Timer4_CH1_PB6()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,82 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_6);
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
;SelfParkingCars.c,83 :: 		SpinDirectionLeftWheel = FORWARD_SPIN;    // Default forward spin
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR6_GPIOA_ODR_bit+0)
MOVT	R0, #hi_addr(ODR6_GPIOA_ODR_bit+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,85 :: 		pwmPeriod[LEFT_WHEEL] =  PWM_TIM4_Init(50000) ; // Work on frequency 20-35 Khz
MOVW	R0, #50000
BL	_PWM_TIM4_Init+0
MOVW	R1, #lo_addr(_pwmPeriod+0)
MOVT	R1, #hi_addr(_pwmPeriod+0)
STRH	R0, [R1, #0]
;SelfParkingCars.c,86 :: 		pwmDuty[LEFT_WHEEL] = pwmPeriod[LEFT_WHEEL]-700; // -750;// - 1000 ;
SUB	R1, R0, #700
MOVW	R0, #lo_addr(_pwmDuty+0)
MOVT	R0, #hi_addr(_pwmDuty+0)
STRH	R1, [R0, #0]
;SelfParkingCars.c,87 :: 		ChangeDuty[LEFT_WHEEL](pwmDuty[LEFT_WHEEL]);
UXTH	R4, R1
UXTH	R0, R4
MOVW	R4, #lo_addr(_ChangeDuty+0)
MOVT	R4, #hi_addr(_ChangeDuty+0)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,88 :: 		PWM_TIM4_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM4_CH1_PB6);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM4_CH1_PB6+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM4_CH1_PB6+0)
MOVS	R0, #0
BL	_PWM_TIM4_Start+0
;SelfParkingCars.c,89 :: 		}
L_end_InitLeftWheelPWM_Timer4_CH1_PB6:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitLeftWheelPWM_Timer4_CH1_PB6
_InitRightWheelPWM_Timer9_CH1_PE5:
;SelfParkingCars.c,91 :: 		void InitRightWheelPWM_Timer9_CH1_PE5()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,93 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
;SelfParkingCars.c,94 :: 		SpinDirectionRightWheel = FORWARD_SPIN;    // Default forward spin
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR7_GPIOA_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOA_ODR_bit+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,96 :: 		pwmPeriod[RIGHT_WHEEL] =  PWM_TIM9_Init(25000);
MOVW	R0, #25000
BL	_PWM_TIM9_Init+0
MOVW	R1, #lo_addr(_pwmPeriod+2)
MOVT	R1, #hi_addr(_pwmPeriod+2)
STRH	R0, [R1, #0]
;SelfParkingCars.c,97 :: 		pwmDuty[RIGHT_WHEEL] = pwmPeriod[RIGHT_WHEEL]-1400;//-1500;//-1650;//      27.44 us from 39.88 us (slow)
SUB	R1, R0, #1400
MOVW	R0, #lo_addr(_pwmDuty+2)
MOVT	R0, #hi_addr(_pwmDuty+2)
STRH	R1, [R0, #0]
;SelfParkingCars.c,98 :: 		ChangeDuty[RIGHT_WHEEL](pwmDuty[RIGHT_WHEEL]);
UXTH	R4, R1
UXTH	R0, R4
MOVW	R4, #lo_addr(_ChangeDuty+4)
MOVT	R4, #hi_addr(_ChangeDuty+4)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,99 :: 		PWM_TIM9_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM9_CH1_PE5);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM9_CH1_PE5+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM9_CH1_PE5+0)
MOVS	R0, #0
BL	_PWM_TIM9_Start+0
;SelfParkingCars.c,100 :: 		}
L_end_InitRightWheelPWM_Timer9_CH1_PE5:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitRightWheelPWM_Timer9_CH1_PE5
_InitBackServoPWM_Timer10_CH1_PB8:
;SelfParkingCars.c,109 :: 		void InitBackServoPWM_Timer10_CH1_PB8()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,111 :: 		pwmPeriod[BACK_SENSOR] =  PWM_TIM10_Init(INITIAL_SENSOR_FREQUENCY);
MOVS	R0, #50
BL	_PWM_TIM10_Init+0
MOVW	R1, #lo_addr(_pwmPeriod+6)
MOVT	R1, #hi_addr(_pwmPeriod+6)
STRH	R0, [R1, #0]
;SelfParkingCars.c,112 :: 		pwmDuty[BACK_SENSOR] = sensorPositions[0];
MOVW	R1, #2604
SXTH	R1, R1
MOVW	R0, #lo_addr(_pwmDuty+6)
MOVT	R0, #hi_addr(_pwmDuty+6)
STRH	R1, [R0, #0]
;SelfParkingCars.c,113 :: 		ChangeDuty[BACK_SENSOR](pwmDuty[BACK_SENSOR]);
MOVW	R4, #2604
UXTH	R0, R4
MOVW	R4, #lo_addr(_ChangeDuty+12)
MOVT	R4, #hi_addr(_ChangeDuty+12)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,114 :: 		PWM_TIM10_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM10_CH1_PB8);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM10_CH1_PB8+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM10_CH1_PB8+0)
MOVS	R0, #0
BL	_PWM_TIM10_Start+0
;SelfParkingCars.c,115 :: 		}
L_end_InitBackServoPWM_Timer10_CH1_PB8:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitBackServoPWM_Timer10_CH1_PB8
_InitFrontServoPWM_Timer11_CH1_PB9:
;SelfParkingCars.c,117 :: 		void InitFrontServoPWM_Timer11_CH1_PB9()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,119 :: 		pwmPeriod[FRONT_SENSOR]  = PWM_TIM11_Init(INITIAL_SENSOR_FREQUENCY);
MOVS	R0, #50
BL	_PWM_TIM11_Init+0
MOVW	R1, #lo_addr(_pwmPeriod+4)
MOVT	R1, #hi_addr(_pwmPeriod+4)
STRH	R0, [R1, #0]
;SelfParkingCars.c,120 :: 		pwmDuty[FRONT_SENSOR] = sensorPositions[0];
MOVW	R1, #2604
SXTH	R1, R1
MOVW	R0, #lo_addr(_pwmDuty+4)
MOVT	R0, #hi_addr(_pwmDuty+4)
STRH	R1, [R0, #0]
;SelfParkingCars.c,121 :: 		ChangeDuty[FRONT_SENSOR](pwmDuty[FRONT_SENSOR]);  // 1ms = 6484 2 ms =   12 973
MOVW	R4, #2604
UXTH	R0, R4
MOVW	R4, #lo_addr(_ChangeDuty+8)
MOVT	R4, #hi_addr(_ChangeDuty+8)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,122 :: 		PWM_TIM11_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM11_CH1_PB9);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM11_CH1_PB9+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM11_CH1_PB9+0)
MOVS	R0, #0
BL	_PWM_TIM11_Start+0
;SelfParkingCars.c,123 :: 		}
L_end_InitFrontServoPWM_Timer11_CH1_PB9:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitFrontServoPWM_Timer11_CH1_PB9
_UpdateCurrentDuty:
;SelfParkingCars.c,126 :: 		void UpdateCurrentDuty(int updateFor, int component)
; component start address is: 4 (R1)
; updateFor start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
STRH	R1, [SP, #4]
SXTH	R1, R0
LDRSH	R0, [SP, #4]
; component end address is: 4 (R1)
; updateFor end address is: 0 (R0)
; updateFor start address is: 4 (R1)
; component start address is: 0 (R0)
;SelfParkingCars.c,128 :: 		if (pwmDuty[component]+ updateFor < 0)
LSLS	R3, R0, #1
MOVW	R2, #lo_addr(_pwmDuty+0)
MOVT	R2, #hi_addr(_pwmDuty+0)
ADDS	R2, R2, R3
LDRSH	R2, [R2, #0]
ADDS	R2, R2, R1
SXTH	R2, R2
CMP	R2, #0
IT	GE
BGE	L_UpdateCurrentDuty4
; updateFor end address is: 4 (R1)
;SelfParkingCars.c,130 :: 		pwmDuty[component] = 0;
LSLS	R3, R0, #1
MOVW	R2, #lo_addr(_pwmDuty+0)
MOVT	R2, #hi_addr(_pwmDuty+0)
ADDS	R3, R2, R3
MOVS	R2, #0
SXTH	R2, R2
STRH	R2, [R3, #0]
;SelfParkingCars.c,131 :: 		}
IT	AL
BAL	L_UpdateCurrentDuty5
L_UpdateCurrentDuty4:
;SelfParkingCars.c,134 :: 		pwmDuty[component] += updateFor;
; updateFor start address is: 4 (R1)
LSLS	R3, R0, #1
MOVW	R2, #lo_addr(_pwmDuty+0)
MOVT	R2, #hi_addr(_pwmDuty+0)
ADDS	R3, R2, R3
LDRSH	R2, [R3, #0]
ADDS	R2, R2, R1
; updateFor end address is: 4 (R1)
STRH	R2, [R3, #0]
;SelfParkingCars.c,135 :: 		}
L_UpdateCurrentDuty5:
;SelfParkingCars.c,137 :: 		ChangeDuty[component](pwmDuty[component]);
LSLS	R3, R0, #2
MOVW	R2, #lo_addr(_ChangeDuty+0)
MOVT	R2, #hi_addr(_ChangeDuty+0)
ADDS	R2, R2, R3
LDR	R4, [R2, #0]
LSLS	R3, R0, #1
; component end address is: 0 (R0)
MOVW	R2, #lo_addr(_pwmDuty+0)
MOVT	R2, #hi_addr(_pwmDuty+0)
ADDS	R2, R2, R3
LDRSH	R2, [R2, #0]
UXTH	R2, R2
UXTH	R0, R2
BLX	R4
;SelfParkingCars.c,138 :: 		}
L_end_UpdateCurrentDuty:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _UpdateCurrentDuty
_WheelsSpeedAndDirectionTest:
;SelfParkingCars.c,144 :: 		void WheelsSpeedAndDirectionTest()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,146 :: 		InitLeftWheelPWM_Timer4_CH1_PB6();
BL	_InitLeftWheelPWM_Timer4_CH1_PB6+0
;SelfParkingCars.c,147 :: 		InitRightWheelPWM_Timer9_CH1_PE5();
BL	_InitRightWheelPWM_Timer9_CH1_PE5+0
;SelfParkingCars.c,148 :: 		while(1)
L_WheelsSpeedAndDirectionTest6:
;SelfParkingCars.c,150 :: 		selectedWheel = wheelDirection;
MOVW	R0, #lo_addr(_wheelDirection+0)
MOVT	R0, #hi_addr(_wheelDirection+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_selectedWheel+0)
MOVT	R0, #hi_addr(_selectedWheel+0)
STRH	R1, [R0, #0]
;SelfParkingCars.c,151 :: 		Delay_ms(3000); //UpdateCurrentDuty(-500, selectedWheel);
MOVW	R7, #3582
MOVT	R7, #1831
NOP
NOP
L_WheelsSpeedAndDirectionTest8:
SUBS	R7, R7, #1
BNE	L_WheelsSpeedAndDirectionTest8
NOP
NOP
NOP
;SelfParkingCars.c,152 :: 		Delay_ms(3000); //UpdateCurrentDuty(500, selectedWheel);
MOVW	R7, #3582
MOVT	R7, #1831
NOP
NOP
L_WheelsSpeedAndDirectionTest10:
SUBS	R7, R7, #1
BNE	L_WheelsSpeedAndDirectionTest10
NOP
NOP
NOP
;SelfParkingCars.c,155 :: 		if (wheelDirection)
MOVW	R0, #lo_addr(_wheelDirection+0)
MOVT	R0, #hi_addr(_wheelDirection+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_WheelsSpeedAndDirectionTest12
;SelfParkingCars.c,157 :: 		selectedWheel = !selectedWheel;
MOVW	R1, #lo_addr(_selectedWheel+0)
MOVT	R1, #hi_addr(_selectedWheel+0)
LDRSH	R0, [R1, #0]
CMP	R0, #0
MOVW	R0, #0
BNE	L__WheelsSpeedAndDirectionTest69
MOVS	R0, #1
L__WheelsSpeedAndDirectionTest69:
UXTB	R0, R0
STRH	R0, [R1, #0]
;SelfParkingCars.c,158 :: 		}
IT	AL
BAL	L_WheelsSpeedAndDirectionTest13
L_WheelsSpeedAndDirectionTest12:
;SelfParkingCars.c,162 :: 		wheelDirection = !wheelDirection;
MOVW	R1, #lo_addr(_wheelDirection+0)
MOVT	R1, #hi_addr(_wheelDirection+0)
LDRSH	R0, [R1, #0]
CMP	R0, #0
MOVW	R0, #0
BNE	L__WheelsSpeedAndDirectionTest70
MOVS	R0, #1
L__WheelsSpeedAndDirectionTest70:
UXTB	R0, R0
STRH	R0, [R1, #0]
;SelfParkingCars.c,163 :: 		}
L_WheelsSpeedAndDirectionTest13:
;SelfParkingCars.c,164 :: 		}
IT	AL
BAL	L_WheelsSpeedAndDirectionTest6
;SelfParkingCars.c,165 :: 		}
L_end_WheelsSpeedAndDirectionTest:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _WheelsSpeedAndDirectionTest
_WheelsSpeedTest:
;SelfParkingCars.c,167 :: 		void WheelsSpeedTest()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,169 :: 		Delay_ms(2000);
MOVW	R7, #46078
MOVT	R7, #1220
NOP
NOP
L_WheelsSpeedTest14:
SUBS	R7, R7, #1
BNE	L_WheelsSpeedTest14
NOP
NOP
NOP
;SelfParkingCars.c,171 :: 		InitRightWheelPWM_Timer9_CH1_PE5();
BL	_InitRightWheelPWM_Timer9_CH1_PE5+0
;SelfParkingCars.c,172 :: 		while(pwmDuty[RIGHT_WHEEL]>0)
L_WheelsSpeedTest16:
MOVW	R0, #lo_addr(_pwmDuty+2)
MOVT	R0, #hi_addr(_pwmDuty+2)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LE
BLE	L_WheelsSpeedTest17
;SelfParkingCars.c,174 :: 		UpdateCurrentDuty(50, RIGHT_WHEEL);           //left range 2290
MOVS	R1, #1
SXTH	R1, R1
MOVS	R0, #50
SXTH	R0, R0
BL	_UpdateCurrentDuty+0
;SelfParkingCars.c,175 :: 		Delay_ms(250);
MOVW	R7, #38526
MOVT	R7, #152
NOP
NOP
L_WheelsSpeedTest18:
SUBS	R7, R7, #1
BNE	L_WheelsSpeedTest18
NOP
NOP
NOP
;SelfParkingCars.c,176 :: 		}
IT	AL
BAL	L_WheelsSpeedTest16
L_WheelsSpeedTest17:
;SelfParkingCars.c,177 :: 		}
L_end_WheelsSpeedTest:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _WheelsSpeedTest
_ServoPositionTest:
;SelfParkingCars.c,181 :: 		void ServoPositionTest()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,183 :: 		InitFrontServoPWM_Timer11_CH1_PB9();
BL	_InitFrontServoPWM_Timer11_CH1_PB9+0
;SelfParkingCars.c,184 :: 		InitBackServoPWM_Timer10_CH1_PB8();
BL	_InitBackServoPWM_Timer10_CH1_PB8+0
;SelfParkingCars.c,186 :: 		while(1)
L_ServoPositionTest20:
;SelfParkingCars.c,188 :: 		ChangeDuty[FRONT_SENSOR](sensorPositions[ServoPosition]);
MOVW	R0, #lo_addr(_ServoPosition+0)
MOVT	R0, #hi_addr(_ServoPosition+0)
LDRSH	R0, [R0, #0]
LSLS	R1, R0, #1
MOVW	R0, #lo_addr(SelfParkingCars_sensorPositions+0)
MOVT	R0, #hi_addr(SelfParkingCars_sensorPositions+0)
ADDS	R0, R0, R1
LDRH	R0, [R0, #0]
UXTH	R4, R0
UXTH	R0, R4
MOVW	R4, #lo_addr(_ChangeDuty+8)
MOVT	R4, #hi_addr(_ChangeDuty+8)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,189 :: 		ChangeDuty[BACK_SENSOR](sensorPositions[ServoPosition]);
MOVW	R0, #lo_addr(_ServoPosition+0)
MOVT	R0, #hi_addr(_ServoPosition+0)
LDRSH	R0, [R0, #0]
LSLS	R1, R0, #1
MOVW	R0, #lo_addr(SelfParkingCars_sensorPositions+0)
MOVT	R0, #hi_addr(SelfParkingCars_sensorPositions+0)
ADDS	R0, R0, R1
LDRH	R0, [R0, #0]
UXTH	R4, R0
UXTH	R0, R4
MOVW	R4, #lo_addr(_ChangeDuty+12)
MOVT	R4, #hi_addr(_ChangeDuty+12)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,190 :: 		Delay_ms(500);
MOVW	R7, #11518
MOVT	R7, #305
NOP
NOP
L_ServoPositionTest22:
SUBS	R7, R7, #1
BNE	L_ServoPositionTest22
NOP
NOP
NOP
;SelfParkingCars.c,191 :: 		ServoPosition=(ServoPosition+1)%15;
MOVW	R3, #lo_addr(_ServoPosition+0)
MOVT	R3, #hi_addr(_ServoPosition+0)
LDRSH	R0, [R3, #0]
ADDS	R2, R0, #1
SXTH	R2, R2
MOVS	R1, #15
SXTH	R1, R1
SDIV	R0, R2, R1
MLS	R0, R1, R0, R2
STRH	R0, [R3, #0]
;SelfParkingCars.c,192 :: 		}
IT	AL
BAL	L_ServoPositionTest20
;SelfParkingCars.c,193 :: 		}
L_end_ServoPositionTest:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ServoPositionTest
_GetResultsInCM:
;SelfParkingCars.c,195 :: 		double GetResultsInCM(unsigned long distance)
; distance start address is: 0 (R0)
SUB	SP, SP, #4
; distance end address is: 0 (R0)
; distance start address is: 0 (R0)
;SelfParkingCars.c,197 :: 		return distance/580.0;
VMOV	S1, R0
VCVT.F32	#0, S1, S1
; distance end address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #17425
VMOV	S0, R1
VDIV.F32	S0, S1, S0
;SelfParkingCars.c,198 :: 		}
L_end_GetResultsInCM:
ADD	SP, SP, #4
BX	LR
; end of _GetResultsInCM
_Timer:
;SelfParkingCars.c,208 :: 		void Timer()
SUB	SP, SP, #4
;SelfParkingCars.c,210 :: 		RCC_APB1ENR.TIM2EN = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,211 :: 		TIM2_CR1.CEN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,212 :: 		TIM2_PSC = 5; // Prescaller     (120 Mhz / prescaller+1 represents frequency of Timer calls)
MOVS	R1, #5
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,213 :: 		TIM2_ARR = 65535;
MOVW	R1, #65535
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,214 :: 		}
L_end_Timer:
ADD	SP, SP, #4
BX	LR
; end of _Timer
_ExtInt4:
;SelfParkingCars.c,217 :: 		void ExtInt4() iv IVT_INT_EXTI4 ics ICS_AUTO {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,218 :: 		EXTI_PR.B4 = 1;                     // clear flag
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,219 :: 		ODR15_GPIOE_ODR_bit = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR15_GPIOE_ODR_bit+0)
MOVT	R0, #hi_addr(ODR15_GPIOE_ODR_bit+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,220 :: 		if(IDR4_GPIOC_IDR_bit == 1)
MOVW	R1, #lo_addr(IDR4_GPIOC_IDR_bit+0)
MOVT	R1, #hi_addr(IDR4_GPIOC_IDR_bit+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_ExtInt424
;SelfParkingCars.c,222 :: 		TIM2_CR1.CEN = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,223 :: 		};
L_ExtInt424:
;SelfParkingCars.c,225 :: 		if(IDR4_GPIOC_IDR_bit == 0)
MOVW	R1, #lo_addr(IDR4_GPIOC_IDR_bit+0)
MOVT	R1, #hi_addr(IDR4_GPIOC_IDR_bit+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_ExtInt425
;SelfParkingCars.c,227 :: 		TIM2_CR1.CEN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,228 :: 		merenje = TIM2_CNT;
MOVW	R0, #lo_addr(TIM2_CNT+0)
MOVT	R0, #hi_addr(TIM2_CNT+0)
LDR	R0, [R0, #0]
MOVW	R2, #lo_addr(_merenje+0)
MOVT	R2, #hi_addr(_merenje+0)
STR	R0, [R2, #0]
;SelfParkingCars.c,229 :: 		TIM2_CNT = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM2_CNT+0)
MOVT	R0, #hi_addr(TIM2_CNT+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,230 :: 		if (merenje >= 4000)
MOV	R0, R2
LDR	R0, [R0, #0]
CMP	R0, #4000
IT	CC
BCC	L_ExtInt426
;SelfParkingCars.c,232 :: 		ODR15_GPIOE_ODR_bit = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR15_GPIOE_ODR_bit+0)
MOVT	R0, #hi_addr(ODR15_GPIOE_ODR_bit+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,233 :: 		}
L_ExtInt426:
;SelfParkingCars.c,234 :: 		rez = GetResultsInCM(merenje);
MOVW	R0, #lo_addr(_merenje+0)
MOVT	R0, #hi_addr(_merenje+0)
LDR	R0, [R0, #0]
BL	_GetResultsInCM+0
MOVW	R0, #lo_addr(_rez+0)
MOVT	R0, #hi_addr(_rez+0)
VSTR	#1, S0, [R0, #0]
;SelfParkingCars.c,240 :: 		}
L_ExtInt425:
;SelfParkingCars.c,241 :: 		}
L_end_ExtInt4:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ExtInt4
_ExtInt3:
;SelfParkingCars.c,243 :: 		void ExtInt3() iv IVT_INT_EXTI3 ics ICS_AUTO {
SUB	SP, SP, #8
STR	LR, [SP, #0]
;SelfParkingCars.c,244 :: 		EXTI_PR.B3 = 1;                     // clear flag
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,245 :: 		ODR15_GPIOE_ODR_bit = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR15_GPIOE_ODR_bit+0)
MOVT	R0, #hi_addr(ODR15_GPIOE_ODR_bit+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,246 :: 		if(IDR3_GPIOC_IDR_bit == 1)
MOVW	R1, #lo_addr(IDR3_GPIOC_IDR_bit+0)
MOVT	R1, #hi_addr(IDR3_GPIOC_IDR_bit+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_ExtInt327
;SelfParkingCars.c,248 :: 		TIM2_CR1.CEN = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,249 :: 		};
L_ExtInt327:
;SelfParkingCars.c,251 :: 		if(IDR3_GPIOC_IDR_bit == 0)
MOVW	R1, #lo_addr(IDR3_GPIOC_IDR_bit+0)
MOVT	R1, #hi_addr(IDR3_GPIOC_IDR_bit+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_ExtInt328
;SelfParkingCars.c,253 :: 		TIM2_CR1.CEN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,254 :: 		merenjee = TIM2_CNT;
MOVW	R0, #lo_addr(TIM2_CNT+0)
MOVT	R0, #hi_addr(TIM2_CNT+0)
LDR	R0, [R0, #0]
MOVW	R2, #lo_addr(_merenjee+0)
MOVT	R2, #hi_addr(_merenjee+0)
STR	R0, [R2, #0]
;SelfParkingCars.c,255 :: 		TIM2_CNT = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM2_CNT+0)
MOVT	R0, #hi_addr(TIM2_CNT+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,256 :: 		rez = GetResultsInCM(merenjee);
MOV	R0, R2
LDR	R0, [R0, #0]
BL	_GetResultsInCM+0
MOVW	R0, #lo_addr(_rez+0)
MOVT	R0, #hi_addr(_rez+0)
STR	R0, [SP, #4]
VSTR	#1, S0, [R0, #0]
;SelfParkingCars.c,257 :: 		rez2 = GetResultsInCM(merenje);
MOVW	R0, #lo_addr(_merenje+0)
MOVT	R0, #hi_addr(_merenje+0)
LDR	R0, [R0, #0]
BL	_GetResultsInCM+0
MOVW	R0, #lo_addr(_rez2+0)
MOVT	R0, #hi_addr(_rez2+0)
VSTR	#1, S0, [R0, #0]
;SelfParkingCars.c,262 :: 		if (rez-rez2> 10 || rez2-rez>10)
LDR	R0, [SP, #4]
VLDR	#1, S1, [R0, #0]
VSUB.F32	S1, S1, S0
VMOV.F32	S0, #10
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	GT
BGT	L__ExtInt354
MOVW	R0, #lo_addr(_rez+0)
MOVT	R0, #hi_addr(_rez+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_rez2+0)
MOVT	R0, #hi_addr(_rez2+0)
VLDR	#1, S0, [R0, #0]
VSUB.F32	S1, S0, S1
VMOV.F32	S0, #10
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	GT
BGT	L__ExtInt353
IT	AL
BAL	L_ExtInt331
L__ExtInt354:
L__ExtInt353:
;SelfParkingCars.c,264 :: 		faza2=1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_faza2+0)
MOVT	R0, #hi_addr(_faza2+0)
STRH	R1, [R0, #0]
;SelfParkingCars.c,265 :: 		}
L_ExtInt331:
;SelfParkingCars.c,266 :: 		}
L_ExtInt328:
;SelfParkingCars.c,267 :: 		}
L_end_ExtInt3:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _ExtInt3
_SpinAndBack:
;SelfParkingCars.c,268 :: 		void SpinAndBack()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,270 :: 		Delay_ms(3000);
MOVW	R7, #3582
MOVT	R7, #1831
NOP
NOP
L_SpinAndBack32:
SUBS	R7, R7, #1
BNE	L_SpinAndBack32
NOP
NOP
NOP
;SelfParkingCars.c,271 :: 		ChangeDuty[RIGHT_WHEEL](0);
MOVS	R0, #0
MOVW	R4, #lo_addr(_ChangeDuty+4)
MOVT	R4, #hi_addr(_ChangeDuty+4)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,272 :: 		ChangeDuty[LEFT_WHEEL](0);
MOVS	R0, #0
MOVW	R4, #lo_addr(_ChangeDuty+0)
MOVT	R4, #hi_addr(_ChangeDuty+0)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,273 :: 		SpinDirectionLeftWheel = ~SpinDirectionLeftWheel;
MOVW	R1, #lo_addr(ODR6_GPIOA_ODR_bit+0)
MOVT	R1, #hi_addr(ODR6_GPIOA_ODR_bit+0)
LDR	R0, [R1, #0]
EOR	R0, R0, #1
STR	R0, [R1, #0]
;SelfParkingCars.c,274 :: 		Delay_ms(3000);
MOVW	R7, #3582
MOVT	R7, #1831
NOP
NOP
L_SpinAndBack34:
SUBS	R7, R7, #1
BNE	L_SpinAndBack34
NOP
NOP
NOP
;SelfParkingCars.c,275 :: 		ChangeDuty[RIGHT_WHEEL](pwmDuty[RIGHT_WHEEL]);
MOVW	R0, #lo_addr(_pwmDuty+2)
MOVT	R0, #hi_addr(_pwmDuty+2)
LDRSH	R4, [R0, #0]
UXTH	R0, R4
MOVW	R4, #lo_addr(_ChangeDuty+4)
MOVT	R4, #hi_addr(_ChangeDuty+4)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,276 :: 		ChangeDuty[LEFT_WHEEL](pwmDuty[LEFT_WHEEL]);
MOVW	R0, #lo_addr(_pwmDuty+0)
MOVT	R0, #hi_addr(_pwmDuty+0)
LDRSH	R4, [R0, #0]
UXTH	R0, R4
MOVW	R4, #lo_addr(_ChangeDuty+0)
MOVT	R4, #hi_addr(_ChangeDuty+0)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,277 :: 		Delay_ms(3000);
MOVW	R7, #3582
MOVT	R7, #1831
NOP
NOP
L_SpinAndBack36:
SUBS	R7, R7, #1
BNE	L_SpinAndBack36
NOP
NOP
NOP
;SelfParkingCars.c,278 :: 		ChangeDuty[RIGHT_WHEEL](0);
MOVS	R0, #0
MOVW	R4, #lo_addr(_ChangeDuty+4)
MOVT	R4, #hi_addr(_ChangeDuty+4)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,279 :: 		ChangeDuty[LEFT_WHEEL](0);
MOVS	R0, #0
MOVW	R4, #lo_addr(_ChangeDuty+0)
MOVT	R4, #hi_addr(_ChangeDuty+0)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,280 :: 		}
L_end_SpinAndBack:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _SpinAndBack
_AightSensors:
;SelfParkingCars.c,281 :: 		void AightSensors()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,283 :: 		InitFrontServoPWM_Timer11_CH1_PB9();
BL	_InitFrontServoPWM_Timer11_CH1_PB9+0
;SelfParkingCars.c,284 :: 		InitBackServoPWM_Timer10_CH1_PB8();
BL	_InitBackServoPWM_Timer10_CH1_PB8+0
;SelfParkingCars.c,286 :: 		ChangeDuty[FRONT_SENSOR](sensorPositions[10]);
MOVW	R0, #5859
MOVW	R4, #lo_addr(_ChangeDuty+8)
MOVT	R4, #hi_addr(_ChangeDuty+8)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,287 :: 		ChangeDuty[BACK_SENSOR](sensorPositions[2]);
MOVW	R0, #3255
MOVW	R4, #lo_addr(_ChangeDuty+12)
MOVT	R4, #hi_addr(_ChangeDuty+12)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,288 :: 		}
L_end_AightSensors:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _AightSensors
_poravnaj:
;SelfParkingCars.c,290 :: 		void poravnaj()
SUB	SP, SP, #4
;SelfParkingCars.c,293 :: 		}
L_end_poravnaj:
ADD	SP, SP, #4
BX	LR
; end of _poravnaj
_main:
;SelfParkingCars.c,294 :: 		void main() {
SUB	SP, SP, #4
;SelfParkingCars.c,295 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_10); // Set PORTD as digital output
MOVW	R1, #1024
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;SelfParkingCars.c,296 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_15); // Led
MOVW	R1, #32768
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;SelfParkingCars.c,297 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_11); // Led
MOVW	R1, #2048
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;SelfParkingCars.c,298 :: 		GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_4);
MOVW	R1, #16
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Input+0
;SelfParkingCars.c,299 :: 		GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_3);
MOVW	R1, #8
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Input+0
;SelfParkingCars.c,300 :: 		InitExternIntRisingEdge_PC1_PC2();
BL	_InitExternIntRisingEdge_PC1_PC2+0
;SelfParkingCars.c,302 :: 		Delay_ms(100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_main38:
SUBS	R7, R7, #1
BNE	L_main38
NOP
NOP
NOP
;SelfParkingCars.c,303 :: 		InitLeftWheelPWM_Timer4_CH1_PB6();
BL	_InitLeftWheelPWM_Timer4_CH1_PB6+0
;SelfParkingCars.c,304 :: 		InitRightWheelPWM_Timer9_CH1_PE5();
BL	_InitRightWheelPWM_Timer9_CH1_PE5+0
;SelfParkingCars.c,305 :: 		wheelInterruptCount[0]=20; wheelInterruptCount[1]=20;
MOVS	R1, #20
SXTH	R1, R1
MOVW	R0, #lo_addr(_wheelInterruptCount+0)
MOVT	R0, #hi_addr(_wheelInterruptCount+0)
STRH	R1, [R0, #0]
MOVS	R1, #20
SXTH	R1, R1
MOVW	R0, #lo_addr(_wheelInterruptCount+2)
MOVT	R0, #hi_addr(_wheelInterruptCount+2)
STRH	R1, [R0, #0]
;SelfParkingCars.c,306 :: 		Timer();
BL	_Timer+0
;SelfParkingCars.c,307 :: 		SYSCFGEN_bit = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(SYSCFGEN_bit+0)
MOVT	R0, #hi_addr(SYSCFGEN_bit+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,308 :: 		SYSCFG_EXTICR2 |= 0x000000002;
MOVW	R0, #lo_addr(SYSCFG_EXTICR2+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR2+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2
MOVW	R0, #lo_addr(SYSCFG_EXTICR2+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR2+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,309 :: 		EXTI_RTSR |= 0x00000010;              // Set interrupt on Rising edge
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,310 :: 		EXTI_FTSR |= 0x00000010;              // Set interrupt on Falling edge
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,311 :: 		EXTI_IMR |= 0x00000010;              // Set mask
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,312 :: 		NVIC_IntEnable(IVT_INT_EXTI4);   // Enable External interrupt   PC3
MOVW	R0, #26
BL	_NVIC_IntEnable+0
;SelfParkingCars.c,313 :: 		SYSCFG_EXTICR1 |= 0x00002000;
MOVW	R0, #lo_addr(SYSCFG_EXTICR1+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8192
MOVW	R0, #lo_addr(SYSCFG_EXTICR1+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR1+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,314 :: 		EXTI_RTSR |= 0x00000008;              // Set interrupt on Rising edge
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,315 :: 		EXTI_FTSR |= 0x00000008;              // Set interrupt on Falling edge
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,316 :: 		EXTI_IMR |= 0x00000008;              // Set mask
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,317 :: 		NVIC_IntEnable(IVT_INT_EXTI3);   // Enable External interrupt
MOVW	R0, #25
BL	_NVIC_IntEnable+0
;SelfParkingCars.c,320 :: 		ODR15_GPIOE_ODR_bit = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR15_GPIOE_ODR_bit+0)
MOVT	R0, #hi_addr(ODR15_GPIOE_ODR_bit+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,321 :: 		AightSensors();
BL	_AightSensors+0
;SelfParkingCars.c,324 :: 		while(1) {
L_main40:
;SelfParkingCars.c,325 :: 		ODR10_GPIOD_ODR_bit = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR10_GPIOD_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOD_ODR_bit+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,326 :: 		Delay_us(40);
MOVW	R7, #1598
MOVT	R7, #0
NOP
NOP
L_main42:
SUBS	R7, R7, #1
BNE	L_main42
NOP
NOP
NOP
;SelfParkingCars.c,327 :: 		ODR10_GPIOD_ODR_bit = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR10_GPIOD_ODR_bit+0)
MOVT	R0, #hi_addr(ODR10_GPIOD_ODR_bit+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,328 :: 		Delay_ms(60);
MOVW	R7, #40702
MOVT	R7, #36
NOP
NOP
L_main44:
SUBS	R7, R7, #1
BNE	L_main44
NOP
NOP
NOP
;SelfParkingCars.c,330 :: 		ODR11_GPIOD_ODR_bit = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR11_GPIOD_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOD_ODR_bit+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,331 :: 		Delay_us(40);
MOVW	R7, #1598
MOVT	R7, #0
NOP
NOP
L_main46:
SUBS	R7, R7, #1
BNE	L_main46
NOP
NOP
NOP
;SelfParkingCars.c,332 :: 		ODR11_GPIOD_ODR_bit = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR11_GPIOD_ODR_bit+0)
MOVT	R0, #hi_addr(ODR11_GPIOD_ODR_bit+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,333 :: 		Delay_ms(60);
MOVW	R7, #40702
MOVT	R7, #36
NOP
NOP
L_main48:
SUBS	R7, R7, #1
BNE	L_main48
NOP
NOP
NOP
;SelfParkingCars.c,334 :: 		}
IT	AL
BAL	L_main40
;SelfParkingCars.c,358 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
