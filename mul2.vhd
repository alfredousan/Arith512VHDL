library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mul2 is
    Port ( A : in STD_LOGIC_VECTOR (1 downto 0);
           B : in STD_LOGIC_VECTOR (1 downto 0);
           R : out STD_LOGIC_VECTOR (3 downto 0));
end mul2;

architecture Behavioral of mul2 is
signal a0b0, a1b0, a0b1, a1b1, carry: STD_LOGIC;

component sum is
    Port ( A : in STD_LOGIC;
       B : in STD_LOGIC;
       Cin : in STD_LOGIC;
       Cout : out STD_LOGIC;
       S : out STD_LOGIC);
end component;
begin

a0b0 <= a(0) and b(0);
a1b0 <= a(1) and b(0);
a0b1 <= a(0) and b(1);
a1b1 <= a(1) and b(1);

R(0) <= a0b0;

sum0: sum port map(
  A => a1b0,
  B => a0b1,
  Cin => '0',
  Cout => carry,
  S => R(1)
  );
  
sum1: sum port map(
  A => a1b1,
  B => '0',
  Cin => carry,
  Cout => R(3),
  S => R(2)
  );
  
end Behavioral;