library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sum32 is
  Port ( A: in STD_LOGIC_VECTOR(31 downto 0);
       B: in STD_LOGIC_VECTOR(31 downto 0);
       Cin: in STD_LOGIC;
       S: out STD_LOGIC_VECTOR(31 downto 0);
       Cout : out STD_LOGIC
);
end sum32;

architecture Behavioral of sum32 is
component sum16 is
  Port ( A: in STD_LOGIC_VECTOR(15 downto 0);
         B: in STD_LOGIC_VECTOR(15 downto 0);
         Cin: in STD_LOGIC;
         S: out STD_LOGIC_VECTOR(15 downto 0);
         Cout : out STD_LOGIC
  );
end component;

signal carry: STD_LOGIC;

begin

sum0: sum16 port map(
A => A(15 downto 0),
B => B(15 downto 0),
Cin => Cin,
Cout => carry,
S => S(15 downto 0)
);

sum1: sum16 port map(
A => A(31 downto 16),
B => B(31 downto 16),
Cin => carry,
Cout => Cout,
S => S(31 downto 16)
);

end Behavioral;