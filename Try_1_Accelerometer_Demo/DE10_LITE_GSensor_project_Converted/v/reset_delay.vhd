--------------------------------------------------------------
--------------------------------------------------------------
--                                                          --
-- This VHDL file has been generated by the verilog2vhdl    --
-- tool.                                                    --
-- Contact help@edautils.com  for support/info.--
--                                                          --
--                                                          --
--------------------------------------------------------------
--------------------------------------------------------------
--
--
-- Assumptions: 
--         (1) All the parameters are of type INTEGER, and hence the translated generics are of this type
--
--
-- Generated by : apache on 2/19/21 2:18 PM
--
--
library ieee;
use ieee.std_logic_1164.all;
package vl2vh_common_pack_reset_delay is 
    type vl2vh_memory_type is      array  ( natural range <> , natural range <>  )  of std_logic ;
    function vl2vh_ternary_func(  constant cond : Boolean;  constant trueval : std_logic;  constant falseval : std_logic)  return std_logic; 
    function vl2vh_ternary_func(  constant cond : Boolean;  constant trueval : std_logic_vector;  constant falseval : std_logic_vector)  return std_logic_vector; 
end package; 




package body vl2vh_common_pack_reset_delay is 
    function vl2vh_ternary_func(  constant cond : Boolean;  constant trueval : std_logic;  constant falseval : std_logic)  return std_logic is 
    begin
        if ( cond ) then 
             return trueval;
        else 
             return falseval;
        end if;
    end;
    function vl2vh_ternary_func(  constant cond : Boolean;  constant trueval : std_logic_vector;  constant falseval : std_logic_vector)  return std_logic_vector is 
    begin
        if ( cond ) then 
             return trueval;
        else 
             return falseval;
        end if;
    end;
end; 


library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;
use work.vl2vh_common_pack_reset_delay.all;
entity reset_delay_reset_delay is 
     port (
        iRSTN :  in std_logic;
        iCLK :  in std_logic;
        oRST :  out std_logic
    );
end entity; 


architecture rtl of reset_delay_reset_delay is 
    signal cont : std_logic_vector( 20  downto 0  );
    begin 
        process 
        begin
            wait until ( ( iRSTN'EVENT and ( iRSTN = '0' )  )  or ( iCLK'EVENT and ( iCLK = '1' )  )  ) ;
            if ( (  not iRSTN )  ) then 
                cont <= '0';
                oRST <= '1';
            else 
                if ( (  not cont(20 ) )  ) then 
                    cont <= ( cont + '1' ) ;
                    oRST <= '1';
                else 
                    oRST <= '0';
                end if;
            end if;
        end process;
    end; 


