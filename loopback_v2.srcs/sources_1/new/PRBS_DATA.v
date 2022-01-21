/* Machine-generated using Migen */
/* Machine-generated using Migen */
module PRBS_DATA(
	input we,
	output [33:0] d_out,
	output we_fifo,
	input sys_clk,
	input sys_rst
);

reg [31:0] __main___o = 32'd0;
wire __main___enable;
reg [6:0] __main___state = 7'd1;
reg __main___prbs_en;
reg [1:0] __main___data_type = 2'd0;
reg [3:0] __main___index = 4'd0;
reg [2:0] __main___pack_index = 3'd0;
reg __main___write_fifo = 1'd0;
reg [1:0] __main___idle_counter = 2'd0;
reg [3:0] __main___aux = 4'd0;
reg __main___done_packs = 1'd0;
reg [2:0] convert_state = 3'd0;
reg [2:0] convert_next_state;
reg __main___write_fifo_t_next_value0;
reg __main___write_fifo_t_next_value_ce0;
reg [3:0] __main___aux_next_value0;
reg __main___aux_next_value_ce0;
reg [1:0] __main___data_type_t_next_value1;
reg __main___data_type_t_next_value_ce1;
reg [3:0] __main___index_t_next_value2;
reg __main___index_t_next_value_ce2;
reg [2:0] __main___pack_index_next_value1;
reg __main___pack_index_next_value_ce1;
reg [1:0] __main___idle_counter_next_value2;
reg __main___idle_counter_next_value_ce2;
reg __main___done_packs_f_next_value;
reg __main___done_packs_f_next_value_ce;

// synthesis translate_off
reg dummy_s;
initial dummy_s <= 1'd0;
// synthesis translate_on

assign d_out = {__main___data_type, __main___o};
assign we_fifo = __main___write_fifo;
assign __main___enable = __main___prbs_en;

// synthesis translate_off
reg dummy_d;
// synthesis translate_on
always @(*) begin
	__main___prbs_en <= 1'd0;
	convert_next_state <= 3'd0;
	__main___write_fifo_t_next_value0 <= 1'd0;
	__main___write_fifo_t_next_value_ce0 <= 1'd0;
	__main___aux_next_value0 <= 4'd0;
	__main___aux_next_value_ce0 <= 1'd0;
	__main___data_type_t_next_value1 <= 2'd0;
	__main___data_type_t_next_value_ce1 <= 1'd0;
	__main___index_t_next_value2 <= 4'd0;
	__main___index_t_next_value_ce2 <= 1'd0;
	__main___pack_index_next_value1 <= 3'd0;
	__main___pack_index_next_value_ce1 <= 1'd0;
	__main___idle_counter_next_value2 <= 2'd0;
	__main___idle_counter_next_value_ce2 <= 1'd0;
	__main___done_packs_f_next_value <= 1'd0;
	__main___done_packs_f_next_value_ce <= 1'd0;
	convert_next_state <= convert_state;
	case (convert_state)
		1'd1: begin
			__main___prbs_en <= 1'd1;
			__main___aux_next_value0 <= (__main___aux + 1'd1);
			__main___aux_next_value_ce0 <= 1'd1;
			if ((__main___aux == 3'd5)) begin
				__main___data_type_t_next_value1 <= 1'd1;
				__main___data_type_t_next_value_ce1 <= 1'd1;
				__main___index_t_next_value2 <= (__main___index + 1'd1);
				__main___index_t_next_value_ce2 <= 1'd1;
				convert_next_state <= 2'd2;
			end else begin
				convert_next_state <= 1'd1;
			end
		end
		2'd2: begin
			__main___prbs_en <= 1'd1;
			if ((__main___index < 4'd10)) begin
				__main___prbs_en <= 1'd1;
				__main___data_type_t_next_value1 <= 1'd0;
				__main___data_type_t_next_value_ce1 <= 1'd1;
				__main___index_t_next_value2 <= (__main___index + 1'd1);
				__main___index_t_next_value_ce2 <= 1'd1;
				convert_next_state <= 2'd2;
			end else begin
				convert_next_state <= 2'd3;
				__main___data_type_t_next_value1 <= 2'd2;
				__main___data_type_t_next_value_ce1 <= 1'd1;
				__main___index_t_next_value2 <= 1'd0;
				__main___index_t_next_value_ce2 <= 1'd1;
			end
		end
		2'd3: begin
			__main___prbs_en <= 1'd1;
			__main___write_fifo_t_next_value0 <= 1'd0;
			__main___write_fifo_t_next_value_ce0 <= 1'd1;
			convert_next_state <= 3'd4;
		end
		3'd4: begin
			__main___pack_index_next_value1 <= (__main___pack_index + 1'd1);
			__main___pack_index_next_value_ce1 <= 1'd1;
			__main___idle_counter_next_value2 <= 1'd0;
			__main___idle_counter_next_value_ce2 <= 1'd1;
			if ((__main___pack_index <= 2'd3)) begin
				__main___data_type_t_next_value1 <= 1'd1;
				__main___data_type_t_next_value_ce1 <= 1'd1;
				__main___write_fifo_t_next_value0 <= 1'd1;
				__main___write_fifo_t_next_value_ce0 <= 1'd1;
				convert_next_state <= 2'd2;
			end else begin
				convert_next_state <= 1'd0;
				__main___done_packs_f_next_value <= 1'd1;
				__main___done_packs_f_next_value_ce <= 1'd1;
			end
		end
		default: begin
			__main___prbs_en <= 1'd0;
			if (we) begin
				__main___prbs_en <= 1'd1;
				__main___write_fifo_t_next_value0 <= 1'd1;
				__main___write_fifo_t_next_value_ce0 <= 1'd1;
				convert_next_state <= 1'd1;
			end
		end
	endcase
// synthesis translate_off
	dummy_d <= dummy_s;
// synthesis translate_on
end

always @(posedge sys_clk) begin
	if (__main___enable) begin
		__main___state <= {(((((__main___state[4] ^ __main___state[5]) ^ (__main___state[5] ^ __main___state[6])) ^ ((__main___state[5] ^ __main___state[6]) ^ __main___state[0])) ^ (((__main___state[5] ^ __main___state[6]) ^ __main___state[0]) ^ (__main___state[0] ^ __main___state[1]))) ^ ((((__main___state[5] ^ __main___state[6]) ^ __main___state[0]) ^ (__main___state[0] ^ __main___state[1])) ^ ((__main___state[0] ^ __main___state[1]) ^ (__main___state[1] ^ __main___state[2])))), (((((__main___state[3] ^ __main___state[4]) ^ (__main___state[4] ^ __main___state[5])) ^ ((__main___state[4] ^ __main___state[5]) ^ (__main___state[5] ^ __main___state[6]))) ^ (((__main___state[4] ^ __main___state[5]) ^ (__main___state[5] ^ __main___state[6])) ^ ((__main___state[5] ^ __main___state[6]) ^ __main___state[0]))) ^ ((((__main___state[4] ^ __main___state[5]) ^ (__main___state[5] ^ __main___state[6])) ^ ((__main___state[5] ^ __main___state[6]) ^ __main___state[0])) ^ (((__main___state[5] ^ __main___state[6]) ^ __main___state[0]) ^ (__main___state[0] ^ __main___state[1])))), (((((__main___state[2] ^ __main___state[3]) ^ (__main___state[3] ^ __main___state[4])) ^ ((__main___state[3] ^ __main___state[4]) ^ (__main___state[4] ^ __main___state[5]))) ^ (((__main___state[3] ^ __main___state[4]) ^ (__main___state[4] ^ __main___state[5])) ^ ((__main___state[4] ^ __main___state[5]) ^ (__main___state[5] ^ __main___state[6])))) ^ ((((__main___state[3] ^ __main___state[4]) ^ (__main___state[4] ^ __main___state[5])) ^ ((__main___state[4] ^ __main___state[5]) ^ (__main___state[5] ^ __main___state[6]))) ^ (((__main___state[4] ^ __main___state[5]) ^ (__main___state[5] ^ __main___state[6])) ^ ((__main___state[5] ^ __main___state[6]) ^ __main___state[0])))), (((((__main___state[1] ^ __main___state[2]) ^ (__main___state[2] ^ __main___state[3])) ^ ((__main___state[2] ^ __main___state[3]) ^ (__main___state[3] ^ __main___state[4]))) ^ (((__main___state[2] ^ __main___state[3]) ^ (__main___state[3] ^ __main___state[4])) ^ ((__main___state[3] ^ __main___state[4]) ^ (__main___state[4] ^ __main___state[5])))) ^ ((((__main___state[2] ^ __main___state[3]) ^ (__main___state[3] ^ __main___state[4])) ^ ((__main___state[3] ^ __main___state[4]) ^ (__main___state[4] ^ __main___state[5]))) ^ (((__main___state[3] ^ __main___state[4]) ^ (__main___state[4] ^ __main___state[5])) ^ ((__main___state[4] ^ __main___state[5]) ^ (__main___state[5] ^ __main___state[6]))))), (((((__main___state[0] ^ __main___state[1]) ^ (__main___state[1] ^ __main___state[2])) ^ ((__main___state[1] ^ __main___state[2]) ^ (__main___state[2] ^ __main___state[3]))) ^ (((__main___state[1] ^ __main___state[2]) ^ (__main___state[2] ^ __main___state[3])) ^ ((__main___state[2] ^ __main___state[3]) ^ (__main___state[3] ^ __main___state[4])))) ^ ((((__main___state[1] ^ __main___state[2]) ^ (__main___state[2] ^ __main___state[3])) ^ ((__main___state[2] ^ __main___state[3]) ^ (__main___state[3] ^ __main___state[4]))) ^ (((__main___state[2] ^ __main___state[3]) ^ (__main___state[3] ^ __main___state[4])) ^ ((__main___state[3] ^ __main___state[4]) ^ (__main___state[4] ^ __main___state[5]))))), ((((((__main___state[5] ^ __main___state[6]) ^ __main___state[0]) ^ (__main___state[0] ^ __main___state[1])) ^ ((__main___state[0] ^ __main___state[1]) ^ (__main___state[1] ^ __main___state[2]))) ^ (((__main___state[0] ^ __main___state[1]) ^ (__main___state[1] ^ __main___state[2])) ^ ((__main___state[1] ^ __main___state[2]) ^ (__main___state[2] ^ __main___state[3])))) ^ ((((__main___state[0] ^ __main___state[1]) ^ (__main___state[1] ^ __main___state[2])) ^ ((__main___state[1] ^ __main___state[2]) ^ (__main___state[2] ^ __main___state[3]))) ^ (((__main___state[1] ^ __main___state[2]) ^ (__main___state[2] ^ __main___state[3])) ^ ((__main___state[2] ^ __main___state[3]) ^ (__main___state[3] ^ __main___state[4]))))), ((((((__main___state[4] ^ __main___state[5]) ^ (__main___state[5] ^ __main___state[6])) ^ ((__main___state[5] ^ __main___state[6]) ^ __main___state[0])) ^ (((__main___state[5] ^ __main___state[6]) ^ __main___state[0]) ^ (__main___state[0] ^ __main___state[1]))) ^ ((((__main___state[5] ^ __main___state[6]) ^ __main___state[0]) ^ (__main___state[0] ^ __main___state[1])) ^ ((__main___state[0] ^ __main___state[1]) ^ (__main___state[1] ^ __main___state[2])))) ^ (((((__main___state[5] ^ __main___state[6]) ^ __main___state[0]) ^ (__main___state[0] ^ __main___state[1])) ^ ((__main___state[0] ^ __main___state[1]) ^ (__main___state[1] ^ __main___state[2]))) ^ (((__main___state[0] ^ __main___state[1]) ^ (__main___state[1] ^ __main___state[2])) ^ ((__main___state[1] ^ __main___state[2]) ^ (__main___state[2] ^ __main___state[3])))))};
		__main___o <= {(__main___state[5] ^ __main___state[6]), (__main___state[4] ^ __main___state[5]), (__main___state[3] ^ __main___state[4]), (__main___state[2] ^ __main___state[3]), (__main___state[1] ^ __main___state[2]), (__main___state[0] ^ __main___state[1]), ((__main___state[5] ^ __main___state[6]) ^ __main___state[0]), ((__main___state[4] ^ __main___state[5]) ^ (__main___state[5] ^ __main___state[6])), ((__main___state[3] ^ __main___state[4]) ^ (__main___state[4] ^ __main___state[5])), ((__main___state[2] ^ __main___state[3]) ^ (__main___state[3] ^ __main___state[4])), ((__main___state[1] ^ __main___state[2]) ^ (__main___state[2] ^ __main___state[3])), ((__main___state[0] ^ __main___state[1]) ^ (__main___state[1] ^ __main___state[2])), (((__main___state[5] ^ __main___state[6]) ^ __main___state[0]) ^ (__main___state[0] ^ __main___state[1])), (((__main___state[4] ^ __main___state[5]) ^ (__main___state[5] ^ __main___state[6])) ^ ((__main___state[5] ^ __main___state[6]) ^ __main___state[0])), (((__main___state[3] ^ __main___state[4]) ^ (__main___state[4] ^ __main___state[5])) ^ ((__main___state[4] ^ __main___state[5]) ^ (__main___state[5] ^ __main___state[6]))), (((__main___state[2] ^ __main___state[3]) ^ (__main___state[3] ^ __main___state[4])) ^ ((__main___state[3] ^ __main___state[4]) ^ (__main___state[4] ^ __main___state[5]))), (((__main___state[1] ^ __main___state[2]) ^ (__main___state[2] ^ __main___state[3])) ^ ((__main___state[2] ^ __main___state[3]) ^ (__main___state[3] ^ __main___state[4]))), (((__main___state[0] ^ __main___state[1]) ^ (__main___state[1] ^ __main___state[2])) ^ ((__main___state[1] ^ __main___state[2]) ^ (__main___state[2] ^ __main___state[3]))), ((((__main___state[5] ^ __main___state[6]) ^ __main___state[0]) ^ (__main___state[0] ^ __main___state[1])) ^ ((__main___state[0] ^ __main___state[1]) ^ (__main___state[1] ^ __main___state[2]))), ((((__main___state[4] ^ __main___state[5]) ^ (__main___state[5] ^ __main___state[6])) ^ ((__main___state[5] ^ __main___state[6]) ^ __main___state[0])) ^ (((__main___state[5] ^ __main___state[6]) ^ __main___state[0]) ^ (__main___state[0] ^ __main___state[1]))), ((((__main___state[3] ^ __main___state[4]) ^ (__main___state[4] ^ __main___state[5])) ^ ((__main___state[4] ^ __main___state[5]) ^ (__main___state[5] ^ __main___state[6]))) ^ (((__main___state[4] ^ __main___state[5]) ^ (__main___state[5] ^ __main___state[6])) ^ ((__main___state[5] ^ __main___state[6]) ^ __main___state[0]))), ((((__main___state[2] ^ __main___state[3]) ^ (__main___state[3] ^ __main___state[4])) ^ ((__main___state[3] ^ __main___state[4]) ^ (__main___state[4] ^ __main___state[5]))) ^ (((__main___state[3] ^ __main___state[4]) ^ (__main___state[4] ^ __main___state[5])) ^ ((__main___state[4] ^ __main___state[5]) ^ (__main___state[5] ^ __main___state[6])))), ((((__main___state[1] ^ __main___state[2]) ^ (__main___state[2] ^ __main___state[3])) ^ ((__main___state[2] ^ __main___state[3]) ^ (__main___state[3] ^ __main___state[4]))) ^ (((__main___state[2] ^ __main___state[3]) ^ (__main___state[3] ^ __main___state[4])) ^ ((__main___state[3] ^ __main___state[4]) ^ (__main___state[4] ^ __main___state[5])))), ((((__main___state[0] ^ __main___state[1]) ^ (__main___state[1] ^ __main___state[2])) ^ ((__main___state[1] ^ __main___state[2]) ^ (__main___state[2] ^ __main___state[3]))) ^ (((__main___state[1] ^ __main___state[2]) ^ (__main___state[2] ^ __main___state[3])) ^ ((__main___state[2] ^ __main___state[3]) ^ (__main___state[3] ^ __main___state[4])))), (((((__main___state[5] ^ __main___state[6]) ^ __main___state[0]) ^ (__main___state[0] ^ __main___state[1])) ^ ((__main___state[0] ^ __main___state[1]) ^ (__main___state[1] ^ __main___state[2]))) ^ (((__main___state[0] ^ __main___state[1]) ^ (__main___state[1] ^ __main___state[2])) ^ ((__main___state[1] ^ __main___state[2]) ^ (__main___state[2] ^ __main___state[3])))), (((((__main___state[4] ^ __main___state[5]) ^ (__main___state[5] ^ __main___state[6])) ^ ((__main___state[5] ^ __main___state[6]) ^ __main___state[0])) ^ (((__main___state[5] ^ __main___state[6]) ^ __main___state[0]) ^ (__main___state[0] ^ __main___state[1]))) ^ ((((__main___state[5] ^ __main___state[6]) ^ __main___state[0]) ^ (__main___state[0] ^ __main___state[1])) ^ ((__main___state[0] ^ __main___state[1]) ^ (__main___state[1] ^ __main___state[2])))), (((((__main___state[3] ^ __main___state[4]) ^ (__main___state[4] ^ __main___state[5])) ^ ((__main___state[4] ^ __main___state[5]) ^ (__main___state[5] ^ __main___state[6]))) ^ (((__main___state[4] ^ __main___state[5]) ^ (__main___state[5] ^ __main___state[6])) ^ ((__main___state[5] ^ __main___state[6]) ^ __main___state[0]))) ^ ((((__main___state[4] ^ __main___state[5]) ^ (__main___state[5] ^ __main___state[6])) ^ ((__main___state[5] ^ __main___state[6]) ^ __main___state[0])) ^ (((__main___state[5] ^ __main___state[6]) ^ __main___state[0]) ^ (__main___state[0] ^ __main___state[1])))), (((((__main___state[2] ^ __main___state[3]) ^ (__main___state[3] ^ __main___state[4])) ^ ((__main___state[3] ^ __main___state[4]) ^ (__main___state[4] ^ __main___state[5]))) ^ (((__main___state[3] ^ __main___state[4]) ^ (__main___state[4] ^ __main___state[5])) ^ ((__main___state[4] ^ __main___state[5]) ^ (__main___state[5] ^ __main___state[6])))) ^ ((((__main___state[3] ^ __main___state[4]) ^ (__main___state[4] ^ __main___state[5])) ^ ((__main___state[4] ^ __main___state[5]) ^ (__main___state[5] ^ __main___state[6]))) ^ (((__main___state[4] ^ __main___state[5]) ^ (__main___state[5] ^ __main___state[6])) ^ ((__main___state[5] ^ __main___state[6]) ^ __main___state[0])))), (((((__main___state[1] ^ __main___state[2]) ^ (__main___state[2] ^ __main___state[3])) ^ ((__main___state[2] ^ __main___state[3]) ^ (__main___state[3] ^ __main___state[4]))) ^ (((__main___state[2] ^ __main___state[3]) ^ (__main___state[3] ^ __main___state[4])) ^ ((__main___state[3] ^ __main___state[4]) ^ (__main___state[4] ^ __main___state[5])))) ^ ((((__main___state[2] ^ __main___state[3]) ^ (__main___state[3] ^ __main___state[4])) ^ ((__main___state[3] ^ __main___state[4]) ^ (__main___state[4] ^ __main___state[5]))) ^ (((__main___state[3] ^ __main___state[4]) ^ (__main___state[4] ^ __main___state[5])) ^ ((__main___state[4] ^ __main___state[5]) ^ (__main___state[5] ^ __main___state[6]))))), (((((__main___state[0] ^ __main___state[1]) ^ (__main___state[1] ^ __main___state[2])) ^ ((__main___state[1] ^ __main___state[2]) ^ (__main___state[2] ^ __main___state[3]))) ^ (((__main___state[1] ^ __main___state[2]) ^ (__main___state[2] ^ __main___state[3])) ^ ((__main___state[2] ^ __main___state[3]) ^ (__main___state[3] ^ __main___state[4])))) ^ ((((__main___state[1] ^ __main___state[2]) ^ (__main___state[2] ^ __main___state[3])) ^ ((__main___state[2] ^ __main___state[3]) ^ (__main___state[3] ^ __main___state[4]))) ^ (((__main___state[2] ^ __main___state[3]) ^ (__main___state[3] ^ __main___state[4])) ^ ((__main___state[3] ^ __main___state[4]) ^ (__main___state[4] ^ __main___state[5]))))), ((((((__main___state[5] ^ __main___state[6]) ^ __main___state[0]) ^ (__main___state[0] ^ __main___state[1])) ^ ((__main___state[0] ^ __main___state[1]) ^ (__main___state[1] ^ __main___state[2]))) ^ (((__main___state[0] ^ __main___state[1]) ^ (__main___state[1] ^ __main___state[2])) ^ ((__main___state[1] ^ __main___state[2]) ^ (__main___state[2] ^ __main___state[3])))) ^ ((((__main___state[0] ^ __main___state[1]) ^ (__main___state[1] ^ __main___state[2])) ^ ((__main___state[1] ^ __main___state[2]) ^ (__main___state[2] ^ __main___state[3]))) ^ (((__main___state[1] ^ __main___state[2]) ^ (__main___state[2] ^ __main___state[3])) ^ ((__main___state[2] ^ __main___state[3]) ^ (__main___state[3] ^ __main___state[4]))))), ((((((__main___state[4] ^ __main___state[5]) ^ (__main___state[5] ^ __main___state[6])) ^ ((__main___state[5] ^ __main___state[6]) ^ __main___state[0])) ^ (((__main___state[5] ^ __main___state[6]) ^ __main___state[0]) ^ (__main___state[0] ^ __main___state[1]))) ^ ((((__main___state[5] ^ __main___state[6]) ^ __main___state[0]) ^ (__main___state[0] ^ __main___state[1])) ^ ((__main___state[0] ^ __main___state[1]) ^ (__main___state[1] ^ __main___state[2])))) ^ (((((__main___state[5] ^ __main___state[6]) ^ __main___state[0]) ^ (__main___state[0] ^ __main___state[1])) ^ ((__main___state[0] ^ __main___state[1]) ^ (__main___state[1] ^ __main___state[2]))) ^ (((__main___state[0] ^ __main___state[1]) ^ (__main___state[1] ^ __main___state[2])) ^ ((__main___state[1] ^ __main___state[2]) ^ (__main___state[2] ^ __main___state[3])))))};
	end
	convert_state <= convert_next_state;
	if (__main___write_fifo_t_next_value_ce0) begin
		__main___write_fifo <= __main___write_fifo_t_next_value0;
	end
	if (__main___aux_next_value_ce0) begin
		__main___aux <= __main___aux_next_value0;
	end
	if (__main___data_type_t_next_value_ce1) begin
		__main___data_type <= __main___data_type_t_next_value1;
	end
	if (__main___index_t_next_value_ce2) begin
		__main___index <= __main___index_t_next_value2;
	end
	if (__main___pack_index_next_value_ce1) begin
		__main___pack_index <= __main___pack_index_next_value1;
	end
	if (__main___idle_counter_next_value_ce2) begin
		__main___idle_counter <= __main___idle_counter_next_value2;
	end
	if (__main___done_packs_f_next_value_ce) begin
		__main___done_packs <= __main___done_packs_f_next_value;
	end
	if (sys_rst) begin
		__main___o <= 32'd0;
		__main___state <= 7'd1;
		__main___data_type <= 2'd0;
		__main___index <= 4'd0;
		__main___pack_index <= 3'd0;
		__main___write_fifo <= 1'd0;
		__main___idle_counter <= 2'd0;
		__main___aux <= 4'd0;
		__main___done_packs <= 1'd0;
		convert_state <= 3'd0;
	end
end

endmodule


