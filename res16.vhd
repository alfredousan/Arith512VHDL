library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity res16 is
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (15 downto 0);
           Cout : out STD_LOGIC);
end res16;

architecture Behavioral of res16 is
component res8 is
  Port ( A: in STD_LOGIC_VECTOR(7 downto 0);
         B: in STD_LOGIC_VECTOR(7 downto 0);
         Cin: in STD_LOGIC;
         S: out STD_LOGIC_VECTOR(7 downto 0);
         Cout : out STD_LOGIC
  );
end component;

signal borrow: STD_LOGIC;

begin

res0: res8 port map(
A => A(7 downto 0),
B => B(7 downto 0),
Cin => Cin,
Cout => borrow,
S => S(7 downto 0)
);

res1: res8 port map(
A => A(15 downto 8),
B => B(15 downto 8),
Cin => borrow,
Cout => Cout,
S => S(15 downto 8)
);

end Behavioral;