#line 1 "C:/Users/Jelena/Desktop/SelfParkingCars/Sensors.c"
#line 1 "c:/users/jelena/desktop/selfparkingcars/sensors.h"



 void InitializeSensors();
 void AlignRightSensors();
 void RotateFrontSensorFront();
 void TriggerFrontSensorMeasurement();
 void TriggerBackSensorMeasurement();
 double GetFrontSensorDistance();
 double GetBackSensorDistance();
#line 1 "c:/users/jelena/desktop/selfparkingcars/selfparkingcars.h"
#line 22 "c:/users/jelena/desktop/selfparkingcars/selfparkingcars.h"
static int pwmDuty[4];
static unsigned int pwmPeriod[4];
static int wheelInterruptCount[2]={ 200, 200 };
static int stepsLeft = 0, stepsRight = 0;




static const unsigned int sensorPositions[15] = { 2604, 2929, 3255, 3581, 3907, 4232, 4558, 4883,
 5208, 5534, 5859, 6185, 6510, 6836, 7161 };


typedef void (*DutyChangeFunctionPtr)(unsigned int);


static void PWM_TIM4_Set_Duty_Wrapper(unsigned int ratio) {
 PWM_TIM4_Set_Duty(ratio, _PWM_INVERTED, _PWM_CHANNEL1);
}


static void PWM_TIM9_Set_Duty_Wrapper(unsigned int ratio) {
 PWM_TIM9_Set_Duty(ratio, _PWM_INVERTED, _PWM_CHANNEL1);
}


static void PWM_TIM10_Set_Duty_Wrapper(unsigned int ratio) {
 PWM_TIM10_Set_Duty(ratio, _PWM_NON_INVERTED, _PWM_CHANNEL1);
}


static void PWM_TIM11_Set_Duty_Wrapper(unsigned int ratio) {
 PWM_TIM11_Set_Duty(ratio, _PWM_NON_INVERTED, _PWM_CHANNEL1);
}

static DutyChangeFunctionPtr ChangeDuty[4] = { &PWM_TIM4_Set_Duty_Wrapper, &PWM_TIM9_Set_Duty_Wrapper,
 &PWM_TIM10_Set_Duty_Wrapper, &PWM_TIM11_Set_Duty_Wrapper };
#line 4 "C:/Users/Jelena/Desktop/SelfParkingCars/Sensors.c"
 void RotateFrontSensorFront()
 {
 ChangeDuty[ 3 ](sensorPositions[12]);
 }

 void AlignRightSensors()
 {
 ChangeDuty[ 2 ](sensorPositions[10]);
 ChangeDuty[ 3 ](sensorPositions[2]);
 }
void TriggerFrontSensorMeasurement()
{
 ODR10_GPIOD_ODR_bit = 1;
 Delay_us(40);
 ODR10_GPIOD_ODR_bit = 0;
 Delay_ms(60);
}

void TriggerBackSensorMeasurement()
{
 ODR11_GPIOD_ODR_bit = 1;
 Delay_us(40);
 ODR11_GPIOD_ODR_bit = 0;
 Delay_ms(60);
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




unsigned long merenje, merenjee;
char buf[5];



void Timer()
{
 RCC_APB1ENR.TIM2EN = 1;
 TIM2_CR1.CEN = 0;
 TIM2_PSC = 5;
 TIM2_ARR = 65535;
}

void InitializeSensors()
{
 Timer();

 InitBackServoPWM_Timer10_CH1_PB8();
 InitFrontServoPWM_Timer11_CH1_PB9();


 GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_11);
 GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_10);


 GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_3);
 GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_4);


 SYSCFGEN_bit = 1;


 EXTI_RTSR |= 0x8 | 0x10;
 EXTI_FTSR |= 0x8 | 0x10;
 EXTI_IMR |= 0x8 | 0x10;
 SYSCFG_EXTICR1 |= 0x2000; SYSCFG_EXTICR2 |= 0x2;
 NVIC_IntEnable(IVT_INT_EXTI3); NVIC_IntEnable(IVT_INT_EXTI4);
}
double GetResultsInCM(unsigned long distance)
{
 return distance/580.0;
}
 double rez, rez2 ;

 double GetFrontSensorDistance()
 {
 return rez2;
 }
 double GetBackSensorDistance()
 {
 return rez;
 }

void FrontSensorEcho() iv IVT_INT_EXTI4 ics ICS_AUTO {
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
 rez2 = GetResultsInCM(merenje);
#line 131 "C:/Users/Jelena/Desktop/SelfParkingCars/Sensors.c"
 }
}

void BackSensorEcho() iv IVT_INT_EXTI3 ics ICS_AUTO {
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
#line 152 "C:/Users/Jelena/Desktop/SelfParkingCars/Sensors.c"
 }
}
