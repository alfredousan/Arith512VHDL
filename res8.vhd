library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity res8 is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (7 downto 0);
           Cout : out STD_LOGIC);
end res8;

architecture Behavioral of res8 is
component res4 is
  Port ( A: in STD_LOGIC_VECTOR(3 downto 0);
         B: in STD_LOGIC_VECTOR(3 downto 0);
         Cin: in STD_LOGIC;
         S: out STD_LOGIC_VECTOR(3 downto 0);
         Cout : out STD_LOGIC
  );
end component;

signal borrow: STD_LOGIC;

begin

res0: res4 port map(
A => A(3 downto 0),
B => B(3 downto 0),
Cin => Cin,
Cout => borrow,
S => S(3 downto 0)
);

res1: res4 port map(
A => A(7 downto 4),
B => B(7 downto 4),
Cin => borrow,
Cout => Cout,
S => S(7 downto 4)
);

end Behavioral;