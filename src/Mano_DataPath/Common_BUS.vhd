----------------------------------------------------------------------------------
-- Company: 		Amirkabir University of Technology
-- Engineer: 		MohammadReza Babaei Mosleh
--  
-- Module Name:    Common_BUS - Behavioral 
-- Project Name: 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Common_BUS is
    Port ( Mem : in  STD_LOGIC_VECTOR (15 downto 0);
           AR : in  STD_LOGIC_VECTOR (15 downto 0);
           PC : in  STD_LOGIC_VECTOR (15 downto 0);
           DR : in  STD_LOGIC_VECTOR (15 downto 0);
           AC : in  STD_LOGIC_VECTOR (15 downto 0);
           IR : in  STD_LOGIC_VECTOR (15 downto 0);
           TR : in  STD_LOGIC_VECTOR (15 downto 0);
           S : in  STD_LOGIC_VECTOR (2 downto 0);
           Out_BUS : out  STD_LOGIC_VECTOR (15 downto 0));
end Common_BUS;

architecture Behavioral of Common_BUS is
begin
	Out_BUS <= 	Mem when S="111" else
					AR when S="001" else
					PC when S="010" else
					DR when S="011" else
					AC when S="100" else
					IR when S="101" else
					TR when S="110";

end Behavioral;

