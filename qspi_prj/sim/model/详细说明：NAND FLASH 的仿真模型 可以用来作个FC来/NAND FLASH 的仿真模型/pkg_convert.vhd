library ieee;
use ieee.std_logic_1164.all;

package pkg_convert is
function vec2int  (v : std_logic_vector) return integer;
function int2vec  (i : integer) return std_logic_vector;
end pkg_convert;

package body pkg_convert is

------------------------------------------------------------------------
function int2vec      (i: integer)  return std_logic_vector is
	variable temp: integer;
	variable result: std_logic_vector (31 downto 0) := 
		('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0',
		'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
	begin
		temp := i;
		if( temp >= 0 ) then
			for b in 0 to 31 loop
				if temp mod 2 = 1 then
					result (b) := '1';
				end if;
				temp := temp / 2;
			end loop;
			return result;
		else
			result(31) := '1';
			temp := temp + 2147483647;
			temp := temp + 1;
			for b in 0 to 30 loop
				if temp mod 2 = 1 then
					result (b) := '1';
				end if;
				temp := temp / 2;
			end loop;
			return result;
		end if;
	end;

------------------------------------------------------------------------
function vec2int           (v: std_logic_vector) return integer is
	variable result: integer := 0;
	variable addition: integer := 1;
	begin
		for b in v'reverse_range loop
			if v (b) = '1' or v(b)='H' then
				if b = 31 then
					result := -2147483648+result;
				else
					result := result + addition;
				end if;
			end if;
			if( b < 30 )then
				addition := addition * 2;
			end if;
		end loop;
		return result;
end;

------------------------------------------------------------------------

end pkg_convert;
