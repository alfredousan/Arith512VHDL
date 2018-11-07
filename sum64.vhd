library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sum64 is
  Port ( A: in STD_LOGIC_VECTOR(63 downto 0);
       B: in STD_LOGIC_VECTOR(63 downto 0);
       Cin: in STD_LOGIC;
       S: out STD_LOGIC_VECTOR(63 downto 0);
       Cout : out STD_LOGIC
);
end sum64;

architecture Behavioral of sum64 is
component sum32 is
  Port ( A: in STD_LOGIC_VECTOR(31 downto 0);
         B: in STD_LOGIC_VECTOR(31 downto 0);
         Cin: in STD_LOGIC;
         S: out STD_LOGIC_VECTOR(31 downto 0);
         Cout : out STD_LOGIC
  );
end component;

signal carry: STD_LOGIC;

begin

sum0: sum32 port map(
A => A(31 downto 0),
B => B(31 downto 0),
Cin => Cin,
Cout => carry,
S => S(31 downto 0)
);

sum1: sum32 port map(
A => A(63 downto 32),
B => B(63 downto 32),
Cin => carry,
Cout => Cout,
S => S(63 downto 32)
);

end Behavioral;