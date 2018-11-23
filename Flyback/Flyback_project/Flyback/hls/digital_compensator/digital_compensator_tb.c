#include <stdio.h>
#include "ap_cint.h"

#define iterations 40

void digital_compensator(float v_ref, uint12 v_meas, float Kp, float Ki2, uint10 *u);

main()
{
	float ref = 30;
	float vmeas = 4095;
	float kp = 20;
	float ki = 3;
	uint10 vea;
	int i;
	//Hardware calculation
	printf("HW results:\n");
	for (i=0; i<iterations; i++){
		//vmeas += 10;
		digital_compensator (ref,vmeas,kp,ki,&vea);
		printf("Vea%i = %i\n",i,vea);
	}
	return 0;
}
