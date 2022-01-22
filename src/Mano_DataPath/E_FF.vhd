----------------------------------------------------------------------------------
-- Company: 		Amirkabir University of Technology
-- Engineer: 		MohammadReza Babaei Mosleh
-- 
-- Module Name:    E_FF - Behavioral 
-- Project Name: 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity E_FF is
    Port ( Clk : in  STD_LOGIC;
           Rst : in  STD_LOGIC;
           LD : in  STD_LOGIC;
           Comp : in  STD_LOGIC;
           Ein : in  STD_LOGIC;
           Eout : out  STD_LOGIC);
end E_FF;

architecture Behavioral of E_FF is
	signal Eout_sig: STD_LOGIC;
begin
	Eout <= Eout_sig;
	process(Clk)
	begin
		if (Clk='1' and Clk'event) then
			if (Rst='1') then
				Eout_sig <= '0';
			elsif (LD = '1') then
				Eout_sig <= Ein;
			elsif (Comp = '1') then
				Eout_sig <= not Eout_sig;
			end if;
		end if;
	end process;

end Behavioral;
