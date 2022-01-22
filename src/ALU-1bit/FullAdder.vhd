----------------------------------------------------------------------------------
-- Company:		Amirkabir University of Technology
-- Engineer: 	MohammadReza Babaei Mosleh
-- 
-- Module Name:	Adder4bits - Behavioral 
-- Description:	1-bit full adder 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FullAdder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
			  Cin : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Sum : out  STD_LOGIC);
end FullAdder;

architecture Behavioral of FullAdder is
	signal y1, y2, y3:std_logic := '0';
begin
	y1 <= a xor b;
	Sum <= y1 xor Cin;
	y2 <= a and b;
	y3 <= y1 and Cin;
	Cout <= y2 or y3;

end Behavioral;

