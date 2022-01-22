----------------------------------------------------------------------------------
-- Company:			Amirkabir University of Technology 
-- Engineer: 		MohammdReza Babaei Mosleh
-- 
-- Module Name:   ManoDataPath - Behavioral 
-- Description:	Implementing the data path of Mano architecture
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ManoDataPath is
    Port ( Wr_Mem : in  STD_LOGIC;
           Rd_Mem : in  STD_LOGIC;
           LD_AR : in  STD_LOGIC;
           Inc_AR : in  STD_LOGIC;
           LD_PC : in  STD_LOGIC;
           Inc_PC : in  STD_LOGIC;
           LD_DR : in  STD_LOGIC;
           Inc_DR : in  STD_LOGIC;
           LD_AC : in  STD_LOGIC;
           Inc_AC : in  STD_LOGIC;
           LD_IR : in  STD_LOGIC;
           LD_TR : in  STD_LOGIC;
           Inc_TR : in  STD_LOGIC;
           LD_OUTR : in  STD_LOGIC;
           Rst : in  STD_LOGIC;
           Rst_E : in  STD_LOGIC;
           COM_E : in  STD_LOGIC;
           LD_E : in  STD_LOGIC;
           OUTR : out  STD_LOGIC_VECTOR (7 downto 0);
           S : in  STD_LOGIC_VECTOR (2 downto 0);
           INPR : in  STD_LOGIC_VECTOR (7 downto 0);
           Control_Cmd : in  STD_LOGIC_VECTOR (6 downto 0);
           E : out  STD_LOGIC;
           AC : out  STD_LOGIC_VECTOR (15 downto 0);
           IR : out  STD_LOGIC_VECTOR (15 downto 0);
           DR : out  STD_LOGIC_VECTOR (15 downto 0);
           Clk : in  STD_LOGIC);
end ManoDataPath;

architecture Behavioral of ManoDataPath is
component Reg16Bits is
	Port(Clk : in  STD_LOGIC;
        Rst : in  STD_LOGIC;
        LD : in  STD_LOGIC;
        Inc : in  STD_LOGIC;
			  
        Din : in  STD_LOGIC_VECTOR (15 downto 0);
        Dout : out  STD_LOGIC_VECTOR (15 downto 0));
end component;
component Reg8Bits is
    Port ( Clk : in  STD_LOGIC;
           Rst : in  STD_LOGIC;
           LD : in  STD_LOGIC;
			  
           Din : in  STD_LOGIC_VECTOR (7 downto 0);
           Dout : out  STD_LOGIC_VECTOR (7 downto 0));
end component;
component RAM32x16Bits is
    Port ( Addr : in  STD_LOGIC_VECTOR (4 downto 0);
           Clk : in  STD_LOGIC;
           Rd : in  STD_LOGIC;
           Wr : in  STD_LOGIC;
           Din : in  STD_LOGIC_VECTOR (15 downto 0);
           Dout : out  STD_LOGIC_VECTOR (15 downto 0));
end component;
component E_FF is
    Port ( Clk : in  STD_LOGIC;
           Rst : in  STD_LOGIC;
           LD : in  STD_LOGIC;
           Comp : in  STD_LOGIC;
           Ein : in  STD_LOGIC;
           Eout : out  STD_LOGIC);
end component;
component Common_BUS is
    Port ( Mem : in  STD_LOGIC_VECTOR (15 downto 0);
           AR : in  STD_LOGIC_VECTOR (15 downto 0);
           PC : in  STD_LOGIC_VECTOR (15 downto 0);
           DR : in  STD_LOGIC_VECTOR (15 downto 0);
           AC : in  STD_LOGIC_VECTOR (15 downto 0);
           IR : in  STD_LOGIC_VECTOR (15 downto 0);
           TR : in  STD_LOGIC_VECTOR (15 downto 0);
           S : in  STD_LOGIC_VECTOR (2 downto 0);
           Out_BUS : out  STD_LOGIC_VECTOR (15 downto 0));
end component;
component ALU_16bits
    Port ( AC : in  STD_LOGIC_VECTOR (15 downto 0);
           DR : in  STD_LOGIC_VECTOR (15 downto 0);
           Control_Cmd : in  STD_LOGIC_VECTOR (6 downto 0);
           INPR : in  STD_LOGIC_VECTOR (7 downto 0);
           Cin : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           ALU_Out : out  STD_LOGIC_VECTOR (15 downto 0));
end component;
signal Mem_Out: STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
signal AR_Out: STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
signal PC_Out: STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
signal DR_Out: STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
signal AC_Out: STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
signal IR_Out: STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
signal TR_Out: STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
signal Out_BUS: STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000"; 
signal ALU_Out: STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
signal Cout: STD_LOGIC := '0';
begin
U0: RAM32x16Bits
	Port map(Addr => Out_BUS(4 downto 0),
           Clk => Clk,
           Rd => Rd_Mem,
           Wr => Wr_Mem,
           Din => Out_BUS,
           Dout => Mem_Out);
U1: Reg16Bits
	Port map(Clk => Clk,
				Rst => Rst,
				LD => LD_AR,
				Inc => Inc_AR,
			  
				Din => Out_BUS,
				Dout => AR_Out);
U2: Reg16Bits
	Port map(Clk => Clk,
				Rst => Rst,
				LD => LD_PC,
				Inc => Inc_PC,
				Din => Out_BUS,
				Dout => PC_Out);
U3: Reg16Bits
	Port map(Clk => Clk,
				Rst => Rst,
				LD => LD_DR,
				Inc => Inc_DR,
				Din => Out_BUS,
				Dout => DR_Out);
				
U4: ALU_16bits
	Port map(AC => AC_Out,
           DR => DR_Out,
           Control_Cmd => Control_Cmd,
           INPR => INPR,
           Cin => '0',
           Cout => Cout,
           ALU_Out => ALU_Out);
U5: E_FF
	Port map(Clk => Clk,
           Rst => Rst_E,
           LD => LD_E,
           Comp => COM_E,
           Ein => Cout,
           Eout => E);

U6: Reg16Bits
	Port map(Clk => Clk,
				Rst => Rst,
				LD => LD_AC,
				Inc => Inc_AC,
				Din => ALU_Out,
				Dout => AC_Out);

U7: Reg16Bits
	Port map(Clk => Clk,
				Rst => Rst,
				LD => LD_IR,
				Inc => '0',
				Din => Out_BUS,
				Dout => IR_Out);
				
U8: Reg16Bits
	Port map(Clk => Clk,
				Rst => Rst,
				LD => LD_TR,
				Inc => Inc_TR,
				Din => Out_BUS,
				Dout => TR_Out);

U9: Reg8Bits
    Port map( Clk => Clk,
           Rst => Rst,
           LD => LD_OUTR,			  
           Din(7) => Out_BUS(7),
			  Din(6) => Out_BUS(6),
			  Din(5) => Out_BUS(5),
			  Din(4) => Out_BUS(4),
			  Din(3) => Out_BUS(3),
			  Din(2) => Out_BUS(2),
			  Din(1) => Out_BUS(1),
			  Din(0) => Out_BUS(0),
           Dout => OUTR);

U10: Common_BUS
    Port map( Mem => Mem_Out,
           AR => AR_Out,
           PC => PC_Out,
           DR => DR_Out,
           AC => AC_Out,
           IR => IR_Out,
           TR => TR_Out,
           S => S,
           Out_BUS => Out_BUS);

end Behavioral;

