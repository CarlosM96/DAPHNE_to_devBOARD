`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/16/2021 03:00:00 PM
// Design Name: 
// Module Name: top_tb
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


module top_tb();

	reg Q0_CLK0_GTREFCLK_PAD_N_IN;
	reg Q0_CLK0_GTREFCLK_PAD_P_IN;
	reg DRP_CLK_IN_P;
	reg DRP_CLK_IN_N;
	wire txn;
	wire txp;
	reg we;
	reg reset;

	

	top top1(
    .GTP_CLK_N(Q0_CLK0_GTREFCLK_PAD_N_IN),
    .GTP_CLK_P(Q0_CLK0_GTREFCLK_PAD_P_IN),
    .DRP_CLK_IN_P(DRP_CLK_IN_P),
    .DRP_CLK_IN_N(DRP_CLK_IN_N),
    .reset(1'b0),
    .we(we),
    .txp(txp),
    .txn(txn)
    );


	

	
	initial begin 
		Q0_CLK0_GTREFCLK_PAD_P_IN = 1'b1;
	end

	always begin 
		Q0_CLK0_GTREFCLK_PAD_P_IN = !Q0_CLK0_GTREFCLK_PAD_P_IN; #(2.083); // original 3.6
		assign Q0_CLK0_GTREFCLK_PAD_N_IN = !Q0_CLK0_GTREFCLK_PAD_P_IN;
	end
	
	initial begin 
		DRP_CLK_IN_P = 1'b1;
	end

	always begin 
		DRP_CLK_IN_P = !DRP_CLK_IN_P; #(5); // original 3.6
		assign DRP_CLK_IN_N = !DRP_CLK_IN_P;
	end

	
	
	
	initial begin 
	#100000;
	
		we = 1; #90;
	    we = 0;

	end
	
	
endmodule 

