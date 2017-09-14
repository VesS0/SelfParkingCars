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
;SelfParkingCars.c,19 :: 		void InitExternIntRisingEdge_PC1_PC2()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,21 :: 		GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_1);
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Input+0
;SelfParkingCars.c,22 :: 		GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_2);
MOVW	R1, #4
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Input+0
;SelfParkingCars.c,24 :: 		SYSCFGEN_bit = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(SYSCFGEN_bit+0)
MOVT	R0, #hi_addr(SYSCFGEN_bit+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,25 :: 		SYSCFG_EXTICR1 |= LEFT_WHEEL_EXT_INT_CR1_PC1 | RIGHT_WHEEL_EXT_INT_CR1_PC2;
MOVW	R0, #lo_addr(SYSCFG_EXTICR1+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #544
MOVW	R0, #lo_addr(SYSCFG_EXTICR1+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR1+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,26 :: 		EXTI_RTSR |= RISING_TRIGGER_PC1 | RISING_TRIGGER_PC2;
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #6
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,27 :: 		EXTI_FTSR |= RISING_TRIGGER_PC1 | RISING_TRIGGER_PC2;
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #6
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,28 :: 		EXTI_IMR  |=  RISING_TRIGGER_PC1 |  RISING_TRIGGER_PC2;
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #6
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,29 :: 		NVIC_IntEnable(IVT_INT_EXTI1);
MOVW	R0, #23
BL	_NVIC_IntEnable+0
;SelfParkingCars.c,30 :: 		NVIC_IntEnable(IVT_INT_EXTI2);
MOVW	R0, #24
BL	_NVIC_IntEnable+0
;SelfParkingCars.c,31 :: 		}
L_end_InitExternIntRisingEdge_PC1_PC2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitExternIntRisingEdge_PC1_PC2
_RightWheel_Interrupt:
;SelfParkingCars.c,35 :: 		void RightWheel_Interrupt() iv IVT_INT_EXTI2 ics ICS_AUTO
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,36 :: 		{      EXTI_PR.B2 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,37 :: 		if (!startCounting) return;
MOVW	R0, #lo_addr(_startCounting+0)
MOVT	R0, #hi_addr(_startCounting+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_RightWheel_Interrupt0
IT	AL
BAL	L_end_RightWheel_Interrupt
L_RightWheel_Interrupt0:
;SelfParkingCars.c,38 :: 		--wheelInterruptCount[LEFT_WHEEL];
MOVW	R1, #lo_addr(SelfParkingCars_wheelInterruptCount+0)
MOVT	R1, #hi_addr(SelfParkingCars_wheelInterruptCount+0)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;SelfParkingCars.c,39 :: 		if (wheelInterruptCount[LEFT_WHEEL] <  0)
CMP	R0, #0
IT	GE
BGE	L_RightWheel_Interrupt1
;SelfParkingCars.c,41 :: 		ChangeDuty[LEFT_WHEEL](0);
MOVS	R0, #0
MOVW	R4, #lo_addr(SelfParkingCars_ChangeDuty+0)
MOVT	R4, #hi_addr(SelfParkingCars_ChangeDuty+0)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,42 :: 		rightWheelStopped = 1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_rightWheelStopped+0)
MOVT	R0, #hi_addr(_rightWheelStopped+0)
STRH	R1, [R0, #0]
;SelfParkingCars.c,43 :: 		}
L_RightWheel_Interrupt1:
;SelfParkingCars.c,44 :: 		}
L_end_RightWheel_Interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RightWheel_Interrupt
_LeftWheel_Interrupt:
;SelfParkingCars.c,46 :: 		void LeftWheel_Interrupt() iv IVT_INT_EXTI1 ics ICS_AUTO
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,47 :: 		{      EXTI_PR.B1 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,48 :: 		if (!startCounting) return;
MOVW	R0, #lo_addr(_startCounting+0)
MOVT	R0, #hi_addr(_startCounting+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_LeftWheel_Interrupt2
IT	AL
BAL	L_end_LeftWheel_Interrupt
L_LeftWheel_Interrupt2:
;SelfParkingCars.c,50 :: 		--wheelInterruptCount[RIGHT_WHEEL];
MOVW	R1, #lo_addr(SelfParkingCars_wheelInterruptCount+2)
MOVT	R1, #hi_addr(SelfParkingCars_wheelInterruptCount+2)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;SelfParkingCars.c,51 :: 		if (wheelInterruptCount[RIGHT_WHEEL] <  0)
CMP	R0, #0
IT	GE
BGE	L_LeftWheel_Interrupt3
;SelfParkingCars.c,53 :: 		ChangeDuty[RIGHT_WHEEL](0);
MOVS	R0, #0
MOVW	R4, #lo_addr(SelfParkingCars_ChangeDuty+4)
MOVT	R4, #hi_addr(SelfParkingCars_ChangeDuty+4)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,54 :: 		leftWheelStopped = 1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_leftWheelStopped+0)
MOVT	R0, #hi_addr(_leftWheelStopped+0)
STRH	R1, [R0, #0]
;SelfParkingCars.c,55 :: 		}
L_LeftWheel_Interrupt3:
;SelfParkingCars.c,56 :: 		}
L_end_LeftWheel_Interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _LeftWheel_Interrupt
_InitLeftWheelPWM_Timer4_CH1_PB6:
;SelfParkingCars.c,63 :: 		void InitLeftWheelPWM_Timer4_CH1_PB6()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,65 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_6);
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
;SelfParkingCars.c,66 :: 		SpinDirectionLeftWheel = FORWARD_SPIN;    // Default forward spin
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR6_GPIOA_ODR_bit+0)
MOVT	R0, #hi_addr(ODR6_GPIOA_ODR_bit+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,68 :: 		pwmPeriod[LEFT_WHEEL] =  PWM_TIM4_Init(50000) ; // Work on frequency 20-40 Khz
MOVW	R0, #50000
BL	_PWM_TIM4_Init+0
MOVW	R1, #lo_addr(SelfParkingCars_pwmPeriod+0)
MOVT	R1, #hi_addr(SelfParkingCars_pwmPeriod+0)
STRH	R0, [R1, #0]
;SelfParkingCars.c,69 :: 		pwmDuty[LEFT_WHEEL] = pwmPeriod[LEFT_WHEEL]- 650; //-700; // -750;// - 1000 ;
SUBW	R1, R0, #650
MOVW	R0, #lo_addr(SelfParkingCars_pwmDuty+0)
MOVT	R0, #hi_addr(SelfParkingCars_pwmDuty+0)
STRH	R1, [R0, #0]
;SelfParkingCars.c,70 :: 		ChangeDuty[LEFT_WHEEL](pwmDuty[LEFT_WHEEL]);
UXTH	R4, R1
UXTH	R0, R4
MOVW	R4, #lo_addr(SelfParkingCars_ChangeDuty+0)
MOVT	R4, #hi_addr(SelfParkingCars_ChangeDuty+0)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,71 :: 		PWM_TIM4_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM4_CH1_PB6);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM4_CH1_PB6+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM4_CH1_PB6+0)
MOVS	R0, #0
BL	_PWM_TIM4_Start+0
;SelfParkingCars.c,72 :: 		}
L_end_InitLeftWheelPWM_Timer4_CH1_PB6:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitLeftWheelPWM_Timer4_CH1_PB6
_InitRightWheelPWM_Timer9_CH1_PE5:
;SelfParkingCars.c,74 :: 		void InitRightWheelPWM_Timer9_CH1_PE5()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,76 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
;SelfParkingCars.c,77 :: 		SpinDirectionRightWheel = FORWARD_SPIN;    // Default forward spin
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR7_GPIOA_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOA_ODR_bit+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,79 :: 		pwmPeriod[RIGHT_WHEEL] =  PWM_TIM9_Init(25000);
MOVW	R0, #25000
BL	_PWM_TIM9_Init+0
MOVW	R1, #lo_addr(SelfParkingCars_pwmPeriod+2)
MOVT	R1, #hi_addr(SelfParkingCars_pwmPeriod+2)
STRH	R0, [R1, #0]
;SelfParkingCars.c,80 :: 		pwmDuty[RIGHT_WHEEL] = pwmPeriod[RIGHT_WHEEL] - 1300;//-1400;//-1500;//-1650;//      27.44 us from 39.88 us (slow)
SUBW	R1, R0, #1300
MOVW	R0, #lo_addr(SelfParkingCars_pwmDuty+2)
MOVT	R0, #hi_addr(SelfParkingCars_pwmDuty+2)
STRH	R1, [R0, #0]
;SelfParkingCars.c,81 :: 		ChangeDuty[RIGHT_WHEEL](pwmDuty[RIGHT_WHEEL]);
UXTH	R4, R1
UXTH	R0, R4
MOVW	R4, #lo_addr(SelfParkingCars_ChangeDuty+4)
MOVT	R4, #hi_addr(SelfParkingCars_ChangeDuty+4)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,82 :: 		PWM_TIM9_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM9_CH1_PE5);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM9_CH1_PE5+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM9_CH1_PE5+0)
MOVS	R0, #0
BL	_PWM_TIM9_Start+0
;SelfParkingCars.c,83 :: 		}
L_end_InitRightWheelPWM_Timer9_CH1_PE5:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitRightWheelPWM_Timer9_CH1_PE5
_UpdateCurrentDuty:
;SelfParkingCars.c,86 :: 		void UpdateCurrentDuty(int updateFor, int component)
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
;SelfParkingCars.c,88 :: 		if (pwmDuty[component]+ updateFor < 0)
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
;SelfParkingCars.c,90 :: 		pwmDuty[component] = 0;
LSLS	R3, R0, #1
MOVW	R2, #lo_addr(SelfParkingCars_pwmDuty+0)
MOVT	R2, #hi_addr(SelfParkingCars_pwmDuty+0)
ADDS	R3, R2, R3
MOVS	R2, #0
SXTH	R2, R2
STRH	R2, [R3, #0]
;SelfParkingCars.c,91 :: 		}
IT	AL
BAL	L_UpdateCurrentDuty5
L_UpdateCurrentDuty4:
;SelfParkingCars.c,94 :: 		pwmDuty[component] += updateFor;
; updateFor start address is: 4 (R1)
LSLS	R3, R0, #1
MOVW	R2, #lo_addr(SelfParkingCars_pwmDuty+0)
MOVT	R2, #hi_addr(SelfParkingCars_pwmDuty+0)
ADDS	R3, R2, R3
LDRSH	R2, [R3, #0]
ADDS	R2, R2, R1
; updateFor end address is: 4 (R1)
STRH	R2, [R3, #0]
;SelfParkingCars.c,95 :: 		}
L_UpdateCurrentDuty5:
;SelfParkingCars.c,97 :: 		ChangeDuty[component](pwmDuty[component]);
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
;SelfParkingCars.c,98 :: 		}
L_end_UpdateCurrentDuty:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _UpdateCurrentDuty
_WheelsSpeedAndDirectionTest:
;SelfParkingCars.c,104 :: 		void WheelsSpeedAndDirectionTest()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,106 :: 		InitLeftWheelPWM_Timer4_CH1_PB6();
BL	_InitLeftWheelPWM_Timer4_CH1_PB6+0
;SelfParkingCars.c,107 :: 		InitRightWheelPWM_Timer9_CH1_PE5();
BL	_InitRightWheelPWM_Timer9_CH1_PE5+0
;SelfParkingCars.c,108 :: 		while(1)
L_WheelsSpeedAndDirectionTest6:
;SelfParkingCars.c,110 :: 		selectedWheel = wheelDirection;
MOVW	R0, #lo_addr(_wheelDirection+0)
MOVT	R0, #hi_addr(_wheelDirection+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_selectedWheel+0)
MOVT	R0, #hi_addr(_selectedWheel+0)
STRH	R1, [R0, #0]
;SelfParkingCars.c,111 :: 		Delay_ms(3000); //UpdateCurrentDuty(-500, selectedWheel);
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
;SelfParkingCars.c,112 :: 		Delay_ms(3000); //UpdateCurrentDuty(500, selectedWheel);
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
;SelfParkingCars.c,115 :: 		if (wheelDirection)
MOVW	R0, #lo_addr(_wheelDirection+0)
MOVT	R0, #hi_addr(_wheelDirection+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_WheelsSpeedAndDirectionTest12
;SelfParkingCars.c,117 :: 		selectedWheel = !selectedWheel;
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
;SelfParkingCars.c,118 :: 		}
IT	AL
BAL	L_WheelsSpeedAndDirectionTest13
L_WheelsSpeedAndDirectionTest12:
;SelfParkingCars.c,122 :: 		wheelDirection = !wheelDirection;
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
;SelfParkingCars.c,123 :: 		}
L_WheelsSpeedAndDirectionTest13:
;SelfParkingCars.c,124 :: 		}
IT	AL
BAL	L_WheelsSpeedAndDirectionTest6
;SelfParkingCars.c,125 :: 		}
L_end_WheelsSpeedAndDirectionTest:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _WheelsSpeedAndDirectionTest
_WheelsSpeedTest:
;SelfParkingCars.c,127 :: 		void WheelsSpeedTest()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,129 :: 		Delay_ms(2000);
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
;SelfParkingCars.c,131 :: 		InitRightWheelPWM_Timer9_CH1_PE5();
BL	_InitRightWheelPWM_Timer9_CH1_PE5+0
;SelfParkingCars.c,132 :: 		while(pwmDuty[RIGHT_WHEEL]>0)
L_WheelsSpeedTest16:
MOVW	R0, #lo_addr(SelfParkingCars_pwmDuty+2)
MOVT	R0, #hi_addr(SelfParkingCars_pwmDuty+2)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LE
BLE	L_WheelsSpeedTest17
;SelfParkingCars.c,134 :: 		UpdateCurrentDuty(50, RIGHT_WHEEL);           //left range 2290
MOVS	R1, #1
SXTH	R1, R1
MOVS	R0, #50
SXTH	R0, R0
BL	_UpdateCurrentDuty+0
;SelfParkingCars.c,135 :: 		Delay_ms(250);
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
;SelfParkingCars.c,136 :: 		}
IT	AL
BAL	L_WheelsSpeedTest16
L_WheelsSpeedTest17:
;SelfParkingCars.c,137 :: 		}
L_end_WheelsSpeedTest:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _WheelsSpeedTest
_ServoPositionTest:
;SelfParkingCars.c,141 :: 		void ServoPositionTest()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,143 :: 		while(1)
L_ServoPositionTest20:
;SelfParkingCars.c,145 :: 		ChangeDuty[FRONT_SENSOR](sensorPositions[ServoPosition]);
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
;SelfParkingCars.c,146 :: 		ChangeDuty[BACK_SENSOR](sensorPositions[ServoPosition]);
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
;SelfParkingCars.c,147 :: 		Delay_ms(500);
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
;SelfParkingCars.c,148 :: 		ServoPosition=(ServoPosition+1)%15;
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
;SelfParkingCars.c,149 :: 		}
IT	AL
BAL	L_ServoPositionTest20
;SelfParkingCars.c,150 :: 		}
L_end_ServoPositionTest:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ServoPositionTest
_SpinAndBack:
;SelfParkingCars.c,152 :: 		void SpinAndBack()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,154 :: 		Delay_ms(3000);
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
;SelfParkingCars.c,155 :: 		ChangeDuty[RIGHT_WHEEL](0);
MOVS	R0, #0
MOVW	R4, #lo_addr(SelfParkingCars_ChangeDuty+4)
MOVT	R4, #hi_addr(SelfParkingCars_ChangeDuty+4)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,156 :: 		ChangeDuty[LEFT_WHEEL](0);
MOVS	R0, #0
MOVW	R4, #lo_addr(SelfParkingCars_ChangeDuty+0)
MOVT	R4, #hi_addr(SelfParkingCars_ChangeDuty+0)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,157 :: 		SpinDirectionLeftWheel = ~SpinDirectionLeftWheel;
MOVW	R1, #lo_addr(ODR6_GPIOA_ODR_bit+0)
MOVT	R1, #hi_addr(ODR6_GPIOA_ODR_bit+0)
LDR	R0, [R1, #0]
EOR	R0, R0, #1
STR	R0, [R1, #0]
;SelfParkingCars.c,158 :: 		Delay_ms(3000);
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
;SelfParkingCars.c,159 :: 		ChangeDuty[RIGHT_WHEEL](pwmDuty[RIGHT_WHEEL]);
MOVW	R0, #lo_addr(SelfParkingCars_pwmDuty+2)
MOVT	R0, #hi_addr(SelfParkingCars_pwmDuty+2)
LDRSH	R4, [R0, #0]
UXTH	R0, R4
MOVW	R4, #lo_addr(SelfParkingCars_ChangeDuty+4)
MOVT	R4, #hi_addr(SelfParkingCars_ChangeDuty+4)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,160 :: 		ChangeDuty[LEFT_WHEEL](pwmDuty[LEFT_WHEEL]);
MOVW	R0, #lo_addr(SelfParkingCars_pwmDuty+0)
MOVT	R0, #hi_addr(SelfParkingCars_pwmDuty+0)
LDRSH	R4, [R0, #0]
UXTH	R0, R4
MOVW	R4, #lo_addr(SelfParkingCars_ChangeDuty+0)
MOVT	R4, #hi_addr(SelfParkingCars_ChangeDuty+0)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,161 :: 		Delay_ms(3000);
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
;SelfParkingCars.c,162 :: 		ChangeDuty[RIGHT_WHEEL](0);
MOVS	R0, #0
MOVW	R4, #lo_addr(SelfParkingCars_ChangeDuty+4)
MOVT	R4, #hi_addr(SelfParkingCars_ChangeDuty+4)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,163 :: 		ChangeDuty[LEFT_WHEEL](0);
MOVS	R0, #0
MOVW	R4, #lo_addr(SelfParkingCars_ChangeDuty+0)
MOVT	R4, #hi_addr(SelfParkingCars_ChangeDuty+0)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,164 :: 		}
L_end_SpinAndBack:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _SpinAndBack
_StopWheels:
;SelfParkingCars.c,166 :: 		void StopWheels()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,168 :: 		ChangeDuty[LEFT_WHEEL](0);
MOVS	R0, #0
MOVW	R4, #lo_addr(SelfParkingCars_ChangeDuty+0)
MOVT	R4, #hi_addr(SelfParkingCars_ChangeDuty+0)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,169 :: 		ChangeDuty[RIGHT_WHEEL](0);
MOVS	R0, #0
MOVW	R4, #lo_addr(SelfParkingCars_ChangeDuty+4)
MOVT	R4, #hi_addr(SelfParkingCars_ChangeDuty+4)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,170 :: 		}
L_end_StopWheels:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _StopWheels
_StartWheels:
;SelfParkingCars.c,172 :: 		void StartWheels()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,174 :: 		ChangeDuty[RIGHT_WHEEL](pwmDuty[RIGHT_WHEEL]);
MOVW	R0, #lo_addr(SelfParkingCars_pwmDuty+2)
MOVT	R0, #hi_addr(SelfParkingCars_pwmDuty+2)
LDRSH	R4, [R0, #0]
UXTH	R0, R4
MOVW	R4, #lo_addr(SelfParkingCars_ChangeDuty+4)
MOVT	R4, #hi_addr(SelfParkingCars_ChangeDuty+4)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,175 :: 		ChangeDuty[LEFT_WHEEL](pwmDuty[LEFT_WHEEL]);
MOVW	R0, #lo_addr(SelfParkingCars_pwmDuty+0)
MOVT	R0, #hi_addr(SelfParkingCars_pwmDuty+0)
LDRSH	R4, [R0, #0]
UXTH	R0, R4
MOVW	R4, #lo_addr(SelfParkingCars_ChangeDuty+0)
MOVT	R4, #hi_addr(SelfParkingCars_ChangeDuty+0)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,176 :: 		}
L_end_StartWheels:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _StartWheels
_DriveWhileParkingNotSpotted:
;SelfParkingCars.c,178 :: 		void DriveWhileParkingNotSpotted()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;SelfParkingCars.c,180 :: 		TriggerFrontSensorMeasurement();
BL	_TriggerFrontSensorMeasurement+0
;SelfParkingCars.c,181 :: 		TriggerBackSensorMeasurement();
BL	_TriggerBackSensorMeasurement+0
;SelfParkingCars.c,183 :: 		while((GetFrontSensorDistance() - GetBackSensorDistance()) < 15)
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
;SelfParkingCars.c,186 :: 		TriggerFrontSensorMeasurement();
BL	_TriggerFrontSensorMeasurement+0
;SelfParkingCars.c,187 :: 		TriggerBackSensorMeasurement();
BL	_TriggerBackSensorMeasurement+0
;SelfParkingCars.c,188 :: 		}
IT	AL
BAL	L_DriveWhileParkingNotSpotted30
L_DriveWhileParkingNotSpotted31:
;SelfParkingCars.c,189 :: 		leftWheelStopped = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_leftWheelStopped+0)
MOVT	R0, #hi_addr(_leftWheelStopped+0)
STRH	R1, [R0, #0]
;SelfParkingCars.c,190 :: 		rightWheelStopped = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_rightWheelStopped+0)
MOVT	R0, #hi_addr(_rightWheelStopped+0)
STRH	R1, [R0, #0]
;SelfParkingCars.c,191 :: 		wheelInterruptCount[0]=60;
MOVS	R1, #60
SXTH	R1, R1
MOVW	R0, #lo_addr(SelfParkingCars_wheelInterruptCount+0)
MOVT	R0, #hi_addr(SelfParkingCars_wheelInterruptCount+0)
STRH	R1, [R0, #0]
;SelfParkingCars.c,192 :: 		wheelInterruptCount[1]=60;
MOVS	R1, #60
SXTH	R1, R1
MOVW	R0, #lo_addr(SelfParkingCars_wheelInterruptCount+2)
MOVT	R0, #hi_addr(SelfParkingCars_wheelInterruptCount+2)
STRH	R1, [R0, #0]
;SelfParkingCars.c,193 :: 		startCounting = 1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_startCounting+0)
MOVT	R0, #hi_addr(_startCounting+0)
STRH	R1, [R0, #0]
;SelfParkingCars.c,194 :: 		StartWheels();
BL	_StartWheels+0
;SelfParkingCars.c,195 :: 		while (leftWheelStopped == 0 || rightWheelStopped == 0);
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
;SelfParkingCars.c,196 :: 		StopWheels();
BL	_StopWheels+0
;SelfParkingCars.c,197 :: 		}
L_end_DriveWhileParkingNotSpotted:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DriveWhileParkingNotSpotted
_RotateFor90Right:
;SelfParkingCars.c,199 :: 		void RotateFor90Right()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,201 :: 		leftWheelStopped = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_leftWheelStopped+0)
MOVT	R0, #hi_addr(_leftWheelStopped+0)
STRH	R1, [R0, #0]
;SelfParkingCars.c,202 :: 		rightWheelStopped = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_rightWheelStopped+0)
MOVT	R0, #hi_addr(_rightWheelStopped+0)
STRH	R1, [R0, #0]
;SelfParkingCars.c,203 :: 		SpinDirectionLeftWheel = BACKWARD_SPIN;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR6_GPIOA_ODR_bit+0)
MOVT	R0, #hi_addr(ODR6_GPIOA_ODR_bit+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,204 :: 		SpinDirectionRightWheel = FORWARD_SPIN;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR7_GPIOA_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOA_ODR_bit+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,205 :: 		wheelInterruptCount[0]=52; // 63
MOVS	R1, #52
SXTH	R1, R1
MOVW	R0, #lo_addr(SelfParkingCars_wheelInterruptCount+0)
MOVT	R0, #hi_addr(SelfParkingCars_wheelInterruptCount+0)
STRH	R1, [R0, #0]
;SelfParkingCars.c,206 :: 		wheelInterruptCount[1]=52; // 63
MOVS	R1, #52
SXTH	R1, R1
MOVW	R0, #lo_addr(SelfParkingCars_wheelInterruptCount+2)
MOVT	R0, #hi_addr(SelfParkingCars_wheelInterruptCount+2)
STRH	R1, [R0, #0]
;SelfParkingCars.c,207 :: 		startCounting = 1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_startCounting+0)
MOVT	R0, #hi_addr(_startCounting+0)
STRH	R1, [R0, #0]
;SelfParkingCars.c,208 :: 		StartWheels();
BL	_StartWheels+0
;SelfParkingCars.c,209 :: 		while (leftWheelStopped == 0 || rightWheelStopped == 0);
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
;SelfParkingCars.c,210 :: 		}
L_end_RotateFor90Right:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RotateFor90Right
_DriveUntillWall:
;SelfParkingCars.c,214 :: 		void DriveUntillWall()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,216 :: 		Delay_ms(100);
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
;SelfParkingCars.c,217 :: 		SpinDirectionLeftWheel = FORWARD_SPIN;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR6_GPIOA_ODR_bit+0)
MOVT	R0, #hi_addr(ODR6_GPIOA_ODR_bit+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,218 :: 		SpinDirectionRightWheel = FORWARD_SPIN;
MOVW	R0, #lo_addr(ODR7_GPIOA_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOA_ODR_bit+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,219 :: 		startCounting = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_startCounting+0)
MOVT	R0, #hi_addr(_startCounting+0)
STRH	R1, [R0, #0]
;SelfParkingCars.c,220 :: 		TriggerFrontSensorMeasurement();
BL	_TriggerFrontSensorMeasurement+0
;SelfParkingCars.c,221 :: 		StartWheels();
BL	_StartWheels+0
;SelfParkingCars.c,224 :: 		while (GetFrontSensorDistance() > 8)
L_DriveUntillWall42:
BL	_GetFrontSensorDistance+0
VMOV.F32	S1, #8
VCMPE.F32	S0, S1
VMRS	#60, FPSCR
IT	LE
BLE	L_DriveUntillWall43
;SelfParkingCars.c,226 :: 		TriggerFrontSensorMeasurement();
BL	_TriggerFrontSensorMeasurement+0
;SelfParkingCars.c,227 :: 		}
IT	AL
BAL	L_DriveUntillWall42
L_DriveUntillWall43:
;SelfParkingCars.c,229 :: 		StopWheels();
BL	_StopWheels+0
;SelfParkingCars.c,230 :: 		}
L_end_DriveUntillWall:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _DriveUntillWall
_InitializeWheels:
;SelfParkingCars.c,232 :: 		void InitializeWheels()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,234 :: 		InitLeftWheelPWM_Timer4_CH1_PB6();
BL	_InitLeftWheelPWM_Timer4_CH1_PB6+0
;SelfParkingCars.c,235 :: 		InitRightWheelPWM_Timer9_CH1_PE5();
BL	_InitRightWheelPWM_Timer9_CH1_PE5+0
;SelfParkingCars.c,236 :: 		InitExternIntRisingEdge_PC1_PC2();
BL	_InitExternIntRisingEdge_PC1_PC2+0
;SelfParkingCars.c,237 :: 		}
L_end_InitializeWheels:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitializeWheels
_main:
;SelfParkingCars.c,239 :: 		void main() {
SUB	SP, SP, #4
;SelfParkingCars.c,243 :: 		InitializeSensors();
BL	_InitializeSensors+0
;SelfParkingCars.c,244 :: 		AlignRightSensors();
BL	_AlignRightSensors+0
;SelfParkingCars.c,245 :: 		Delay_ms(4000);
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
;SelfParkingCars.c,246 :: 		InitializeWheels();
BL	_InitializeWheels+0
;SelfParkingCars.c,247 :: 		DriveWhileParkingNotSpotted();
BL	_DriveWhileParkingNotSpotted+0
;SelfParkingCars.c,248 :: 		RotateFor90Right();
BL	_RotateFor90Right+0
;SelfParkingCars.c,249 :: 		RotateFrontSensorFront();
BL	_RotateFrontSensorFront+0
;SelfParkingCars.c,250 :: 		DriveUntillWall();
BL	_DriveUntillWall+0
;SelfParkingCars.c,251 :: 		RotateFor90Right();
BL	_RotateFor90Right+0
;SelfParkingCars.c,253 :: 		while(1);
L_main46:
IT	AL
BAL	L_main46
;SelfParkingCars.c,267 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
