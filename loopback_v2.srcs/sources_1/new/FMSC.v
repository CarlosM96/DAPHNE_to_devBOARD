/* Machine-generated using Migen */
module FMSC(
	input link_ready,
	input [31:0] data_in,
	input [1:0] data_type_in,
	output reg [31:0] data_out,
	input fifo_empty,
	output fifo_re,
	output reg k,
	input [19:0] fromCRC,
	output reg [31:0] toCRC,
	output crcstrobe,
	output crcreset,
	input sys_clk,
	input sys_rst
);

reg [31:0] da = 32'd0;
reg [31:0] db = 32'd0;
reg [1:0] dta = 2'd0;
reg [1:0] dtb = 2'd0;
reg [19:0] crc_delay = 20'd0;
wire stream_controller_link_ready;
wire stream_controller_fifo_empty;
wire [1:0] stream_controller_data_type;
wire [1:0] stream_controller_data_typeb;
wire stream_controller_tx_init_done;
reg stream_controller_sop = 1'd0;
reg stream_controller_eop = 1'd0;
reg stream_controller_ign;
reg stream_controller_idle = 1'd0;
reg stream_controller_intermediate = 1'd0;
reg stream_controller_encoder_ready = 1'd0;
reg stream_controller_fsm_done;
reg stream_controller_aux_ign = 1'd0;
reg stream_controller_reset = 1'd0;
wire [1:0] crc_control_data_type;
wire crc_control_fsm_done;
wire crc_control_fifo_empty;
reg crc_control_strobe_crc;
reg crc_control_reset_crc;
reg crc_control_fifo_re;
reg [2:0] fsm_state = 3'd0;
reg [2:0] fsm_next_state;
reg stream_controller_sop_t_next_value0;
reg stream_controller_sop_t_next_value_ce0;
reg stream_controller_idle_t_next_value1;
reg stream_controller_idle_t_next_value_ce1;
reg stream_controller_encoder_ready_next_value0;
reg stream_controller_encoder_ready_next_value_ce0;
reg stream_controller_intermediate_next_value1;
reg stream_controller_intermediate_next_value_ce1;
reg stream_controller_aux_ign_cases_next_value0;
reg stream_controller_aux_ign_cases_next_value_ce0;
reg stream_controller_eop_cases_next_value1;
reg stream_controller_eop_cases_next_value_ce1;
reg [1:0] control_state = 2'd0;
reg [1:0] control_next_state;

// synthesis translate_off
reg dummy_s;
initial dummy_s <= 1'd0;
// synthesis translate_on

assign stream_controller_link_ready = link_ready;
assign stream_controller_fifo_empty = fifo_empty;
assign crc_control_fifo_empty = fifo_empty;
assign stream_controller_data_type = data_type_in;
assign crc_control_data_type = data_type_in;
assign stream_controller_data_typeb = dtb;
assign stream_controller_tx_init_done = link_ready;
assign fifo_re = crc_control_fifo_re;
assign crc_control_fsm_done = stream_controller_fsm_done;
assign crcstrobe = crc_control_strobe_crc;
assign crcreset = crc_control_reset_crc;

// synthesis translate_off
reg dummy_d;
// synthesis translate_on
always @(*) begin
	toCRC <= 32'd0;
	if (stream_controller_encoder_ready) begin
		toCRC <= data_in;
	end
// synthesis translate_off
	dummy_d <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_1;
// synthesis translate_on
always @(*) begin
	data_out <= 32'd0;
	k <= 1'd0;
	if (stream_controller_idle) begin
		data_out <= 8'd188;
		k <= 1'd1;
	end
	if (stream_controller_sop) begin
		data_out <= 6'd60;
		k <= 1'd1;
	end
	if (stream_controller_intermediate) begin
		data_out <= db;
	end
	if (stream_controller_ign) begin
		data_out <= 7'd92;
		k <= 1'd1;
	end
	if (stream_controller_eop) begin
		data_out <= {crc_delay, 8'd220};
		k <= 1'd1;
	end
	if (((((~stream_controller_idle) & (~stream_controller_eop)) & (~stream_controller_sop)) & (~stream_controller_ign))) begin
		k <= 1'd0;
	end
// synthesis translate_off
	dummy_d_1 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_2;
// synthesis translate_on
always @(*) begin
	stream_controller_ign <= 1'd0;
	stream_controller_fsm_done <= 1'd0;
	fsm_next_state <= 3'd0;
	stream_controller_sop_t_next_value0 <= 1'd0;
	stream_controller_sop_t_next_value_ce0 <= 1'd0;
	stream_controller_idle_t_next_value1 <= 1'd0;
	stream_controller_idle_t_next_value_ce1 <= 1'd0;
	stream_controller_encoder_ready_next_value0 <= 1'd0;
	stream_controller_encoder_ready_next_value_ce0 <= 1'd0;
	stream_controller_intermediate_next_value1 <= 1'd0;
	stream_controller_intermediate_next_value_ce1 <= 1'd0;
	stream_controller_aux_ign_cases_next_value0 <= 1'd0;
	stream_controller_aux_ign_cases_next_value_ce0 <= 1'd0;
	stream_controller_eop_cases_next_value1 <= 1'd0;
	stream_controller_eop_cases_next_value_ce1 <= 1'd0;
	fsm_next_state <= fsm_state;
	case (fsm_state)
		1'd1: begin
			stream_controller_encoder_ready_next_value0 <= 1'd1;
			stream_controller_encoder_ready_next_value_ce0 <= 1'd1;
			if (stream_controller_fifo_empty) begin
				fsm_next_state <= 1'd1;
			end else begin
				if ((stream_controller_link_ready & (stream_controller_data_type == 1'd1))) begin
					fsm_next_state <= 2'd2;
					stream_controller_sop_t_next_value0 <= 1'd1;
					stream_controller_sop_t_next_value_ce0 <= 1'd1;
					stream_controller_idle_t_next_value1 <= 1'd0;
					stream_controller_idle_t_next_value_ce1 <= 1'd1;
				end
			end
		end
		2'd2: begin
			fsm_next_state <= 2'd3;
			stream_controller_intermediate_next_value1 <= 1'd1;
			stream_controller_intermediate_next_value_ce1 <= 1'd1;
			stream_controller_sop_t_next_value0 <= 1'd0;
			stream_controller_sop_t_next_value_ce0 <= 1'd1;
		end
		2'd3: begin
			case (stream_controller_data_typeb)
				1'd0: begin
					stream_controller_intermediate_next_value1 <= 1'd1;
					stream_controller_intermediate_next_value_ce1 <= 1'd1;
					stream_controller_aux_ign_cases_next_value0 <= 1'd0;
					stream_controller_aux_ign_cases_next_value_ce0 <= 1'd1;
				end
				2'd2: begin
					fsm_next_state <= 3'd4;
					stream_controller_eop_cases_next_value1 <= 1'd1;
					stream_controller_eop_cases_next_value_ce1 <= 1'd1;
					stream_controller_intermediate_next_value1 <= 1'd0;
					stream_controller_intermediate_next_value_ce1 <= 1'd1;
					stream_controller_aux_ign_cases_next_value0 <= 1'd0;
					stream_controller_aux_ign_cases_next_value_ce0 <= 1'd1;
				end
				2'd3: begin
					fsm_next_state <= 2'd3;
					stream_controller_ign <= 1'd1;
				end
			endcase
		end
		3'd4: begin
			stream_controller_fsm_done <= 1'd1;
			stream_controller_eop_cases_next_value1 <= 1'd0;
			stream_controller_eop_cases_next_value_ce1 <= 1'd1;
			stream_controller_idle_t_next_value1 <= 1'd1;
			stream_controller_idle_t_next_value_ce1 <= 1'd1;
			fsm_next_state <= 1'd1;
		end
		default: begin
			if (stream_controller_tx_init_done) begin
				if (stream_controller_link_ready) begin
					if (((stream_controller_link_ready & (~stream_controller_fifo_empty)) & (stream_controller_data_type == 1'd1))) begin
						fsm_next_state <= 2'd2;
						stream_controller_sop_t_next_value0 <= 1'd1;
						stream_controller_sop_t_next_value_ce0 <= 1'd1;
						stream_controller_idle_t_next_value1 <= 1'd0;
						stream_controller_idle_t_next_value_ce1 <= 1'd1;
					end else begin
						fsm_next_state <= 1'd1;
						stream_controller_idle_t_next_value1 <= 1'd1;
						stream_controller_idle_t_next_value_ce1 <= 1'd1;
					end
				end else begin
					fsm_next_state <= 1'd1;
					stream_controller_idle_t_next_value1 <= 1'd1;
					stream_controller_idle_t_next_value_ce1 <= 1'd1;
				end
			end else begin
				fsm_next_state <= 1'd0;
			end
		end
	endcase
// synthesis translate_off
	dummy_d_2 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_3;
// synthesis translate_on
always @(*) begin
	crc_control_strobe_crc <= 1'd0;
	crc_control_reset_crc <= 1'd0;
	crc_control_fifo_re <= 1'd0;
	control_next_state <= 2'd0;
	control_next_state <= control_state;
	case (control_state)
		1'd1: begin
			crc_control_fifo_re <= 1'd1;
			case (crc_control_data_type)
				1'd0: begin
					crc_control_strobe_crc <= 1'd1;
					crc_control_reset_crc <= 1'd0;
					control_next_state <= 1'd1;
				end
				2'd2: begin
					crc_control_strobe_crc <= 1'd1;
					crc_control_reset_crc <= 1'd0;
					control_next_state <= 2'd2;
				end
				2'd3: begin
					crc_control_strobe_crc <= 1'd0;
					control_next_state <= 1'd1;
				end
			endcase
		end
		2'd2: begin
			crc_control_fifo_re <= 1'd0;
			crc_control_strobe_crc <= 1'd0;
			crc_control_reset_crc <= 1'd1;
			if (crc_control_fsm_done) begin
				control_next_state <= 1'd0;
			end else begin
				control_next_state <= 2'd2;
			end
		end
		default: begin
			if ((~crc_control_fifo_empty)) begin
				crc_control_fifo_re <= 1'd1;
				if ((crc_control_data_type == 1'd1)) begin
					crc_control_strobe_crc <= 1'd1;
					crc_control_reset_crc <= 1'd0;
					control_next_state <= 1'd1;
				end else begin
					control_next_state <= 1'd0;
				end
			end
		end
	endcase
// synthesis translate_off
	dummy_d_3 <= dummy_s;
// synthesis translate_on
end

always @(posedge sys_clk) begin
	da <= data_in;
	dta <= data_type_in;
	db <= da;
	dtb <= dta;
	crc_delay <= fromCRC;
	fsm_state <= fsm_next_state;
	if (stream_controller_sop_t_next_value_ce0) begin
		stream_controller_sop <= stream_controller_sop_t_next_value0;
	end
	if (stream_controller_idle_t_next_value_ce1) begin
		stream_controller_idle <= stream_controller_idle_t_next_value1;
	end
	if (stream_controller_encoder_ready_next_value_ce0) begin
		stream_controller_encoder_ready <= stream_controller_encoder_ready_next_value0;
	end
	if (stream_controller_intermediate_next_value_ce1) begin
		stream_controller_intermediate <= stream_controller_intermediate_next_value1;
	end
	if (stream_controller_aux_ign_cases_next_value_ce0) begin
		stream_controller_aux_ign <= stream_controller_aux_ign_cases_next_value0;
	end
	if (stream_controller_eop_cases_next_value_ce1) begin
		stream_controller_eop <= stream_controller_eop_cases_next_value1;
	end
	if (stream_controller_reset) begin
		stream_controller_sop <= 1'd0;
		stream_controller_eop <= 1'd0;
		stream_controller_idle <= 1'd0;
		stream_controller_intermediate <= 1'd0;
		stream_controller_encoder_ready <= 1'd0;
		stream_controller_aux_ign <= 1'd0;
		fsm_state <= 3'd0;
	end
	control_state <= control_next_state;
	if (sys_rst) begin
		da <= 32'd0;
		db <= 32'd0;
		dta <= 2'd0;
		dtb <= 2'd0;
		crc_delay <= 20'd0;
		stream_controller_sop <= 1'd0;
		stream_controller_eop <= 1'd0;
		stream_controller_idle <= 1'd0;
		stream_controller_intermediate <= 1'd0;
		stream_controller_encoder_ready <= 1'd0;
		stream_controller_aux_ign <= 1'd0;
		fsm_state <= 3'd0;
		control_state <= 2'd0;
	end
end

endmodule
