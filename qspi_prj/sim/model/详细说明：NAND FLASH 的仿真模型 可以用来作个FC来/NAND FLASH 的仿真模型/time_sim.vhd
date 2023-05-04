---------------------------------------------------------------------------
-- XPLAOPT Version 3.45
-- VHDL Timing Model
-- Converted from JEDEC file
-- Created by Xilinx, Inc.
-- Design Name = NAND_INTERFACE.blx
-- Device Name = XCR3064XL-6VQ44
-- Aug 03 11:03:52 2001
---------------------------------------------------------------------------
package pxa_pkg is
    constant tLOGI1 : time := 2000 ps;
    constant tLOGI2 : time := 2500 ps;
    constant tLOGI3 : time := 6000 ps;
    constant tFIN  : time := 2300 ps;
    constant tIN   : time := 1300 ps;
    constant tF    : time := 2400 ps;
    constant tUDA  : time := 3500 ps;
    constant tGCK  : time := 800 ps;
    constant tLDI  : time := 1300 ps;
    constant toe_slew : time := 8200 ps;
    constant tbuf_slew : time := 6200 ps;
    constant tap2q : time := 2500 ps;
    constant tar2q : time := 2500 ps;
    constant trd   : time := 1000 ps;
    constant tbuf  : time := 2200 ps;
    constant toe   : time := 4200 ps;
end pxa_pkg;
---------------------------------------------------------------------------
-- Components Defined Here
---------------------------------------------------------------------------
-- Output Buffer
library ieee;
use ieee.std_logic_1164.all;
use work.pxa_pkg.all;
entity pxa_bufif2 is
	port (O: out std_logic; I, OE, SLEW : in std_logic);
end pxa_bufif2;
architecture behavioral of pxa_bufif2 is
signal OE_local, I_local : std_logic := '0';
begin
  OE_local <= OE after toe_slew when SLEW = '1' else OE after toe;
  I_local <= I after tbuf_slew when SLEW = '1' else I after tbuf;
  O <= I_local when OE_local = '1' else 'Z';
end behavioral;

-- Multiplexer
library ieee;
use ieee.std_logic_1164.all;
use work.pxa_pkg.all;
entity pxa_mux is
	port (O: out std_logic; S, A, B : in std_logic);
end pxa_mux;
architecture behavioral of pxa_mux is
begin
	O <= A when S = '1' else B;
end behavioral;

-- D Latch with Active High Latch Enable/Set/Reset; Power up to 0.
library ieee;
use ieee.std_logic_1164.all;
use work.pxa_pkg.all;
entity pxa_lff_apar_p0 is
	port (Q : out std_logic; D, LH, AP, AR : in std_logic);
end pxa_lff_apar_p0;
architecture behavioral of pxa_lff_apar_p0 is
signal Q_local: std_logic := '0';
begin
  process(D, LH, AP, AR)
  begin
    if AR = '1' then
      Q_local <= '0' after tar2q;
    elsif LH = '1' then
      Q_local <= D after tLDI;
    elsif AP = '1' then
      Q_local <= '1' after tap2q;
    end if;
  end process;
  Q <= Q_local;
end behavioral;

---------------------------------------------------------------------------
-- Main VHDL Model 
---------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use work.pxa_pkg.all;
entity NAND_INTERFACE is
    port(ce_n, com_lat_n, read_n, reset, ry_byn, write_n: in std_logic;
         port_addr: in std_logic_vector(3 downto 0);
         ale, cle, outce_n, re_n, ready, se_n, we_n, wp_n: out std_logic
         );
end NAND_INTERFACE;

architecture structure of NAND_INTERFACE is

-------- Signal Declaration -----------------------------------------------
signal   N115_COM, N115_COM_tF, ale_AP, ale_AR, ale_D, ale_DIN, ale_LH,
         ale_OE, ale_Q, ce_n_tIN, cle_COM, cle_OE, com_lat_n_tIN,
         outce_n_AP, outce_n_AR, outce_n_D, outce_n_DIN, outce_n_LH,
         outce_n_OE, outce_n_Q, port_addr_0_tIN, port_addr_1_tIN,
         port_addr_2_tIN, port_addr_3_tIN, re_n_COM, re_n_OE, read_n_tIN,
         ready_COM, ready_OE, reset_tIN, ry_byn_tIN, se_n_AP, se_n_AR,
         se_n_D, se_n_DIN, se_n_LH, se_n_OE, se_n_Q, we_n_COM, we_n_OE,
         wp_n_AP, wp_n_AR, wp_n_D, wp_n_DIN, wp_n_LH, wp_n_OE, wp_n_Q,
         write_n_tIN: std_logic;
signal   VCC : std_logic;
signal   GND : std_logic;

component pxa_bufif2
	port (O: out std_logic; I, OE, SLEW : in std_logic);
end component;
component pxa_mux
	port (O: out std_logic; S, A, B : in std_logic);
end component;
component pxa_lff_apar_p0
	port (Q : out std_logic; D, LH, AP, AR : in std_logic);
end component;
begin
-- Equations:

VCC         <= '1';
GND         <= '0';
--------( N115 )-----------------------------------------------------------
N115_COM    <= not ((not write_n_tIN and port_addr_2_tIN and not ce_n_tIN 
               and port_addr_1_tIN and not port_addr_0_tIN 
               and not port_addr_3_tIN)) after tLOGI1;
--------( ale )------------------------------------------------------------
ale_D       <= (GND) after tFIN;
ale_OE      <= (VCC) after tFIN;
ale_buf: pxa_bufif2 port map (ale, ale_Q, ale_OE, GND);
ale_mux: pxa_mux port map (ale_DIN, GND, GND, ale_D);
ale_LH      <= (not port_addr_3_tIN and not write_n_tIN 
               and not port_addr_2_tIN and port_addr_0_tIN 
               and not ce_n_tIN and port_addr_1_tIN) after tLOGI1;
ale_AP      <= (not port_addr_3_tIN and not write_n_tIN 
               and not port_addr_2_tIN and not port_addr_0_tIN 
               and not ce_n_tIN and port_addr_1_tIN) after tLOGI1;
ale_AR      <= (reset_tIN) after tLOGI1;
ale_ff: pxa_lff_apar_p0 port map (ale_Q, ale_DIN, ale_LH, ale_AP, 
               ale_AR); 
--------( cle )------------------------------------------------------------
cle_COM     <= ((not port_addr_2_tIN and not ce_n_tIN 
               and not port_addr_1_tIN and port_addr_0_tIN 
               and not port_addr_3_tIN)) after tLOGI1;
cle_OE      <= (VCC) after tFIN;
cle_buf: pxa_bufif2 port map (cle, cle_COM, cle_OE, GND);
--------( outce_n )--------------------------------------------------------
outce_n_D   <= (VCC) after tFIN;
outce_n_OE  <= (VCC) after tFIN;
outce_n_buf: pxa_bufif2 port map (outce_n, outce_n_Q, outce_n_OE, GND);
outce_n_mux: pxa_mux port map (outce_n_DIN, GND, GND, outce_n_D);
outce_n_LH  <= (not write_n_tIN and not port_addr_2_tIN and not ce_n_tIN 
               and not port_addr_1_tIN and port_addr_0_tIN 
               and port_addr_3_tIN) after tLOGI1;
outce_n_AP  <= (reset_tIN) after tLOGI1;
outce_n_AR  <= (not reset_tIN and not write_n_tIN and not port_addr_2_tIN 
               and not ce_n_tIN and not port_addr_1_tIN 
               and not port_addr_0_tIN and port_addr_3_tIN) after tLOGI1;
outce_n_ff: pxa_lff_apar_p0 port map (outce_n_Q, outce_n_DIN, outce_n_LH, 
               outce_n_AP, outce_n_AR); 
--------( re_n )-----------------------------------------------------------
re_n_COM    <= not ((not port_addr_2_tIN and not read_n_tIN 
               and not ce_n_tIN and not port_addr_1_tIN 
               and not port_addr_0_tIN and not port_addr_3_tIN))
               after tLOGI1;
re_n_OE     <= (VCC) after tFIN;
re_n_buf: pxa_bufif2 port map (re_n, re_n_COM, re_n_OE, GND);
--------( ready )----------------------------------------------------------
ready_COM   <= ((ry_byn_tIN)) after tLOGI1;
ready_OE    <= (port_addr_2_tIN and not read_n_tIN and not ce_n_tIN 
               and port_addr_1_tIN and port_addr_0_tIN and port_addr_3_tIN)
               after tLOGI1;
ready_buf: pxa_bufif2 port map (ready, ready_COM, ready_OE, GND);
--------( se_n )-----------------------------------------------------------
se_n_D      <= (VCC) after tFIN;
se_n_OE     <= (VCC) after tFIN;
se_n_buf: pxa_bufif2 port map (se_n, se_n_Q, se_n_OE, GND);
se_n_mux: pxa_mux port map (se_n_DIN, GND, GND, se_n_D);
se_n_LH     <= (not write_n_tIN and port_addr_2_tIN and not ce_n_tIN 
               and not port_addr_1_tIN and port_addr_0_tIN 
               and not port_addr_3_tIN) after tLOGI1;
se_n_AP     <= (reset_tIN) after tLOGI1;
se_n_AR     <= (not reset_tIN and not write_n_tIN and port_addr_2_tIN 
               and not ce_n_tIN and not port_addr_1_tIN 
               and not port_addr_0_tIN and not port_addr_3_tIN)
               after tLOGI1;
se_n_ff: pxa_lff_apar_p0 port map (se_n_Q, se_n_DIN, se_n_LH, se_n_AP, 
               se_n_AR); 
--------( we_n )-----------------------------------------------------------
we_n_COM    <= not ((not com_lat_n_tIN and not write_n_tIN 
               and not port_addr_2_tIN and not ce_n_tIN 
               and not port_addr_1_tIN and not port_addr_3_tIN)
               or (not write_n_tIN and not port_addr_2_tIN 
               and not ce_n_tIN and not port_addr_1_tIN 
               and not port_addr_0_tIN and not port_addr_3_tIN))
               after tLOGI2;
we_n_OE     <= (VCC) after tFIN;
we_n_buf: pxa_bufif2 port map (we_n, we_n_COM, we_n_OE, GND);
--------( wp_n )-----------------------------------------------------------
wp_n_D      <= (VCC) after tFIN;
wp_n_OE     <= (VCC) after tFIN;
wp_n_buf: pxa_bufif2 port map (wp_n, wp_n_Q, wp_n_OE, GND);
wp_n_mux: pxa_mux port map (wp_n_DIN, GND, GND, wp_n_D);
wp_n_LH     <= (not write_n_tIN and port_addr_2_tIN and not ce_n_tIN 
               and port_addr_1_tIN and port_addr_0_tIN 
               and not port_addr_3_tIN) after tLOGI1;
wp_n_AP     <= (GND) after tFIN;
wp_n_AR     <= not (not reset_tIN and N115_COM_tF) after tLOGI1;
wp_n_ff: pxa_lff_apar_p0 port map (wp_n_Q, wp_n_DIN, wp_n_LH, wp_n_AP, 
               wp_n_AR); 
--------( Intermeditate Signals )------------------------------------------
N115_COM_tF <= (N115_COM) after tF;
ce_n_tIN    <= (ce_n) after tIN;
com_lat_n_tIN<= (com_lat_n) after tIN;
port_addr_0_tIN<= (port_addr(0)) after tIN;
port_addr_1_tIN<= (port_addr(1)) after tIN;
port_addr_2_tIN<= (port_addr(2)) after tIN;
port_addr_3_tIN<= (port_addr(3)) after tIN;
read_n_tIN  <= (read_n) after tIN;
reset_tIN   <= (reset) after tIN;
ry_byn_tIN  <= (ry_byn) after tIN;
write_n_tIN <= (write_n) after tIN;
end structure;

