-- **************************************************************
--
-- Owner:	Xilinx Inc.
-- File:  	amd_flash_tb.vhd
--
-- Purpose: 	Test bench for AMD Flash Interface and Denali 
--		AMD Flash model.
--
-- **************************************************************

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use WORK.pkg_convert.all;

entity AMD_FLASH_TB is
	generic (MEM_SIZE	: INTEGER := 132);
end AMD_FLASH_TB;


architecture BEHAVIOR of AMD_FLASH_TB is 

-- ******************** CONSTANT DECLARATIONS ***********************
-- CPLD Port Addresses
constant PORT0_ADDR	: STD_LOGIC_VECTOR (3 downto 0) := "0000";	-- Read Data, IO, Status
									-- Write Address and Data
constant PORT1_ADDR	: STD_LOGIC_VECTOR (3 downto 0) := "0001";	-- Write Command
constant PORT2_ADDR	: STD_LOGIC_VECTOR (3 downto 0) := "0010";	-- Set ale
constant PORT3_ADDR	: STD_LOGIC_VECTOR (3 downto 0) := "0011";	-- clear ale
constant PORT4_ADDR	: STD_LOGIC_VECTOR (3 downto 0) := "0100";	-- Set sen
constant PORT5_ADDR	: STD_LOGIC_VECTOR (3 downto 0) := "0101";	-- Clear sen
constant PORT6_ADDR	: STD_LOGIC_VECTOR (3 downto 0) := "0110";	-- Set wpn
constant PORT7_ADDR	: STD_LOGIC_VECTOR (3 downto 0) := "0111";	-- Clear wpn
constant PORT8_ADDR	: STD_LOGIC_VECTOR (3 downto 0) := "1000";	-- Set ce0n
constant PORT9_ADDR	: STD_LOGIC_VECTOR (3 downto 0) := "1001";	-- Clear ce0n
constant PORTA_ADDR	: STD_LOGIC_VECTOR (3 downto 0) := "1010";	-- Set ce1n
constant PORTB_ADDR	: STD_LOGIC_VECTOR (3 downto 0) := "1011";	-- Clear ce1n
constant PORTC_ADDR	: STD_LOGIC_VECTOR (3 downto 0) := "1100";	-- Set ce2n
constant PORTD_ADDR	: STD_LOGIC_VECTOR (3 downto 0) := "1101";	-- Clear ce2n
constant PORTE_ADDR	: STD_LOGIC_VECTOR (3 downto 0) := "1110";	-- N/A
constant PORTF_ADDR	: STD_LOGIC_VECTOR (3 downto 0) := "1111";	-- Read ry_byn status

constant PAGE_SIZE	: INTEGER := 528;


-- ******************* SIGNAL DECLARATIONS **************************

type BIG_MEM is array (0 to MEM_SIZE - 1) of INTEGER;		-- Define memory array
signal mem_buffer : BIG_MEM;

signal data_bus     	: STD_LOGIC_VECTOR (7 downto 0);
signal cle    		: STD_LOGIC;
signal ale    		: STD_LOGIC;
signal ren    		: STD_LOGIC;
signal wen    		: STD_LOGIC;
signal wpn    		: STD_LOGIC;
signal sen    		: STD_LOGIC;
signal ry_byn 		: STD_LOGIC;

signal cpld_ce 		: STD_LOGIC;				-- CPLD chip enable (active high)
signal port_addr 	: STD_LOGIC_VECTOR (3 downto 0);	-- Specifies CPLD port address
signal outce0 		: STD_LOGIC;			-- Output signals 
signal write, read 	: STD_LOGIC;				-- Port read/write signals (active low)
signal reset 		: STD_LOGIC;				-- Reset is high when Vcc is ramping up or drops down
								-- Active high reset
signal ready 		: STD_LOGIC;				-- Asserted to read status of RY/BY signal

signal source_tmp	: STD_LOGIC_VECTOR (31 downto 0);	-- Temp signal for source_cnt	
	
signal fail_flag	: STD_LOGIC;				-- Asserted when programming fails
signal com_latn		: STD_LOGIC;				-- Command latch signal


-- ******************** COMPONENT DECLARATIONS **********************
-- Denali AMD UltraNAND Flash Model Component: AM30LV0064D
component am30lv0064d
	port( 	
	   	io     : inout STD_LOGIC_VECTOR(7 downto 0);
	    	cle    : in    STD_LOGIC;
	    	ale    : in    STD_LOGIC;
	    	cen    : in    STD_LOGIC;
	    	ren    : in    STD_LOGIC;
	    	wen    : in    STD_LOGIC;
	    	wpn    : in    STD_LOGIC;
	    	sen    : in    STD_LOGIC;
	   	ry_byn : out   STD_LOGIC 
	   	);
	  
end component;

-- CPLD NAND Interface => VHDL component
component NAND_INTERFACE

	port(	
		-- Input Signals to CPLD
		write_n		: in 	STD_LOGIC;			-- System Write Enable
		read_n		: in 	STD_LOGIC;			-- System Read Enable	
		port_addr	: in 	STD_LOGIC_VECTOR (3 downto 0);	-- Address input to select port
		ce_n		: in 	STD_LOGIC;			-- Chip Enable for the interface and UltraNAND 
		ry_byn		: in 	STD_LOGIC;			-- RY/BY# input from UltraNAND 
		reset		: in 	STD_LOGIC;			-- RESET - high for reset and power transitions
		com_lat_n	: in 	STD_LOGIC;			-- COM_LAT from test bench to negate CLE 
									-- during command write cycle
			
		-- Output signals from CPLD
		ready 		: out 	STD_LOGIC;			-- Allows system to read RY/BY# pin state 
		cle		: out 	STD_LOGIC;			-- Command Latch Enable to UltraNAND 
		ale		: out 	STD_LOGIC;			-- Address Latch Enable to UltraNAND 
		se_n		: out 	STD_LOGIC;			-- Spare Area Enable to UltraNAND 
		wp_n 		: out 	STD_LOGIC;			-- Write Protect to UltraNAND 
		outce_n		: out 	STD_LOGIC;			-- Chip Enable to UltraNAND 	
		we_n 		: out 	STD_LOGIC;			-- Write Enable to UltraNAND 
		re_n		: out 	STD_LOGIC			-- Read Enable to UltraNAND 

		);
	
end component;

begin

	-- ******************** COMPONENT DECLARATION *********************
	-- DEN_MODEL: Denali AMD Flash Model Component
	DEN_MODEL : am30lv0064d
		port map(
		
			io     	=> data_bus,
			cle     => cle,
			ale     => ale,
			cen     => outce0,
			ren     => ren,
			wen     => wen,
			wpn     => wpn,
			sen     => sen,
			ry_byn  => ry_byn );
			
			
	-- Xilinx Timing Model Component
	CPLD : NAND_INTERFACE
		port map(
		
			-- Inputs
			write_n		=> write,
			read_n		=> read,
			port_addr	=> port_addr,
			ce_n		=> cpld_ce,
			ry_byn		=> ry_byn,
			reset		=> reset,
			com_lat_n	=> com_latn,					
				
			-- Outputs
			ready 		=> ready,
			cle		=> cle,
			ale		=> ale,	
			se_n		=> sen,
			wp_n 		=> wpn,
			outce_n		=> outce0,
			we_n 		=> wen,
			re_n		=> ren );
		
		

	-- *************************** SIGNAL DEFINITIONS **************************
	
	-- ***************************** Process: FLOW *****************************
	-- Main test flow for AMD UltraNAND Interface
	FLOW: process
	
	variable temp 		: STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
	variable byte_sel 	: STD_LOGIC_VECTOR (1 downto 0) := "00";
	variable source_cnt	: INTEGER := 0;
	
	begin
		fail_flag <= '0';
		com_latn <= '1';
		reset <= '0';
		cpld_ce <= '1';
		data_bus <= (others => 'Z');
		port_addr <= (others => 'Z');	-- Default address
		write <= '1';
		read <= '1';
		wait for 100 us;
		
		-- Activate NAND Interface
		reset <= '1';
		wait for 200 us;
		
		reset <= '0';
		wait for 200 us;
		
		------------------- INIT ---------------------
		
		------------------ START ---------------------
	
		-- Write 00h to (PORTADDR + 8)
		-- Set OUTCE0# (low) to enable UltraNAND. Data is a don’t care
		port_addr <= PORT8_ADDR;
		data_bus <= (others => '0');
		write <= '0';
		cpld_ce <= '0';
		wait for 200 us;
		
		write <= '1';
		cpld_ce <= '1';
		wait for 100 us;
		
		-- Write 00h to (PORTADDR + 3)
		-- Clear ALE (low) prior to issuing command. Data is a don’t care
		port_addr <= PORT3_ADDR;
		data_bus <= (others => '0');
		write <= '0';
		cpld_ce <= '0';
		wait for 200 us;
		
		write <= '1';
		cpld_ce <= '1';
		wait for 100 us;		
		
		-- Write FFh to (PORTADDR + 1)
		-- Send a reset command to reset the Flash (may be omitted)
		port_addr <= PORT1_ADDR;
		data_bus <= (others => '1');
		write <= '0';
		cpld_ce <= '0';
		com_latn <= '0';
		wait for 200 us;
		
		com_latn <= '1';
		wait for 50 us;
		
		cpld_ce <= '1';
		write <= '1';
		wait for 100 us;
		
		-- Write 00h to (PORTADDR + 1)
		-- Send a "Read First Half Page" command to the Flash to set
		-- the internal pointer to the first half page region in the Flash
		port_addr <= PORT1_ADDR;
		data_bus <= (others => '0');
		write <= '0';
		cpld_ce <= '0';
		com_latn <= '0';
		wait for 200 us;
		
		com_latn <= '1';
		wait for 50 us;
		
		cpld_ce <= '1';
		write <= '1';
		wait for 100 us;	
		
		-- Write 00h to (PORTADDR + 4)
		-- Set SE# (low) to allow Spare Area access. Data is a don’t care
		port_addr <= PORT4_ADDR;
		data_bus <= (others => '0');
		write <= '0';
		cpld_ce <= '0';
		wait for 200 us;
		
		write <= '1';
		cpld_ce <= '1';
		wait for 100 us;				
		
		-- Write 00h to (PORTADDR + 7)
		-- Clear WP# (high) to allow Flash program. Data is a don’t care
		port_addr <= PORT7_ADDR;
		data_bus <= (others => '0');
		write <= '0';
		cpld_ce <= '0';
		wait for 200 us;
		
		write <= '1';
		cpld_ce <= '1';
		wait for 100 us;				
		
		-- Write 80h to (PORTADDR + 1)
		-- Send an "Input Data" command to the Flash
		port_addr <= PORT1_ADDR;
		data_bus <= "10000000";
		write <= '0';
		cpld_ce <= '0';
		com_latn <= '0';
		wait for 200 us;
		
		com_latn <= '1';
		wait for 50 us;
		
		cpld_ce <= '1';
		write <= '1';
		wait for 100 us;			
		
		-- Write 00h to (PORTADDR + 2)
		-- Set ALE (high) prior to issuing addresses. Data is a don’t care
		port_addr <= PORT2_ADDR;
		data_bus <= (others => '0');
		write <= '0';
		cpld_ce <= '0';
		wait for 200 us;
		
		write <= '1';
		cpld_ce <= '1';
		wait for 100 us;				
		
		-- Write DEST[A7-A0] to (PORTADDR + 0)
		-- Load the first address byte into the Flash
		port_addr <= PORT0_ADDR;
		data_bus <= (others => '0');
		write <= '0';
		cpld_ce <= '0';
		wait for 200 us;
		
		cpld_ce <= '1';
		write <= '1';
		wait for 100 us;			
		
		-- Write DEST[A16-A9] to (PORTADDR + 0)
		-- Load the second address byte into the Flash
		port_addr <= PORT0_ADDR;
		data_bus <= (others => '0');
		write <= '0';
		cpld_ce <= '0';
		wait for 200 us;
		
		cpld_ce <= '1';
		write <= '1';
		wait for 100 us;			
		
		-- Write DEST[A24-A17] to (PORTADDR + 0)
		-- Load the third address byte into the Flash
		port_addr <= PORT0_ADDR;
		data_bus <= (others => '0');
		write <= '0';
		cpld_ce <= '0';
		wait for 200 us;
		
		cpld_ce <= '1';
		write <= '1';
		wait for 100 us;			
		
		-- Write 00h to (PORTADDR + 3)
		-- Clear ALE (low) prior to writing data. Data is a don’t care
		port_addr <= PORT3_ADDR;
		data_bus <= (others => '0');
		write <= '0';
		cpld_ce <= '0';
		com_latn <= '1';
		wait for 200 us;
		
		com_latn <= '0';
		wait for 50 us;
		
		cpld_ce <= '1';
		write <= '1';
		wait for 100 us;				
		
		-- Clear SOURCE buffer counter
		source_cnt := 0;
		
		-- Does SOURCE = 527, has the last data byte been written?
		while (source_cnt <= (MEM_SIZE - 1) ) loop
			
			--source_tmp <= int2vec (source_cnt);			
			--mem_buffer (vec2int (source_tmp (7 downto 0) ) ) <= source_cnt;
			mem_buffer (source_cnt) <= source_cnt;
			source_cnt := source_cnt + 1;			
			wait for 25 us;
			
		end loop;
		
		
		------------------ LOOP1 ---------------------
		-- This is where we fill the Flash buffer
		
		-- Clear SOURCE buffer counter
		source_cnt := 0;
		
		-- Does SOURCE = 527, has the last data byte been written?
		while (source_cnt <= (PAGE_SIZE - 1) ) loop
						
			-- Write [SOURCE] to (PORTADDR + 0)		
			-- Write the data contents at the SOURCE location to the data port
			source_tmp <= int2vec (source_cnt);
			
			wait for 25 us;
			
			byte_sel := source_tmp(1 downto 0);			
			temp := int2vec (mem_buffer ( vec2int (source_tmp (9 downto 2) ) ) );
			
			case byte_sel is
				when "00" => 	data_bus(7 downto 0) <= temp(7 downto 0);
				when "01" =>	data_bus(7 downto 0) <= temp(15 downto 8);
				when "10" =>	data_bus(7 downto 0) <= temp(23 downto 16);
				when "11" => 	data_bus(7 downto 0) <= temp(31 downto 24);
				when others =>	NULL;
			end case;
			
			port_addr <= PORT0_ADDR;		
			write <= '0';
			cpld_ce <= '0';
			wait for 200 us;
			
			cpld_ce <= '1';
			write <= '1';
			wait for 100 us;
			
			-- Increment source pointer to write to next address location
			source_cnt := source_cnt + 1;			
			--wait for 25 us;
					
		end loop;
		
		------------------ PROG ----------------------
		-- All 528 bytes are loaded so program the Flash
		
		-- Write 10h to (PORTADDR + 1)
		-- Send a Page Program command to the Flash
		port_addr <= PORT1_ADDR;
		data_bus <= "00010000";
		write <= '0';
		cpld_ce <= '0';
		com_latn <= '0';
		wait for 200 us;
		
		com_latn <= '1';
		wait for 50 us;
		
		cpld_ce <= '1';
		write <= '1';
		wait for 100 us;
		
		
		-- Write 70h to (PORTADDR + 1)
		-- Send a Read Status command to the Flash
		port_addr <= PORT1_ADDR;
		data_bus <= "01110000";
		write <= '0';
		cpld_ce <= '0';
		com_latn <= '0';
		wait for 200 us;
		
		com_latn <= '1';
		wait for 50 us;
		
		cpld_ce <= '1';
		write <= '1';
		wait for 100 us;	
		

		----------------- CHKSTAT --------------------
		
		-- Read from (PORTADDR + 0)
		-- Read the device status to see if the program is done
		port_addr <= PORT0_ADDR;
		data_bus <= (others => 'Z');
		read <= '0';
		cpld_ce <= '0';
		wait for 200 us;			
		
		-- Check status of a ready condition
		-- If not continue to check the status for a ready condition
		--wait until (data_bus(6) = '1');
	
		read <= '1';
		cpld_ce <= '1';
		wait for 100 us;
	
		------------------ DONE ----------------------
		
		-- Write 00h to (PORTADDR + 6)
		-- Set WP# (low) to re-protect the Flash. Data is a don’t care
		port_addr <= PORT6_ADDR;
		data_bus <= "00000000";
		write <= '0';
		cpld_ce <= '0';
		wait for 200 us;
		
		write <= '1';
		cpld_ce <= '1';
		wait for 100 us;
		
		-- Read from (PORTADDR + 0)
		-- Read the device status again to see if the program passed
		port_addr <= PORT0_ADDR;
		data_bus <= (others => 'Z');
		read <= '0';
		cpld_ce <= '0';
		wait for 200 us;
		
		read <= '1';
		cpld_ce <= '1';
		wait for 100 us;
		
		if (data_bus(0) = '1') then
		
			------------------- FAIL ---------------------
			
			-- A '1' in the D0 location indicates a failure condition
			
			-- Write 00h to (PORTADDR + 9)
			-- Clear OUTCE0# (high) to disable UltraNAND. Data is a don’t care
			port_addr <= PORT9_ADDR;
			data_bus <= "00000000";
			write <= '0';
			cpld_ce <= '0';
			wait for 200 us;
			
			write <= '1';
			cpld_ce <= '1';
			wait for 100 us;

			-- Return (program failed)
			-- The program operation failed so return and report
			fail_flag <= '1';			
		
		else
		
			-- Write 00h to (PORTADDR + 9)
			-- Clear OUTCE0# (high) to disable UltraNAND. Data is a don’t care
			port_addr <= PORT9_ADDR;
			data_bus <= "00000000";
			write <= '0';
			cpld_ce <= '0';
			wait for 200 us;
			
			write <= '1';
			cpld_ce <= '1';
			wait for 100 us;
			
			-- Return (program successful) ;The program operation passed so return and report
			fail_flag <= '0';

		end if;	
	
		wait;	
		
	end process FLOW;
	
	
end BEHAVIOR;