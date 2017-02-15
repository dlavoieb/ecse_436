library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.graph_data_parameters.all;

entity switch_to_array is
  port (
    switch : in std_logic_vector(17 downto 0);
    data : out data_array
  ) ;
end entity ; -- switch_to_array

architecture arch of switch_to_array is

begin

switch_changes : process( switch )
variable switch_range_width : integer := 18/NUMBER_OF_SAMPLES;
variable pad : std_logic_vector(SAMPLES_DATA_LENGTH - 1 - switch_range_width downto 0);
variable temp : std_logic_vector(SAMPLES_DATA_LENGTH -1 downto 0);
begin
    pad := (others => '0');
    for j in 0 to NUMBER_OF_SAMPLES-1 loop
			temp := pad & switch(j*switch_range_width+switch_range_width-1 downto j*switch_range_width);
        data(j) <= temp(SAMPLES_DATA_LENGTH -5 downto 0) & "0000";  -- convert range of switches to data element
    end loop;
end process ; -- switch_changes


end architecture ; -- arch