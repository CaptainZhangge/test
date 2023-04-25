`timescale 1ns/1ps
`define    clk_period	10
`define    SIM_TIMEOUT  1000000
module tb_asyn_fifo();

reg							w_clk,
reg	 						w_rst_n,
reg	               		    w_en,
reg	 	[DATA_WIDTH-1:0]	wdata,
reg							r_clk,
reg	 						r_rst_n,
wire 	[DATA_WIDTH-1:0]	rdata,
wire						full,
wire 						empty

asyn_fifo#(
.DEEPTH		(4) ,
.DATA_WIDTH	(2) ,
.DELAY		(1)
)u_asyn_fifo(
.w_clk		(w_clk		),
.w_rst_n	(w_rst_n	),
.w_en		(w_en		),
.wdata		(wdata		),
.r_clk		(r_clk		),
.r_rst_n	(r_rst_n	),
.rdata		(rdata		),
.full		(full		),
.empty		(empty		)
);


//clk
initial begin
	w_clk	<= 1'b0;
	r_clk	<= 1'b1;
	fork
		forever(`clk_period/2) w_clk <= ~w_clk;
		forever(`clk_period/2) r_clk <= ~r_clk;
	join
end
//rst
initial begin
	w_rst_n	<= 1'b0;
	r_rst_n	<= 1'b0;
	#103;
	w_rst_n	<= 1'b1;
	#103
	r_rst_n	<= 1'b1;
end

initial begin
	$fsdbvampar();
	$finish(2);
end

endmodule