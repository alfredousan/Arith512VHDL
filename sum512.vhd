library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sum512 is
  Port ( A: in STD_LOGIC_VECTOR(511 downto 0);
       B: in STD_LOGIC_VECTOR(511 downto 0);
       Cin: in STD_LOGIC;
       S: out STD_LOGIC_VECTOR(511 downto 0);
       Cout : out STD_LOGIC
);
end sum512;

architecture Behavioral of sum512 is
component sum256 is
  Port ( A: in STD_LOGIC_VECTOR(255 downto 0);
         B: in STD_LOGIC_VECTOR(255 downto 0);
         Cin: in STD_LOGIC;
         S: out STD_LOGIC_VECTOR(255 downto 0);
         Cout : out STD_LOGIC
  );
end component;

signal carry: STD_LOGIC;

begin

sum0: sum256 port map(
A => A(255 downto 0),
B => B(255 downto 0),
Cin => Cin,
Cout => carry,
S => S(255 downto 0)
);

sum1: sum256 port map(
A => A(511 downto 256),
B => B(511 downto 256),
Cin => carry,
Cout => Cout,
S => S(511 downto 256)
);

end Behavioral;