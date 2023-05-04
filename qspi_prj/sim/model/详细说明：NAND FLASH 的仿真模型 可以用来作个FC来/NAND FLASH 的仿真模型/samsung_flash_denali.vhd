-- Entity:                      k9f4008w0a
-- SOMA file:                   H:/Applications/Memory/Samsung/Denali Soft/k9f4008w0a.soma
-- Initial contents file:       

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;

ENTITY k9f4008w0a IS
GENERIC (
    memory_spec: string := "H:/Applications/Memory/Samsung/Denali Soft/k9f4008w0a.soma";
    init_file:   string := ""
);
PORT (
    io     : inout STD_LOGIC_VECTOR(7 downto 0);
    cle    : in    STD_LOGIC;
    ale    : in    STD_LOGIC;
    cen    : in    STD_LOGIC;
    ren    : in    STD_LOGIC;
    wen    : in    STD_LOGIC;
    wpn    : in    STD_LOGIC;
    sen    : in    STD_LOGIC;
    rdybyn : out   STD_LOGIC
);
END k9f4008w0a;

ARCHITECTURE behavior of k9f4008w0a is
  attribute foreign: string;
  attribute foreign of behavior: architecture is "flashInitMTI $DENALI\denali.dll"; 
BEGIN
END behavior;
