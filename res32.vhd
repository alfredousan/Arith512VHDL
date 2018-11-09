library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity res32 is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (31 downto 0);
           Cout : out STD_LOGIC);
end res32;

architecture Behavioral of res32 is
component res16 is
  Port ( A: in STD_LOGIC_VECTOR(15 downto 0);
         B: in STD_LOGIC_VECTOR(15 downto 0);
         Cin: in STD_LOGIC;
         S: out STD_LOGIC_VECTOR(15 downto 0);
         Cout : out STD_LOGIC
  );
end component;

signal borrow: STD_LOGIC;

begin

res0: res16 port map(
A => A(15 downto 0),
B => B(15 downto 0),
Cin => Cin,
Cout => borrow,
S => S(15 downto 0)
);

res1: res16 port map(
A => A(31 downto 16),
B => B(31 downto 16),
Cin => borrow,
Cout => Cout,
S => S(31 downto 16)
);

end Behavioral;