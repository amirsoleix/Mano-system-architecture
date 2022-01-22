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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Common_BUS is
    Port ( I0 : in  STD_LOGIC;
           I1 : in  STD_LOGIC;
           I2 : in  STD_LOGIC;
           I3 : in  STD_LOGIC;
           Sel : in  STD_LOGIC_VECTOR(1 downto 0);
           Out_BUS : out  STD_LOGIC);
end Common_BUS;

architecture Behavioral of Common_BUS is
begin
	Out_BUS <= 	I0 when Sel="00" else
					I1 when Sel="01" else
					I2 when Sel="10" else
					I3;
end Behavioral;

