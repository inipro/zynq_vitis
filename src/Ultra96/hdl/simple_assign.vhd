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
        pmod_a : out std_logic_vector(7 downto 0);
        pmod_c : in std_logic_vector(7 downto 0)
     );
end simple_assign;

architecture Behavioral of simple_assign is

begin

    pmod_a <= pmod_c;
    
end Behavioral;
