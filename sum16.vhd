library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sum16 is
  Port ( A: in STD_LOGIC_VECTOR(15 downto 0);
       B: in STD_LOGIC_VECTOR(15 downto 0);
       Cin: in STD_LOGIC;
       S: out STD_LOGIC_VECTOR(15 downto 0);
       Cout : out STD_LOGIC
);
end sum16;

architecture Behavioral of sum16 is
component sum8 is
  Port ( A: in STD_LOGIC_VECTOR(7 downto 0);
         B: in STD_LOGIC_VECTOR(7 downto 0);
         Cin: in STD_LOGIC;
         S: out STD_LOGIC_VECTOR(7 downto 0);
         Cout : out STD_LOGIC
  );
end component;

signal carry: STD_LOGIC;

begin

sum0: sum8 port map(
A => A(7 downto 0),
B => B(7 downto 0),
Cin => Cin,
Cout => carry,
S => S(7 downto 0)
);

sum1: sum8 port map(
A => A(15 downto 8),
B => B(15 downto 8),
Cin => carry,
Cout => Cout,
S => S(15 downto 8)
);

end Behavioral;