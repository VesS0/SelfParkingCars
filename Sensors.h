 #ifndef _SENSORS_H
 #define _SENSORS_H

 void InitializeSensors();
 void AlignRightSensors();
 void RotateFrontSensorFront();
 void TriggerFrontSensorMeasurement();
 void TriggerBackSensorMeasurement();
 double GetFrontSensorDistance();
 double GetBackSensorDistance();
 #endif