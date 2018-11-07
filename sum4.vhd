library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity sum4 is
  Port ( A: in STD_LOGIC_VECTOR(3 downto 0);
         B: in STD_LOGIC_VECTOR(3 downto 0);
         Cin: in STD_LOGIC;
         S: out STD_LOGIC_VECTOR(3 downto 0);
         Cout : out STD_LOGIC
  );
  
end sum4;

architecture Behavioral of sum4 is
component sum2 is
Port ( A: in STD_LOGIC_VECTOR(1 downto 0);
       B: in STD_LOGIC_VECTOR(1 downto 0);
       S: out STD_LOGIC_VECTOR(1 downto 0);
       Cin: in STD_LOGIC;
       Cout: out STD_LOGIC);
end component;

signal carry: STD_LOGIC;

begin
sum0: sum2 port map(
A => A(1 downto 0),
B => B(1 downto 0),
Cin => Cin,
Cout => carry,
S => S(1 downto 0)
);

sum1: sum2 port map(
A => A(3 downto 2),
B => B(3 downto 2),
Cin => carry,
Cout => Cout,
S => S(3 downto 2)
);
end Behavioral;
