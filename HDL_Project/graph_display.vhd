library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

package graph_data_parameters is
constant SAMPLES_DATA_LENGTH: integer := 16;  --bits wide
constant NUMBER_OF_SAMPLES : integer := 16; --number of samples to analyse
type data_array is array(0 to NUMBER_OF_SAMPLES -1) of std_logic_vector (SAMPLES_DATA_LENGTH -1 downto 0);
end package graph_data_parameters;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.graph_data_parameters.all;


entity graph_display is
  port (
    clock: in std_logic;
    x, y: in std_logic_vector(9 downto 0);
    data: in data_array;
    data_update: in std_logic;
    r, g, b: out std_logic_vector(3 downto 0);
    data_reg_out : out data_array;
    col_width_out : out std_logic_vector(9 downto 0);
    col_index_out : out std_logic_vector(4 downto 0)
  ) ;
end entity ; -- graph_display

architecture arch of graph_display is
    signal data_reg : data_array;
begin

copy_data : process(data_update, x, y, data)
begin
  if ((x = (x'range => '0')) and (y = (y'range => '0')))  then
    data_reg <= data;
  end if;
end process ; -- copy_data


draw : process( x, y )
variable col_width : integer;
variable col_index : integer;
begin
    col_width := 639 / NUMBER_OF_SAMPLES;
    col_index := to_integer(unsigned(x)) / col_width;

    col_width_out <= std_logic_vector(to_unsigned(col_width, col_width_out'length));
    col_index_out <= std_logic_vector(to_unsigned(col_index, col_index_out'length));
    if (col_index < NUMBER_OF_SAMPLES) then
        if ((y) < '0'&data_reg(col_index)(SAMPLES_DATA_LENGTH-8 downto 0)) then
            if ((col_index * col_width = to_integer(unsigned(x))) or ((col_index+1) * col_width = to_integer(unsigned(x)) + 1)) then
                r <= "0000";
                g <= "0000";
                b <= "0000";
            else
                r <= "1000";
                g <= "1000";
                b <= "1000";
            end if;
        elsif((y) = '0'&data_reg(col_index)(SAMPLES_DATA_LENGTH-8 downto 0)) then
            r <= "0000";
            g <= "0000";
            b <= "0000";
        else
            r <= "1111";
            g <= "1111";
            b <= "1111";
        end if;
    else
        r <= "0000";
        g <= "0000";
        b <= "0000";
    end if;
end process ; -- draw

data_reg_out <= data_reg;

end architecture ; -- arch
