----------------------------------------------------------------------------------
-- Company:			Amirkabir University of Technology 
-- Engineer: 		MohammadReza Babaei Mosleh
-- 
-- Module Name:	RAM32x16Bits - Behavioral 
-- Description:	Implements memory ram for Mano architecture
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RAM32x16Bits is
    Port ( Addr : in  STD_LOGIC_VECTOR (4 downto 0);
           Clk : in  STD_LOGIC;
           Rd : in  STD_LOGIC;
           Wr : in  STD_LOGIC;
           Din : in  STD_LOGIC_VECTOR (15 downto 0);
           Dout : out  STD_LOGIC_VECTOR (15 downto 0));
end RAM32x16Bits;

architecture Behavioral of RAM32x16Bits is
Subtype RAM_WORD is STD_LOGIC_VECTOR (15 downto 0);
Type RAM_TABLE is array (0 to 31) of RAM_WORD;
signal RAM: RAM_TABLE :=
	(
		x"0000", x"0111", x"0222", x"0333",
		x"0444", x"0555", x"0666", x"0777",
		x"0888", x"0999", x"0aaa", x"0bbb",
		x"0ccc", x"0ddd", x"0eee", x"0fff",
		x"1000", x"1111", x"1222", x"1333",
		x"1444", x"1555", x"1666", x"1777",
		x"1888", x"1999", x"1aaa", x"1bbb",
		x"1ccc", x"1ddd", x"1eee", x"1fff");
begin
	Dout <= RAM(conv_integer(Addr));
	process(Clk)
	begin
		if(Clk='1' and Clk'event) then
			if(Wr='1') then
				RAM(conv_integer(Addr)) <= Din;
			end if;
		end if;
	end process;

end Behavioral;

