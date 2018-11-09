library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity res4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Cout : out STD_LOGIC);
end res4;

architecture Behavioral of res4 is
component res2 is
Port ( A: in STD_LOGIC_VECTOR(1 downto 0);
       B: in STD_LOGIC_VECTOR(1 downto 0);
       S: out STD_LOGIC_VECTOR(1 downto 0);
       Cin: in STD_LOGIC;
       Cout: out STD_LOGIC);
end component;

signal borrow: STD_LOGIC;

begin
res0: res2 port map(
A => A(1 downto 0),
B => B(1 downto 0),
Cin => Cin,
Cout => borrow,
S => S(1 downto 0)
);

res1: res2 port map(
A => A(3 downto 2),
B => B(3 downto 2),
Cin => borrow,
Cout => Cout,
S => S(3 downto 2)
);
end Behavioral;