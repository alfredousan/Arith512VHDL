library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mul4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           R : out STD_LOGIC_VECTOR (7 downto 0));
end mul4;

architecture Behavioral of mul4 is
signal a0b0, a1b0, a0b1, a1b1, s0, s1: STD_LOGIC_VECTOR(3 downto 0);
signal c0, c1, c2: STD_LOGIC;
signal zeros: STD_LOGIC_VECTOR(3 downto 0);
component mul2 is
    Port ( A : in STD_LOGIC_VECTOR (1 downto 0);
           B : in STD_LOGIC_VECTOR (1 downto 0);
           R : out STD_LOGIC_VECTOR (3 downto 0));
end component;
component sum4 is
  Port ( A: in STD_LOGIC_VECTOR(3 downto 0);
         B: in STD_LOGIC_VECTOR(3 downto 0);
         Cin: in STD_LOGIC;
         S: out STD_LOGIC_VECTOR(3 downto 0);
         Cout : out STD_LOGIC
  );
end component;

begin
zeros <= "0000";

m0: mul2 port map(
A => A(1 downto 0),
B => B(1 downto 0),
R => a0b0
);

m1: mul2 port map(
A => A(3 downto 2),
B => B(1 downto 0),
R => a1b0
);

m2: mul2 port map(
A => A(1 downto 0),
B => B(3 downto 2),
R => a0b1
);

m3: mul2 port map(
A => A(3 downto 2),
B => B(3 downto 2),
R => a1b1
);

R(1 downto 0) <= a0b0(1 downto 0);

sum0: sum4 port map(
  A(1 downto 0) => a0b0(3 downto 2),
  A(3 downto 2) => zeros(1 downto 0),
  B => a1b0,
  Cin => '0',
  Cout => c0,
  S => s0
  );

sum1: sum4 port map(
  A => s0,
  B => a0b1,
  Cin => c0,
  Cout => c1,
  S => s1
  );
  
  R(3 downto 2) <= s1(1 downto 0);
  

sum3: sum4 port map(
  A(1 downto 0) => s1(3 downto 2),
  A(2) => c1,
  A(3) => zeros(0),
  B => a1b1,
  Cin => '0',
  Cout => c2,
  S => R(7 downto 4)
  );
  

end Behavioral;