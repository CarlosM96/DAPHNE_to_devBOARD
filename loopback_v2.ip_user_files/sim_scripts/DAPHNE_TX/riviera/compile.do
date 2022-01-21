vlib work
vlib riviera

vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"../../../../loopback_v2.srcs/sources_1/ip/DAPHNE_TX/daphne_tx_common_reset.v" \
"../../../../loopback_v2.srcs/sources_1/ip/DAPHNE_TX/DAPHNE_TX/example_design/support/daphne_tx_clock_module.v" \
"../../../../loopback_v2.srcs/sources_1/ip/DAPHNE_TX/daphne_tx_common.v" \
"../../../../loopback_v2.srcs/sources_1/ip/DAPHNE_TX/daphne_tx_gt_usrclk_source.v" \
"../../../../loopback_v2.srcs/sources_1/ip/DAPHNE_TX/daphne_tx_support.v" \
"../../../../loopback_v2.srcs/sources_1/ip/DAPHNE_TX/daphne_tx_cpll_railing.v" \
"../../../../loopback_v2.srcs/sources_1/ip/DAPHNE_TX/DAPHNE_TX/example_design/daphne_tx_tx_startup_fsm.v" \
"../../../../loopback_v2.srcs/sources_1/ip/DAPHNE_TX/DAPHNE_TX/example_design/daphne_tx_rx_startup_fsm.v" \
"../../../../loopback_v2.srcs/sources_1/ip/DAPHNE_TX/daphne_tx_init.v" \
"../../../../loopback_v2.srcs/sources_1/ip/DAPHNE_TX/daphne_tx_gt.v" \
"../../../../loopback_v2.srcs/sources_1/ip/DAPHNE_TX/daphne_tx_multi_gt.v" \
"../../../../loopback_v2.srcs/sources_1/ip/DAPHNE_TX/DAPHNE_TX/example_design/daphne_tx_sync_block.v" \
"../../../../loopback_v2.srcs/sources_1/ip/DAPHNE_TX/daphne_tx.v" \


vlog -work xil_defaultlib \
"glbl.v"

