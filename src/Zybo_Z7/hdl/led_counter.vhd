library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity led_counter is
    Port (
        sysclk : in std_logic;
        led : out std_logic_vector(3 downto 0)
    );
end led_counter;

architecture Behavioral of led_counter is

    signal cnt : std_logic_vector(27 downto 0);
    
begin

    process(sysclk)
    begin
        if rising_edge(sysclk) then
            cnt <= cnt + 1;
        end if;
    end process;
    
    led <= cnt(27 downto 24);
    
end Behavioral;