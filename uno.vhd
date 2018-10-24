library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity prueba_not is
    Port ( a : in STD_LOGIC;
           s : out STD_LOGIC);
end prueba_not;

architecture Behavioral of prueba_not is

begin
s <= not a;

end Behavioral;