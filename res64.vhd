library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity res64 is
    Port ( A : in STD_LOGIC_VECTOR (63 downto 0);
           B : in STD_LOGIC_VECTOR (63 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (63 downto 0);
           Cout : out STD_LOGIC);
end res64;

architecture Behavioral of res64 is
component res32 is
  Port ( A: in STD_LOGIC_VECTOR(31 downto 0);
         B: in STD_LOGIC_VECTOR(31 downto 0);
         Cin: in STD_LOGIC;
         S: out STD_LOGIC_VECTOR(31 downto 0);
         Cout : out STD_LOGIC
  );
end component;

signal borrow: STD_LOGIC;

begin

res0: res32 port map(
A => A(31 downto 0),
B => B(31 downto 0),
Cin => Cin,
Cout => borrow,
S => S(31 downto 0)
);

res1: res32 port map(
A => A(63 downto 32),
B => B(63 downto 32),
Cin => borrow,
Cout => Cout,
S => S(63 downto 32)
);

end Behavioral;
