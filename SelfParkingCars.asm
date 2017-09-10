SelfParkingCars_PWM_TIM4_Set_Duty_Wrapper:
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
; end of SelfParkingCars_PWM_TIM4_Set_Duty_Wrapper
SelfParkingCars_PWM_TIM9_Set_Duty_Wrapper:
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
; end of SelfParkingCars_PWM_TIM9_Set_Duty_Wrapper
SelfParkingCars_PWM_TIM10_Set_Duty_Wrapper:
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
; end of SelfParkingCars_PWM_TIM10_Set_Duty_Wrapper
SelfParkingCars_PWM_TIM11_Set_Duty_Wrapper:
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
; end of SelfParkingCars_PWM_TIM11_Set_Duty_Wrapper
_InitExternIntRisingEdge_PC1_PC2:
;SelfParkingCars.c,14 :: 		void InitExternIntRisingEdge_PC1_PC2()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,16 :: 		GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_1);
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Input+0
;SelfParkingCars.c,17 :: 		GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_2);
MOVW	R1, #4
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Input+0
;SelfParkingCars.c,19 :: 		SYSCFGEN_bit = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(SYSCFGEN_bit+0)
MOVT	R0, #hi_addr(SYSCFGEN_bit+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,20 :: 		SYSCFG_EXTICR1 |= LEFT_WHEEL_EXT_INT_CR1_PC1 | RIGHT_WHEEL_EXT_INT_CR1_PC2;
MOVW	R0, #lo_addr(SYSCFG_EXTICR1+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #544
MOVW	R0, #lo_addr(SYSCFG_EXTICR1+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR1+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,21 :: 		EXTI_RTSR |= RISING_TRIGGER_PC1 | RISING_TRIGGER_PC2;
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #6
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,22 :: 		EXTI_FTSR |= RISING_TRIGGER_PC1 | RISING_TRIGGER_PC2;
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #6
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,23 :: 		EXTI_IMR  |=  RISING_TRIGGER_PC1 |  RISING_TRIGGER_PC2;
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #6
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,24 :: 		NVIC_IntEnable(IVT_INT_EXTI1);
MOVW	R0, #23
BL	_NVIC_IntEnable+0
;SelfParkingCars.c,25 :: 		NVIC_IntEnable(IVT_INT_EXTI2);
MOVW	R0, #24
BL	_NVIC_IntEnable+0
;SelfParkingCars.c,26 :: 		}
L_end_InitExternIntRisingEdge_PC1_PC2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitExternIntRisingEdge_PC1_PC2
_RightWheel_Interrupt:
;SelfParkingCars.c,30 :: 		void RightWheel_Interrupt() iv IVT_INT_EXTI2 ics ICS_AUTO
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,31 :: 		{      EXTI_PR.B2 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,32 :: 		if (!startCounting) return;
MOVW	R0, #lo_addr(_startCounting+0)
MOVT	R0, #hi_addr(_startCounting+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_RightWheel_Interrupt0
IT	AL
BAL	L_end_RightWheel_Interrupt
L_RightWheel_Interrupt0:
;SelfParkingCars.c,33 :: 		--wheelInterruptCount[LEFT_WHEEL];
MOVW	R1, #lo_addr(SelfParkingCars_wheelInterruptCount+0)
MOVT	R1, #hi_addr(SelfParkingCars_wheelInterruptCount+0)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;SelfParkingCars.c,34 :: 		if (wheelInterruptCount[LEFT_WHEEL] <  0)
CMP	R0, #0
IT	GE
BGE	L_RightWheel_Interrupt1
;SelfParkingCars.c,36 :: 		ChangeDuty[LEFT_WHEEL](0);
MOVS	R0, #0
MOVW	R4, #lo_addr(SelfParkingCars_ChangeDuty+0)
MOVT	R4, #hi_addr(SelfParkingCars_ChangeDuty+0)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,37 :: 		rightWheelStopped = 1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_rightWheelStopped+0)
MOVT	R0, #hi_addr(_rightWheelStopped+0)
STRH	R1, [R0, #0]
;SelfParkingCars.c,38 :: 		}
L_RightWheel_Interrupt1:
;SelfParkingCars.c,39 :: 		}
L_end_RightWheel_Interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RightWheel_Interrupt
_LeftWheel_Interrupt:
;SelfParkingCars.c,41 :: 		void LeftWheel_Interrupt() iv IVT_INT_EXTI1 ics ICS_AUTO
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,42 :: 		{      EXTI_PR.B1 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,43 :: 		if (!startCounting) return;
MOVW	R0, #lo_addr(_startCounting+0)
MOVT	R0, #hi_addr(_startCounting+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_LeftWheel_Interrupt2
IT	AL
BAL	L_end_LeftWheel_Interrupt
L_LeftWheel_Interrupt2:
;SelfParkingCars.c,45 :: 		--wheelInterruptCount[RIGHT_WHEEL];
MOVW	R1, #lo_addr(SelfParkingCars_wheelInterruptCount+2)
MOVT	R1, #hi_addr(SelfParkingCars_wheelInterruptCount+2)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;SelfParkingCars.c,46 :: 		if (wheelInterruptCount[RIGHT_WHEEL] <  0)
CMP	R0, #0
IT	GE
BGE	L_LeftWheel_Interrupt3
;SelfParkingCars.c,48 :: 		ChangeDuty[RIGHT_WHEEL](0);
MOVS	R0, #0
MOVW	R4, #lo_addr(SelfParkingCars_ChangeDuty+4)
MOVT	R4, #hi_addr(SelfParkingCars_ChangeDuty+4)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,49 :: 		leftWheelStopped = 1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_leftWheelStopped+0)
MOVT	R0, #hi_addr(_leftWheelStopped+0)
STRH	R1, [R0, #0]
;SelfParkingCars.c,50 :: 		}
L_LeftWheel_Interrupt3:
;SelfParkingCars.c,51 :: 		}
L_end_LeftWheel_Interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _LeftWheel_Interrupt
_InitLeftWheelPWM_Timer4_CH1_PB6:
;SelfParkingCars.c,57 :: 		void InitLeftWheelPWM_Timer4_CH1_PB6()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,59 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_6);
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
;SelfParkingCars.c,60 :: 		SpinDirectionLeftWheel = FORWARD_SPIN;    // Default forward spin
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR6_GPIOA_ODR_bit+0)
MOVT	R0, #hi_addr(ODR6_GPIOA_ODR_bit+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,62 :: 		pwmPeriod[LEFT_WHEEL] =  PWM_TIM4_Init(50000) ; // Work on frequency 20-35 Khz
MOVW	R0, #50000
BL	_PWM_TIM4_Init+0
MOVW	R1, #lo_addr(SelfParkingCars_pwmPeriod+0)
MOVT	R1, #hi_addr(SelfParkingCars_pwmPeriod+0)
STRH	R0, [R1, #0]
;SelfParkingCars.c,63 :: 		pwmDuty[LEFT_WHEEL] = pwmPeriod[LEFT_WHEEL]- 650; //-700; // -750;// - 1000 ;
SUBW	R1, R0, #650
MOVW	R0, #lo_addr(SelfParkingCars_pwmDuty+0)
MOVT	R0, #hi_addr(SelfParkingCars_pwmDuty+0)
STRH	R1, [R0, #0]
;SelfParkingCars.c,64 :: 		ChangeDuty[LEFT_WHEEL](pwmDuty[LEFT_WHEEL]);
UXTH	R4, R1
UXTH	R0, R4
MOVW	R4, #lo_addr(SelfParkingCars_ChangeDuty+0)
MOVT	R4, #hi_addr(SelfParkingCars_ChangeDuty+0)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,65 :: 		PWM_TIM4_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM4_CH1_PB6);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM4_CH1_PB6+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM4_CH1_PB6+0)
MOVS	R0, #0
BL	_PWM_TIM4_Start+0
;SelfParkingCars.c,66 :: 		}
L_end_InitLeftWheelPWM_Timer4_CH1_PB6:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitLeftWheelPWM_Timer4_CH1_PB6
_InitRightWheelPWM_Timer9_CH1_PE5:
;SelfParkingCars.c,68 :: 		void InitRightWheelPWM_Timer9_CH1_PE5()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,70 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
;SelfParkingCars.c,71 :: 		SpinDirectionRightWheel = FORWARD_SPIN;    // Default forward spin
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR7_GPIOA_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOA_ODR_bit+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,73 :: 		pwmPeriod[RIGHT_WHEEL] =  PWM_TIM9_Init(25000);
MOVW	R0, #25000
BL	_PWM_TIM9_Init+0
MOVW	R1, #lo_addr(SelfParkingCars_pwmPeriod+2)
MOVT	R1, #hi_addr(SelfParkingCars_pwmPeriod+2)
STRH	R0, [R1, #0]
;SelfParkingCars.c,74 :: 		pwmDuty[RIGHT_WHEEL] = pwmPeriod[RIGHT_WHEEL] - 1300;//-1400;//-1500;//-1650;//      27.44 us from 39.88 us (slow)
SUBW	R1, R0, #1300
MOVW	R0, #lo_addr(SelfParkingCars_pwmDuty+2)
MOVT	R0, #hi_addr(SelfParkingCars_pwmDuty+2)
STRH	R1, [R0, #0]
;SelfParkingCars.c,75 :: 		ChangeDuty[RIGHT_WHEEL](pwmDuty[RIGHT_WHEEL]);
UXTH	R4, R1
UXTH	R0, R4
MOVW	R4, #lo_addr(SelfParkingCars_ChangeDuty+4)
MOVT	R4, #hi_addr(SelfParkingCars_ChangeDuty+4)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,76 :: 		PWM_TIM9_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM9_CH1_PE5);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM9_CH1_PE5+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM9_CH1_PE5+0)
MOVS	R0, #0
BL	_PWM_TIM9_Start+0
;SelfParkingCars.c,77 :: 		}
L_end_InitRightWheelPWM_Timer9_CH1_PE5:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitRightWheelPWM_Timer9_CH1_PE5
_UpdateCurrentDuty:
;SelfParkingCars.c,80 :: 		void UpdateCurrentDuty(int updateFor, int component)
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
;SelfParkingCars.c,82 :: 		if (pwmDuty[component]+ updateFor < 0)
LSLS	R3, R0, #1
MOVW	R2, #lo_addr(SelfParkingCars_pwmDuty+0)
MOVT	R2, #hi_addr(SelfParkingCars_pwmDuty+0)
ADDS	R2, R2, R3
LDRSH	R2, [R2, #0]
ADDS	R2, R2, R1
SXTH	R2, R2
CMP	R2, #0
IT	GE
BGE	L_UpdateCurrentDuty4
; updateFor end address is: 4 (R1)
;SelfParkingCars.c,84 :: 		pwmDuty[component] = 0;
LSLS	R3, R0, #1
MOVW	R2, #lo_addr(SelfParkingCars_pwmDuty+0)
MOVT	R2, #hi_addr(SelfParkingCars_pwmDuty+0)
ADDS	R3, R2, R3
MOVS	R2, #0
SXTH	R2, R2
STRH	R2, [R3, #0]
;SelfParkingCars.c,85 :: 		}
IT	AL
BAL	L_UpdateCurrentDuty5
L_UpdateCurrentDuty4:
;SelfParkingCars.c,88 :: 		pwmDuty[component] += updateFor;
; updateFor start address is: 4 (R1)
LSLS	R3, R0, #1
MOVW	R2, #lo_addr(SelfParkingCars_pwmDuty+0)
MOVT	R2, #hi_addr(SelfParkingCars_pwmDuty+0)
ADDS	R3, R2, R3
LDRSH	R2, [R3, #0]
ADDS	R2, R2, R1
; updateFor end address is: 4 (R1)
STRH	R2, [R3, #0]
;SelfParkingCars.c,89 :: 		}
L_UpdateCurrentDuty5:
;SelfParkingCars.c,91 :: 		ChangeDuty[component](pwmDuty[component]);
LSLS	R3, R0, #2
MOVW	R2, #lo_addr(SelfParkingCars_ChangeDuty+0)
MOVT	R2, #hi_addr(SelfParkingCars_ChangeDuty+0)
ADDS	R2, R2, R3
LDR	R4, [R2, #0]
LSLS	R3, R0, #1
; component end address is: 0 (R0)
MOVW	R2, #lo_addr(SelfParkingCars_pwmDuty+0)
MOVT	R2, #hi_addr(SelfParkingCars_pwmDuty+0)
ADDS	R2, R2, R3
LDRSH	R2, [R2, #0]
UXTH	R2, R2
UXTH	R0, R2
BLX	R4
;SelfParkingCars.c,92 :: 		}
L_end_UpdateCurrentDuty:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _UpdateCurrentDuty
_WheelsSpeedAndDirectionTest:
;SelfParkingCars.c,98 :: 		void WheelsSpeedAndDirectionTest()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,100 :: 		InitLeftWheelPWM_Timer4_CH1_PB6();
BL	_InitLeftWheelPWM_Timer4_CH1_PB6+0
;SelfParkingCars.c,101 :: 		InitRightWheelPWM_Timer9_CH1_PE5();
BL	_InitRightWheelPWM_Timer9_CH1_PE5+0
;SelfParkingCars.c,102 :: 		while(1)
L_WheelsSpeedAndDirectionTest6:
;SelfParkingCars.c,104 :: 		selectedWheel = wheelDirection;
MOVW	R0, #lo_addr(_wheelDirection+0)
MOVT	R0, #hi_addr(_wheelDirection+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_selectedWheel+0)
MOVT	R0, #hi_addr(_selectedWheel+0)
STRH	R1, [R0, #0]
;SelfParkingCars.c,105 :: 		Delay_ms(3000); //UpdateCurrentDuty(-500, selectedWheel);
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
;SelfParkingCars.c,106 :: 		Delay_ms(3000); //UpdateCurrentDuty(500, selectedWheel);
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
;SelfParkingCars.c,109 :: 		if (wheelDirection)
MOVW	R0, #lo_addr(_wheelDirection+0)
MOVT	R0, #hi_addr(_wheelDirection+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_WheelsSpeedAndDirectionTest12
;SelfParkingCars.c,111 :: 		selectedWheel = !selectedWheel;
MOVW	R1, #lo_addr(_selectedWheel+0)
MOVT	R1, #hi_addr(_selectedWheel+0)
LDRSH	R0, [R1, #0]
CMP	R0, #0
MOVW	R0, #0
BNE	L__WheelsSpeedAndDirectionTest65
MOVS	R0, #1
L__WheelsSpeedAndDirectionTest65:
UXTB	R0, R0
STRH	R0, [R1, #0]
;SelfParkingCars.c,112 :: 		}
IT	AL
BAL	L_WheelsSpeedAndDirectionTest13
L_WheelsSpeedAndDirectionTest12:
;SelfParkingCars.c,116 :: 		wheelDirection = !wheelDirection;
MOVW	R1, #lo_addr(_wheelDirection+0)
MOVT	R1, #hi_addr(_wheelDirection+0)
LDRSH	R0, [R1, #0]
CMP	R0, #0
MOVW	R0, #0
BNE	L__WheelsSpeedAndDirectionTest66
MOVS	R0, #1
L__WheelsSpeedAndDirectionTest66:
UXTB	R0, R0
STRH	R0, [R1, #0]
;SelfParkingCars.c,117 :: 		}
L_WheelsSpeedAndDirectionTest13:
;SelfParkingCars.c,118 :: 		}
IT	AL
BAL	L_WheelsSpeedAndDirectionTest6
;SelfParkingCars.c,119 :: 		}
L_end_WheelsSpeedAndDirectionTest:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _WheelsSpeedAndDirectionTest
_WheelsSpeedTest:
;SelfParkingCars.c,121 :: 		void WheelsSpeedTest()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,123 :: 		Delay_ms(2000);
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
;SelfParkingCars.c,125 :: 		InitRightWheelPWM_Timer9_CH1_PE5();
BL	_InitRightWheelPWM_Timer9_CH1_PE5+0
;SelfParkingCars.c,126 :: 		while(pwmDuty[RIGHT_WHEEL]>0)
L_WheelsSpeedTest16:
MOVW	R0, #lo_addr(SelfParkingCars_pwmDuty+2)
MOVT	R0, #hi_addr(SelfParkingCars_pwmDuty+2)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LE
BLE	L_WheelsSpeedTest17
;SelfParkingCars.c,128 :: 		UpdateCurrentDuty(50, RIGHT_WHEEL);           //left range 2290
MOVS	R1, #1
SXTH	R1, R1
MOVS	R0, #50
SXTH	R0, R0
BL	_UpdateCurrentDuty+0
;SelfParkingCars.c,129 :: 		Delay_ms(250);
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
;SelfParkingCars.c,130 :: 		}
IT	AL
BAL	L_WheelsSpeedTest16
L_WheelsSpeedTest17:
;SelfParkingCars.c,131 :: 		}
L_end_WheelsSpeedTest:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _WheelsSpeedTest
_ServoPositionTest:
;SelfParkingCars.c,135 :: 		void ServoPositionTest()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,137 :: 		while(1)
L_ServoPositionTest20:
;SelfParkingCars.c,139 :: 		ChangeDuty[FRONT_SENSOR](sensorPositions[ServoPosition]);
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
MOVW	R4, #lo_addr(SelfParkingCars_ChangeDuty+8)
MOVT	R4, #hi_addr(SelfParkingCars_ChangeDuty+8)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,140 :: 		ChangeDuty[BACK_SENSOR](sensorPositions[ServoPosition]);
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
MOVW	R4, #lo_addr(SelfParkingCars_ChangeDuty+12)
MOVT	R4, #hi_addr(SelfParkingCars_ChangeDuty+12)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,141 :: 		Delay_ms(500);
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
;SelfParkingCars.c,142 :: 		ServoPosition=(ServoPosition+1)%15;
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
;SelfParkingCars.c,143 :: 		}
IT	AL
BAL	L_ServoPositionTest20
;SelfParkingCars.c,144 :: 		}
L_end_ServoPositionTest:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ServoPositionTest
_SpinAndBack:
;SelfParkingCars.c,146 :: 		void SpinAndBack()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,148 :: 		Delay_ms(3000);
MOVW	R7, #3582
MOVT	R7, #1831
NOP
NOP
L_SpinAndBack24:
SUBS	R7, R7, #1
BNE	L_SpinAndBack24
NOP
NOP
NOP
;SelfParkingCars.c,149 :: 		ChangeDuty[RIGHT_WHEEL](0);
MOVS	R0, #0
MOVW	R4, #lo_addr(SelfParkingCars_ChangeDuty+4)
MOVT	R4, #hi_addr(SelfParkingCars_ChangeDuty+4)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,150 :: 		ChangeDuty[LEFT_WHEEL](0);
MOVS	R0, #0
MOVW	R4, #lo_addr(SelfParkingCars_ChangeDuty+0)
MOVT	R4, #hi_addr(SelfParkingCars_ChangeDuty+0)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,151 :: 		SpinDirectionLeftWheel = ~SpinDirectionLeftWheel;
MOVW	R1, #lo_addr(ODR6_GPIOA_ODR_bit+0)
MOVT	R1, #hi_addr(ODR6_GPIOA_ODR_bit+0)
LDR	R0, [R1, #0]
EOR	R0, R0, #1
STR	R0, [R1, #0]
;SelfParkingCars.c,152 :: 		Delay_ms(3000);
MOVW	R7, #3582
MOVT	R7, #1831
NOP
NOP
L_SpinAndBack26:
SUBS	R7, R7, #1
BNE	L_SpinAndBack26
NOP
NOP
NOP
;SelfParkingCars.c,153 :: 		ChangeDuty[RIGHT_WHEEL](pwmDuty[RIGHT_WHEEL]);
MOVW	R0, #lo_addr(SelfParkingCars_pwmDuty+2)
MOVT	R0, #hi_addr(SelfParkingCars_pwmDuty+2)
LDRSH	R4, [R0, #0]
UXTH	R0, R4
MOVW	R4, #lo_addr(SelfParkingCars_ChangeDuty+4)
MOVT	R4, #hi_addr(SelfParkingCars_ChangeDuty+4)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,154 :: 		ChangeDuty[LEFT_WHEEL](pwmDuty[LEFT_WHEEL]);
MOVW	R0, #lo_addr(SelfParkingCars_pwmDuty+0)
MOVT	R0, #hi_addr(SelfParkingCars_pwmDuty+0)
LDRSH	R4, [R0, #0]
UXTH	R0, R4
MOVW	R4, #lo_addr(SelfParkingCars_ChangeDuty+0)
MOVT	R4, #hi_addr(SelfParkingCars_ChangeDuty+0)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,155 :: 		Delay_ms(3000);
MOVW	R7, #3582
MOVT	R7, #1831
NOP
NOP
L_SpinAndBack28:
SUBS	R7, R7, #1
BNE	L_SpinAndBack28
NOP
NOP
NOP
;SelfParkingCars.c,156 :: 		ChangeDuty[RIGHT_WHEEL](0);
MOVS	R0, #0
MOVW	R4, #lo_addr(SelfParkingCars_ChangeDuty+4)
MOVT	R4, #hi_addr(SelfParkingCars_ChangeDuty+4)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,157 :: 		ChangeDuty[LEFT_WHEEL](0);
MOVS	R0, #0
MOVW	R4, #lo_addr(SelfParkingCars_ChangeDuty+0)
MOVT	R4, #hi_addr(SelfParkingCars_ChangeDuty+0)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,158 :: 		}
L_end_SpinAndBack:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _SpinAndBack
_StopWheels:
;SelfParkingCars.c,160 :: 		void StopWheels()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,162 :: 		ChangeDuty[LEFT_WHEEL](0);
MOVS	R0, #0
MOVW	R4, #lo_addr(SelfParkingCars_ChangeDuty+0)
MOVT	R4, #hi_addr(SelfParkingCars_ChangeDuty+0)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,163 :: 		ChangeDuty[RIGHT_WHEEL](0);
MOVS	R0, #0
MOVW	R4, #lo_addr(SelfParkingCars_ChangeDuty+4)
MOVT	R4, #hi_addr(SelfParkingCars_ChangeDuty+4)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,164 :: 		}
L_end_StopWheels:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _StopWheels
_StartWheels:
;SelfParkingCars.c,166 :: 		void StartWheels()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,168 :: 		ChangeDuty[RIGHT_WHEEL](pwmDuty[RIGHT_WHEEL]);
MOVW	R0, #lo_addr(SelfParkingCars_pwmDuty+2)
MOVT	R0, #hi_addr(SelfParkingCars_pwmDuty+2)
LDRSH	R4, [R0, #0]
UXTH	R0, R4
MOVW	R4, #lo_addr(SelfParkingCars_ChangeDuty+4)
MOVT	R4, #hi_addr(SelfParkingCars_ChangeDuty+4)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,169 :: 		ChangeDuty[LEFT_WHEEL](pwmDuty[LEFT_WHEEL]);
MOVW	R0, #lo_addr(SelfParkingCars_pwmDuty+0)
MOVT	R0, #hi_addr(SelfParkingCars_pwmDuty+0)
LDRSH	R4, [R0, #0]
UXTH	R0, R4
MOVW	R4, #lo_addr(SelfParkingCars_ChangeDuty+0)
MOVT	R4, #hi_addr(SelfParkingCars_ChangeDuty+0)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,170 :: 		}
L_end_StartWheels:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _StartWheels
_DriveWhileParkingNotSpotted:
;SelfParkingCars.c,172 :: 		void DriveWhileParkingNotSpotted()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;SelfParkingCars.c,174 :: 		TriggerFrontSensorMeasurement();
BL	_TriggerFrontSensorMeasurement+0
;SelfParkingCars.c,175 :: 		TriggerBackSensorMeasurement();
BL	_TriggerBackSensorMeasurement+0
;SelfParkingCars.c,177 :: 		while((GetFrontSensorDistance() - GetBackSensorDistance()) < 15)
L_DriveWhileParkingNotSpotted30:
BL	_GetFrontSensorDistance+0
VSTR	#1, S0, [SP, #4]
BL	_GetBackSensorDistance+0
VLDR	#1, S1, [SP, #4]
VSUB.F32	S1, S1, S0
VMOV.F32	S0, #15
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	GE
BGE	L_DriveWhileParkingNotSpotted31
;SelfParkingCars.c,180 :: 		TriggerFrontSensorMeasurement();
BL	_TriggerFrontSensorMeasurement+0
;SelfParkingCars.c,181 :: 		TriggerBackSensorMeasurement();
BL	_TriggerBackSensorMeasurement+0
;SelfParkingCars.c,182 :: 		}
IT	AL
BAL	L_DriveWhileParkingNotSpotted30
L_DriveWhileParkingNotSpotted31:
;SelfParkingCars.c,183 :: 		leftWheelStopped = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_leftWheelStopped+0)
MOVT	R0, #hi_addr(_leftWheelStopped+0)
STRH	R1, [R0, #0]
;SelfParkingCars.c,184 :: 		rightWheelStopped = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_rightWheelStopped+0)
MOVT	R0, #hi_addr(_rightWheelStopped+0)
STRH	R1, [R0, #0]
;SelfParkingCars.c,185 :: 		wheelInterruptCount[0]=60;
MOVS	R1, #60
SXTH	R1, R1
MOVW	R0, #lo_addr(SelfParkingCars_wheelInterruptCount+0)
MOVT	R0, #hi_addr(SelfParkingCars_wheelInterruptCount+0)
STRH	R1, [R0, #0]
;SelfParkingCars.c,186 :: 		wheelInterruptCount[1]=60;
MOVS	R1, #60
SXTH	R1, R1
MOVW	R0, #lo_addr(SelfParkingCars_wheelInterruptCount+2)
MOVT	R0, #hi_addr(SelfParkingCars_wheelInterruptCount+2)
STRH	R1, [R0, #0]
;SelfParkingCars.c,187 :: 		startCounting = 1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_startCounting+0)
MOVT	R0, #hi_addr(_startCounting+0)
STRH	R1, [R0, #0]
;SelfParkingCars.c,188 :: 		StartWheels();
BL	_StartWheels+0
;SelfParkingCars.c,189 :: 		while (leftWheelStopped == 0 || rightWheelStopped == 0);
L_DriveWhileParkingNotSpotted32:
MOVW	R0, #lo_addr(_leftWheelStopped+0)
MOVT	R0, #hi_addr(_leftWheelStopped+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L__DriveWhileParkingNotSpotted50
MOVW	R0, #lo_addr(_rightWheelStopped+0)
MOVT	R0, #hi_addr(_rightWheelStopped+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L__DriveWhileParkingNotSpotted49
IT	AL
BAL	L_DriveWhileParkingNotSpotted33
L__DriveWhileParkingNotSpotted50:
L__DriveWhileParkingNotSpotted49:
IT	AL
BAL	L_DriveWhileParkingNotSpotted32
L_DriveWhileParkingNotSpotted33:
;SelfParkingCars.c,190 :: 		StopWheels();
BL	_StopWheels+0
;SelfParkingCars.c,191 :: 		}
L_end_DriveWhileParkingNotSpotted:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DriveWhileParkingNotSpotted
_RotateFor90Right:
;SelfParkingCars.c,193 :: 		void RotateFor90Right()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,195 :: 		leftWheelStopped = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_leftWheelStopped+0)
MOVT	R0, #hi_addr(_leftWheelStopped+0)
STRH	R1, [R0, #0]
;SelfParkingCars.c,196 :: 		rightWheelStopped = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_rightWheelStopped+0)
MOVT	R0, #hi_addr(_rightWheelStopped+0)
STRH	R1, [R0, #0]
;SelfParkingCars.c,197 :: 		SpinDirectionLeftWheel = BACKWARD_SPIN;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR6_GPIOA_ODR_bit+0)
MOVT	R0, #hi_addr(ODR6_GPIOA_ODR_bit+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,198 :: 		SpinDirectionRightWheel = FORWARD_SPIN;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR7_GPIOA_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOA_ODR_bit+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,199 :: 		wheelInterruptCount[0]=52; // 63
MOVS	R1, #52
SXTH	R1, R1
MOVW	R0, #lo_addr(SelfParkingCars_wheelInterruptCount+0)
MOVT	R0, #hi_addr(SelfParkingCars_wheelInterruptCount+0)
STRH	R1, [R0, #0]
;SelfParkingCars.c,200 :: 		wheelInterruptCount[1]=52; // 63
MOVS	R1, #52
SXTH	R1, R1
MOVW	R0, #lo_addr(SelfParkingCars_wheelInterruptCount+2)
MOVT	R0, #hi_addr(SelfParkingCars_wheelInterruptCount+2)
STRH	R1, [R0, #0]
;SelfParkingCars.c,201 :: 		startCounting = 1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_startCounting+0)
MOVT	R0, #hi_addr(_startCounting+0)
STRH	R1, [R0, #0]
;SelfParkingCars.c,202 :: 		StartWheels();
BL	_StartWheels+0
;SelfParkingCars.c,203 :: 		while (leftWheelStopped == 0 || rightWheelStopped == 0);
L_RotateFor90Right36:
MOVW	R0, #lo_addr(_leftWheelStopped+0)
MOVT	R0, #hi_addr(_leftWheelStopped+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L__RotateFor90Right53
MOVW	R0, #lo_addr(_rightWheelStopped+0)
MOVT	R0, #hi_addr(_rightWheelStopped+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L__RotateFor90Right52
IT	AL
BAL	L_RotateFor90Right37
L__RotateFor90Right53:
L__RotateFor90Right52:
IT	AL
BAL	L_RotateFor90Right36
L_RotateFor90Right37:
;SelfParkingCars.c,204 :: 		}
L_end_RotateFor90Right:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RotateFor90Right
_DriveUntillWall:
;SelfParkingCars.c,208 :: 		void DriveUntillWall()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,210 :: 		Delay_ms(100);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_DriveUntillWall40:
SUBS	R7, R7, #1
BNE	L_DriveUntillWall40
NOP
NOP
NOP
;SelfParkingCars.c,211 :: 		SpinDirectionLeftWheel = FORWARD_SPIN;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR6_GPIOA_ODR_bit+0)
MOVT	R0, #hi_addr(ODR6_GPIOA_ODR_bit+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,212 :: 		SpinDirectionRightWheel = FORWARD_SPIN;
MOVW	R0, #lo_addr(ODR7_GPIOA_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOA_ODR_bit+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,213 :: 		startCounting = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_startCounting+0)
MOVT	R0, #hi_addr(_startCounting+0)
STRH	R1, [R0, #0]
;SelfParkingCars.c,214 :: 		TriggerFrontSensorMeasurement();
BL	_TriggerFrontSensorMeasurement+0
;SelfParkingCars.c,215 :: 		StartWheels();
BL	_StartWheels+0
;SelfParkingCars.c,218 :: 		while (GetFrontSensorDistance() > 8)
L_DriveUntillWall42:
BL	_GetFrontSensorDistance+0
VMOV.F32	S1, #8
VCMPE.F32	S0, S1
VMRS	#60, FPSCR
IT	LE
BLE	L_DriveUntillWall43
;SelfParkingCars.c,220 :: 		TriggerFrontSensorMeasurement();
BL	_TriggerFrontSensorMeasurement+0
;SelfParkingCars.c,221 :: 		}
IT	AL
BAL	L_DriveUntillWall42
L_DriveUntillWall43:
;SelfParkingCars.c,223 :: 		StopWheels();
BL	_StopWheels+0
;SelfParkingCars.c,224 :: 		}
L_end_DriveUntillWall:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _DriveUntillWall
_InitializeWheels:
;SelfParkingCars.c,226 :: 		void InitializeWheels()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,228 :: 		InitLeftWheelPWM_Timer4_CH1_PB6();
BL	_InitLeftWheelPWM_Timer4_CH1_PB6+0
;SelfParkingCars.c,229 :: 		InitRightWheelPWM_Timer9_CH1_PE5();
BL	_InitRightWheelPWM_Timer9_CH1_PE5+0
;SelfParkingCars.c,230 :: 		InitExternIntRisingEdge_PC1_PC2();
BL	_InitExternIntRisingEdge_PC1_PC2+0
;SelfParkingCars.c,231 :: 		}
L_end_InitializeWheels:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitializeWheels
_main:
;SelfParkingCars.c,233 :: 		void main() {
SUB	SP, SP, #4
;SelfParkingCars.c,237 :: 		InitializeSensors();
BL	_InitializeSensors+0
;SelfParkingCars.c,238 :: 		AlignRightSensors();
BL	_AlignRightSensors+0
;SelfParkingCars.c,239 :: 		Delay_ms(4000);
MOVW	R7, #26622
MOVT	R7, #2441
NOP
NOP
L_main44:
SUBS	R7, R7, #1
BNE	L_main44
NOP
NOP
NOP
;SelfParkingCars.c,240 :: 		InitializeWheels();
BL	_InitializeWheels+0
;SelfParkingCars.c,241 :: 		DriveWhileParkingNotSpotted();
BL	_DriveWhileParkingNotSpotted+0
;SelfParkingCars.c,242 :: 		RotateFor90Right();
BL	_RotateFor90Right+0
;SelfParkingCars.c,243 :: 		RotateFrontSensorFront();
BL	_RotateFrontSensorFront+0
;SelfParkingCars.c,244 :: 		DriveUntillWall();
BL	_DriveUntillWall+0
;SelfParkingCars.c,245 :: 		RotateFor90Right();
BL	_RotateFor90Right+0
;SelfParkingCars.c,247 :: 		while(1);
L_main46:
IT	AL
BAL	L_main46
;SelfParkingCars.c,261 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
