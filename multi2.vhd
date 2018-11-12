library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mul is

 Port ( A : in STD_LOGIC_VECTOR(1 downto 0);
        B : in STD_LOGIC_VECTOR(1 downto 0);
        C : out STD_LOGIC_VECTOR(3 downto 0));
end mul;

architecture Behavioral of mul is
signal d0, d1, d2, d3, d4: std_logic;
begin
d3 <= a(1) and b(1);
d2 <= a(1) and b(0);
c(0) <= a(0) and b(0);
d0 <= a(0) and b(1);

c(1) <= d0 xor d2;
d4 <= d0 and d2;
c(2) <= d4 xor d3;
c(3) <= d4 and d3;

end Behavioral;