library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity karatsuba8 is
    Port (  
        A: in STD_LOGIC_VECTOR (7 downto 0);
        B: in STD_LOGIC_VECTOR (7 downto 0);
        R: out STD_LOGIC_VECTOR (15 downto 0)
    );
end karatsuba8;

architecture Behavioral of karatsuba8 is

constant top: integer := 15;
constant middle: integer := 7;
constant quart: integer := 3;
constant n: integer := 2;

signal borrow0, borrow1, c, c0, c1: STD_LOGIC;
signal a0b0, a1b1, sa, sb: STD_LOGIC_VECTOR(middle downto 0);
signal m2, r0, r1: STD_LOGIC_VECTOR(top downto 0);

component karatsuba4 is
    Port (  
        A: in STD_LOGIC_VECTOR (quart downto 0);
        B: in STD_LOGIC_VECTOR (quart downto 0);
        R: out STD_LOGIC_VECTOR (middle downto 0)
    );
end component;

component sum8 is
Port ( A: in STD_LOGIC_VECTOR(middle downto 0);
       B: in STD_LOGIC_VECTOR(middle downto 0);
       S: out STD_LOGIC_VECTOR(middle downto 0);
       Cin: in STD_LOGIC;
       Cout: out STD_LOGIC);
end component;

component mul8 is
    Port ( A : in STD_LOGIC_VECTOR (middle downto 0);
           B : in STD_LOGIC_VECTOR (middle downto 0);
           R : out STD_LOGIC_VECTOR (top downto 0));
end component;

component res16 is
    Port ( A : in STD_LOGIC_VECTOR (top downto 0);
           B : in STD_LOGIC_VECTOR (top downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (top downto 0);
           Cout : out STD_LOGIC);
end component;

component sum16 is
    Port ( A : in STD_LOGIC_VECTOR (top downto 0);
           B : in STD_LOGIC_VECTOR (top downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (top downto 0);
           Cout : out STD_LOGIC);
end component;

begin
mu0: karatsuba4 port map(
    A => A(quart downto 0),
    B => B(quart downto 0),
    R => a0b0
);

mu1: karatsuba4 port map(
    A => A(middle downto quart +1),
    B => B(middle downto quart +1),
    R => a1b1
);

s0: sum8 port map(
    A(quart downto 0) => A(quart downto 0),
    A(middle downto quart +1)=>(others => '0'),
    B(quart downto 0) => A(middle downto quart +1),
    B(middle downto quart +1)=>(others => '0'),
    Cin => '0',
    Cout => c0,
    S => sa(middle downto 0)
);

s1: sum8 port map(
    A(quart downto 0) => B(quart downto 0),
    A(middle downto quart +1)=>(others => '0'),
    B(quart downto 0) => B(middle downto quart +1),
    B(middle downto quart +1)=>(others => '0'),
    Cin => '0',
    Cout => c1,
    S => sb(middle downto 0)  
);

mu2: mul8 port map(
    A => sa,
    B => sb,
    R => m2
);

re0: res16 port map(
    A => m2,
    B(middle downto 0) => (a0b0),
    B(top downto middle +1) => (others => '0'),
    S => r0,
    Cin => '0',
    Cout => borrow0
);

re1: res16 port map(
    A => r0,
    B(middle downto 0) =>a1b1,
    B(top downto middle +1) => (others => '0'),
    S => r1,
    Cin => '0',
    Cout => borrow1
);

s2: sum16 port map(
    A(middle downto 0) => a0b0,
    A(top downto middle +1) => a1b1,
    B(top downto quart +1) => r1(top -2*n downto 0),
    B(quart downto 0) => (others => '0'),
    Cin => '0',
    Cout => c,
    S=>R
);
end Behavioral;