-- Title       : Multiplicador Test Bench

-- File        : multiplicador_tb
-- Author      : Jonathan Nunez de Caceres
-- Created     : 2020-02-29

-- Description: Test Bench del multiplicador basado en multiplexores 4 a 1.

library ieee;
use ieee.std_logic_1164.all;

entity multiplicador_tb is
end multiplicador_tb;

architecture test of multiplicador_tb is
    component multiplicador is
        port(
            A, B : in  std_logic_vector(3 downto 0);
            Z    : out std_logic_vector(7 downto 0)
        );
    end component;
    signal A, B : std_logic_vector(3 downto 0);
    signal Z    : std_logic_vector(7 downto 0);
begin
        uut : multiplicador port map(A, B, Z);

    process
        constant period : time := 10 ns;
    begin
        A <= "0011" ;
        B <= "1001" ;
        wait for period;
        assert Z = "00011011"
            report "Error en el test, resultado invalido" severity error;

        A <= "0111" ;
        B <= "0011" ;
        wait for period;
        assert Z = "00010101"
            report "Error en el test, resultado invalido" severity error;

        A <= "0101" ;
        B <= "0100" ;
        wait for period;
        assert Z = "00010100"
            report "Error en el test, resultado invalido" severity error;

        A <= "1101" ;
        B <= "0010" ;
        wait for period;
        assert Z = "00011010"
            report "Error en el test, resultado invalido" severity error;

        A <= "0011" ;
        B <= "0111" ;
        wait for period;
        assert Z = "00010101"
            report "Error en el test, resultado invalido" severity error;

        wait;

    end process;
end architecture test;
