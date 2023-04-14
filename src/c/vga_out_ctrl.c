/*
 * vga_out_ctrl.c
 *
 *  Created on: 2019. 4. 5.
 *      Author: user
 */

#include "xparameters.h"
#include "xgpiops.h"
#include "myip.h"

int main (void)
{
	u32 MYIP_BaseAddress = XPAR_MYIP_0_S00_AXI_BASEADDR;
	u32 wreg = 0;
	int8_t read_char = 0;
	int16_t hc ,vc = 0;

	xil_printf("-- Start of the Program --\r\n");

	while(1){

		read_char = inbyte();

		switch(read_char) {
			case 'a' :
				hc = hc - 3;
				xil_printf("Move to the Left\r\n");
				break;

			case 's' :
				hc = hc + 3;
				xil_printf("Move to the Right\r\n");
				break;

			case 'w' :
				vc = vc - 3;
				xil_printf("Move Upward\r\n");
				break;

			case 'z' :
				vc = vc + 3;
				xil_printf("Move Downward\r\n");
				break;
		}

		if(hc<0)	hc=0;
		if(hc>500)	hc=500;
		if(vc<0)	vc=0;
		if(vc>440)	vc=440;

		wreg = vc;
		wreg = wreg << 16;
		wreg = wreg + hc;

		xil_printf("Write: %x\r\n", wreg);
		MYIP_mWriteReg(MYIP_BaseAddress, 0, wreg);
	}
}