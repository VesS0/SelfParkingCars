#define LEFT_WHEEL 0
#define RIGHT_WHEEL 1
#define FRONT_SENSOR 2
#define BACK_SENSOR 3

#define FORWARD_SPIN_RIGHT 1
#define BACKWARD_SPIN_RIGHT 0
#define FORWARD_SPIN_LEFT 0
#define BACKWARD_SPIN_LEFT 1

#define INITIAL_SENSOR_FREQUENCY 50
#define INITIAL_MOTOR_FREQUENCY 25000

#define ENABLE_CLOCK 1
#define LEFT_WHEEL_EXT_INT_CR1_PC1 0x00000020
#define RIGHT_WHEEL_EXT_INT_CR1_PC2 0x00000200
#define RISING_TRIGGER_PC1 0x00000002
#define RISING_TRIGGER_PC2 0x00000004
#define NO_INTERRUPT 0x00000000

sbit SpinDirectionLeftWheel at ODR6_GPIOA_ODR_bit;
sbit SpinDirectionRightWheel at ODR7_GPIOA_ODR_bit;

// Positions from  0.8 ms - 2.2 ms with 0.1 ms step
static const unsigned int sensorPositions[15] = { 2604, 2929, 3255, 3581, 3907, 4232, 4558, 4883,
                                                  5208, 5534, 5859, 6185, 6510, 6836, 7161 };

// Function Wrappers

typedef void (*DutyChangeFunctionPtr)(unsigned int);

// Left wheel function wrapper
void PWM_TIM4_Set_Duty_Wrapper(unsigned int ratio) {
     PWM_TIM4_Set_Duty(ratio, _PWM_INVERTED, _PWM_CHANNEL1);
}

// Right wheel function wrapper
void PWM_TIM9_Set_Duty_Wrapper(unsigned int ratio) {
     PWM_TIM9_Set_Duty(ratio, _PWM_INVERTED, _PWM_CHANNEL1);
}

// Front sensor function wrapper
void PWM_TIM10_Set_Duty_Wrapper(unsigned int ratio) {
     PWM_TIM10_Set_Duty(ratio, _PWM_NON_INVERTED, _PWM_CHANNEL1);
}

// Back sensor function wrapper
void PWM_TIM11_Set_Duty_Wrapper(unsigned int ratio) {
     PWM_TIM11_Set_Duty(ratio, _PWM_NON_INVERTED, _PWM_CHANNEL1);
}

DutyChangeFunctionPtr ChangeDuty[4] = { &PWM_TIM4_Set_Duty_Wrapper, &PWM_TIM9_Set_Duty_Wrapper,
                                        &PWM_TIM10_Set_Duty_Wrapper, &PWM_TIM11_Set_Duty_Wrapper };
int pwmDuty[4];
unsigned int pwmPeriod[4];
int wheelInterruptCount[2]={ 600, 200 };

//          *****   Initialization   *****

// Interrupts
// PC1 for right wheel
// PC2 for left wheel

void InitExternIntRisingEdge_PC1_PC2()
{
     SYSCFGEN_bit = 1;
     SYSCFG_EXTICR1 = LEFT_WHEEL_EXT_INT_CR1_PC1 | RIGHT_WHEEL_EXT_INT_CR1_PC2;
     EXTI_RTSR |= RISING_TRIGGER_PC1 | RISING_TRIGGER_PC2;
     EXTI_FTSR |= RISING_TRIGGER_PC1 | RISING_TRIGGER_PC2;
     EXTI_IMR  |=  RISING_TRIGGER_PC1 |  RISING_TRIGGER_PC2;
     NVIC_IntEnable(IVT_INT_EXTI1);
     NVIC_IntEnable(IVT_INT_EXTI2);
}
void UpdateCurrentDuty(int,int);

void RightWheel_Interrupt() iv IVT_INT_EXTI2 ics ICS_AUTO
{      EXTI_PR.B1 = 1;

      --wheelInterruptCount[LEFT_WHEEL];
      if (wheelInterruptCount[LEFT_WHEEL] <  0)
      {
           UpdateCurrentDuty(-4000, RIGHT_WHEEL);
      }
}

void LeftWheel_Interrupt() iv IVT_INT_EXTI1 ics ICS_AUTO
{      EXTI_PR.B2 = 1;

       --wheelInterruptCount[RIGHT_WHEEL];
      if (wheelInterruptCount[RIGHT_WHEEL] <  0)
      {
           UpdateCurrentDuty(-4000, LEFT_WHEEL);
      }
}

// Wheels
// Decoder: CD4555B
// Decoder uses Inverted input for enable

void InitLeftWheelPWM_Timer4_CH1_PB6()
{
     GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_6);
     SpinDirectionLeftWheel = FORWARD_SPIN_LEFT;    // Default forward spin

     pwmPeriod[LEFT_WHEEL] =  PWM_TIM4_Init(INITIAL_MOTOR_FREQUENCY) ; // Work on frequency 20-35 Khz
     pwmDuty[LEFT_WHEEL] = pwmPeriod[LEFT_WHEEL] - 1250;
     ChangeDuty[LEFT_WHEEL](pwmDuty[LEFT_WHEEL]);
     PWM_TIM4_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM4_CH1_PB6);
}

void InitRightWheelPWM_Timer9_CH1_PE5()
{
     GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_7);
     SpinDirectionRightWheel = FORWARD_SPIN_RIGHT;    // Default forward spin

     pwmPeriod[RIGHT_WHEEL] =  PWM_TIM9_Init(INITIAL_MOTOR_FREQUENCY);
     pwmDuty[RIGHT_WHEEL] = pwmPeriod[RIGHT_WHEEL] - 1250;
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

 //          *****   Helper functions   *****
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


//          *****   Tests   *****
int selectedWheel = RIGHT_WHEEL;
int wheelDirection = FORWARD_SPIN_RIGHT;
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
   Delay_ms(300);
   InitLeftWheelPWM_Timer4_CH1_PB6();
   // InitRightWheelPWM_Timer9_CH1_PE5();
   while(pwmDuty[LEFT_WHEEL]>0)
   {
        UpdateCurrentDuty(-200, LEFT_WHEEL);
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
       ChangeDuty[FRONT_SENSOR](sensorPositions[ServoPosition]);
       ChangeDuty[BACK_SENSOR](sensorPositions[ServoPosition]);
       Delay_ms(500);
       ServoPosition=(ServoPosition+1)%15;
    }
}

void ExternInterruptTest()
{
     GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_1);
     GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_2);
     // GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_15);
     // ODR15_GPIOE_ODR_bit = 1;
     InitExternIntRisingEdge_PC1_PC2();
}

void main() {

      // InitLeftWheelPWM_Timer4_CH1_PB6();
      // InitRightWheelPWM_Timer9_CH1_PE5();
     // InitBackServoPWM_Timer10_CH1_PB8()
     // InitFrontServoPWM_Timer11_CH1_PB9();
     
     // Tests
        ExternInterruptTest();
        WheelsSpeedAndDirectionTest();
     // InitRightWheelPWM_Timer9_CH1_PE5();
     // WheelsSpeedTest();
     // ServoPositionTest();

     while(1);


}




