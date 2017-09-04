#line 1 "C:/Users/Jelena/Desktop/SelfParkingCars/SelfParkingCars.c"
#line 21 "C:/Users/Jelena/Desktop/SelfParkingCars/SelfParkingCars.c"
sbit SpinDirectionLeftWheel at ODR6_GPIOA_ODR_bit;
sbit SpinDirectionRightWheel at ODR7_GPIOA_ODR_bit;


static const unsigned int sensorPositions[15] = { 2604, 2929, 3255, 3581, 3907, 4232, 4558, 4883,
 5208, 5534, 5859, 6185, 6510, 6836, 7161 };



typedef void (*DutyChangeFunctionPtr)(unsigned int);


void PWM_TIM4_Set_Duty_Wrapper(unsigned int ratio) {
 PWM_TIM4_Set_Duty(ratio, _PWM_INVERTED, _PWM_CHANNEL1);
}


void PWM_TIM9_Set_Duty_Wrapper(unsigned int ratio) {
 PWM_TIM9_Set_Duty(ratio, _PWM_INVERTED, _PWM_CHANNEL1);
}


void PWM_TIM10_Set_Duty_Wrapper(unsigned int ratio) {
 PWM_TIM10_Set_Duty(ratio, _PWM_NON_INVERTED, _PWM_CHANNEL1);
}


void PWM_TIM11_Set_Duty_Wrapper(unsigned int ratio) {
 PWM_TIM11_Set_Duty(ratio, _PWM_NON_INVERTED, _PWM_CHANNEL1);
}

DutyChangeFunctionPtr ChangeDuty[4] = { &PWM_TIM4_Set_Duty_Wrapper, &PWM_TIM9_Set_Duty_Wrapper,
 &PWM_TIM10_Set_Duty_Wrapper, &PWM_TIM11_Set_Duty_Wrapper };
int pwmDuty[4];
unsigned int pwmPeriod[4];
int wheelInterruptCount[2]={ 600, 200 };







void InitExternIntRisingEdge_PC1_PC2()
{
 SYSCFGEN_bit = 1;
 SYSCFG_EXTICR1 =  0x00000020  |  0x00000200 ;
 EXTI_RTSR |=  0x00000002  |  0x00000004 ;
 EXTI_FTSR |=  0x00000002  |  0x00000004 ;
 EXTI_IMR |=  0x00000002  |  0x00000004 ;
 NVIC_IntEnable(IVT_INT_EXTI1);
 NVIC_IntEnable(IVT_INT_EXTI2);
}
void UpdateCurrentDuty(int,int);

void RightWheel_Interrupt() iv IVT_INT_EXTI2 ics ICS_AUTO
{ EXTI_PR.B1 = 1;

 --wheelInterruptCount[ 0 ];
 if (wheelInterruptCount[ 0 ] < 0)
 {
 UpdateCurrentDuty(-4000,  1 );
 }
}

void LeftWheel_Interrupt() iv IVT_INT_EXTI1 ics ICS_AUTO
{ EXTI_PR.B2 = 1;

 --wheelInterruptCount[ 1 ];
 if (wheelInterruptCount[ 1 ] < 0)
 {
 UpdateCurrentDuty(-4000,  0 );
 }
}





void InitLeftWheelPWM_Timer4_CH1_PB6()
{
 GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_6);
 SpinDirectionLeftWheel =  0 ;

 pwmPeriod[ 0 ] = PWM_TIM4_Init( 25000 ) ;
 pwmDuty[ 0 ] = pwmPeriod[ 0 ] - 1250;
 ChangeDuty[ 0 ](pwmDuty[ 0 ]);
 PWM_TIM4_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM4_CH1_PB6);
}

void InitRightWheelPWM_Timer9_CH1_PE5()
{
 GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_7);
 SpinDirectionRightWheel =  1 ;

 pwmPeriod[ 1 ] = PWM_TIM9_Init( 25000 );
 pwmDuty[ 1 ] = pwmPeriod[ 1 ] - 1250;
 ChangeDuty[ 1 ](pwmDuty[ 1 ]);
 PWM_TIM9_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM9_CH1_PE5);
}








void InitBackServoPWM_Timer10_CH1_PB8()
{
 pwmPeriod[ 3 ] = PWM_TIM10_Init( 50 );
 pwmDuty[ 3 ] = sensorPositions[0];
 ChangeDuty[ 3 ](pwmDuty[ 3 ]);
 PWM_TIM10_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM10_CH1_PB8);
}

void InitFrontServoPWM_Timer11_CH1_PB9()
{
 pwmPeriod[ 2 ] = PWM_TIM11_Init( 50 );
 pwmDuty[ 2 ] = sensorPositions[0];
 ChangeDuty[ 2 ](pwmDuty[ 2 ]);
 PWM_TIM11_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM11_CH1_PB9);
}


void UpdateCurrentDuty(int updateFor, int component)
{
 if (pwmDuty[component]+ updateFor < 0)
 {
 pwmDuty[component] = 0;
 }
 else
 {
 pwmDuty[component] += updateFor;
 }

 ChangeDuty[component](pwmDuty[component]);
}



int selectedWheel =  1 ;
int wheelDirection =  1 ;
void WheelsSpeedAndDirectionTest()
{
 InitLeftWheelPWM_Timer4_CH1_PB6();
 InitRightWheelPWM_Timer9_CH1_PE5();
 while(1)
 {
 selectedWheel = wheelDirection;
 Delay_ms(3000);
 Delay_ms(3000);


 if (wheelDirection)
 {
 selectedWheel = !selectedWheel;
 }
 else
 {

 wheelDirection = !wheelDirection;
 }
 }
}

void WheelsSpeedTest()
{
 Delay_ms(300);
 InitLeftWheelPWM_Timer4_CH1_PB6();

 while(pwmDuty[ 0 ]>0)
 {
 UpdateCurrentDuty(-200,  0 );
 Delay_ms(350);
 }
}

int ServoPosition = 0;

void ServoPositionTest()
{
 InitFrontServoPWM_Timer11_CH1_PB9();
 InitBackServoPWM_Timer10_CH1_PB8();

 while(1)
 {
 ChangeDuty[ 2 ](sensorPositions[ServoPosition]);
 ChangeDuty[ 3 ](sensorPositions[ServoPosition]);
 Delay_ms(500);
 ServoPosition=(ServoPosition+1)%15;
 }
}

void ExternInterruptTest()
{
 GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_1);
 GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_2);


 InitExternIntRisingEdge_PC1_PC2();
}

void main() {







 ExternInterruptTest();
 WheelsSpeedAndDirectionTest();




 while(1);


}