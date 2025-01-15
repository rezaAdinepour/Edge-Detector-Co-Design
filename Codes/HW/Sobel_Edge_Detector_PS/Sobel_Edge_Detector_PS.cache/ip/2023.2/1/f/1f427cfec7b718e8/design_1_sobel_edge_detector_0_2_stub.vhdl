-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
-- Date        : Wed Nov 13 23:54:40 2024
-- Host        : DESKTOP-A2LG1N2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_sobel_edge_detector_0_2_stub.vhdl
-- Design      : design_1_sobel_edge_detector_0_2
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    x_TVALID : in STD_LOGIC;
    x_TREADY : out STD_LOGIC;
    x_TDATA : in STD_LOGIC_VECTOR ( 7 downto 0 );
    edge_out_TVALID : out STD_LOGIC;
    edge_out_TREADY : in STD_LOGIC;
    edge_out_TDATA : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "ap_clk,ap_rst_n,ap_start,ap_done,ap_idle,ap_ready,x_TVALID,x_TREADY,x_TDATA[7:0],edge_out_TVALID,edge_out_TREADY,edge_out_TDATA[7:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "sobel_edge_detector,Vivado 2023.2";
begin
end;
