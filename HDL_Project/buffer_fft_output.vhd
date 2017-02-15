library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.graph_data_parameters.all;

entity buffer_fft_output is
  port (
    clock : in std_logic;
    valid : in std_logic;
    sample : in std_logic_vector(SAMPLES_DATA_LENGTH - 1 downto 0) ;
    data_output : out data_array;
    ready : out std_logic
  ) ;
end entity ; -- buffer_fft_output

architecture arch of buffer_fft_output is

begin

identifier : process( valid, clock, sample )
    variable count : integer := 0;
    variable last_valid : std_logic;
begin
    if (rising_edge(clock)) then
        if (valid = '0') then
            -- rising edge of valid
            count := 0;
            ready <= '0';
        end if ;

        if (valid = '1') then
            -- iterate over count
            data_output(count) <= sample;
            count := count + 1;
        end if;

        if (count = NUMBER_OF_SAMPLES) then
            -- falling edge valid
            ready <= '1';
        end if ;

        last_valid := valid;
    end if ;
end process ; -- identifier

end architecture ; -- arch