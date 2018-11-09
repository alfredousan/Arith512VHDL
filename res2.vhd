library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity res2 is
    Port ( A : in STD_LOGIC_VECTOR (1 downto 0);
           B : in STD_LOGIC_VECTOR (1 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (1 downto 0);
           Cout : out STD_LOGIC);
end res2;

architecture Behavioral of res2 is

component res is
    Port ( A : in STD_LOGIC;
       B : in STD_LOGIC;
       Cin : in STD_LOGIC;
       Cout : out STD_LOGIC;
       S : out STD_LOGIC);
end component;

signal borrow: STD_LOGIC;

begin
res0: res port map(
A => A(0),
B => B(0),
Cin => Cin,
Cout => borrow,
S => S(0)
);

res1: res port map(
A => A(1),
B => B(1),
Cin => borrow,
Cout => Cout,
S => S(1)
);

end Behavioral;