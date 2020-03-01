-- Title       : Multiplexor 4 a 1

-- File        : mux4to1
-- Author      : Jonathan Nunez de Caceres
-- Created     : 2020-02-29

-- Description: Multiplexor 4 a 1

library ieee;
use ieee.std_logic_1164.all;

entity mux4to1 is
    port(
        D,C,B,A : in  std_logic; -- Datos
        sel1, sel0  : in  std_logic; -- Selector de datos
        S    : out std_logic                     -- Salida
    );
end mux4to1;

architecture equations of mux4to1 is
    signal D0,C0,B0,A0 : std_logic;
begin
    A0 <= not sel1 and not sel0 and A;
    B0 <= not sel1 and sel0 and B;
    C0 <= sel1 and not sel0 and C;
    D0 <= sel1 and sel0 and D;
    S <= A0 or B0 or C0 or D0;
end equations;