#line 1 "C:/Users/Jelena/Desktop/SelfParkingCars/SelfParkingCars.c"
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
#line 1 "c:/users/jelena/desktop/selfparkingcars/sensors.h"



 void InitializeSensors();
 void AlignRightSensors();
 void RotateFrontSensorFront();
 void TriggerFrontSensorMeasurement();
 void TriggerBackSensorMeasurement();
 double GetFrontSensorDistance();
 double GetBackSensorDistance();
#line 4 "C:/Users/Jelena/Desktop/SelfParkingCars/SelfParkingCars.c"
sbit SpinDirectionLeftWheel at ODR6_GPIOA_ODR_bit;
sbit SpinDirectionRightWheel at ODR7_GPIOA_ODR_bit;
volatile int startCounting = 0;
volatile int leftWheelStopped = 0, rightWheelStopped = 0;






void InitExternIntRisingEdge_PC1_PC2()
{
 GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_1);
 GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_2);

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
 if (!startCounting) return;
 --wheelInterruptCount[ 0 ];
 if (wheelInterruptCount[ 0 ] < 0)
 {
 ChangeDuty[ 0 ](0);
 rightWheelStopped = 1;
 }
}

void LeftWheel_Interrupt() iv IVT_INT_EXTI1 ics ICS_AUTO
{ EXTI_PR.B1 = 1;
 if (!startCounting) return;

 --wheelInterruptCount[ 1 ];
 if (wheelInterruptCount[ 1 ] < 0)
 {
 ChangeDuty[ 1 ](0);
 leftWheelStopped = 1;
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
 while(1)
 {
 ChangeDuty[ 2 ](sensorPositions[ServoPosition]);
 ChangeDuty[ 3 ](sensorPositions[ServoPosition]);
 Delay_ms(500);
 ServoPosition=(ServoPosition+1)%15;
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

void StopWheels()
{
 ChangeDuty[ 0 ](0);
 ChangeDuty[ 1 ](0);
}

void StartWheels()
{
 ChangeDuty[ 1 ](pwmDuty[ 1 ]);
 ChangeDuty[ 0 ](pwmDuty[ 0 ]);
}

void DriveWhileParkingNotSpotted()
{
 TriggerFrontSensorMeasurement();
 TriggerBackSensorMeasurement();

 while((GetFrontSensorDistance() - GetBackSensorDistance()) < 15)
 {
 if (GetBackSensorDistance() - GetFrontSensorDistance() > 15) break;
 TriggerFrontSensorMeasurement();
 TriggerBackSensorMeasurement();
 }
 Delay_ms(700);
 StopWheels();
}

void RotateFor90Right()
{
 leftWheelStopped = 0;
 rightWheelStopped = 0;
 SpinDirectionLeftWheel =  0 ;
 SpinDirectionRightWheel =  1 ;
 wheelInterruptCount[0]=65;
 wheelInterruptCount[1]=65;
 startCounting = 1;
 StartWheels();
 while (leftWheelStopped == 0 || rightWheelStopped == 0);
}

void DriveUntillWall()
{
 Delay_ms(100);
 SpinDirectionLeftWheel =  1 ;
 SpinDirectionRightWheel =  1 ;
 startCounting = 0;
 TriggerFrontSensorMeasurement();
 StartWheels();


 while (GetFrontSensorDistance() > 4.0)
 {
 TriggerFrontSensorMeasurement();
 }

 StopWheels();
}

 void InitializeWheels()
 {
 InitLeftWheelPWM_Timer4_CH1_PB6();
 InitRightWheelPWM_Timer9_CH1_PE5();
 InitExternIntRisingEdge_PC1_PC2();
 }

void main() {



 InitializeSensors();
 AlignRightSensors();
 Delay_ms(3000);
 InitializeWheels();
 DriveWhileParkingNotSpotted();
 RotateFor90Right();
 RotateFrontSensorFront();
 DriveUntillWall();
 RotateFor90Right();

 while(1);
#line 253 "C:/Users/Jelena/Desktop/SelfParkingCars/SelfParkingCars.c"
}
