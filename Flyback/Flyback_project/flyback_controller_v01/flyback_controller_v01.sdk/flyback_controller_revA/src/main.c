/****************************************************************************
 *	main.c	--	Flyback controller based on ZYBO platform					*
 *																			*
 * Ver   Who  Date     Changes												*
 * ----- ---- -------- ---------------------------------------------			*
 * v00 GFB   00/00/00 Creation												*
 * 																			*
 ****************************************************************************/


/***************************** Include Files *******************************/
#include "xparameters.h"
#include "xuartps.h"
#include "user_interface.h"
#include "xdig_compensator.h"
#include "system_controller.h"
#include <xil_io.h>
#include <stdio.h>

/************************* Constant Definitions ****************************/
#define UART_BASEADDR		XPAR_PS7_UART_1_BASEADDR
//#define SYS_CTRL_BASEADDR	XPAR_SYSTEM_CONTROLLER_0_S00_AXI_BASEADDR
#define SYS_CTRL_BASEADDR	0x43C00000
#define NUMCOEFS 3
#define VmeasGain 0.165
#define ADCstep 3.3/4096
#define ADCstepInv 4096/3.3
#define DEF_TRIGGER 700
#define DEF_UMAX 	800
#define DEF_ADCMASK 0xFFFF
#define MSFORCOUNT 81230
/**************************** Type Definitions *****************************/
typedef struct {
	float b[NUMCOEFS]; //numerator coefficients b0..bN
	float a[NUMCOEFS]; //denominator coefficients a0..aN
	int Fsamp;	//Sampling freq. in Hz
	float vRef;	//Reference set point
} SMCparameters;

/************************** Function Prototypes ******************************/
int sys_init();		//System initialization

/************************** Variable Definitions *****************************/
XDig_compensator DigComp;
SMCparameters SMCparams;

int umax = 800;
int trigger = 700;

/****************************************************************************
 * main function
 * Handles communication with SmartCtrl
 ****************************************************************************/
int main(void)
{
	char command = 0x00; //Input user command
	unsigned int val_uint;
	int val_int, delay;
	float vRef_step;
	unsigned int duty, period, pulses;	// Step generation variables
	volatile int i,j;	//loop counter

	//Initialization
	sys_init();
	//Flush UART FIFO
	while (XUartPs_IsReceiveData(UART_BASEADDR)) XUartPs_ReadReg(UART_BASEADDR, XUARTPS_FIFO_OFFSET);
	//Command decoding
	while (command != EXIT){
		scanf(" %c", &command);
		switch (command){
		// COMPENSATOR CONFIGURATIONS
		case CFG1:	//PI Configuration
			//Stop control
			Xil_Out32(SYS_CTRL_BASEADDR,0x0);
			//Get values from SMC
			scanf("%f%f%f%f", &SMCparams.b[0], &SMCparams.b[0], &SMCparams.b[1], &SMCparams.b[2]);
			scanf("%f%f%f%f", &SMCparams.a[0], &SMCparams.a[0], &SMCparams.a[1], &SMCparams.a[2]);
			scanf("%d", &SMCparams.Fsamp);scanf("%f", &SMCparams.vRef);
			SMCparams.vRef =  VmeasGain * SMCparams.vRef * ADCstepInv;
			//Load values to FPGA digital controller
			XDig_compensator_Write_params_coef_Words(&DigComp, 0, (int *)&SMCparams.b[1], 1);
			XDig_compensator_Write_params_coef_Words(&DigComp, 1, (int *)&SMCparams.b[2], 1);
			XDig_compensator_Write_params_coef_Words(&DigComp, 2, (int *)&SMCparams.b[0], 1); //always 0
			XDig_compensator_Set_params_vRef(&DigComp, *(int *)&SMCparams.vRef);
			//Run control
			SYSTEM_CONTROLLER_mWriteReg(SYS_CTRL_BASEADDR, 0, 0x1);
			printf("PI Configuration applied\n");
			break;
		case CFG2:	//PID CONFIGURATION
			//Stop control
			Xil_Out32(SYS_CTRL_BASEADDR,0x0);
			//Get values from SMC
			scanf("%f%f%f%f", &SMCparams.b[0], &SMCparams.b[0], &SMCparams.b[1], &SMCparams.b[2]);
			scanf("%f%f%f%f", &SMCparams.a[0], &SMCparams.a[0], &SMCparams.a[1], &SMCparams.a[2]);
			scanf("%d", &SMCparams.Fsamp);scanf("%f", &SMCparams.vRef);
			SMCparams.vRef =  VmeasGain * SMCparams.vRef * ADCstepInv;
			//Load values to FPGA digital controller
			XDig_compensator_Write_params_coef_Words(&DigComp, 0, (int *)&SMCparams.b[0], 1);
			XDig_compensator_Write_params_coef_Words(&DigComp, 1, (int *)&SMCparams.b[1], 1);
			XDig_compensator_Write_params_coef_Words(&DigComp, 2, (int *)&SMCparams.b[2], 1);
			XDig_compensator_Set_params_vRef(&DigComp, *(int *)&SMCparams.vRef);
			//Run control
			SYSTEM_CONTROLLER_mWriteReg(SYS_CTRL_BASEADDR, 0, 0x1);
			printf("PID Configuration applied\n");
			break;

		// SPECIFIC CONFIGURATION
		case SETTRIGGER:
			//val_uint = SYSTEM_CONTROLLER_mReadReg(SYS_CTRL_BASEADDR, 4);
			scanf("%i", &val_uint);
			SYSTEM_CONTROLLER_mWriteReg(SYS_CTRL_BASEADDR, 4, val_uint); //Set trigger
			printf("Trigger set to: %i\n", val_uint);
			break;
		case SETUMAX:	//Saturation value
			scanf("%i", &val_uint);
			XDig_compensator_Set_params_y_max(&DigComp,val_uint);
			printf("UMAX set to: %i\n", val_uint);
			break;
		case SETADCMASK:
			scanf("%i", &val_uint);
			XDig_compensator_Set_params_adcMask(&DigComp,~val_uint);
			printf("ADC mask set to: %#06X\n", ~val_uint);
			break;

		// GLOBAL CONTROL
		case RUNCTRL:
			SYSTEM_CONTROLLER_mWriteReg(SYS_CTRL_BASEADDR, 0, 0x1); //Enable control
			printf("Control running\n");
			break;
		case STOPCTRL:
			SYSTEM_CONTROLLER_mWriteReg(SYS_CTRL_BASEADDR, 0, 0x0); //Stop control
			printf("Control stopped\n");
			break;

		// STEP GENERATORS
		case VREFSTEP:
			scanf("%i", &val_int);
			vRef_step = SMCparams.vRef*(1+(float)val_int/100);
			XDig_compensator_Set_params_vRef(&DigComp, *(int *)&vRef_step);
			val_uint = XDig_compensator_Get_params_vRef(&DigComp);	//Vref
			delay = MSFORCOUNT*100;		//100 ms step
			for (i=0; i<delay; i++);	//Step period
			XDig_compensator_Set_params_vRef(&DigComp, *(int *)&SMCparams.vRef);
			val_uint = XDig_compensator_Get_params_vRef(&DigComp);	//Vref
			printf("Vref step applied\n");
			break;
		case VINSTEP:
			scanf("%i", &period);	//Get duration
			SYSTEM_CONTROLLER_mWriteReg(SYS_CTRL_BASEADDR, 8, 0);	//Enable Vin step
			delay = MSFORCOUNT*period;
			for (i=0; i<delay; i++);	//Step period
			SYSTEM_CONTROLLER_mWriteReg(SYS_CTRL_BASEADDR, 8, 1);	//Disable Vin step
			printf("Vin step applied\n");
			break;
		case VINPULSES:
			scanf("%i", &duty); //Get Duty cycle
			scanf("%i", &period); //Get period
			scanf("%i", &pulses); //Get number of pulses
			for (j=0; j<pulses; j++){
				SYSTEM_CONTROLLER_mWriteReg(SYS_CTRL_BASEADDR, 8, 0);	//Enable Vin step
				delay = MSFORCOUNT*period*duty/100;
				for (i=0; i<delay; i++);			//Step enabled period
				SYSTEM_CONTROLLER_mWriteReg(SYS_CTRL_BASEADDR, 8, 1);	//Disable Vin step
				delay = MSFORCOUNT*period-delay;
				for (i=0; i<delay; i++);		//Step disabled period
			}
			printf("Vin pulses applied\n");
			break;
		case LOADSTEP:
			scanf("%i", &period);	//Get duration
			SYSTEM_CONTROLLER_mWriteReg(SYS_CTRL_BASEADDR, 12, 0);	//Enable Load step (Rl=22)
			delay = MSFORCOUNT*period;
			for (i=0; i<delay; i++);	//Step period
			SYSTEM_CONTROLLER_mWriteReg(SYS_CTRL_BASEADDR, 12, 1);	//Disable Load step (Rl=9)
			printf("Load step applied\n");
			break;
		case LOADPULSES:
			scanf("%i", &duty); //Get Duty cycle
			scanf("%i", &period); //Get period
			scanf("%i", &pulses); //Get number of pulses
			for (j=0; j<pulses; j++){
				SYSTEM_CONTROLLER_mWriteReg(SYS_CTRL_BASEADDR, 12, 0);	//Enable Load step (Rl=22)
				delay = MSFORCOUNT*period*duty/100;
				for (i=0; i<delay; i++);			//Step enabled period
				SYSTEM_CONTROLLER_mWriteReg(SYS_CTRL_BASEADDR, 12, 1);	//Disable Load step (Rl=9)
				delay = MSFORCOUNT*period-delay;
				for (i=0; i<delay; i++);		//Step disabled period
			}
			printf("Load pulses applied\n");
			break;

		// MONITORING
		case READCFG:
			XDig_compensator_Read_params_coef_Words(&DigComp, 0, &val_int, 1);	//coeff0
			printf("\nCoeff0: %f\n", *(float *)&val_int);
			XDig_compensator_Read_params_coef_Words(&DigComp, 1, &val_int, 1);	//coeff1
			printf("Coeff1: %f\n", *(float *)&val_int);
			XDig_compensator_Read_params_coef_Words(&DigComp, 2, &val_int, 1);	//coeff2
			printf("Coeff2: %f\n", *(float *)&val_int);
			val_uint = XDig_compensator_Get_params_vRef(&DigComp);	//Vref
			printf("Vref: %f\n", *(float *)&val_uint);
			val_uint = SYSTEM_CONTROLLER_mReadReg(SYS_CTRL_BASEADDR, 4);
			printf("Trigger: %d\n", val_uint);
			val_uint = XDig_compensator_Get_params_y_max(&DigComp);	//Saturation value
			printf("Umax: %d\n", val_uint);
			val_uint = XDig_compensator_Get_params_adcMask(&DigComp);	//ADC mask
			printf("ADCmask: %#06X\n", val_uint);
			break;
		case READDBG:
			val_uint = XDig_compensator_Get_yVmeasDbg(&DigComp);
			printf("\nVmeas: %d\n", (int)*(float *)&val_uint);
			val_uint = XDig_compensator_Get_yDbg(&DigComp);
			printf("y: %f\n", *(float *)&val_uint);
			val_uint = XDig_compensator_Get_eDbg(&DigComp);
			printf("e: %d\n", (int)*(float *)&val_uint);
			val_uint = XDig_compensator_Get_uDbg(&DigComp);
			printf("u: %d\n", val_uint);
			break;
		// Others
		case EXIT:
			SYSTEM_CONTROLLER_mWriteReg(SYS_CTRL_BASEADDR, 0, 0x0); //Stop control
			printf("Exiting...\n");
			break;
		default :
			printf("Wrong command\n");
		}
	}
	return 0;
}

int sys_init()
{
	int status;

	status = XDig_compensator_Initialize(&DigComp, XPAR_DIG_COMPENSATOR_0_DEVICE_ID);
	//Disable Load step (Rl=9)
	SYSTEM_CONTROLLER_mWriteReg(SYS_CTRL_BASEADDR, 12, 1);
	//Disable Vin step (Vin=18)
	SYSTEM_CONTROLLER_mWriteReg(SYS_CTRL_BASEADDR, 8, 1);
	//Set default trigger
	SYSTEM_CONTROLLER_mWriteReg(SYS_CTRL_BASEADDR, 4, DEF_TRIGGER);
	//Set default UMAX (saturation value)
	XDig_compensator_Set_params_y_max(&DigComp, DEF_UMAX);
	//Set default ADC max to all bits enabled
	XDig_compensator_Set_params_adcMask(&DigComp, DEF_ADCMASK);
	return status;
}
