/*
 * user_interface.h
 *
 *  Created on: 13/02/2016
 *      Author: GFB
 */

#ifndef USER_INTERFACE_H_
#define USER_INTERFACE_H_

/* Table of user commands */
//Full configurations: T3, PI, PID
#define CFG0 0xA0 //Type 3 configuration is loaded
#define CFG1 0xA1 //PI configuration is loaded
#define CFG2 0xA2 //PID configuration is loaded
//Specific configuration
#define SETTRIGGER 	'6'	//Trigger configuration
//#define SETVREF 	'-'	//0xB0 //Write Vref
#define SETUMAX	 	'7'	//Write U_MAX, saturation value
#define SETADCMASK 	'8'	//0xC8 //Set ADC masking
//Global control
#define RUNCTRL		0xC0	//'1'  //Run controller
#define STOPCTRL 	0xC1	//'2'  //Stop controller
// Step generators
#define VREFSTEP	0xC3	//'5'  //Vref step
#define VINSTEP		0xC4	//'3'  //0xC4 //Vin step
#define VINPULSES	0xC5	//Vin step pulses
#define LOADSTEP	0xC6	//'4'  //0xC6 //Load step
#define LOADPULSES	0xC7	//Load step pulses


//Monitoring
#define READCFG '9'
#define READDBG '0'
//Others
#define EXIT  	'q' //Exit program (controlled)
//Erroneous command
#define ERR 0x00

#endif /* USER_INTERFACE_H_ */
