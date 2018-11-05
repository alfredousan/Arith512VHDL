library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sum8 is
  Port ( A: in STD_LOGIC_VECTOR(7 downto 0);
       B: in STD_LOGIC_VECTOR(7 downto 0);
       Cin: in STD_LOGIC;
       S: out STD_LOGIC_VECTOR(7 downto 0);
       Cout : out STD_LOGIC
);
end sum8;

architecture Behavioral of sum8 is
component sum4 is
  Port ( A: in STD_LOGIC_VECTOR(3 downto 0);
         B: in STD_LOGIC_VECTOR(3 downto 0);
         Cin: in STD_LOGIC;
         S: out STD_LOGIC_VECTOR(3 downto 0);
         Cout : out STD_LOGIC
  );
end component;

signal carry: STD_LOGIC;

begin

sum0: sum4 port map(
A => A(3 downto 0),
B => B(3 downto 0),
Cin => Cin,
Cout => carry,
S => S(3 downto 0)
);

sum1: sum4 port map(
A => A(7 downto 4),
B => B(7 downto 4),
Cin => carry,
Cout => Cout,
S => S(7 downto 4)
);

end Behavioral;
