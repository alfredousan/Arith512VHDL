library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mul8 is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           R : out STD_LOGIC_VECTOR (15 downto 0));
end mul8;

architecture Behavioral of mul8 is

constant Top: integer := 15;
constant Middle: integer := 7;
constant Quart: integer := 3;

signal a0b0, a1b0, a0b1, a1b1, s0, s1: STD_LOGIC_VECTOR(middle downto 0);
signal c0, c1, c2: STD_LOGIC;
signal zeros: STD_LOGIC_VECTOR(middle downto 0);
component mul4 is
    Port ( A : in STD_LOGIC_VECTOR (quart downto 0);
           B : in STD_LOGIC_VECTOR (quart downto 0);
           R : out STD_LOGIC_VECTOR (middle downto 0));
end component;
component sum8 is
  Port ( A: in STD_LOGIC_VECTOR(middle downto 0);
         B: in STD_LOGIC_VECTOR(middle downto 0);
         Cin: in STD_LOGIC;
         S: out STD_LOGIC_VECTOR(middle downto 0);
         Cout : out STD_LOGIC
  );
end component;

begin
zeros <= "00000000";

m0: mul4 port map(
A => A(quart downto 0),
B => B(quart downto 0),
R => a0b0
);

m1: mul4 port map(
A => A(middle downto quart +1),
B => B(quart downto 0),
R => a1b0
);

m2: mul4 port map(
A => A(quart downto 0),
B => B(middle downto quart +1),
R => a0b1
);

m3: mul4 port map(
A => A(middle downto quart +1),
B => B(middle downto quart +1),
R => a1b1
);

R(quart downto 0) <= a0b0(quart downto 0);

sum0: sum8 port map(
  A(quart downto 0) => a0b0(middle downto quart +1),
  A(middle downto quart +1) => zeros(quart downto 0),
  B => a1b0,
  Cin => '0',
  Cout => c0,
  S => s0
  );

sum1: sum8 port map(
  A => s0,
  B => a0b1,
  Cin => c0,
  Cout => c1,
  S => s1
  );
  
  R(middle downto quart +1) <= s1(quart downto 0);
  

sum3: sum8 port map(
  A(quart downto 0) => s1(middle downto quart +1),
  A(quart + 1) => c1,
  A(middle downto quart +2) => zeros(middle downto quart +2),
  B => a1b1,
  Cin => '0',
  Cout => c2,
  S => R(top downto middle +1)
  );
  

end Behavioral;