library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sum128 is
  Port ( A: in STD_LOGIC_VECTOR(127 downto 0);
       B: in STD_LOGIC_VECTOR(127 downto 0);
       Cin: in STD_LOGIC;
       S: out STD_LOGIC_VECTOR(127 downto 0);
       Cout : out STD_LOGIC
);
end sum128;

architecture Behavioral of sum128 is
component sum64 is
  Port ( A: in STD_LOGIC_VECTOR(63 downto 0);
         B: in STD_LOGIC_VECTOR(63 downto 0);
         Cin: in STD_LOGIC;
         S: out STD_LOGIC_VECTOR(63 downto 0);
         Cout : out STD_LOGIC
  );
end component;

signal carry: STD_LOGIC;

begin

sum0: sum64 port map(
A => A(63 downto 0),
B => B(63 downto 0),
Cin => Cin,
Cout => carry,
S => S(63 downto 0)
);

sum1: sum64 port map(
A => A(127 downto 64),
B => B(127 downto 64),
Cin => carry,
Cout => Cout,
S => S(127 downto 64)
);

end Behavioral;