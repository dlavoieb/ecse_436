library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

package fft_operations is   --contains function like add,sub,mul

    type complex is
        record
            r:std_logic_vector(3 downto 0);
            i:std_logic_vector(3 downto 0);
        end record;
    function add (n1,n2:complex) return complex;
    function sub (n1,n2:complex) return complex;
    function mult (n1,n2:complex) return complex;
end package fft_operations;

package body fft_operations is

    --addition of complex numbers
    function add (n1,n2 : complex) return complex is
        variable sum : complex;
    begin
        sum.r:=n1.r + n2.r;
        sum.i:=n1.i + n2.i;
        return sum;
    end add;

    --subtraction of complex numbers.
    function sub (n1,n2 : complex) return complex is
        variable diff : complex;
    begin
        diff.r:=n1.r - n2.r;
        diff.i:=n1.i - n2.i;
        return diff;
    end sub;

    --multiplication of complex numbers.
    function mult (n1,n2 : complex) return complex is
        variable prod : complex;
        variable temp : std_logic_vector(7 downto 0) ;
    begin
        temp := (n1.r * n2.r) - (n1.i * n2.i);
        prod.r:= temp(3 downto 0);
        temp := (n1.r * n2.i) + (n1.i * n2.r);
        prod.i:=temp(3 downto 0);
        return prod;
    end mult;

end fft_operations;