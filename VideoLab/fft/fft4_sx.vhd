library ieee;
use ieee.std_logic_1164.all;
library work;
use work.fft_pkg.all;

entity fft4 is
    port (
        s : in comp_array;
        output : out comp_array
    );
end fft4;

architecture rtl of fft4 is

component butterfly is
   port(
      s1,s2 : in complex;      --inputs
      w :in complex;      -- phase factor
      g1,g2 :out complex      -- outputs
   );
end component;

signal g1,g2 :comp_array :=(others=>(0000,0000));
constant w:complex:=((0001,0000),(0000,1111));

begin
 --first stage of butterfly
bf11 : butterfly port map(s(0),s(2),w(0),g1(0),g1(1));
bf12 : butterfly port map(s(1),s(3),w(0),g1(2),g1(3));


--second stage of butterfly's.
bf21 : butterfly port map(g1(0),g1(2),w(0),g2(0),g2(2));
bf22 : butterfly port map(g1(1),g1(3),w(1),g2(1),g2(3));
end rtl;