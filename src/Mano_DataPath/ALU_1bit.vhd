----------------------------------------------------------------------------------
-- Company:			Amirkabir University of Technology 
-- Engineer:		MohammadReza Babaei Mosleh
-- 

-- Module Name:	ALU_1bit - Behavioral 
-- Description:	1-bit ALU unit based on Mano architecture
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU_1bit is
    Port ( AC_i : in  STD_LOGIC;
           AC_iplus1 : in  STD_LOGIC;
           AC_iMin1 : in  STD_LOGIC;
           DR_i : in  STD_LOGIC;
           Control_Cmd : in  STD_LOGIC_VECTOR (6 downto 0);
           INPR_i : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           ALU_OUT_i : out  STD_LOGIC);
end ALU_1bit;

architecture Behavioral of ALU_1bit is
	component FullAdder is
		Port(
			a:in STD_LOGIC;
			b:in STD_LOGIC;
			Cin:in STD_LOGIC;
			Sum:out STD_LOGIC;
			Cout:out STD_LOGIC);
	end component;
	signal Y:STD_LOGIC_VECTOR(6 downto 0);
	signal FAResult:STD_LOGIC := '0';
begin
	Y(0) <= Control_Cmd(0) AND AC_i;
	U0: FullAdder
		Port map(
			a => AC_i,
			b => DR_i,
			Cin => Cin,
			Sum => FAResult,
			Cout => Cout);
	Y(1) <= Control_Cmd(1) AND FAResult;
	Y(2) <= Control_Cmd(2) AND DR_i;
	Y(3) <= Control_Cmd(3) AND INPR_i;
	Y(4) <= Control_Cmd(4) AND (not AC_i);
	Y(5) <= Control_Cmd(5) AND AC_iPlus1;
	Y(6) <= Control_Cmd(6) AND AC_iMin1;
	ALU_OUT_i <= Y(0) OR Y(1) OR Y(2) OR Y(3) OR Y(4) OR Y(5) OR Y(6);

end Behavioral;

