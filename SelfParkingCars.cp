#line 1 "C:/Users/Jelena/Desktop/SelfParkingCars/SelfParkingCars.c"
#line 1 "c:/users/jelena/desktop/selfparkingcars/selfparkingcars.h"
#line 20 "c:/users/jelena/desktop/selfparkingcars/selfparkingcars.h"
static const unsigned int sensorPositions[15] = { 2604, 2929, 3255, 3581, 3907, 4232, 4558, 4883,
 5208, 5534, 5859, 6185, 6510, 6836, 7161 };

sbit SpinDirectionLeftWheel at ODR6_GPIOA_ODR_bit;
sbit SpinDirectionRightWheel at ODR7_GPIOA_ODR_bit;


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
#line 3 "C:/Users/Jelena/Desktop/SelfParkingCars/SelfParkingCars.c"
DutyChangeFunctionPtr ChangeDuty[4] = { &PWM_TIM4_Set_Duty_Wrapper, &PWM_TIM9_Set_Duty_Wrapper,
 &PWM_TIM10_Set_Duty_Wrapper, &PWM_TIM11_Set_Duty_Wrapper };
int pwmDuty[4];
unsigned int pwmPeriod[4];
int wheelInterruptCount[2]={ 200, 200 };
int faza2 = 0;
int stepsLeft = 0, stepsRight = 0;






void InitExternIntRisingEdge_PC1_PC2()
{
 GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_1);
 GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_2);
 GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_12);
 SYSCFGEN_bit = 1;
 SYSCFG_EXTICR1 |=  0x00000020  |  0x00000200 ;
 EXTI_RTSR |=  0x00000002  |  0x00000004 ;
 EXTI_FTSR |=  0x00000002  |  0x00000004 ;
 EXTI_IMR |=  0x00000002  |  0x00000004 ;
 NVIC_IntEnable(IVT_INT_EXTI1);
 NVIC_IntEnable(IVT_INT_EXTI2);
}
void UpdateCurrentDuty(int,int);

void RightWheel_Interrupt() iv IVT_INT_EXTI2 ics ICS_AUTO
{ EXTI_PR.B2 = 1;
 stepsRight++;
 if (stepsRight%10 == 0)
 {

 }
#line 46 "C:/Users/Jelena/Desktop/SelfParkingCars/SelfParkingCars.c"
}
double ratio = 1;
 void AdjustWheelsPWM(double distanceWheelLeft,double distanceWheelRight)
 {
#line 59 "C:/Users/Jelena/Desktop/SelfParkingCars/SelfParkingCars.c"
 }
void LeftWheel_Interrupt() iv IVT_INT_EXTI1 ics ICS_AUTO
{ EXTI_PR.B1 = 1;
 stepsLeft++;
 if (stepsLeft%5 == 0 )
 {

 }
 if (!faza2) return;
 --wheelInterruptCount[ 1 ];
 if (wheelInterruptCount[ 1 ] < 0)
 {
 ChangeDuty[ 1 ](0);

 }
}





void InitLeftWheelPWM_Timer4_CH1_PB6()
{
 GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_6);
 SpinDirectionLeftWheel =  1 ;

 pwmPeriod[ 0 ] = PWM_TIM4_Init(50000) ;
 pwmDuty[ 0 ] = pwmPeriod[ 0 ]-700;
 ChangeDuty[ 0 ](pwmDuty[ 0 ]);
 PWM_TIM4_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM4_CH1_PB6);
}

void InitRightWheelPWM_Timer9_CH1_PE5()
{
 GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_7);
 SpinDirectionRightWheel =  1 ;

 pwmPeriod[ 1 ] = PWM_TIM9_Init(25000);
 pwmDuty[ 1 ] = pwmPeriod[ 1 ]-1400;
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
 Delay_ms(2000);

 InitRightWheelPWM_Timer9_CH1_PE5();
 while(pwmDuty[ 1 ]>0)
 {
 UpdateCurrentDuty(50,  1 );
 Delay_ms(250);
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

double GetResultsInCM(unsigned long distance)
{
 return distance/580.0;
}




unsigned long merenje, merenjee;
char buf[5];



void Timer()
{
 RCC_APB1ENR.TIM2EN = 1;
 TIM2_CR1.CEN = 0;
 TIM2_PSC = 5;
 TIM2_ARR = 65535;
}

 double rez, rez2 ;
void ExtInt4() iv IVT_INT_EXTI4 ics ICS_AUTO {
 EXTI_PR.B4 = 1;
 ODR15_GPIOE_ODR_bit = 0;
 if(IDR4_GPIOC_IDR_bit == 1)
 {
 TIM2_CR1.CEN = 1;
 };

 if(IDR4_GPIOC_IDR_bit == 0)
 {
 TIM2_CR1.CEN = 0;
 merenje = TIM2_CNT;
 TIM2_CNT = 0;
 if (merenje >= 4000)
 {
 ODR15_GPIOE_ODR_bit = 0;
 }
 rez = GetResultsInCM(merenje);
#line 240 "C:/Users/Jelena/Desktop/SelfParkingCars/SelfParkingCars.c"
 }
}

void ExtInt3() iv IVT_INT_EXTI3 ics ICS_AUTO {
 EXTI_PR.B3 = 1;
 ODR15_GPIOE_ODR_bit = 0;
 if(IDR3_GPIOC_IDR_bit == 1)
 {
 TIM2_CR1.CEN = 1;
 };

 if(IDR3_GPIOC_IDR_bit == 0)
 {
 TIM2_CR1.CEN = 0;
 merenjee = TIM2_CNT;
 TIM2_CNT = 0;
 rez = GetResultsInCM(merenjee);
 rez2 = GetResultsInCM(merenje);
#line 262 "C:/Users/Jelena/Desktop/SelfParkingCars/SelfParkingCars.c"
 if (rez-rez2> 10 || rez2-rez>10)
 {
 faza2=1;
 }
 }
}
void SpinAndBack()
{
 Delay_ms(3000);
 ChangeDuty[ 1 ](0);
 ChangeDuty[ 0 ](0);
 SpinDirectionLeftWheel = ~SpinDirectionLeftWheel;
 Delay_ms(3000);
 ChangeDuty[ 1 ](pwmDuty[ 1 ]);
 ChangeDuty[ 0 ](pwmDuty[ 0 ]);
 Delay_ms(3000);
 ChangeDuty[ 1 ](0);
 ChangeDuty[ 0 ](0);
}
 void AightSensors()
 {
 InitFrontServoPWM_Timer11_CH1_PB9();
 InitBackServoPWM_Timer10_CH1_PB8();

 ChangeDuty[ 2 ](sensorPositions[10]);
 ChangeDuty[ 3 ](sensorPositions[2]);
 }

 void poravnaj()
 {

 }
void main() {
 GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_10);
 GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_15);
 GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_11);
 GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_4);
 GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_3);
 InitExternIntRisingEdge_PC1_PC2();

 Delay_ms(100);
 InitLeftWheelPWM_Timer4_CH1_PB6();
 InitRightWheelPWM_Timer9_CH1_PE5();
 wheelInterruptCount[0]=20; wheelInterruptCount[1]=20;
 Timer();
 SYSCFGEN_bit = 1;
 SYSCFG_EXTICR2 |= 0x000000002;
 EXTI_RTSR |= 0x00000010;
 EXTI_FTSR |= 0x00000010;
 EXTI_IMR |= 0x00000010;
 NVIC_IntEnable(IVT_INT_EXTI4);
 SYSCFG_EXTICR1 |= 0x00002000;
 EXTI_RTSR |= 0x00000008;
 EXTI_FTSR |= 0x00000008;
 EXTI_IMR |= 0x00000008;
 NVIC_IntEnable(IVT_INT_EXTI3);


 ODR15_GPIOE_ODR_bit = 1;
 AightSensors();


 while(1) {
 ODR10_GPIOD_ODR_bit = 1;
 Delay_us(40);
 ODR10_GPIOD_ODR_bit = 0;
 Delay_ms(60);

 ODR11_GPIOD_ODR_bit = 1;
 Delay_us(40);
 ODR11_GPIOD_ODR_bit = 0;
 Delay_ms(60);
 }
#line 355 "C:/Users/Jelena/Desktop/SelfParkingCars/SelfParkingCars.c"
 while(1);


}
