----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- Company:			Sharif University of Technology
-- Engineer:		Amir Soleimani
-- 
-- Module Name:	FullAdder - Behavioral 
-- Project Name:	Digital Logic final
-- Description:	1-bit full adder 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FullAdder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Sum : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end FullAdder;

architecture Behavioral of FullAdder is
	signal y1, y2, y3 : STD_LOGIC := '0';
begin
	y1 <= a XOR b;
	Sum <= y1 XOR Cin;
	y2 <= a AND b;
	y3 <= y1 AND Cin;
	Cout <= y2 OR y3;
end Behavioral;

