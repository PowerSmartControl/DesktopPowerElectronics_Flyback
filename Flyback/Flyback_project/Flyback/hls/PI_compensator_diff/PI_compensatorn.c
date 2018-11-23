#include "ap_cint.h"

#define LSB 3.3/4096
#define VSgain 6.06	// Ganancia de la cadena de adquisición
#define X_MIN 0
#define X_MAX 600

#ifndef DBG_MODE
void PI_compensator(float v_ref, uint12 v_meas, float Kp, float Ki2, uint10 *u)
#else
void PI_compensator(float v_ref, uint12 v_meas, float Kp, float Ki2, uint10 *u, float *yVmeasDbg, float *yDbg, float *eDbg, uint10 *uDbg)
#endif //#ifndef DBG_MODE
{
	float y, e; //fb signal, error signal, result signal
	float x;
	static float x_integral;
	static char sat;

	//Transform ADC data (11bits) to real voltage (float)
	y = v_meas*LSB*VSgain;
	//Obtain last error value
	e = v_ref - y;
	// PI controller with anti-windup
	if ((sat < 0 && e < 0) || (sat > 0 && e > 0)); //Do nothing if there's sat and error in the same direction
	else{
		x_integral = x_integral + Ki2*e;

		if (x_integral < X_MIN){
			x_integral = X_MIN;
			sat = -1;
		}
		else if (x_integral > X_MAX){
			x_integral = X_MAX;
			sat = 1;
		}
		else{
			sat = 0;
		}
		x = Kp*e + x_integral;
		x = (x > X_MIN) ? x : X_MIN;
		x = (x < X_MAX) ? x : X_MAX;
	}
	//Truncate to 9b and output
	*u = x;
	#ifdef DBG_MODE
	*yVmeasDbg = v_meas;
	*yDbg = y;
	*eDbg = e;
	*uDbg = x;
	#endif //#ifdef DBG_MODE
}
