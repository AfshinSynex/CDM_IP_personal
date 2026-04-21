----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/15/2025 03:13:39 PM
-- Design Name: 
-- Module Name: PCM_Streamer - Behavioral
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

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pcm_streamer is
    port (
        ----------------------------------------------------------------------------
        -- External clock, reset, and enable
        ----------------------------------------------------------------------------
        sclk_in       : in  std_logic;                     -- ~8.192 MHz serial bit clock
        reset_ext     : in  std_logic;                     -- Active-low ASYNC reset (external)
        en            : in  std_logic;                     -- Global output enable

        ----------------------------------------------------------------------------
        -- External shift register interface
        ----------------------------------------------------------------------------
        ch_in  : in  std_logic_vector(239 downto 0); -- Parallel data load for shifting

        ----------------------------------------------------------------------------
        -- PCM outputs (gated by en)
        ----------------------------------------------------------------------------
        PCM_SCLK      : out std_logic;
        PCM_SDIN      : out std_logic;
        PCM_LRCLK     : out std_logic
    );
end entity pcm_streamer;

architecture rtl of pcm_streamer is
    ----------------------------------------------------------------------------
    -- Internal Signals
    ----------------------------------------------------------------------------
    signal shift_reg     : std_logic_vector(239 downto 0) := (others => '0');
    signal bit_count     : unsigned(7 downto 0)              := (others => '0');
    signal rst_sync1     : std_logic                         := '1';
    signal rst_sync2     : std_logic                         := '1';
    signal reset_int     : std_logic                         := '0';
    
        -- two-stage outputs before gating with en
    signal sdin_int   : std_logic := '0';
    signal lrclk_int  : std_logic := '0';
begin
    ----------------------------------------------------------------------------
    -- 1) PCM_SCLK simply follows the incoming sclk_in, gated by en
    ----------------------------------------------------------------------------
    PCM_SCLK <= sclk_in and en;

    ----------------------------------------------------------------------------
    -- 2) Asynchronous Reset Synchronizer
    ----------------------------------------------------------------------------
    process(sclk_in, reset_ext)
    begin
        if reset_ext = '0' then
            rst_sync1 <= '0';
            rst_sync2 <= '0';
        elsif rising_edge(sclk_in) then
            rst_sync1 <= '1';
            rst_sync2 <= rst_sync1;
        end if;
    end process;
    reset_int <= not rst_sync2;

    ----------------------------------------------------------------------------
    -- 3) Main Shift/Count Process (parallel load from ch_in)
    ----------------------------------------------------------------------------
    process(sclk_in)
    begin
        if falling_edge(sclk_in) then
            if reset_int = '1' then
                bit_count <= (others => '0');
                shift_reg <= (others => '0');
            else
                if bit_count = 255 then
                    -- On end-of-frame, load new data from external port
                    shift_reg <= ch_in;
                    bit_count <= (others => '0');
                else
                    -- Shift out data during the frame
                    if bit_count < 240 then
                        shift_reg <= shift_reg(238 downto 0) & '0';
                    end if;
                    bit_count <= bit_count + 1;
                end if;
            end if;
        end if;
    end process;

    ----------------------------------------------------------------------------
    -- 4) Capture SDIN & LRCLK on falling edge, aligned in one process
    ----------------------------------------------------------------------------
    process(sclk_in)
    begin
        if falling_edge(sclk_in) then
            if reset_int = '0' and bit_count < 240 then
                sdin_int  <= shift_reg(239);
                lrclk_int <= '1';
            else
                sdin_int  <= '0';
                lrclk_int <= '0';
            end if;
        end if;
    end process;

    ----------------------------------------------------------------------------
    -- 5) Gate both signals with en
    ----------------------------------------------------------------------------
    PCM_SDIN  <= sdin_int  and en;
    PCM_LRCLK <= lrclk_int and en;

end architecture rtl;

