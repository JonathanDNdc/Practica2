-- Title       : Full adder

-- File        : fulladder
-- Author      : Jonathan Nunez de Caceres
-- Created     : 2020-02-29

-- Description: Full adder con multiplexores 4 a 1

library ieee;
use ieee.std_logic_1164.all;

entity fulladder is
    port(
        A, B, Ci : in  std_logic; -- Bits
        S        : out std_logic; -- Suma
        Co       : out std_logic  -- Acarreo
    );
end fulladder;

architecture structure of fulladder is
    component mux4to1 is
        port(
            D,C,B,A    : in  std_logic; -- Datos
            sel1, sel0 : in  std_logic; -- Selector de datos
            S          : out std_logic  -- Salida
        );

    end component;

    signal nCi : std_logic;

begin
    nCi <= not Ci;
        u1 : mux4to1 port map(Ci, nCi, nCi, Ci, A, B, S);
        u2 : mux4to1 port map('1', Ci, Ci, '0', A, B, Co);
end structure;