library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity simple_assign is
    Port (
        led : out std_logic_vector(3 downto 0);
        sw : in std_logic_vector(3 downto 0)
     );
end simple_assign;

architecture Behavioral of simple_assign is

begin

    led <= sw;
    
end Behavioral;
