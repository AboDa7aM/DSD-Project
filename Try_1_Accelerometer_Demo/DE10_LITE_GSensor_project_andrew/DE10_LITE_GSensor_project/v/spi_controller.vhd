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
-- Generated by : apache on 2/22/21 9:41 AM
--
--
library ieee;
use ieee.std_logic_1164.all;
--package vl2vh_common_pack is 
   -- type vl2vh_memory_type is      array  ( natural range <> , natural range <>  )  of std_logic ;
  --  function vl2vh_ternary_func(  constant cond : Boolean;  constant trueval : std_logic;  constant falseval : std_logic)  return std_logic; 
  --  function vl2vh_ternary_func(  constant cond : Boolean;  constant trueval : std_logic_vector;  constant falseval : std_logic_vector)  return std_logic_vector; 
--end package; 




package body vl2vh_common_pack is 
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
use work.vl2vh_common_pack.all;
--entity spi_controller is 
   --  port (
   --     iRSTN :  in std_logic;
   --     iSPI_CLK :  in std_logic;
   --     iSPI_CLK_OUT :  in std_logic;
   --     iP2S_DATA :  in std_logic_vector( SI_DataL downto 0  );
   --     iSPI_GO :  in std_logic;
   --     oSPI_END :  out std_logic;
   --     oS2P_DATA :  out std_logic_vector( SO_DataL downto 0  );
   --     SPI_SDIO :  inout std_logic;
   --     oSPI_CSN :  out std_logic;
   --     oSPI_CLK :  out std_logic
  --  );
--end entity; 


architecture rtl of spi_controller is 
    signal SI_DataL : std_logic;
    signal SO_DataL : std_logic;
    signal read_mode : std_logic;
    signal write_address : std_logic;
    signal spi_count_en : std_logic;
    signal spi_count : std_logic_vector( 3  downto 0  );
    begin 
        read_mode <= iP2S_DATA(SI_DataL);
        write_address <= spi_count(3 );
        oSPI_END <= NOR_REDUCE( spi_count );
        oSPI_CSN <= (  not iSPI_GO ) ;
        oSPI_CLK <= vl2vh_ternary_func( spi_count_en, iSPI_CLK_OUT, '1' );
        SPI_SDIO <= vl2vh_ternary_func( ( spi_count_en and ( (  not read_mode )  or write_address )  ) , iP2S_DATA(spi_count), 'z' );
        process 
        begin
            wait until ( ( iRSTN'EVENT and ( iRSTN = '0' )  )  or ( iSPI_CLK'EVENT and ( iSPI_CLK = '1' )  )  ) ;
            if ( (  not iRSTN )  ) then 
                spi_count_en <= '0';
                spi_count <= X"f" ;
            else 
                if ( oSPI_END ) then 
                    spi_count_en <= '0';
                else 
                    if ( iSPI_GO ) then 
                        spi_count_en <= '1';
                    end if;
                end if;
                if ( (  not spi_count_en )  ) then 
                    spi_count <= X"f" ;
                else 
                    spi_count <= ( spi_count - '1' ) ;
                end if;
                if ( ( read_mode and (  not write_address )  )  ) then 
                    oS2P_DATA <= ( oS2P_DATA & SPI_SDIO );
                end if;
            end if;
        end process;
    end; 

