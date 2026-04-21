## design_1_wrapper.xdc
## Pin assignments for TAS5825 I2C, PDN control, TDM, and INA4230 I2C
## Excluding AXI interface signals; all I/O set to 3.3 V (LVCMOS33)

# 100MHz System Clock
set_property PACKAGE_PIN AA6 [get_ports {clk_sys_clk_p[0]}]
set_property IOSTANDARD LVDS_25 [get_ports {clk_sys_clk_p[0]}]
create_clock -period 10.000 -name sys_clk [get_ports {clk_sys_clk_p[0]}]

## Reset pin assignment
set_property PACKAGE_PIN B6 [get_ports s00_axi_aresetn]
set_property IOSTANDARD LVCMOS33 [get_ports s00_axi_aresetn]

## Heartbeat LEDs
# CLK heartbeat → B9
set_property PACKAGE_PIN B9 [get_ports {CLK_HEARTBEAT[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {CLK_HEARTBEAT[0]}]

# PDN control pins
set_property PACKAGE_PIN G21 [get_ports {GPO_tri_o[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {GPO_tri_o[0]}]
set_property PACKAGE_PIN H21 [get_ports {GPO_tri_o[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {GPO_tri_o[1]}]
set_property PACKAGE_PIN J21 [get_ports {GPO_tri_o[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {GPO_tri_o[2]}]

# Enable Static PWR → J17
set_property PACKAGE_PIN J17 [get_ports {GPO_tri_o[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {GPO_tri_o[3]}]

# FSYNC → J16
set_property PACKAGE_PIN J16 [get_ports {GPO_tri_o[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {GPO_tri_o[4]}]

# Enable 6V5
set_property PACKAGE_PIN H16 [get_ports {GPO_tri_o[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {GPO_tri_o[5]}]

# Enable 6V5
set_property PACKAGE_PIN F12 [get_ports {GPO_tri_o[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {GPO_tri_o[6]}]

# Enable 6V5
set_property PACKAGE_PIN E12 [get_ports {GPO_tri_o[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {GPO_tri_o[7]}]

# CPU heartbeat → A9
set_property PACKAGE_PIN A9 [get_ports {GPO_tri_o[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {GPO_tri_o[8]}]

# PID Loop Timing B7 (pin 5 on J20)
set_property PACKAGE_PIN B7 [get_ports {GPO_tri_o[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {GPO_tri_o[9]}]

## UART interface
# UART RXD (input) → A7 (pin 1 on J20)
set_property PACKAGE_PIN A7 [get_ports uart_rtl_0_rxd]
set_property IOSTANDARD LVCMOS33 [get_ports uart_rtl_0_rxd]

# UART TXD (output) → D6 (pin 3 on J20)
set_property PACKAGE_PIN D6 [get_ports uart_rtl_0_txd]
set_property IOSTANDARD LVCMOS33 [get_ports uart_rtl_0_txd]

# INA4230 I2C (CSA interfaces)
set_property PACKAGE_PIN G11 [get_ports I2C_CSA0_scl_io]
set_property IOSTANDARD LVCMOS33 [get_ports I2C_CSA0_scl_io]
set_property PACKAGE_PIN F11 [get_ports I2C_CSA0_sda_io]
set_property IOSTANDARD LVCMOS33 [get_ports I2C_CSA0_sda_io]

set_property PACKAGE_PIN G10 [get_ports I2C_CSA1_scl_io]
set_property IOSTANDARD LVCMOS33 [get_ports I2C_CSA1_scl_io]
set_property PACKAGE_PIN F10 [get_ports I2C_CSA1_sda_io]
set_property IOSTANDARD LVCMOS33 [get_ports I2C_CSA1_sda_io]

set_property PACKAGE_PIN D20 [get_ports I2C_CSA2_scl_io]
set_property IOSTANDARD LVCMOS33 [get_ports I2C_CSA2_scl_io]
set_property PACKAGE_PIN C20 [get_ports I2C_CSA2_sda_io]
set_property IOSTANDARD LVCMOS33 [get_ports I2C_CSA2_sda_io]

# TAS5825 I2C (SG interfaces)
set_property PACKAGE_PIN G20 [get_ports I2C_SG0_scl_io]
set_property IOSTANDARD LVCMOS33 [get_ports I2C_SG0_scl_io]
set_property PACKAGE_PIN H19 [get_ports I2C_SG0_sda_io]
set_property IOSTANDARD LVCMOS33 [get_ports I2C_SG0_sda_io]

set_property PACKAGE_PIN H20 [get_ports I2C_SG1_scl_io]
set_property IOSTANDARD LVCMOS33 [get_ports I2C_SG1_scl_io]
set_property PACKAGE_PIN G22 [get_ports I2C_SG1_sda_io]
set_property IOSTANDARD LVCMOS33 [get_ports I2C_SG1_sda_io]

set_property PACKAGE_PIN K22 [get_ports I2C_SG2_scl_io]
set_property IOSTANDARD LVCMOS33 [get_ports I2C_SG2_scl_io]
set_property PACKAGE_PIN L22 [get_ports I2C_SG2_sda_io]
set_property IOSTANDARD LVCMOS33 [get_ports I2C_SG2_sda_io]

set_property PACKAGE_PIN B21 [get_ports I2C_SG3_scl_io]
set_property IOSTANDARD LVCMOS33 [get_ports I2C_SG3_scl_io]
set_property PACKAGE_PIN B22 [get_ports I2C_SG3_sda_io]
set_property IOSTANDARD LVCMOS33 [get_ports I2C_SG3_sda_io]

set_property PACKAGE_PIN F21 [get_ports I2C_SG4_scl_io]
set_property IOSTANDARD LVCMOS33 [get_ports I2C_SG4_scl_io]
set_property PACKAGE_PIN C22 [get_ports I2C_SG4_sda_io]
set_property IOSTANDARD LVCMOS33 [get_ports I2C_SG4_sda_io]


# TDM audio interface (SG0 → TDM0): SCK, LRCLK, SDIN
set_property PACKAGE_PIN F19 [get_ports SCLK_SG0]
set_property IOSTANDARD LVCMOS33 [get_ports SCLK_SG0]
set_property PACKAGE_PIN L16 [get_ports LRCLK_SG0]
set_property IOSTANDARD LVCMOS33 [get_ports LRCLK_SG0]
set_property PACKAGE_PIN K17 [get_ports SDIN_SG0]
set_property IOSTANDARD LVCMOS33 [get_ports SDIN_SG0]

# TDM audio interface (SG1 → TDM1): SCK, LRCLK, SDIN
set_property PACKAGE_PIN M15 [get_ports SCLK_SG1]
set_property IOSTANDARD LVCMOS33 [get_ports SCLK_SG1]
set_property PACKAGE_PIN K18 [get_ports LRCLK_SG1]
set_property IOSTANDARD LVCMOS33 [get_ports LRCLK_SG1]
set_property PACKAGE_PIN K19 [get_ports SDIN_SG1]
set_property IOSTANDARD LVCMOS33 [get_ports SDIN_SG1]

# TDM audio interface (SG2 → TDM2): SCK, LRCLK, SDIN
set_property PACKAGE_PIN M17 [get_ports SCLK_SG2]
set_property IOSTANDARD LVCMOS33 [get_ports SCLK_SG2]
set_property PACKAGE_PIN J19 [get_ports LRCLK_SG2]
set_property IOSTANDARD LVCMOS33 [get_ports LRCLK_SG2]
set_property PACKAGE_PIN J20 [get_ports SDIN_SG2]
set_property IOSTANDARD LVCMOS33 [get_ports SDIN_SG2]


