 library ieee;
use ieee.std_logic_1164.all;

use work.graph_data_parameters.all;

entity fft_controller_block is
  port (
    clock : in std_logic;
    samples : in std_logic_vector(31 downto 0) ;
    re : out std_logic_vector(15 downto 0) ;
    im : out std_logic_vector(15 downto 0) ;
    start : out std_logic
  ) ;
end entity ; -- fft_controller_block

architecture arch of fft_controller_block is
begin
    re <= '0' & samples(30 downto 16);
    im <= (others => '0');
    --start <= clock;

    counter : process( clock )
        variable count : integer := 0;
    begin
        if rising_edge(clock) then
            count := count + 1;
            if count = NUMBER_OF_SAMPLES then
                count := 0;
                start <= '1';
            else
                start <= '0';
            end if ;
        end if ;

    end process ; -- counter
end architecture ; -- arch