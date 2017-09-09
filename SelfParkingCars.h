#ifndef _CARS_H
#define _CARS_H

#define LEFT_WHEEL 0
#define RIGHT_WHEEL 1
#define FRONT_SENSOR 2
#define BACK_SENSOR 3

#define FORWARD_SPIN 1
#define BACKWARD_SPIN 0

#define INITIAL_SENSOR_FREQUENCY 50
#define INITIAL_MOTOR_FREQUENCY 25000

#define ENABLE_CLOCK 1
#define LEFT_WHEEL_EXT_INT_CR1_PC1 0x00000020
#define RIGHT_WHEEL_EXT_INT_CR1_PC2 0x00000200
#define RISING_TRIGGER_PC1 0x00000002
#define RISING_TRIGGER_PC2 0x00000004
#define NO_INTERRUPT 0x00000000

static int pwmDuty[4];
static unsigned int pwmPeriod[4];
static int wheelInterruptCount[2]={ 200, 200 };
static int stepsLeft = 0, stepsRight = 0;



// Positions from  0.8 ms - 2.2 ms with 0.1 ms step
static const unsigned int sensorPositions[15] = { 2604, 2929, 3255, 3581, 3907, 4232, 4558, 4883,
                                                  5208, 5534, 5859, 6185, 6510, 6836, 7161 };

// Function Wrappers
typedef void (*DutyChangeFunctionPtr)(unsigned int);

// Left wheel function wrapper
static void PWM_TIM4_Set_Duty_Wrapper(unsigned int ratio) {
     PWM_TIM4_Set_Duty(ratio, _PWM_INVERTED, _PWM_CHANNEL1);
}

// Right wheel function wrapper
static void PWM_TIM9_Set_Duty_Wrapper(unsigned int ratio) {
     PWM_TIM9_Set_Duty(ratio, _PWM_INVERTED, _PWM_CHANNEL1);
}

// Front sensor function wrapper
static void PWM_TIM10_Set_Duty_Wrapper(unsigned int ratio) {
     PWM_TIM10_Set_Duty(ratio, _PWM_NON_INVERTED, _PWM_CHANNEL1);
}

// Back sensor function wrapper
static void PWM_TIM11_Set_Duty_Wrapper(unsigned int ratio) {
     PWM_TIM11_Set_Duty(ratio, _PWM_NON_INVERTED, _PWM_CHANNEL1);
}

static DutyChangeFunctionPtr ChangeDuty[4] = { &PWM_TIM4_Set_Duty_Wrapper, &PWM_TIM9_Set_Duty_Wrapper,
                                        &PWM_TIM10_Set_Duty_Wrapper, &PWM_TIM11_Set_Duty_Wrapper };
#endif