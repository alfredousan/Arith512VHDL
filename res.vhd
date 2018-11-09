library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity res is
    Port ( A : in STD_LOGIC;
       B : in STD_LOGIC;
       Cin : in STD_LOGIC;
       Cout : out STD_LOGIC;
       S : out STD_LOGIC);
end res;

architecture Behavioral of res is
signal axb, na, naab, naxb, canx: STD_LOGIC;
begin
axb <= A xor B;
na <= not a;
naab <= na and b;
naxb <= not axb;
canx <= naxb and Cin;
S <= axb xor Cin;
Cout <= canx or naab;

end Behavioral;