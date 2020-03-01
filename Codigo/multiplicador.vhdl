-- Title       : Multiplicador

-- File        : multiplicador
-- Author      : Jonathan Nunez de Caceres
-- Created     : 2020-02-29

-- Description: Multiplicador de 4 bits con multiplexores 4 a 1

library ieee;
use ieee.std_logic_1164.all;

entity multiplicador is
    port(
        A, B : in  std_logic_vector(3 downto 0);
        Z    : out std_logic_vector(7 downto 0)
    );
end multiplicador;

architecture structure of multiplicador is

    component mux4to1 is
        port(
            D,C,B,A    : in  std_logic; -- Datos
            sel1, sel0 : in  std_logic; -- Selector de datos
            S          : out std_logic  -- Salida
        );
    end component;

    signal P  : std_logic_vector(15 downto 0);
    signal C  : std_logic_vector(13 downto 0);
    signal nC : std_logic_vector( 6 downto 0);
    signal S  : std_logic_vector( 7 downto 0);
begin

    -- Multiplicaciones de bits individuales
    P(0)  <= A(0) and B(0);
    P(1)  <= A(1) and B(0);
    P(2)  <= A(2) and B(0);
    P(3)  <= A(3) and B(0);
    P(4)  <= A(0) and B(1);
    P(5)  <= A(1) and B(1);
    P(6)  <= A(2) and B(1);
    P(7)  <= A(3) and B(1);
    P(8)  <= A(0) and B(2);
    P(9)  <= A(1) and B(2);
    P(10) <= A(2) and B(2);
    P(11) <= A(3) and B(2);
    P(12) <= A(0) and B(3);
    P(13) <= A(1) and B(3);
    P(14) <= A(2) and B(3);
    P(15) <= A(3) and B(3);

    -- Primera fila

    Z(0) <= P(0);
        hs0 : mux4to1 port map('0', '1', '1', '0', P(1), P(4), Z(1));
        hc0 : mux4to1 port map('1', '0', '0', '0', P(1), P(4), C(0));

        hs1 : mux4to1 port map('0', '1', '1', '0', P(2), P(5), S(0));
        hc1 : mux4to1 port map('1', '0', '0', '0', P(2), P(5), C(1));

        hs2 : mux4to1 port map('0', '1', '1', '0', P(3), P(6), S(1));
        hc2 : mux4to1 port map('1', '0', '0', '0', P(3), P(6), C(2));

    -- Segunda fila

    nC(0) <= not C(0);
        fs0 : mux4to1 port map(C(0), nC(0), nC(0), C(0), P(8), S(0), Z(2));
        fc0 : mux4to1 port map('1', C(0), C(0), '0', P(8), S(0), C(3));

    nC(1) <= not C(1);
        fs1 : mux4to1 port map(C(1), nC(1), nC(1), C(1), P(9), S(1), S(2));
        fc1 : mux4to1 port map('1', C(1), C(1), '0', P(9), S(1), C(4));

    nC(2) <= not C(2);
        fs2 : mux4to1 port map(C(2), nC(2), nC(2), C(2), P(10), P(7), S(3));
        fc2 : mux4to1 port map('1', C(2), C(2), '0', P(10), P(7), C(5));

    -- Tercera fila

    nC(3) <= not C(3);
        fs3 : mux4to1 port map(C(3), nC(3), nC(3), C(3), P(12), S(2), Z(3));
        fc3 : mux4to1 port map('1', C(3), C(0), '0', P(12), S(2), C(6));

    nC(4) <= not C(4);
        fs4 : mux4to1 port map(C(4), nC(4), nC(4), C(4), P(13), S(3), S(4));
        fc4 : mux4to1 port map('1', C(4), C(4), '0', P(13), S(3), C(7));

    nC(5) <= not C(5);
        fs5 : mux4to1 port map(C(5), nC(5), nC(5), C(5), P(14), P(11), S(5));
        fc5 : mux4to1 port map('1', C(5), C(5), '0', P(14), P(11), C(8));

    -- Cuarta fila

        hs3 : mux4to1 port map('0', '1', '1', '0', S(4), C(6), Z(4));
        hc3 : mux4to1 port map('1', '0', '0', '0', S(4), C(6), C(9));

        hs4 : mux4to1 port map('0', '1', '1', '0', S(5), C(7), S(6));
        hc4 : mux4to1 port map('1', '0', '0', '0', S(5), C(7), C(10));

        hs5 : mux4to1 port map('0', '1', '1', '0', P(15), C(8), S(7));
        hc5 : mux4to1 port map('1', '0', '0', '0', P(15), C(8), C(11));

    -- Quinta fila

        hs6 : mux4to1 port map('0', '1', '1', '0', S(6), C(9), Z(5));
        hc6 : mux4to1 port map('1', '0', '0', '0', S(6), C(9), C(12));

    nC(6) <= not C(10);
        fs6 : mux4to1 port map(C(12), nC(6), nC(6), C(12), C(10), S(7), Z(6));
        fc6 : mux4to1 port map('1', C(12), C(12), '0', C(10), S(7), C(13));

        -- Sexta fila
        hs7 : mux4to1 port map('0', '1', '1', '0', C(11), C(13), Z(7));

end structure;