library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sum256 is
  Port ( A: in STD_LOGIC_VECTOR(255 downto 0);
       B: in STD_LOGIC_VECTOR(255 downto 0);
       Cin: in STD_LOGIC;
       S: out STD_LOGIC_VECTOR(255 downto 0);
       Cout : out STD_LOGIC
);
end sum256;

architecture Behavioral of sum256 is
component sum128 is
  Port ( A: in STD_LOGIC_VECTOR(127 downto 0);
         B: in STD_LOGIC_VECTOR(127 downto 0);
         Cin: in STD_LOGIC;
         S: out STD_LOGIC_VECTOR(127 downto 0);
         Cout : out STD_LOGIC
  );
end component;

signal carry: STD_LOGIC;

begin

sum0: sum128 port map(
A => A(127 downto 0),
B => B(127 downto 0),
Cin => Cin,
Cout => carry,
S => S(127 downto 0)
);

sum1: sum128 port map(
A => A(255 downto 128),
B => B(255 downto 128),
Cin => carry,
Cout => Cout,
S => S(255 downto 128)
);

end Behavioral;