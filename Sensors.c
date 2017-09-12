#include "Sensors.h"
#include "SelfParkingCars.h"

 void RotateFrontSensorFront()
 {
      ChangeDuty[BACK_SENSOR](sensorPositions[12]);
 }
 
 void AlignRightSensors()
 {
       ChangeDuty[FRONT_SENSOR](sensorPositions[10]);
       ChangeDuty[BACK_SENSOR](sensorPositions[2]);
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
// Sensors:
//
//   Position
//           90 degree    2ms    right
//           0 degrees    1.5ms  middle
//          -90 degrees   1ms    left
// for servos http://akizukidenshi.com/download/ds/towerpro/SG90.pdf
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
  TIM2_PSC = 5; // Prescaller+1    (120 Mhz / prescaller+1 represents frequency of Timer calls)
  TIM2_ARR = 65535;
}
// Initializes sensors and servo motors that are used to rotate sensors
void InitializeSensors()
{
      Timer();
     // Initialize servo motors rotating sensors
     InitBackServoPWM_Timer10_CH1_PB8();
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
      rez2 = GetResultsInCM(merenje);


  }
}

void BackSensorEcho() iv IVT_INT_EXTI3 ics ICS_AUTO {
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

  }
}