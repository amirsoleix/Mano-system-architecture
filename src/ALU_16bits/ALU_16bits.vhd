----------------------------------------------------------------------------------
-- Company:			Amirkabir University of Technology 
-- Engineer: 		MohammadReza Babaei Mosleh
--  
-- Module Name:	ALU_16bits - Behavioral 
-- Description:	Mano architecture ALU using 16 1-bit ALU
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU_16bits is
    Port ( AC : in  STD_LOGIC_VECTOR (15 downto 0);
           DR : in  STD_LOGIC_VECTOR (15 downto 0);
           Control_Cmd : in  STD_LOGIC_VECTOR (6 downto 0);
           INPR : in  STD_LOGIC_VECTOR (7 downto 0);
           Cin : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           ALU_Out : out  STD_LOGIC_VECTOR (15 downto 0));
end ALU_16bits;

architecture Behavioral of ALU_16bits is
	component ALU_1bit is
		Port(AC_i : in  STD_LOGIC;
           AC_iplus1 : in  STD_LOGIC;
           AC_iMin1 : in  STD_LOGIC;
           DR_i : in  STD_LOGIC;
           Control_Cmd : in  STD_LOGIC_VECTOR (6 downto 0);
           INPR_i : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           ALU_OUT_i : out  STD_LOGIC);
	end component;
	signal C: STD_LOGIC_VECTOR (14 downto 0);	
begin
U0: ALU_1bit
	Port map(
		AC_i => AC(0),
		AC_iplus1 => AC(1),
		AC_iMin1 => '0',
		DR_i => DR(0),
		Control_Cmd => Control_Cmd,
		INPR_i => INPR(0),
		Cin => Cin,
		Cout => C(0),
		ALU_OUT_i => ALU_Out(0)
	);

U1: ALU_1bit
	Port map(
		AC_i => AC(1),
		AC_iplus1 => AC(2),
		AC_iMin1 => AC(0),
		DR_i => DR(1),
		Control_Cmd => Control_Cmd,
		INPR_i => INPR(1),
		Cin => C(0),
		Cout => C(1),
		ALU_OUT_i => ALU_Out(1)
	);
	
U2: ALU_1bit
	Port map(
		AC_i => AC(2),
		AC_iplus1 => AC(3),
		AC_iMin1 => AC(1),
		DR_i => DR(2),
		Control_Cmd => Control_Cmd,
		INPR_i => INPR(2),
		Cin => C(1),
		Cout => C(2),
		ALU_OUT_i => ALU_Out(2)
	);
	
U3: ALU_1bit
	Port map(
		AC_i => AC(3),
		AC_iplus1 => AC(4),
		AC_iMin1 => AC(2),
		DR_i => DR(3),
		Control_Cmd => Control_Cmd,
		INPR_i => INPR(3),
		Cin => C(2),
		Cout => C(3),
		ALU_OUT_i => ALU_Out(3)
	);
	
U4: ALU_1bit
	Port map(
		AC_i => AC(4),
		AC_iplus1 => AC(5),
		AC_iMin1 => AC(3),
		DR_i => DR(4),
		Control_Cmd => Control_Cmd,
		INPR_i => INPR(4),
		Cin => C(3),
		Cout => C(4),
		ALU_OUT_i => ALU_Out(4)
	);
	
U5: ALU_1bit
	Port map(
		AC_i => AC(5),
		AC_iplus1 => AC(6),
		AC_iMin1 => AC(4),
		DR_i => DR(5),
		Control_Cmd => Control_Cmd,
		INPR_i => INPR(5),
		Cin => C(4),
		Cout => C(5),
		ALU_OUT_i => ALU_Out(5)
	);
	
U6: ALU_1bit
	Port map(
		AC_i => AC(6),
		AC_iplus1 => AC(7),
		AC_iMin1 => AC(5),
		DR_i => DR(6),
		Control_Cmd => Control_Cmd,
		INPR_i => INPR(6),
		Cin => C(5),
		Cout => C(6),
		ALU_OUT_i => ALU_Out(6)
	);
	
U7: ALU_1bit
	Port map(
		AC_i => AC(7),
		AC_iplus1 => AC(8),
		AC_iMin1 => AC(6),
		DR_i => DR(7),
		Control_Cmd => Control_Cmd,
		INPR_i => INPR(7),
		Cin => C(6),
		Cout => C(7),
		ALU_OUT_i => ALU_Out(7)
	);
	
U8: ALU_1bit
	Port map(
		AC_i => AC(8),
		AC_iplus1 => AC(9),
		AC_iMin1 => AC(7),
		DR_i => DR(8),
		Control_Cmd => Control_Cmd,
		INPR_i => '0',
		Cin => C(7),
		Cout => C(8),
		ALU_OUT_i => ALU_Out(8)
	);
	
U9: ALU_1bit
	Port map(
		AC_i => AC(9),
		AC_iplus1 => AC(10),
		AC_iMin1 => AC(8),
		DR_i => DR(9),
		Control_Cmd => Control_Cmd,
		INPR_i => '0',
		Cin => C(8),
		Cout => C(9),
		ALU_OUT_i => ALU_Out(9)
	);
	
U10: ALU_1bit
	Port map(
		AC_i => AC(10),
		AC_iplus1 => AC(11),
		AC_iMin1 => AC(9),
		DR_i => DR(10),
		Control_Cmd => Control_Cmd,
		INPR_i => '0',
		Cin => C(9),
		Cout => C(10),
		ALU_OUT_i => ALU_Out(10)
	);
	
U11: ALU_1bit
	Port map(
		AC_i => AC(11),
		AC_iplus1 => AC(12),
		AC_iMin1 => AC(10),
		DR_i => DR(11),
		Control_Cmd => Control_Cmd,
		INPR_i => '0',
		Cin => C(10),
		Cout => C(11),
		ALU_OUT_i => ALU_Out(11)
	);
	
U12: ALU_1bit
	Port map(
		AC_i => AC(12),
		AC_iplus1 => AC(13),
		AC_iMin1 => AC(11),
		DR_i => DR(12),
		Control_Cmd => Control_Cmd,
		INPR_i => '0',
		Cin => C(11),
		Cout => C(12),
		ALU_OUT_i => ALU_Out(12)
	);
	
U13: ALU_1bit
	Port map(
		AC_i => AC(13),
		AC_iplus1 => AC(14),
		AC_iMin1 => AC(12),
		DR_i => DR(13),
		Control_Cmd => Control_Cmd,
		INPR_i => '0',
		Cin => C(12),
		Cout => C(13),
		ALU_OUT_i => ALU_Out(13)
	);
	
U14: ALU_1bit
	Port map(
		AC_i => AC(14),
		AC_iplus1 => AC(15),
		AC_iMin1 => AC(13),
		DR_i => DR(14),
		Control_Cmd => Control_Cmd,
		INPR_i => '0',
		Cin => C(13),
		Cout => C(14),
		ALU_OUT_i => ALU_Out(14)
	);
	
U15: ALU_1bit
	Port map(
		AC_i => AC(15),
		AC_iplus1 => '0',
		AC_iMin1 => AC(14),
		DR_i => DR(15),
		Control_Cmd => Control_Cmd,
		INPR_i => '0',
		Cin => C(14),
		Cout => Cout,
		ALU_OUT_i => ALU_Out(15)
	);

end Behavioral;

