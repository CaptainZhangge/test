-- Entity:                      am30lv0064d
-- Top-level entity:            am30lv0064d_top
-- SOMA file:                   H:/Applications/Memory/AMD/Denali Soft/am30lv0064d.spc   

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;

ENTITY am30lv0064d IS
GENERIC (
    memory_spec: string := "H:/Applications/Memory/AMD/Denali Soft/am30lv0064d.spc";
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
    ry_byn : out   STD_LOGIC
);
END am30lv0064d;

ARCHITECTURE behavior of am30lv0064d is
  attribute foreign: string;
  attribute foreign of behavior: architecture is "flashInitMTI $DENALI\denali.dll"; 
BEGIN
END behavior;

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;

ENTITY am30lv0064d_top IS
GENERIC (
    memory_spec: string := "H:/Applications/Memory/AMD/Denali Soft/am30lv0064d.spc";
    init_file:   string := ""
);
PORT (
    io7 : inout STD_LOGIC;
    io6 : inout STD_LOGIC;
    io5 : inout STD_LOGIC;
    io4 : inout STD_LOGIC;
    io3 : inout STD_LOGIC;
    io2 : inout STD_LOGIC;
    io1 : inout STD_LOGIC;
    io0 : inout STD_LOGIC;
    cle : in STD_LOGIC;
    ale : in STD_LOGIC;
    cen : in STD_LOGIC;
    ren : in STD_LOGIC;
    wen : in STD_LOGIC;
    wpn : in STD_LOGIC;
    sen : in STD_LOGIC;
    ry_byn : out STD_LOGIC
);
END am30lv0064d_top;

ARCHITECTURE behavior OF am30lv0064d_top IS
    COMPONENT am30lv0064d
    GENERIC (
        memory_spec: string := "H:/Applications/Memory/AMD/Denali Soft/am30lv0064d.spc";
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
        ry_byn : out   STD_LOGIC
    );
    END COMPONENT;
BEGIN
    bus_model : am30lv0064d
    GENERIC MAP(memory_spec, init_file)
    PORT MAP (
        io(7) => io7,
        io(6) => io6,
        io(5) => io5,
        io(4) => io4,
        io(3) => io3,
        io(2) => io2,
        io(1) => io1,
        io(0) => io0,
        cle => cle,
        ale => ale,
        cen => cen,
        ren => ren,
        wen => wen,
        wpn => wpn,
        sen => sen,
        ry_byn => ry_byn
    );
END behavior;
