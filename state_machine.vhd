----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/10/2025 11:49:22 AM
-- Design Name: 
-- Module Name: hello_world - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Count1to9 is
generic (
	      --Tclk : integer := 10 -- for simulation timing
	      Tclk : integer := 100000000	
);

  Port (

        	reset : in std_logic;
		fclk : in std_logic;
        	HEX1 : out std_logic_vector(7 downto 0);
		EN1  : out std_logic;
		EN0  : out std_logic;
		EN2  : out std_logic;
		EN3  : out std_logic

        );
end Count1to9;

architecture Behavioral of Count1to9 is

signal coun_clk : integer := 0;
signal aim_clk : integer := Tclk-1;
type count is (N9,N8,N7,N6,N5,N4,N3,N2,N1,N0,delay);
signal state : count := N9;
signal new_state : count := N8;

begin    
   
Count1to9: process(fclk)
begin

	if rising_edge(fclk) then


	EN0<='0';
	EN1<='1';
	EN2<='1';
	EN3<='1';

		if reset='0' then
			EN0<='0';
			EN1<='1';
			EN2<='1';
			EN3<='1';

			--coun_clk <=  coun_clk+1;
			case state is
				when N9 =>
					HEX1<=X"19";-- Hexadecimal for 9
					state <= delay;
					new_state <= N8;
				when N8 =>
					HEX1<=X"01";-- Hexadecimal for 8
					state <= delay;
					new_state <= N7;
				when N7 =>
					HEX1<=X"1B";-- Hexadecimal for 7
					state <= delay;
					new_state <= N6;
				when N6=>
					HEX1<=X"41";-- Hexadecimal for 6
					state <= delay;
					new_state <= N5;
				when N5 =>
					HEX1<=X"49";-- Hexadecimal for 5
					state <= delay;
					new_state <= N4;
				when N4 =>
					HEX1<=X"99";-- Hexadecimal for 4
					state <= delay;
					new_state <= N3;
				when N3 =>
					HEX1<=X"0D";-- Hexadecimal for 3
					state <= delay;
					new_state <= N2;
				when N2 =>
					HEX1<=X"25";-- Hexadecimal for 2
					state <= delay;
					new_state <= N1;
				when N1 =>
					HEX1<=X"9F";-- Hexadecimal for 1
					state <= delay;
					new_state <= N0;
				when N0 =>
					HEX1<=X"03";-- Hexadecimal for 0
				when delay =>
					if coun_clk = aim_clk then 
						coun_clk <= 0;
						state <= new_state;
						
					else
						coun_clk <= coun_clk + 1;
						
					end if;
			end case;
				
		
		else

			EN0<='1';
			EN1<='1';
			EN2<='1';
			EN3<='1';
			state <= N9;
			HEX1 <= X"FF";
		end if;
	end if;
	
end process;

end Behavioral;