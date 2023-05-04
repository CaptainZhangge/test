******************************************************************************************************
README File for Verilog NAND Interface Customer Pack (XAPP354)

Created:  8-13-2001 Jennifer Jenkins

*******************************************************************************************************
*******************************************************************************************************
DISCLAIMER
*******************************************************************************************************

THIS DESIGN IS PROVIDED TO YOU “AS IS”. XILINX MAKES AND YOU RECEIVE NO WARRANTIES OR 
CONDITIONS, EXPRESS, IMPLIED, STATUTORY OR OTHERWISE, AND XILINX SPECIFICALLY DISCLAIMS ANY 
IMPLIED WARRANTIES OF MERCHANTABILITY, NON-INFRINGEMENT, OR FITNESS FOR A PARTICULAR 
PURPOSE. This design has not been verified on hardware (as opposed to simulations), and it should be 
used only as an example design, not as a fully functional core. XILINX does not warrant the 
performance, functionality, or operation of this Design will meet your requirements, or that the 
operation of the Design will be uninterrupted or error free, or that defects in 
the Design will be corrected. Furthermore, XILINX does not warrant or make any representations 
regarding use or the results of the use of the Design in terms of correctness, accuracy, 
reliability or otherwise. 

********************************************************************************************************
FILE CONTENTS
********************************************************************************************************
This zip file contains the following:

VHDL Source Files:	
	
	nand_interface.v		-- CPLD Verilog NAND Interface Design.


Denali Files:
	
	amd_flash_denali.vhd		-- Denali AMD UltraNAND Flash device generated VHDL code.
	samsung_flash_denali.vhd	-- Denali Samsung device generated VHDL code.
	
	k9f4008w0a.soma			-- Samsung Denali SOMA File. (download eMemory.com)
	am30lv0064d.spc			-- AMD UltraNAND Denali SOMA File. (download eMemory.com)
		
		
VHDL Testbench Files:

	amd_flash_tb.vhd		-- AMD Test Bench.
	samsung_flash_vhd.vhd 		-- Samsung Test Bench.
	pkg_convert.vhd			-- VHDL convert utility package.
	
						
WebPACK files:
	
	nand_interface.fit		-- WebPACK NAND Interface Fitter Report
	time_sim.vhd			-- WebPACK Post Route VHDL Timing File


ModelSim DO files:

	wave.do				-- Configures Modelsim wave window for post-route simulation.


Documentation Files:

	k9f4008w0a.pdf			-- Samsung K9F4008W0A Data Sheet
					-- For more information, refer to 
					-- http://samsungelectronics.com/semiconductors/Flash/Flash.htm
	
	AM30LV0064D_22203.pdf		-- AMD UltraNAND AM30LV0064D Data Sheet
					-- For more information, refer to 
					-- http://www.amd.com/products/nvd/overview/ultranand/ultranand.html


*****************************************************************************************************
TESTING NOTES
*****************************************************************************************************
When utilizing the functionality of test benches in Project Navigator, ModelSim is used for 
simulation purposes. 

Note:  If any changes are made to any of the above files, they must be recompiled and loaded in 
ModelSim.

Note: VHDL Simulation. For the Verilog design flow, a VHDL post-route timing model was generated 
from WebPACK.  With a VHDL timing model, the existing VHDL test bench could be utilized.

The test bench environment is described and documented in XAPP354 available for download on the 
Xilinx web site (www.xilinx.com).

Please also note that this design has been verified through simulations, and not on actual hardware.


******************************************************************************************************
DESIGN NOTES
******************************************************************************************************
Complete documentation for the design can be found in XAPP354 available for download from the 
Xilinx web site (www.xilinx.com).

All of the control signals are defined in the Verilog source code and can be easily customized for 
a specific application.  

The NAND Interface design has been targeted to a XCR3032XL-5VQ44 CoolRunner CPLD. This is 
a 3V, 32 macrocell device in a 44VQFP package. The fitter was designated to select the 
pin-out for the device.   


******************************************************************************************************
Technical Support
******************************************************************************************************
Technical support for this design and any other CoolRunner CPLD issues can be obtained as follows:

North American Support
(Mon,Tues,Wed,Fri 6:30am-5pm  
  Thr 6:30am - 4:00pm Pacific Standard Time)
Hotline: 1-800-255-7778 
or (408) 879-5199 
Fax: (408) 879-4442 
Email: hotline@xilinx.com 
 
United Kingdom Support
(Mon,Tues,Wed,Thr 9:00am-12:00pm, 1:00-5:30pm
  Fri 9:00am-12:00pm, 1:00-3:30pm)    
Hotline: +44 1932 820821
Fax: +44 1932 828522 
Email : ukhelp@xilinx.com 
 
France Support
(Mon,Tues,Wed,Thr,Fri 9:30am-12:30pm, 2:00-5:30pm)
Hotline: +33 1 3463 0100 
Fax: +33 1 3463 0959
Email : frhelp@xilinx.com 
 
Germany Support
(Mon,Tues,Wed,Thr 8:00am-12:00pm, 1:00-5:00pm, 
   Fri  8:00am-12:00pm, 1:00pm-3:00pm)
Hotline: +49 89 991 54930 
Fax: +49 89 904 4748 
Email : dlhelp@xilinx.com 
 
Japan Support
(Mon,Tues,Thu,Fri  9:00am -5:00pm ()
 Wed    9:00am -4:00pm)
Hotline: (81)3-3297-9163
Fax:: (81)3-3297-0067
Email: jhotline@xilinx.com
