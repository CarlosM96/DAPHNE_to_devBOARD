

################################## Clock Constraints ##########################


####################### GT reference clock constraints #########################
 

create_clock -period 4.1667 [get_ports GTP_CLK_P]
create_clock -period 10 [get_ports DRP_CLK_IN_P]


#create_clock -name drpclk_in_i -period 5 [get_ports DRP_CLK_IN_P]


# User Clock Constraints

################################# RefClk Location constraints #####################
#MGT REF CLk 0
set_property PACKAGE_PIN F11 [get_ports  GTP_CLK_P] 
#set_property IOSTANDARD  DIFF_SSTL18_II [get_ports  GTP_CLK_P] 
set_property PACKAGE_PIN E11 [get_ports  GTP_CLK_N]
#set_property IOSTANDARD DIFF_SSTL18_II [get_ports  GTP_CLK_N]

#SFP 0
set_property PACKAGE_PIN B7  [get_ports  txp ] 
set_property PACKAGE_PIN A7  [get_ports  txn ]


## LOC constrain for DRP_CLK_P/N 
 
set_property PACKAGE_PIN  AA4 [get_ports  DRP_CLK_IN_P]
set_property IOSTANDARD LVDS_25 [get_ports DRP_CLK_IN_P]

set_property PACKAGE_PIN  AB4 [get_ports  DRP_CLK_IN_N]
set_property IOSTANDARD LVDS_25 [get_ports DRP_CLK_IN_N]
################


 ## cpu_reset:0
set_property PACKAGE_PIN  J8 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

set_property  PACKAGE_PIN G6 [get_ports sfp_dis0]
set_property IOSTANDARD LVTTL [get_ports sfp_dis0]

set_property  PACKAGE_PIN K8 [get_ports sfp_dis1]
set_property IOSTANDARD LVTTL [get_ports sfp_dis1]

set_property  PACKAGE_PIN C4 [get_ports led0]
set_property IOSTANDARD LVCMOS33 [get_ports led0]

set_property  PACKAGE_PIN B5 [get_ports led1]
set_property IOSTANDARD LVCMOS33 [get_ports led1]

set_property  PACKAGE_PIN A5 [get_ports led2]
set_property IOSTANDARD LVCMOS33 [get_ports led2]

set_property  PACKAGE_PIN B4 [get_ports led3]
set_property IOSTANDARD LVCMOS33 [get_ports led3]

set_property  PACKAGE_PIN A4 [get_ports led4]
set_property IOSTANDARD LVCMOS33 [get_ports led4]

set_property  PACKAGE_PIN D3 [get_ports led5]
set_property IOSTANDARD LVCMOS33 [get_ports led5]





 
################################# mgt wrapper constraints #####################

##---------- Set placement for gt0_gtp_wrapper_i/GTPE2_CHANNEL ------
set_property LOC GTPE2_CHANNEL_X0Y4 [get_cells DAPHNE_TX_support_i/inst/DAPHNE_TX_init_i/DAPHNE_TX_i/gt0_DAPHNE_TX_i/gtpe2_i]


