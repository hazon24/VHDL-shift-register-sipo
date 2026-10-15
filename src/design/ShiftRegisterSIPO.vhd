----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.10.2026 10:52:41
-- Design Name: 
-- Module Name: ShiftRegisterSIPO - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ShiftRegisterSIPO is
    Generic(
        SR_WIDTH : integer := 4
    );
    
    Port(
        reset : in std_logic;
        clk : in std_logic;
        data_in : in std_logic;
        data_out : out std_logic_vector(SR_WIDTH-1 DOWNTO 0)
    );
end ShiftRegisterSIPO;

architecture Behavioral of ShiftRegisterSIPO is
    
    component ff_d is
        Port(
            reset : in std_logic;
            clk    : in std_logic;
            d     : in std_logic;
            q     : out std_logic
        );
    end component;
    
    signal n : std_logic_vector(SR_WIDTH downto 0);
    
    
begin
    
    n(0) <= data_in;
   
    LOOP_GEN : for I in 0 to SR_WIDTH-1 generate
        ff_d_inst : ff_d
        port map (
            reset => reset,
            clk => clk,
            d => n(I),
            q => n(I+1)
        );
         data_out(SR_WIDTH-1-I) <= n(I+1);
    end generate;
        
end Behavioral;