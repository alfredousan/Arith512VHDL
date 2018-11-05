
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sum is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           Cout : out STD_LOGIC;
           S : out STD_LOGIC);
end sum;

architecture Behavioral of sum is
signal aab, axb, rac: STD_LOGIC;
begin
  aab <= a AND b;
  axb <= a XOR b;
  rac <= axb AND Cin; 
  Cout <= aab OR rac;
  S <= Cin XOR axb;
end Behavioral;