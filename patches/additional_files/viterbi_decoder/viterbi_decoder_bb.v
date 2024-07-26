
module viterbi_decoder (
	clk,
	sink_val,
	sink_rdy,
	eras_sym,
	rr,
	source_val,
	source_rdy,
	normalizations,
	decbit,
	reset);	

	input		clk;
	input		sink_val;
	output		sink_rdy;
	input	[1:0]	eras_sym;
	input	[15:0]	rr;
	output		source_val;
	input		source_rdy;
	output	[7:0]	normalizations;
	output		decbit;
	input		reset;
endmodule
