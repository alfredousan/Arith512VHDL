library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity res128 is
    Port ( A : in STD_LOGIC_VECTOR (127 downto 0);
           B : in STD_LOGIC_VECTOR (127 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (127 downto 0);
           Cout : out STD_LOGIC);
end res128;

architecture Behavioral of res128 is
component res64 is
  Port ( A: in STD_LOGIC_VECTOR(63 downto 0);
         B: in STD_LOGIC_VECTOR(63 downto 0);
         Cin: in STD_LOGIC;
         S: out STD_LOGIC_VECTOR(63 downto 0);
         Cout : out STD_LOGIC
  );
end component;

signal borrow: STD_LOGIC;

begin

res0: res64 port map(
A => A(63 downto 0),
B => B(63 downto 0),
Cin => Cin,
Cout => borrow,
S => S(63 downto 0)
);

res1: res64 port map(
A => A(127 downto 64),
B => B(127 downto 64),
Cin => borrow,
Cout => Cout,
S => S(127 downto 64)
);

end Behavioral;