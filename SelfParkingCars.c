#include "SelfParkingCars.h"
#include "Sensors.h"

sbit SpinDirectionLeftWheel at ODR6_GPIOA_ODR_bit;
sbit SpinDirectionRightWheel at ODR7_GPIOA_ODR_bit;
volatile int startCounting = 0;
volatile int leftWheelStopped = 0, rightWheelStopped = 0;
//          ***   Initialization   ***

// Interrupts
// PC1 for right wheel
// PC2 for left wheel

void InitExternIntRisingEdge_PC1_PC2()
{
     GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_1);
     GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_2);
     GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_12);
     SYSCFGEN_bit = 1;
     SYSCFG_EXTICR1 |= LEFT_WHEEL_EXT_INT_CR1_PC1 | RIGHT_WHEEL_EXT_INT_CR1_PC2;
     EXTI_RTSR |= RISING_TRIGGER_PC1 | RISING_TRIGGER_PC2;
     EXTI_FTSR |= RISING_TRIGGER_PC1 | RISING_TRIGGER_PC2;
     EXTI_IMR  |=  RISING_TRIGGER_PC1 |  RISING_TRIGGER_PC2;
     NVIC_IntEnable(IVT_INT_EXTI1);
     NVIC_IntEnable(IVT_INT_EXTI2);
}

void UpdateCurrentDuty(int,int);

void RightWheel_Interrupt() iv IVT_INT_EXTI2 ics ICS_AUTO
{      EXTI_PR.B2 = 1;
       if (!startCounting) return;
      --wheelInterruptCount[LEFT_WHEEL];
      if (wheelInterruptCount[LEFT_WHEEL] <  0)
      {
         ChangeDuty[LEFT_WHEEL](0);
         rightWheelStopped = 1;
      }
}

void LeftWheel_Interrupt() iv IVT_INT_EXTI1 ics ICS_AUTO
{      EXTI_PR.B1 = 1;
       if (!startCounting) return;
       
       --wheelInterruptCount[RIGHT_WHEEL];
      if (wheelInterruptCount[RIGHT_WHEEL] <  0)
      {
         ChangeDuty[RIGHT_WHEEL](0);
         leftWheelStopped = 1;
      }
}

// Wheels
// Decoder: CD4555B
// Decoder uses Inverted input for enable

void InitLeftWheelPWM_Timer4_CH1_PB6()
{
     GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_6);
     SpinDirectionLeftWheel = FORWARD_SPIN;    // Default forward spin

     pwmPeriod[LEFT_WHEEL] =  PWM_TIM4_Init(50000) ; // Work on frequency 20-35 Khz
     pwmDuty[LEFT_WHEEL] = pwmPeriod[LEFT_WHEEL]-700; // -750;// - 1000 ;
     ChangeDuty[LEFT_WHEEL](pwmDuty[LEFT_WHEEL]);
     PWM_TIM4_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM4_CH1_PB6);
}

void InitRightWheelPWM_Timer9_CH1_PE5()
{
     GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_7);
     SpinDirectionRightWheel = FORWARD_SPIN;    // Default forward spin

     pwmPeriod[RIGHT_WHEEL] =  PWM_TIM9_Init(25000);
     pwmDuty[RIGHT_WHEEL] = pwmPeriod[RIGHT_WHEEL]-1400;//-1500;//-1650;//      27.44 us from 39.88 us (slow)
     ChangeDuty[RIGHT_WHEEL](pwmDuty[RIGHT_WHEEL]);
     PWM_TIM9_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM9_CH1_PE5);
}

 //          ***   Helper functions   ***
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


//          ***   Tests   ***
int selectedWheel = RIGHT_WHEEL;
int wheelDirection = FORWARD_SPIN;
void WheelsSpeedAndDirectionTest()
{
  InitLeftWheelPWM_Timer4_CH1_PB6();
  InitRightWheelPWM_Timer9_CH1_PE5();
  while(1)
  {
        selectedWheel = wheelDirection;
        Delay_ms(3000); //UpdateCurrentDuty(-500, selectedWheel);
        Delay_ms(3000); //UpdateCurrentDuty(500, selectedWheel);

        // When one wheel has spinned both directions, change wheel
        if (wheelDirection)
        {
           selectedWheel = !selectedWheel;
        }
        else
        {
           // Change direction of spinning
           wheelDirection = !wheelDirection;
        }
  }
}

void WheelsSpeedTest()
{
   Delay_ms(2000);
   // InitLeftWheelPWM_Timer4_CH1_PB6();
   InitRightWheelPWM_Timer9_CH1_PE5();
   while(pwmDuty[RIGHT_WHEEL]>0)
   {
        UpdateCurrentDuty(50, RIGHT_WHEEL);           //left range 2290
        Delay_ms(250);
   }
}

int ServoPosition = 0;

void ServoPositionTest()
{
   while(1)
   {
       ChangeDuty[FRONT_SENSOR](sensorPositions[ServoPosition]);
       ChangeDuty[BACK_SENSOR](sensorPositions[ServoPosition]);
       Delay_ms(500);
       ServoPosition=(ServoPosition+1)%15;
    }
}

void SpinAndBack()
{
         Delay_ms(3000);
         ChangeDuty[RIGHT_WHEEL](0);
         ChangeDuty[LEFT_WHEEL](0);
          SpinDirectionLeftWheel = ~SpinDirectionLeftWheel;
         Delay_ms(3000);
         ChangeDuty[RIGHT_WHEEL](pwmDuty[RIGHT_WHEEL]);
         ChangeDuty[LEFT_WHEEL](pwmDuty[LEFT_WHEEL]);
         Delay_ms(3000);
         ChangeDuty[RIGHT_WHEEL](0);
         ChangeDuty[LEFT_WHEEL](0);
}

void StopWheels()
{
     ChangeDuty[LEFT_WHEEL](0);
     ChangeDuty[RIGHT_WHEEL](0);
}

void StartWheels()
{
     ChangeDuty[RIGHT_WHEEL](pwmDuty[RIGHT_WHEEL]);
     ChangeDuty[LEFT_WHEEL](pwmDuty[LEFT_WHEEL]);
}

void DriveWhileParkingNotSpotted()
{
     ODR15_GPIOE_ODR_bit = 1;
     TriggerFrontSensorMeasurement();
     TriggerBackSensorMeasurement();
      
      while(GetFrontSensorDistance() - GetBackSensorDistance() < 15)
      {
            TriggerFrontSensorMeasurement();
            TriggerBackSensorMeasurement();
      }
      ODR15_GPIOE_ODR_bit = 0;
      Delay_ms(400);
      StopWheels();
}

void RotateFor90Right()
{
     leftWheelStopped = 0;
     rightWheelStopped = 0;
     SpinDirectionLeftWheel = BACKWARD_SPIN;
     SpinDirectionRightWheel = FORWARD_SPIN;
     wheelInterruptCount[0]=65;
     wheelInterruptCount[1]=65;
     startCounting = 1;
     StartWheels();
     while (leftWheelStopped == 0 || rightWheelStopped == 0);
}

void DriveUntillWall()
{
     Delay_ms(100);
     SpinDirectionLeftWheel = FORWARD_SPIN;
     SpinDirectionRightWheel = FORWARD_SPIN;
     startCounting = 0;
     TriggerFrontSensorMeasurement();
     StartWheels();

     ODR15_GPIOE_ODR_bit = 1;
     while (GetFrontSensorDistance() > 4.0)
     {
           TriggerFrontSensorMeasurement();
     }
     ODR15_GPIOE_ODR_bit = 0;
     StopWheels();
}

 void InitializeWheels()
 {
      InitLeftWheelPWM_Timer4_CH1_PB6();
      InitRightWheelPWM_Timer9_CH1_PE5();
      InitExternIntRisingEdge_PC1_PC2();
 }

void main() {
      GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_15); // Led
      ODR15_GPIOE_ODR_bit = 0;
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
      // Tests
        // WheelsSpeedTest();

        // InitLeftWheelPWM_Timer4_CH1_PB6();
        // InitRightWheelPWM_Timer9_CH1_PE5();
         //PWM_TIM4_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM4_CH1_PB6);
         //PWM_TIM9_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM9_CH1_PE5);
        // InitExternIntRisingEdge_PC1_PC2();
        // SpinAndBack();
       // WheelsSpeedAndDirectionTest();
     // InitRightWheelPWM_Timer9_CH1_PE5();
     // WheelsSpeedTest();
     // ServoPositionTest();
}