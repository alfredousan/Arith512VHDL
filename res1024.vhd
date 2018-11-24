
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity res1024 is
    Port ( A : in STD_LOGIC_VECTOR (1023 downto 0);
           B : in STD_LOGIC_VECTOR (1023 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (1023 downto 0);
           Cout : out STD_LOGIC);
end res1024;

architecture Behavioral of res1024 is
component res512 is
  Port ( A: in STD_LOGIC_VECTOR(511 downto 0);
         B: in STD_LOGIC_VECTOR(511 downto 0);
         Cin: in STD_LOGIC;
         S: out STD_LOGIC_VECTOR(511 downto 0);
         Cout : out STD_LOGIC
  );
end component;

signal borrow: STD_LOGIC;

begin

res0: res512 port map(
A => A(511 downto 0),
B => B(511 downto 0),
Cin => Cin,
Cout => borrow,
S => S(511 downto 0)
);

res1: res512 port map(
A => A(1023 downto 512),
B => B(1023 downto 512),
Cin => borrow,
Cout => Cout,
S => S(1023 downto 512)
);

end Behavioral;