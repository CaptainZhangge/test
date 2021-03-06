//-----------------------------------------------------------------
// 
// Owner:	Xilinx Inc.
// File:  	nand_interface.v
//
// Purpose: 	Interface for the AMD AM30LV0064D UltraNAND Flash 
//		device.  Decodes the lower address bits of the system 
//		bus to decode commands and set or clear interface signals.
//		This device includes a RESET input to force WP# asserted 
//		on power transitions. RESET is high until Vcc is valid
//		and goes high when supply power ramps down.
//
// Created:	Verilog code generated by Visual HDL 8-2-01
//  
//  
//----------------------------------------------------------------
 
module NAND_INTERFACE (write_n, read_n, port_addr,
                       ce_n, ry_byn, reset, com_lat_n,
                       ready, cle, ale, se_n,
                       wp_n, outce_n, we_n, re_n);

input write_n;
input read_n;
input [3:0] port_addr; 
input ce_n;
input ry_byn;
input reset;
input com_lat_n;
output ready;
output cle;
output ale;
output se_n;
output wp_n;
output outce_n;
output we_n;
output re_n;

parameter RESET_ACTIVE = 1'b1;

wire port0;
wire port1;
wire port2;
wire port3;
wire port4;
wire port5;
wire port6;
wire port7;
wire port8;
wire port9;
wire porta;
wire portb;
wire portc;
wire portd;
wire porte;
wire portf;

//  Create internal signals
wire se_n_int;
wire ale_int;
wire wp_n_int;
wire outce_n_int;

reg visual_0_ale_int;
assign ale_int = visual_0_ale_int;

reg visual_0_se_n_int;
assign se_n_int = visual_0_se_n_int;

reg visual_0_wp_n_int;
assign wp_n_int = visual_0_wp_n_int;

reg visual_0_outce_n_int;
assign outce_n_int = visual_0_outce_n_int;

reg visual_0_ready;
assign ready = visual_0_ready;


//  ********************** SIGNAL ASSIGNMENTS *************************

//  Assign output signals
assign se_n = se_n_int;
assign ale = ale_int;
assign wp_n = wp_n_int;
assign outce_n = outce_n_int;

//  Data read/write port
assign port0 = ( (~ ce_n) ) & ( (~ port_addr[3]) ) & ( (~ port_addr[2])) & 
		( (~ port_addr[1]) ) & ( (~ port_addr[0]));
                          
//  CLE write port
assign port1 = ( (~ ce_n) ) & ( (~ port_addr[3]) ) & ( (~ port_addr[2])) & 
		( (~ port_addr[1]) ) & port_addr[0];
                          
//  Used to set ALE
assign port2 = ( (~ ce_n) ) & ( (~ port_addr[3]) ) & ( (~ port_addr[2])) & 
		port_addr[1] & ( (~ port_addr[0]) );
                          
//  Used to clear ALE
assign port3 = ( (~ ce_n) ) & ( (~ port_addr[3]) ) & ( (~ port_addr[2])) 
		& port_addr[1] & port_addr[0];
                          
//  Used to set SE#
assign port4 = ( (~ ce_n) ) & ( (~ port_addr[3]) ) & port_addr[2] & 
		( (~port_addr[1]) ) & ( (~port_addr[0]) );
                                          
//  Used to clear SE#
assign port5 = ( (~ ce_n) ) & ( (~ port_addr[3]) ) & port_addr[2] & 
		( (~port_addr[1]) ) & port_addr[0];
 
//  Used to set WP#
assign port6 = ( (~ ce_n) ) & ( (~ port_addr[3]) ) & port_addr[2] &
           	port_addr[1] & ( (~ port_addr[0]) );
                                  
//  Used to clear WP#
assign port7 = ( (~ ce_n) ) & ( (~ port_addr[3]) ) & port_addr[2] &
             	port_addr[1] & port_addr[0];
                                  
//  Used to set OUTCE#
assign port8 = ( (~ ce_n) ) & port_addr[3] & ( (~ port_addr[2]) ) & 
		( (~port_addr[1]) ) & ( (~port_addr[0]) );
                                          
//  Used to clear OUTCE#
assign port9 = ( (~ ce_n) ) & port_addr[3] & ( (~ port_addr[2]) ) & 
		( (~port_addr[1]) ) & port_addr[0];
                                          
//  No Function
assign porta = ( (~ ce_n) ) & port_addr[3] & ( (~ port_addr[2]) ) & 
		port_addr[1] & ( (~ port_addr[0]) );
assign portb = ( (~ ce_n) ) & port_addr[3] & ( (~ port_addr[2]) ) & 
		port_addr[1] & port_addr[0];
assign portc = ( (~ ce_n) ) & port_addr[3] & port_addr[2] & 
		( (~port_addr[0]) );
assign portd = ( (~ ce_n) ) & port_addr[3] & port_addr[2] & 
		( (~port_addr[1]) ) & port_addr[0];
assign porte = ( (~ ce_n) ) & port_addr[3] & port_addr[2] & 
		port_addr[1] & ( (~ port_addr[0]) );

//  To read RY/BY# state
assign portf = ( (~ ce_n) ) & port_addr[3] & port_addr[2] & port_addr[1]
              	& port_addr[0];
                                  
//  Assert CLE on all port1 accesses
assign cle = port1;

//  Drive WE# to UltraNAND for port0 or port1
assign we_n =  (~ (( (~ write_n) ) & (port0 | (port1 & ( (~ com_lat_n) )
                          )))) ;
//  Drive REor to UltraNAND for port0 only
assign re_n =  (~ (( (~ read_n) ) & port0)) ;


//  ********************** PROCESS: ALE_SIG ******************************
//  Purpose: Assert ALE signal
always @(reset or write_n or port2 or port3)
begin
        //  Reset Condition
        if ((reset == RESET_ACTIVE))
        begin
                visual_0_ale_int <= 1'b0;                   
        end
        
        //  Latch ALE on write to PORT2
        else if ((!write_n) && (port2))
        begin
                visual_0_ale_int <= 1'b1;                 
        end
        
        //  Clear on write to PORT3
        else if ((!write_n) && (port3))
        begin
                visual_0_ale_int <= 1'b0;
        end
     
end


//  ********************** PROCESS: SEN_SIG ******************************
//  Purpose: Assert SE# signal
always @(reset or write_n or port4 or port5)
begin
        //  Reset Condition
        if ((reset == RESET_ACTIVE))
        begin
                visual_0_se_n_int <= 1'b1;                   
        end
        
        //  Latch SE# on write to PORT4
        else if ((!write_n) && (port4))
        begin
                visual_0_se_n_int <= 1'b0;                   
        end
        
        //  Clear on write to PORT5
        else if ((!write_n) && (port5))
        begin
                visual_0_se_n_int <= 1'b1;                   
        end
        
end



//  ********************** PROCESS: WPN_SIG ******************************
//  Purpose: Assert WP# signal
always @(reset or write_n or port6 or port7)
begin
        //  Reset Condition
        if ((reset == RESET_ACTIVE))
        begin
                visual_0_wp_n_int <= 1'b0;                   
        end
        
        //  Latch WP# on write to PORT6
        else if ((!write_n) && (port6))
        begin
                visual_0_wp_n_int <= 1'b0;                  
        end
        
        //  Clear on write to PORT7
        else if ((!write_n) && (port7))
        begin
                visual_0_wp_n_int <= 1'b1;                   
        end
        
end



//  ********************* PROCESS: OUTCE_SIG *****************************
//  Purpose: Assert OUTCE# signal
always @(reset or write_n or port8 or port9)
begin
        //  Reset Condition
        if ((reset == RESET_ACTIVE))
        begin
                visual_0_outce_n_int <= 1'b1;                   
        end
        
        //  Set OUTCE# (low) on write to port8
        else if ((!write_n) && (port8))
        begin
                visual_0_outce_n_int <= 1'b0;                   
        end
        
        //  Clear OUTCE# (high) on write to port9
        else if ((!write_n) && (port9))
        begin
                visual_0_outce_n_int <= 1'b1;                   
        end
        
end


//  ********************** PROCESS: READY_SIG ******************************
//  Purpose: Assert ready signal
always @(portf or read_n)
begin
        //  READY is only driven during a PORTF read
        //  READY shows the state of RY/BY#
        if ((portf) && (!read_n))
                visual_0_ready <= ry_byn;
        else
                visual_0_ready <= 1'bz;

end


endmodule

