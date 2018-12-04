library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity montgomery64 is
Port( Am: in STD_LOGIC_VECTOR(63 downto 0);
      Bm: in STD_LOGIC_VECTOR(63 downto 0);
      C: out STD_LOGIC_VECTOR(64 downto 0)
);
end montgomery64;

architecture Behavioral of montgomery64 is
signal d: STD_LOGIC_VECTOR(127 downto 0);
component mul64 is
    Port ( A : in STD_LOGIC_VECTOR (63 downto 0);
           B : in STD_LOGIC_VECTOR (63 downto 0);
           R : out STD_LOGIC_VECTOR (127 downto 0));
end component;

component redc64 is
Port(
    A: in STD_LOGIC_VECTOR(127 downto 0);
    u: out STD_LOGIC_VECTOR(64 downto 0)
);
end component;

begin
m0: mul64 port map(
    A => Am,
    B => Bm,
    R => d
);

r0: redc64 port map(
    A => d,
    u => C
);
end Behavioral;