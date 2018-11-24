library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sum1024 is
  Port ( A: in STD_LOGIC_VECTOR(1023 downto 0);
       B: in STD_LOGIC_VECTOR(1023 downto 0);
       Cin: in STD_LOGIC;
       S: out STD_LOGIC_VECTOR(1023 downto 0);
       Cout : out STD_LOGIC
);
end sum1024;

architecture Behavioral of sum1024 is
component sum512 is
  Port ( A: in STD_LOGIC_VECTOR(511 downto 0);
         B: in STD_LOGIC_VECTOR(511 downto 0);
         Cin: in STD_LOGIC;
         S: out STD_LOGIC_VECTOR(511 downto 0);
         Cout : out STD_LOGIC
  );
end component;

signal carry: STD_LOGIC;

begin

sum0: sum512 port map(
A => A(511 downto 0),
B => B(511 downto 0),
Cin => Cin,
Cout => carry,
S => S(511 downto 0)
);

sum1: sum512 port map(
A => A(1023 downto 512),
B => B(1023 downto 512),
Cin => carry,
Cout => Cout,
S => S(1023 downto 512)
);

end Behavioral;