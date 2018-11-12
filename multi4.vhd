library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multi4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           R : out STD_LOGIC_VECTOR (7 downto 0));
end multi4;

architecture Behavioral of multi4 is
signal a0b0, a1b0, a0b1, a2b0, a1b1, a0b2, a3b0, a2b1, a1b2, a0b3, a3b1, a2b2, a1b3, a3b2, a2b3, a3b3, c0, c1, c2, c3, c4, c5, c6, c7, c8, s0, s1, s2, s3: STD_LOGIC;
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
a2b0 <= a(2) and b(0);
a1b1 <= a(1) and b(1);
a0b2 <= a(0) and b(2);
a3b0 <= a(3) and b(0);
a2b1 <= a(2) and b(1);
a1b2 <= a(1) and b(2);
a0b3 <= a(0) and b(3);
a3b1 <= a(3) and b(1);
a2b2 <= a(2) and b(2);
a1b3 <= a(1) and b(3);
a3b2 <= a(3) and b(2);
a2b3 <= a(2) and b(3);
a3b3 <= a(3) and b(3);

-- R0
R(0) <= a0b0;

-- R1
sum0: sum port map(
  A => a1b0,
  B => a0b1,
  Cin => '0',
  Cout => c0,
  S => R(1)
);

-- R2
sum1: sum port map(
  A => a2b0,
  B => a1b1,
  Cin => c0,
  Cout => c1,
  S => s0
);
sum2: sum port map(
  A => a0b2,
  B => s0,
  Cin => c1,
  Cout => c2,
  S => R(2)
);

-- R3
sum3: sum port map(
  A => a3b0,
  B => a2b1,
  Cin => c2,
  Cout => c3,
  S => s1
);
sum4: sum port map(
  A => a1b2,
  B => s1,
  Cin => c3,
  Cout => c4,
  S => s2
);
sum5: sum port map(
  A => a0b3,
  B => s2,
  Cin => c4,
  Cout => c5,
  S => R(3)
);

-- R4
sum6: sum port map(
  A => a3b1,
  B => a2b2,
  Cin => c5,
  Cout => c6,
  S => s3
);
sum7: sum port map(
  A => a1b3,
  B => s3,
  Cin => c6,
  Cout => c7,
  S => R(4)
);

-- R5
sum8: sum port map(
  A => a3b2,
  B => a2b3,
  Cin => c7,
  Cout => c8,
  S => R(5)
);

-- R6 & R7
sum9: sum port map(
  A => a3b3,
  B => '0',
  Cin => c8,
  Cout => R(7),
  S => R(6)
);

end Behavioral;