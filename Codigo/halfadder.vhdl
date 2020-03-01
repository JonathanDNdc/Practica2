-- Title       : Half adder

-- File        : halfadder
-- Author      : Jonathan Nunez de Caceres
-- Created     : 2020-02-29

-- Description: Half adder con multiplexores 4 a 1

library ieee;
use ieee.std_logic_1164.all;

entity halfadder is
    port(
        D,C,B,A    : in  std_logic; -- Datos
        sel1, sel0 : in  std_logic; -- Selector de datos
        S          : out std_logic  -- Salida
    );

end halfadder;

architecture structure of halfadder is
    component mux4to1 is
        port(
            data : in  std_logic_vector(3 downto 0); -- Datos
            sel  : in  std_logic_vector(1 downto 0); -- Selector de datos
            S    : out std_logic                     -- Salida
        );
    end component;
begin
        u1 : mux4to1 port map('0', '1', '1', '0', A, B, S);
        u2 : mux4to1 port map('1', '0', '0', '0', A, B, Co);
end structure;