/******************************************************
 * coeff0 = num
 */
#include "ap_cint.h"

#define LSB 3.3/4096
#define VSgain 6.06	// Ganancia de la cadena de adquisición
#define X_MIN 0

#ifndef DBG_MODE
void PI_compensator_DiffEq(float v_ref, uint12 v_meas, uint10 X_MAX, float coef[3], uint10 *u)
#else
void PI_compensator_DiffEq(float v_ref, uint12 v_meas, uint10 X_MAX, float coef[3], uint10 *u, float *yVmeasDbg, float *yDbg, float *eDbg, uint10 *uDbg)
#endif //#ifndef DBG_MODE
{
	float y; //fb signal
	static float x0, x1, e0, e1, e2;

	//Store previous values
	x1 = x0;
	e2 = e1;
	e1 = e0;
	//Transform ADC data (11bits) to real voltage (float)
	y = v_meas;//*LSB*VSgain;
	//Obtain current error value
	e0 = v_ref - y;
	// PI(D) controller
	x0 = coef[0]*e0+coef[1]*e1+coef[2]*e2+x1;
	//Saturation control
	x0 = (x0 > X_MIN) ? x0 : X_MIN;
	x0 = (x0 < X_MAX) ? x0 : X_MAX;
	//Truncate to 9b and output
	*u = x0;
	#ifdef DBG_MODE
	*yVmeasDbg = v_meas;
	*yDbg = y;
	*eDbg = e0;
	*uDbg = x0;
	#endif //#ifdef DBG_MODE
}
