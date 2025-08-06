-- test bench to verify the operation of and gate logic

library IEEE;
use IEEE.numeric_std.all;
use IEEE.STD_LOGIC_1164.all;

entity state_mac_tb is
end state_mac_tb;

architecture behave of state_mac_tb is
	component state_machine is
     Port (
       		reset : in std_logic;
		fclk : in std_logic;
        	HEX1 : out std_logic_vector(7 downto 0);
		EN1  : out std_logic;
		EN0  : out std_logic;
		EN2  : out std_logic;
		EN3  : out std_logic
     );
	end component;

constant clockperiod : time := 20 ns;

signal rese, E0, E1, E2, E3 : std_logic;
signal HE : std_logic_vector(7 downto 0);
signal ficlk : std_logic	:= '0';
begin

    state_machine_i : entity work.Count1to9
	port map(

        	reset   => rese,
		HEX1	=> HE,
        	EN0     => E0,
		EN1     => E1,
		EN2		=> E2,
		EN3		=> E3,
		fclk	=> ficlk
    );
ficlk	<= not ficlk after clockperiod/2;

Process is
	begin
		rese	<= '0';
		
		wait for 100 ns;
		
		rese 	<= '1';
		
		wait for 10 ns;
		
		rese	<= '0';
		
		wait for 100 ns ;

	end process;
end behave;
		