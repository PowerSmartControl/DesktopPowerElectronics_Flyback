#include "ap_cint.h"

#define Y_MIN 0
//#define Y_MAX 800
#define NUMCOEFS 3

typedef struct {
	float vRef;		//Reference set point
	float coef[NUMCOEFS]; //Numerator coefficients b0..bN
	int y_max;		//Saturation value
	int adcMask;	//ADC masking
} CtrlParam;

#ifndef DBG_MODE
void Dig_compensator(CtrlParam params, uint12 v_meas, uint10 *u)
#else
void Dig_compensator(CtrlParam params, uint12 v_meas, uint10 *u, float *yVmeasDbg, float *yDbg, float *eDbg, uint10 *uDbg)
#endif //#ifndef DBG_MODE
{
	static float e[NUMCOEFS], y[NUMCOEFS]; //error signal, output signal
	int i = 0; 			// index for loops

	//Apply ADC masking
	float v_measReal = (v_meas&params.adcMask);
	//Obtain last error value
	e[0] = params.vRef - v_measReal;
	//Output signal computation y(n)
	y[0] = params.coef[0]*e[0]+params.coef[1]*e[1]+params.coef[2]*e[2]+y[1];
	//Saturation
	y[0] = (y[0] > Y_MIN) ? y[0] : Y_MIN;
	y[0] = (y[0] < params.y_max) ? y[0] : params.y_max;
	//Truncate to 10b and output
	*u = y[0];
	// Shift values for the next iteration
    for (i = NUMCOEFS-1; i > 0; i--){
    	e[i] = e[i-1];
    	y[i] = y[i-1];
    }

    #ifdef DBG_MODE
	*yVmeasDbg = v_measReal;
	*yDbg = y[0];
	*eDbg = e[0];
	*uDbg = y[0];
	#endif //#ifdef DBG_MODE
}
