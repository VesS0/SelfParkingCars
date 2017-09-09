#include "SelfParkingCars.h"

int pwmDuty[4];
unsigned int pwmPeriod[4];
int wheelInterruptCount[2]={ 200, 200 };
int stepsLeft = 0, stepsRight = 0;
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
       stepsRight++;
       if (stepsRight%10 == 0)
       {

       }
         /* if (!faza2) return;
      --wheelInterruptCount[LEFT_WHEEL];
      if (wheelInterruptCount[LEFT_WHEEL] <  0)
      {

         ChangeDuty[LEFT_WHEEL](0);
           // UpdateCurrentDuty(-2000, LEFT_WHEEL);
      }*/
}
double ratio = 1;
 void AdjustWheelsPWM(double distanceWheelLeft,double distanceWheelRight)
 {
      /*  if (distanceWheelLeft - distanceWheelRight > 5 || distanceWheelRight - distanceWheelLeft > 5)
        {     // 1.2/1 120% : 100%
              // 200 / 100
               ratio =distanceWheelLeft/distanceWheelRight;
              pwmDuty[LEFT_WHEEL]= pwmDuty[LEFT_WHEEL]*1/ratio;
              pwmDuty[RIGHT_WHEEL] = pwmDuty[RIGHT_WHEEL]*ratio
             ChangeDuty[LEFT_WHEEL](pwmDuty[LEFT_WHEEL]);
             ChangeDuty[RIGHT_WHEEL](pwmDuty[RIGHT_WHEEL]);
        } */
 }
void LeftWheel_Interrupt() iv IVT_INT_EXTI1 ics ICS_AUTO
{      EXTI_PR.B1 = 1;
       stepsLeft++;
       if (stepsLeft%5 == 0 )
       {
         // AdjustWheelsPWM(GetResultsInCM(merenje), GetResultsInCM(merenjee));
       }
        if (!faza2) return;
       --wheelInterruptCount[RIGHT_WHEEL];
      if (wheelInterruptCount[RIGHT_WHEEL] <  0)
      {
      ChangeDuty[RIGHT_WHEEL](0);
           // UpdateCurrentDuty(-2000,RIGHT_WHEEL );
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

// Sensors:
//
//   Position
//           90 degree    2ms    right
//           0 degrees    1.5ms  middle
//          -90 degrees   1ms    left

void InitBackServoPWM_Timer10_CH1_PB8()
{
     pwmPeriod[BACK_SENSOR] =  PWM_TIM10_Init(INITIAL_SENSOR_FREQUENCY);
     pwmDuty[BACK_SENSOR] = sensorPositions[0];
     ChangeDuty[BACK_SENSOR](pwmDuty[BACK_SENSOR]);
     PWM_TIM10_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM10_CH1_PB8);
}

void InitFrontServoPWM_Timer11_CH1_PB9()
{
     pwmPeriod[FRONT_SENSOR]  = PWM_TIM11_Init(INITIAL_SENSOR_FREQUENCY);
     pwmDuty[FRONT_SENSOR] = sensorPositions[0];
     ChangeDuty[FRONT_SENSOR](pwmDuty[FRONT_SENSOR]);  // 1ms = 6484 2 ms =   12 973
     PWM_TIM11_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM11_CH1_PB9);
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
   InitFrontServoPWM_Timer11_CH1_PB9();
   InitBackServoPWM_Timer10_CH1_PB8();

   while(1)
   {
       ChangeDuty[FRONT_SENSOR](sensorPositions[ServoPosition]);
       ChangeDuty[BACK_SENSOR](sensorPositions[ServoPosition]);
       Delay_ms(500);
       ServoPosition=(ServoPosition+1)%15;
    }
}

double GetResultsInCM(unsigned long distance)
{
       return distance/580.0;
}
 // Front Sensor
 // Echo PC4, Trigger PC11
 // Back Sensor
 // Echo PC3
unsigned long merenje, merenjee;
char buf[5];
  // https://cdn.sparkfun.com/datasheets/Sensors/Proximity/HCSR04.pdf
  // uS / 58 = centimeters
// Timer 2 is used (uses unsigned long - 32 bits)
void Timer()
{
  RCC_APB1ENR.TIM2EN = 1;
  TIM2_CR1.CEN = 0;
  TIM2_PSC = 5; // Prescaller     (120 Mhz / prescaller+1 represents frequency of Timer calls)
  TIM2_ARR = 65535;
}

 double rez, rez2 ;
void ExtInt4() iv IVT_INT_EXTI4 ics ICS_AUTO {
  EXTI_PR.B4 = 1;                     // clear flag
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
       /*sprintf(buf,"%lf",rez);
       UART3_Write_Text(buf);
       UART3_Write(13);
       UART3_Write(10); */

  }
}

void ExtInt3() iv IVT_INT_EXTI3 ics ICS_AUTO {
  EXTI_PR.B3 = 1;                     // clear flag
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
       /*sprintf(buf,"Prednji: %3.4lf Zadnji: %3.4lf",rez, rez2);
       UART3_Write_Text(buf);
       UART3_Write(13);
       UART3_Write(10); */
    if (rez-rez2> 10 || rez2-rez>10)
    {
     faza2=1;
    }
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
 void AightRightSensors()
 {
   InitFrontServoPWM_Timer11_CH1_PB9();
   InitBackServoPWM_Timer10_CH1_PB8();

       ChangeDuty[FRONT_SENSOR](sensorPositions[10]);
       ChangeDuty[BACK_SENSOR](sensorPositions[2]);
 }

void TriggerFrontSensorMeasurement()
{
     ODR10_GPIOD_ODR_bit = 1;
     Delay_us(10);
     ODR10_GPIOD_ODR_bit = 0;
     Delay_ms(60);
}

void TriggerBackSensorMeasurement()
{
     ODR11_GPIOD_ODR_bit = 1;
     Delay_us(10);
     ODR11_GPIOD_ODR_bit = 0;
     Delay_ms(60);
}

// Initializes sensors and servo motors that are used to rotate sensors
void InitializeSensors()
{
     // Initialize servo motors rotating sensors
     InitBackServoPWM_Timer10_CH1_PB8()
     InitFrontServoPWM_Timer11_CH1_PB9();
     
     // Initialize pins for triggering measurements
     GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_11); // Front sensor Trigger: PD11
     GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_10); // Back sensor Trigger : PD10
     
     // Initialize Echo pins for receiving measurements from sensors
     GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_3); // Back sensor Echo : PC3
     GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_4); // Front sensor Echo: PC4
     
     // Enable interrupts from echo channels
     SYSCFGEN_bit = 1;
     //                  Back Sensor | Front Sensor
     // Pin:             PC3         | PC4
     EXTI_RTSR |=        0x8         | 0x10;              // Set interrupt on Rising edge
     EXTI_FTSR |=        0x8         | 0x10;              // Set interrupt on Falling edge
     EXTI_IMR |=         0x8         | 0x10;              // Set mask
     SYSCFG_EXTICR1 |=   0x2000;       SYSCFG_EXTICR2 |= 0x2;
     NVIC_IntEnable(IVT_INT_EXTI3);    NVIC_IntEnable(IVT_INT_EXTI4);
}

void main() {
      InitializeSensors();
      GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_15); // Led
      ODR15_GPIOE_ODR_bit = 1;

  InitExternIntRisingEdge_PC1_PC2();
  // UART3_Init_Advanced(115200, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART3_PB10_11);
  Delay_ms(100);
        InitLeftWheelPWM_Timer4_CH1_PB6();
       InitRightWheelPWM_Timer9_CH1_PE5();
  wheelInterruptCount[0]=20; wheelInterruptCount[1]=20;
  Timer();


  // EnableInterrupts();                  // Enables the processor interrupt.

    AightRightSensors();

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

     while(1);


}