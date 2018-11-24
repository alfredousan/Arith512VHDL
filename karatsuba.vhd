library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity karatsuba2 is
    Port (  
        A: in STD_LOGIC_VECTOR (1 downto 0);
        B: in STD_LOGIC_VECTOR (1 downto 0);
        R: out STD_LOGIC_VECTOR (3 downto 0)
    );
end karatsuba2;

architecture Behavioral of karatsuba2 is

constant high: integer := 1;
constant low: integer := 0;

constant top: integer := 3;
constant middle: integer := 1;

signal a0b0, a1b1, b1, b2, c1: STD_LOGIC;
signal sa, sb: STD_LOGIC_VECTOR(middle downto 0);
signal m, r0, r1: STD_LOGIC_VECTOR(top downto 0);

component sum is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           Cout : out STD_LOGIC;
           S : out STD_LOGIC);
end component;

component mul2 is
    Port ( A : in STD_LOGIC_VECTOR (middle downto 0);
           B : in STD_LOGIC_VECTOR (middle downto 0);
           R : out STD_LOGIC_VECTOR (top downto 0));
end component;

component res4 is
    Port ( A : in STD_LOGIC_VECTOR (top downto 0);
           B : in STD_LOGIC_VECTOR (top downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (top downto 0);
           Cout : out STD_LOGIC);
end component;

component sum4 is
    Port ( A : in STD_LOGIC_VECTOR (top downto 0);
           B : in STD_LOGIC_VECTOR (top downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (top downto 0);
           Cout : out STD_LOGIC);
end component;

begin
a0b0 <= a(low) and b(low);
a1b1 <= a(high) and b(high);

sum0: sum port map(
    A => A(low),
    B => A(high),
    Cin => '0',
    Cout => sa(high),
    S => sa(low)
);

sum1: sum port map(
    A => B(low),
    B => B(high),
    Cin => '0',
    Cout => sb(high),
    S => sb(low)
);

mul0: mul2 port map(
    A => sa,
    B => sb,
    R => m
);

resta0: res4 port map(
    A => m,
    B(low) => a0b0,
    B(top downto low +1) => (others => '0'),
    Cin => '0',
    Cout => b1,
    S => r0
);

resta1: res4 port map(
    A => r0,
    B(low) => a1b1,
    B(top downto low +1) => (others => '0'),
    Cin => '0',
    Cout => b2,
    S => r1
);

suma2: sum4 port map(
    A(top downto low+1) => r1(top-1 downto 0),
    A(low) => '0',
    B(high+1) => a1b1,
    B(low+1) => '0',
    B(low) => a0b0,
    B(top) => '0',
    Cin => '0',
    Cout => c1,
    S => R
);
end Behavioral;