
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sum2 is
Port ( A: in STD_LOGIC_VECTOR(1 downto 0);
       B: in STD_LOGIC_VECTOR(1 downto 0);
       S: out STD_LOGIC_VECTOR(1 downto 0);
       Cin: in STD_LOGIC;
       Cout: out STD_LOGIC);
end sum2;

architecture Behavioral of sum2 is

component sum is
    Port ( A : in STD_LOGIC;
       B : in STD_LOGIC;
       Cin : in STD_LOGIC;
       Cout : out STD_LOGIC;
       S : out STD_LOGIC);
end component;

signal carry: STD_LOGIC;

begin
sum0: sum port map(
A => A(0),
B => B(0),
Cin => Cin,
Cout => carry,
S => S(0)
);

sum1: sum port map(
A => A(1),
B => B(1),
Cin => carry,
Cout => Cout,
S => S(1)
);

end Behavioral;