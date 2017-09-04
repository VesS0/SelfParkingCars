_PWM_TIM4_Set_Duty_Wrapper:
;SelfParkingCars.c,33 :: 		void PWM_TIM4_Set_Duty_Wrapper(unsigned int ratio) {
; ratio start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; ratio end address is: 0 (R0)
; ratio start address is: 0 (R0)
;SelfParkingCars.c,34 :: 		PWM_TIM4_Set_Duty(ratio, _PWM_INVERTED, _PWM_CHANNEL1);
MOVS	R2, #0
MOVS	R1, #1
; ratio end address is: 0 (R0)
BL	_PWM_TIM4_Set_Duty+0
;SelfParkingCars.c,35 :: 		}
L_end_PWM_TIM4_Set_Duty_Wrapper:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _PWM_TIM4_Set_Duty_Wrapper
_PWM_TIM9_Set_Duty_Wrapper:
;SelfParkingCars.c,38 :: 		void PWM_TIM9_Set_Duty_Wrapper(unsigned int ratio) {
; ratio start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; ratio end address is: 0 (R0)
; ratio start address is: 0 (R0)
;SelfParkingCars.c,39 :: 		PWM_TIM9_Set_Duty(ratio, _PWM_INVERTED, _PWM_CHANNEL1);
MOVS	R2, #0
MOVS	R1, #1
; ratio end address is: 0 (R0)
BL	_PWM_TIM9_Set_Duty+0
;SelfParkingCars.c,40 :: 		}
L_end_PWM_TIM9_Set_Duty_Wrapper:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _PWM_TIM9_Set_Duty_Wrapper
_PWM_TIM10_Set_Duty_Wrapper:
;SelfParkingCars.c,43 :: 		void PWM_TIM10_Set_Duty_Wrapper(unsigned int ratio) {
; ratio start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; ratio end address is: 0 (R0)
; ratio start address is: 0 (R0)
;SelfParkingCars.c,44 :: 		PWM_TIM10_Set_Duty(ratio, _PWM_NON_INVERTED, _PWM_CHANNEL1);
MOVS	R2, #0
MOVS	R1, #0
; ratio end address is: 0 (R0)
BL	_PWM_TIM10_Set_Duty+0
;SelfParkingCars.c,45 :: 		}
L_end_PWM_TIM10_Set_Duty_Wrapper:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _PWM_TIM10_Set_Duty_Wrapper
_PWM_TIM11_Set_Duty_Wrapper:
;SelfParkingCars.c,48 :: 		void PWM_TIM11_Set_Duty_Wrapper(unsigned int ratio) {
; ratio start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; ratio end address is: 0 (R0)
; ratio start address is: 0 (R0)
;SelfParkingCars.c,49 :: 		PWM_TIM11_Set_Duty(ratio, _PWM_NON_INVERTED, _PWM_CHANNEL1);
MOVS	R2, #0
MOVS	R1, #0
; ratio end address is: 0 (R0)
BL	_PWM_TIM11_Set_Duty+0
;SelfParkingCars.c,50 :: 		}
L_end_PWM_TIM11_Set_Duty_Wrapper:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _PWM_TIM11_Set_Duty_Wrapper
_InitExternIntRisingEdge_PC1_PC2:
;SelfParkingCars.c,64 :: 		void InitExternIntRisingEdge_PC1_PC2()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,66 :: 		SYSCFGEN_bit = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(SYSCFGEN_bit+0)
MOVT	R0, #hi_addr(SYSCFGEN_bit+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,67 :: 		SYSCFG_EXTICR1 = LEFT_WHEEL_EXT_INT_CR1_PC1 | RIGHT_WHEEL_EXT_INT_CR1_PC2;
MOVW	R1, #544
MOVW	R0, #lo_addr(SYSCFG_EXTICR1+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR1+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,68 :: 		EXTI_RTSR |= RISING_TRIGGER_PC1 | RISING_TRIGGER_PC2;
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #6
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,69 :: 		EXTI_FTSR |= RISING_TRIGGER_PC1 | RISING_TRIGGER_PC2;
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #6
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,70 :: 		EXTI_IMR  |=  RISING_TRIGGER_PC1 |  RISING_TRIGGER_PC2;
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #6
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,71 :: 		NVIC_IntEnable(IVT_INT_EXTI1);
MOVW	R0, #23
BL	_NVIC_IntEnable+0
;SelfParkingCars.c,72 :: 		NVIC_IntEnable(IVT_INT_EXTI2);
MOVW	R0, #24
BL	_NVIC_IntEnable+0
;SelfParkingCars.c,73 :: 		}
L_end_InitExternIntRisingEdge_PC1_PC2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitExternIntRisingEdge_PC1_PC2
_RightWheel_Interrupt:
;SelfParkingCars.c,76 :: 		void RightWheel_Interrupt() iv IVT_INT_EXTI2 ics ICS_AUTO
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,77 :: 		{      EXTI_PR.B1 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,79 :: 		--wheelInterruptCount[LEFT_WHEEL];
MOVW	R1, #lo_addr(_wheelInterruptCount+0)
MOVT	R1, #hi_addr(_wheelInterruptCount+0)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;SelfParkingCars.c,80 :: 		if (wheelInterruptCount[LEFT_WHEEL] <  0)
CMP	R0, #0
IT	GE
BGE	L_RightWheel_Interrupt0
;SelfParkingCars.c,82 :: 		UpdateCurrentDuty(-4000, RIGHT_WHEEL);
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #61536
SXTH	R0, R0
BL	_UpdateCurrentDuty+0
;SelfParkingCars.c,83 :: 		}
L_RightWheel_Interrupt0:
;SelfParkingCars.c,84 :: 		}
L_end_RightWheel_Interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RightWheel_Interrupt
_LeftWheel_Interrupt:
;SelfParkingCars.c,86 :: 		void LeftWheel_Interrupt() iv IVT_INT_EXTI1 ics ICS_AUTO
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,87 :: 		{      EXTI_PR.B2 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,89 :: 		--wheelInterruptCount[RIGHT_WHEEL];
MOVW	R1, #lo_addr(_wheelInterruptCount+2)
MOVT	R1, #hi_addr(_wheelInterruptCount+2)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;SelfParkingCars.c,90 :: 		if (wheelInterruptCount[RIGHT_WHEEL] <  0)
CMP	R0, #0
IT	GE
BGE	L_LeftWheel_Interrupt1
;SelfParkingCars.c,92 :: 		UpdateCurrentDuty(-4000, LEFT_WHEEL);
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #61536
SXTH	R0, R0
BL	_UpdateCurrentDuty+0
;SelfParkingCars.c,93 :: 		}
L_LeftWheel_Interrupt1:
;SelfParkingCars.c,94 :: 		}
L_end_LeftWheel_Interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _LeftWheel_Interrupt
_InitLeftWheelPWM_Timer4_CH1_PB6:
;SelfParkingCars.c,100 :: 		void InitLeftWheelPWM_Timer4_CH1_PB6()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,102 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_6);
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
;SelfParkingCars.c,103 :: 		SpinDirectionLeftWheel = FORWARD_SPIN_LEFT;    // Default forward spin
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR6_GPIOA_ODR_bit+0)
MOVT	R0, #hi_addr(ODR6_GPIOA_ODR_bit+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,105 :: 		pwmPeriod[LEFT_WHEEL] =  PWM_TIM4_Init(INITIAL_MOTOR_FREQUENCY) ; // Work on frequency 20-35 Khz
MOVW	R0, #25000
BL	_PWM_TIM4_Init+0
MOVW	R1, #lo_addr(_pwmPeriod+0)
MOVT	R1, #hi_addr(_pwmPeriod+0)
STRH	R0, [R1, #0]
;SelfParkingCars.c,106 :: 		pwmDuty[LEFT_WHEEL] = pwmPeriod[LEFT_WHEEL] - 1250;
SUBW	R1, R0, #1250
MOVW	R0, #lo_addr(_pwmDuty+0)
MOVT	R0, #hi_addr(_pwmDuty+0)
STRH	R1, [R0, #0]
;SelfParkingCars.c,107 :: 		ChangeDuty[LEFT_WHEEL](pwmDuty[LEFT_WHEEL]);
UXTH	R4, R1
UXTH	R0, R4
MOVW	R4, #lo_addr(_ChangeDuty+0)
MOVT	R4, #hi_addr(_ChangeDuty+0)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,108 :: 		PWM_TIM4_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM4_CH1_PB6);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM4_CH1_PB6+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM4_CH1_PB6+0)
MOVS	R0, #0
BL	_PWM_TIM4_Start+0
;SelfParkingCars.c,109 :: 		}
L_end_InitLeftWheelPWM_Timer4_CH1_PB6:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitLeftWheelPWM_Timer4_CH1_PB6
_InitRightWheelPWM_Timer9_CH1_PE5:
;SelfParkingCars.c,111 :: 		void InitRightWheelPWM_Timer9_CH1_PE5()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,113 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
;SelfParkingCars.c,114 :: 		SpinDirectionRightWheel = FORWARD_SPIN_RIGHT;    // Default forward spin
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR7_GPIOA_ODR_bit+0)
MOVT	R0, #hi_addr(ODR7_GPIOA_ODR_bit+0)
STR	R1, [R0, #0]
;SelfParkingCars.c,116 :: 		pwmPeriod[RIGHT_WHEEL] =  PWM_TIM9_Init(INITIAL_MOTOR_FREQUENCY);
MOVW	R0, #25000
BL	_PWM_TIM9_Init+0
MOVW	R1, #lo_addr(_pwmPeriod+2)
MOVT	R1, #hi_addr(_pwmPeriod+2)
STRH	R0, [R1, #0]
;SelfParkingCars.c,117 :: 		pwmDuty[RIGHT_WHEEL] = pwmPeriod[RIGHT_WHEEL] - 1250;
SUBW	R1, R0, #1250
MOVW	R0, #lo_addr(_pwmDuty+2)
MOVT	R0, #hi_addr(_pwmDuty+2)
STRH	R1, [R0, #0]
;SelfParkingCars.c,118 :: 		ChangeDuty[RIGHT_WHEEL](pwmDuty[RIGHT_WHEEL]);
UXTH	R4, R1
UXTH	R0, R4
MOVW	R4, #lo_addr(_ChangeDuty+4)
MOVT	R4, #hi_addr(_ChangeDuty+4)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,119 :: 		PWM_TIM9_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM9_CH1_PE5);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM9_CH1_PE5+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM9_CH1_PE5+0)
MOVS	R0, #0
BL	_PWM_TIM9_Start+0
;SelfParkingCars.c,120 :: 		}
L_end_InitRightWheelPWM_Timer9_CH1_PE5:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitRightWheelPWM_Timer9_CH1_PE5
_InitBackServoPWM_Timer10_CH1_PB8:
;SelfParkingCars.c,129 :: 		void InitBackServoPWM_Timer10_CH1_PB8()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,131 :: 		pwmPeriod[BACK_SENSOR] =  PWM_TIM10_Init(INITIAL_SENSOR_FREQUENCY);
MOVS	R0, #50
BL	_PWM_TIM10_Init+0
MOVW	R1, #lo_addr(_pwmPeriod+6)
MOVT	R1, #hi_addr(_pwmPeriod+6)
STRH	R0, [R1, #0]
;SelfParkingCars.c,132 :: 		pwmDuty[BACK_SENSOR] = sensorPositions[0];
MOVW	R1, #2604
SXTH	R1, R1
MOVW	R0, #lo_addr(_pwmDuty+6)
MOVT	R0, #hi_addr(_pwmDuty+6)
STRH	R1, [R0, #0]
;SelfParkingCars.c,133 :: 		ChangeDuty[BACK_SENSOR](pwmDuty[BACK_SENSOR]);
MOVW	R4, #2604
UXTH	R0, R4
MOVW	R4, #lo_addr(_ChangeDuty+12)
MOVT	R4, #hi_addr(_ChangeDuty+12)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,134 :: 		PWM_TIM10_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM10_CH1_PB8);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM10_CH1_PB8+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM10_CH1_PB8+0)
MOVS	R0, #0
BL	_PWM_TIM10_Start+0
;SelfParkingCars.c,135 :: 		}
L_end_InitBackServoPWM_Timer10_CH1_PB8:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitBackServoPWM_Timer10_CH1_PB8
_InitFrontServoPWM_Timer11_CH1_PB9:
;SelfParkingCars.c,137 :: 		void InitFrontServoPWM_Timer11_CH1_PB9()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,139 :: 		pwmPeriod[FRONT_SENSOR]  = PWM_TIM11_Init(INITIAL_SENSOR_FREQUENCY);
MOVS	R0, #50
BL	_PWM_TIM11_Init+0
MOVW	R1, #lo_addr(_pwmPeriod+4)
MOVT	R1, #hi_addr(_pwmPeriod+4)
STRH	R0, [R1, #0]
;SelfParkingCars.c,140 :: 		pwmDuty[FRONT_SENSOR] = sensorPositions[0];
MOVW	R1, #2604
SXTH	R1, R1
MOVW	R0, #lo_addr(_pwmDuty+4)
MOVT	R0, #hi_addr(_pwmDuty+4)
STRH	R1, [R0, #0]
;SelfParkingCars.c,141 :: 		ChangeDuty[FRONT_SENSOR](pwmDuty[FRONT_SENSOR]);  // 1ms = 6484 2 ms =   12 973
MOVW	R4, #2604
UXTH	R0, R4
MOVW	R4, #lo_addr(_ChangeDuty+8)
MOVT	R4, #hi_addr(_ChangeDuty+8)
LDR	R4, [R4, #0]
BLX	R4
;SelfParkingCars.c,142 :: 		PWM_TIM11_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM11_CH1_PB9);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM11_CH1_PB9+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM11_CH1_PB9+0)
MOVS	R0, #0
BL	_PWM_TIM11_Start+0
;SelfParkingCars.c,143 :: 		}
L_end_InitFrontServoPWM_Timer11_CH1_PB9:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitFrontServoPWM_Timer11_CH1_PB9
_UpdateCurrentDuty:
;SelfParkingCars.c,146 :: 		void UpdateCurrentDuty(int updateFor, int component)
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
;SelfParkingCars.c,148 :: 		if (pwmDuty[component]+ updateFor < 0)
LSLS	R3, R0, #1
MOVW	R2, #lo_addr(_pwmDuty+0)
MOVT	R2, #hi_addr(_pwmDuty+0)
ADDS	R2, R2, R3
LDRSH	R2, [R2, #0]
ADDS	R2, R2, R1
SXTH	R2, R2
CMP	R2, #0
IT	GE
BGE	L_UpdateCurrentDuty2
; updateFor end address is: 4 (R1)
;SelfParkingCars.c,150 :: 		pwmDuty[component] = 0;
LSLS	R3, R0, #1
MOVW	R2, #lo_addr(_pwmDuty+0)
MOVT	R2, #hi_addr(_pwmDuty+0)
ADDS	R3, R2, R3
MOVS	R2, #0
SXTH	R2, R2
STRH	R2, [R3, #0]
;SelfParkingCars.c,151 :: 		}
IT	AL
BAL	L_UpdateCurrentDuty3
L_UpdateCurrentDuty2:
;SelfParkingCars.c,154 :: 		pwmDuty[component] += updateFor;
; updateFor start address is: 4 (R1)
LSLS	R3, R0, #1
MOVW	R2, #lo_addr(_pwmDuty+0)
MOVT	R2, #hi_addr(_pwmDuty+0)
ADDS	R3, R2, R3
LDRSH	R2, [R3, #0]
ADDS	R2, R2, R1
; updateFor end address is: 4 (R1)
STRH	R2, [R3, #0]
;SelfParkingCars.c,155 :: 		}
L_UpdateCurrentDuty3:
;SelfParkingCars.c,157 :: 		ChangeDuty[component](pwmDuty[component]);
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
;SelfParkingCars.c,158 :: 		}
L_end_UpdateCurrentDuty:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _UpdateCurrentDuty
_WheelsSpeedAndDirectionTest:
;SelfParkingCars.c,164 :: 		void WheelsSpeedAndDirectionTest()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,166 :: 		InitLeftWheelPWM_Timer4_CH1_PB6();
BL	_InitLeftWheelPWM_Timer4_CH1_PB6+0
;SelfParkingCars.c,167 :: 		InitRightWheelPWM_Timer9_CH1_PE5();
BL	_InitRightWheelPWM_Timer9_CH1_PE5+0
;SelfParkingCars.c,168 :: 		while(1)
L_WheelsSpeedAndDirectionTest4:
;SelfParkingCars.c,170 :: 		selectedWheel = wheelDirection;
MOVW	R0, #lo_addr(_wheelDirection+0)
MOVT	R0, #hi_addr(_wheelDirection+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_selectedWheel+0)
MOVT	R0, #hi_addr(_selectedWheel+0)
STRH	R1, [R0, #0]
;SelfParkingCars.c,171 :: 		Delay_ms(3000); //UpdateCurrentDuty(-500, selectedWheel);
MOVW	R7, #3582
MOVT	R7, #1831
NOP
NOP
L_WheelsSpeedAndDirectionTest6:
SUBS	R7, R7, #1
BNE	L_WheelsSpeedAndDirectionTest6
NOP
NOP
NOP
;SelfParkingCars.c,172 :: 		Delay_ms(3000); //UpdateCurrentDuty(500, selectedWheel);
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
;SelfParkingCars.c,175 :: 		if (wheelDirection)
MOVW	R0, #lo_addr(_wheelDirection+0)
MOVT	R0, #hi_addr(_wheelDirection+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_WheelsSpeedAndDirectionTest10
;SelfParkingCars.c,177 :: 		selectedWheel = !selectedWheel;
MOVW	R1, #lo_addr(_selectedWheel+0)
MOVT	R1, #hi_addr(_selectedWheel+0)
LDRSH	R0, [R1, #0]
CMP	R0, #0
MOVW	R0, #0
BNE	L__WheelsSpeedAndDirectionTest37
MOVS	R0, #1
L__WheelsSpeedAndDirectionTest37:
UXTB	R0, R0
STRH	R0, [R1, #0]
;SelfParkingCars.c,178 :: 		}
IT	AL
BAL	L_WheelsSpeedAndDirectionTest11
L_WheelsSpeedAndDirectionTest10:
;SelfParkingCars.c,182 :: 		wheelDirection = !wheelDirection;
MOVW	R1, #lo_addr(_wheelDirection+0)
MOVT	R1, #hi_addr(_wheelDirection+0)
LDRSH	R0, [R1, #0]
CMP	R0, #0
MOVW	R0, #0
BNE	L__WheelsSpeedAndDirectionTest38
MOVS	R0, #1
L__WheelsSpeedAndDirectionTest38:
UXTB	R0, R0
STRH	R0, [R1, #0]
;SelfParkingCars.c,183 :: 		}
L_WheelsSpeedAndDirectionTest11:
;SelfParkingCars.c,184 :: 		}
IT	AL
BAL	L_WheelsSpeedAndDirectionTest4
;SelfParkingCars.c,185 :: 		}
L_end_WheelsSpeedAndDirectionTest:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _WheelsSpeedAndDirectionTest
_WheelsSpeedTest:
;SelfParkingCars.c,187 :: 		void WheelsSpeedTest()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,189 :: 		Delay_ms(300);
MOVW	R7, #6910
MOVT	R7, #183
NOP
NOP
L_WheelsSpeedTest12:
SUBS	R7, R7, #1
BNE	L_WheelsSpeedTest12
NOP
NOP
NOP
;SelfParkingCars.c,190 :: 		InitLeftWheelPWM_Timer4_CH1_PB6();
BL	_InitLeftWheelPWM_Timer4_CH1_PB6+0
;SelfParkingCars.c,192 :: 		while(pwmDuty[LEFT_WHEEL]>0)
L_WheelsSpeedTest14:
MOVW	R0, #lo_addr(_pwmDuty+0)
MOVT	R0, #hi_addr(_pwmDuty+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	LE
BLE	L_WheelsSpeedTest15
;SelfParkingCars.c,194 :: 		UpdateCurrentDuty(-200, LEFT_WHEEL);
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #65336
SXTH	R0, R0
BL	_UpdateCurrentDuty+0
;SelfParkingCars.c,195 :: 		Delay_ms(350);
MOVW	R7, #40830
MOVT	R7, #213
NOP
NOP
L_WheelsSpeedTest16:
SUBS	R7, R7, #1
BNE	L_WheelsSpeedTest16
NOP
NOP
NOP
;SelfParkingCars.c,196 :: 		}
IT	AL
BAL	L_WheelsSpeedTest14
L_WheelsSpeedTest15:
;SelfParkingCars.c,197 :: 		}
L_end_WheelsSpeedTest:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _WheelsSpeedTest
_ServoPositionTest:
;SelfParkingCars.c,201 :: 		void ServoPositionTest()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,203 :: 		InitFrontServoPWM_Timer11_CH1_PB9();
BL	_InitFrontServoPWM_Timer11_CH1_PB9+0
;SelfParkingCars.c,204 :: 		InitBackServoPWM_Timer10_CH1_PB8();
BL	_InitBackServoPWM_Timer10_CH1_PB8+0
;SelfParkingCars.c,206 :: 		while(1)
L_ServoPositionTest18:
;SelfParkingCars.c,208 :: 		ChangeDuty[FRONT_SENSOR](sensorPositions[ServoPosition]);
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
;SelfParkingCars.c,209 :: 		ChangeDuty[BACK_SENSOR](sensorPositions[ServoPosition]);
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
;SelfParkingCars.c,210 :: 		Delay_ms(500);
MOVW	R7, #11518
MOVT	R7, #305
NOP
NOP
L_ServoPositionTest20:
SUBS	R7, R7, #1
BNE	L_ServoPositionTest20
NOP
NOP
NOP
;SelfParkingCars.c,211 :: 		ServoPosition=(ServoPosition+1)%15;
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
;SelfParkingCars.c,212 :: 		}
IT	AL
BAL	L_ServoPositionTest18
;SelfParkingCars.c,213 :: 		}
L_end_ServoPositionTest:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ServoPositionTest
_ExternInterruptTest:
;SelfParkingCars.c,215 :: 		void ExternInterruptTest()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;SelfParkingCars.c,217 :: 		GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_1);
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Input+0
;SelfParkingCars.c,218 :: 		GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_2);
MOVW	R1, #4
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Input+0
;SelfParkingCars.c,221 :: 		InitExternIntRisingEdge_PC1_PC2();
BL	_InitExternIntRisingEdge_PC1_PC2+0
;SelfParkingCars.c,222 :: 		}
L_end_ExternInterruptTest:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ExternInterruptTest
_main:
;SelfParkingCars.c,224 :: 		void main() {
SUB	SP, SP, #4
;SelfParkingCars.c,232 :: 		ExternInterruptTest();
BL	_ExternInterruptTest+0
;SelfParkingCars.c,233 :: 		WheelsSpeedAndDirectionTest();
BL	_WheelsSpeedAndDirectionTest+0
;SelfParkingCars.c,238 :: 		while(1);
L_main22:
IT	AL
BAL	L_main22
;SelfParkingCars.c,241 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
