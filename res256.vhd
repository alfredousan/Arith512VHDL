library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity res256 is
    Port ( A : in STD_LOGIC_VECTOR (255 downto 0);
           B : in STD_LOGIC_VECTOR (255 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (255 downto 0);
           Cout : out STD_LOGIC);
end res256;

architecture Behavioral of res256 is
component res128 is
  Port ( A: in STD_LOGIC_VECTOR(127 downto 0);
         B: in STD_LOGIC_VECTOR(127 downto 0);
         Cin: in STD_LOGIC;
         S: out STD_LOGIC_VECTOR(127 downto 0);
         Cout : out STD_LOGIC
  );
end component;

signal borrow: STD_LOGIC;

begin

res0: res128 port map(
A => A(127 downto 0),
B => B(127 downto 0),
Cin => Cin,
Cout => borrow,
S => S(127 downto 0)
);

res1: res128 port map(
A => A(255 downto 128),
B => B(255 downto 128),
Cin => borrow,
Cout => Cout,
S => S(255 downto 128)
);

end Behavioral;