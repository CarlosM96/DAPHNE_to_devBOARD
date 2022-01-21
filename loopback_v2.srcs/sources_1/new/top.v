`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/16/2021 01:53:32 PM
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(
    input GTP_CLK_P,
    input GTP_CLK_N,
    input DRP_CLK_IN_P,
    input DRP_CLK_IN_N,
    input reset,
   // input we,
    output txp,
    output txn,
    output sfp_dis0,
    output sfp_dis1,
    output led0,
    output led1,
    output led2,
    output led3,
    output led4,
    output led5  
    );

wire [33:0] data_prbs;
wire [31:0] data_i;
wire [1:0] data_type;
wire [31:0] data_o;
wire fifo_re, fifo_we, fifo_empty, fifo_full;
wire usr_clk;
wire tx_init, rx_init;
wire [19:0] fromCRC;
wire [31:0] toCRC;
wire crcrst, crcstrobe;
wire k_i;

PRBS_DATA PRBS_DATA(
	.we(1'b0),
	.d_out(data_prbs),
    .we_fifo(fifo_we),
	.sys_clk(usr_clk),
    .sys_rst(1'b0) 
);

FIFO34 FIFO34(
	 .link_ready(txinit),
	 .re(fifo_re),
	 .we(fifo_we),
	 .reset(1'b0),
	 .fifo_full(fifo_full),
	 .fifo_empty(fifo_empty),
	 .tx_clk(usr_clk),
	 .write_clk(usr_clk),
	 .tx_data(data_i),
	 .data_type(data_type),
	 .data_in(data_prbs)
);

 FMSC FMSC(
	 .link_ready(txinit),
	 .data_in(data_i),
	 .data_type_in(data_type),
	 .data_out(data_o),
	 .fifo_empty(fifo_empty),
	 .fifo_re(fifo_re),
	 .k(k_i),
	 .fromCRC(fromCRC),
	 .toCRC(toCRC),
	 .crcstrobe(crcstrobe),
	 .crcreset(crcrst),
	 .sys_clk(usr_clk),
	 .sys_rst(1'b0)
);

CRC CRC(
    .CRC (fromCRC),
     .Calc  (crcstrobe),
     .Clk   (usr_clk),
     .DIn   (toCRC),
     .Reset (crcrst)
);


TX  TX(
    .Q0_CLK0_GTREFCLK_PAD_N_IN(GTP_CLK_N),
    .Q0_CLK0_GTREFCLK_PAD_P_IN(GTP_CLK_P),
    .DRP_CLK_IN_P(DRP_CLK_IN_P),
    .DRP_CLK_IN_N(DRP_CLK_IN_N),
    .RESET(1'b0),
    .DATA_IN(data_o),
    .TXN_OUT(txn),
    .TXP_OUT(txp),
    .TXUSRCLK(usr_clk),
    .K_i(k_i),
    .TX_INIT(txinit)
);


//ila_0 ila_0 (
//    .clk(usr_clk),
//    .probe0(datarx),
//    .probe1(data_o)
//);



assign sfp_dis0 = 1'b0;
assign sfp_dis1 = 1'b0;
assign led0 = 1'b1;
assign led1 = 1'b1;
assign led2 = 1'b1;
assign led3 = reset;
assign led4 = 1'b1;
assign led5 = !txinit;


endmodule
