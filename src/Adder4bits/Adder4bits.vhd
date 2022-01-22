----------------------------------------------------------------------------------
-- Company:			Amirkabir University of Technology
-- Engineer:		MohammadReza Babaei Mosleh
-- 
-- Module Name:	Adder4bits - Behavioral 
-- Description:	4-bit full adder 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Adder4bits is
    Port ( a : in  STD_LOGIC_VECTOR(3 downto 0);
           b : in  STD_LOGIC_VECTOR(3 downto 0);
           Cin : in  STD_LOGIC;
           Sum : out  STD_LOGIC_VECTOR(3 downto 0);
           Cout : out  STD_LOGIC);
end Adder4bits;

architecture Behavioral of Adder4bits is
	component FullAdder is
		Port ( a : in STD_LOGIC;
				 b : in STD_LOGIC;
				 Cin : in STD_LOGIC;
				 Sum : out STD_LOGIC;
				 Cout : out STD_LOGIC);
	end component;
	signal c1, c2, c3 : STD_LOGIC := '0';
begin
U0:FullAdder
	Port map(
		a => a(0),
		b => b(0),
		Cin => Cin,
		Sum => Sum(0),
		Cout => c1);
U1:FullAdder
	Port map(
		a => a(1),
		b => b(1),
		Cin => c1,
		Sum => Sum(1),
		Cout => c2);
U2:FullAdder
	Port map(
		a => a(2),
		b => b(2),
		Cin => c2,
		Sum => Sum(2),
		Cout => c3);
U3:FullAdder
	Port map(
		a => a(3),
		b => b(3),
		Cin => c3,
		Sum => Sum(3),
		Cout => Cout);
end Behavioral;

