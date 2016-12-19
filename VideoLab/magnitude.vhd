library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

use work.sqrt_p.all;

entity magnitude is
  port (
    re : in std_logic_vector(15 downto 0) ;
    im : in std_logic_vector(15 downto 0) ;
    mag : out std_logic_vector(15 downto 0)
  ) ;
end entity ; -- magnitude

architecture arch of magnitude is
    signal square : unsigned(31 downto 0) ;
begin
    square <= ((unsigned(re)*unsigned(re))+(unsigned(im)*unsigned(im)));
    mag <= std_logic_vector(sqrt(square));
end architecture ; -- arch