library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity res512 is
    Port ( A : in STD_LOGIC_VECTOR (511 downto 0);
           B : in STD_LOGIC_VECTOR (511 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (511 downto 0);
           Cout : out STD_LOGIC);
end res512;

architecture Behavioral of res512 is
component res256 is
  Port ( A: in STD_LOGIC_VECTOR(255 downto 0);
         B: in STD_LOGIC_VECTOR(255 downto 0);
         Cin: in STD_LOGIC;
         S: out STD_LOGIC_VECTOR(255 downto 0);
         Cout : out STD_LOGIC
  );
end component;

signal borrow: STD_LOGIC;

begin

res0: res256 port map(
A => A(255 downto 0),
B => B(255 downto 0),
Cin => Cin,
Cout => borrow,
S => S(255 downto 0)
);

res1: res256 port map(
A => A(511 downto 256),
B => B(511 downto 256),
Cin => borrow,
Cout => Cout,
S => S(511 downto 256)
);

end Behavioral;