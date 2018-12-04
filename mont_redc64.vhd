library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity redc64 is
Port(
    A: in STD_LOGIC_VECTOR(127 downto 0);
    u: out STD_LOGIC_VECTOR(64 downto 0)
);
end redc64;

architecture Behavioral of redc64 is
signal carr: STD_LOGIC;
signal p, mu, t, q: STD_LOGIC_VECTOR(63 downto 0);
signal Rq, o, u2: STD_LOGIC_VECTOR(127 downto 0);

component mul64 is
    Port ( A : in STD_LOGIC_VECTOR (63 downto 0);
           B : in STD_LOGIC_VECTOR (63 downto 0);
           R : out STD_LOGIC_VECTOR (127 downto 0));
end component;

component sum128 is
  Port ( A: in STD_LOGIC_VECTOR(127 downto 0);
       B: in STD_LOGIC_VECTOR(127 downto 0);
       Cin: in STD_LOGIC;
       S: out STD_LOGIC_VECTOR(127 downto 0);
       Cout : out STD_LOGIC
);
end component;

begin

p <= "1011110001100011000111000011101111011101110011000110110110110111";
mu <= "0110101010011100110101111111111001110100001000001111111111111001";
t <= a(63 downto 0);
m0: mul64 port map(
    A => mu,
    B => t,
    R => Rq
);

q <= Rq(63 downto 0);

m1: mul64 port map(
    A => p,
    B => q,
    R => o
);

sum0: sum128 port map(
    A => a,
    B => o,
    S => u2,
    Cin => '0',
    Cout => carr
);

u(63 downto 0) <= u2(127 downto 64);
u(64) <= carr;

end Behavioral;