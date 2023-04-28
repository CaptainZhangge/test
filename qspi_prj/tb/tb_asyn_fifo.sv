`timescale 1ns/1ps
`define    clk_period	10
`define    SIM_TIMEOUT  1000000

module tb_asyn_fifo();

parameter					DEEPTH = 4;
parameter					DATA_WIDTH = 2;

reg							w_clk;
reg	 						w_rst_n;
reg	               		    w_en;
reg	 	[DATA_WIDTH-1:0]	wdata;
reg							r_clk;
reg	 						r_rst_n;
reg							r_en;
wire 	[DATA_WIDTH-1:0]	rdata;
wire						full;
wire 						empty;

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
.r_en       (r_en		),
.rdata		(rdata		),
.full		(full		),
.empty		(empty		)
);

initial begin
w_en <= 1'd0;
r_en <= 1'd0;
wdata <= 2'd0;
#303;
w_en <= 1'd1;
wdata <= 2'd1;
#(`clk_period)
w_en <= 1'd0;
#303;
r_en <= 1'd1;
#(`clk_period)
r_en <= 1'd0;
#100;
w_en <= 1'd1;
wdata <= 2'd2;
r_en <= 1'd1;
#(`clk_period)
w_en <= 1'd0;
r_en <= 1'd0;
#1000;
$finish(2);
end

//clk
initial begin
	w_clk	<= 1'b0;
	r_clk	<= 1'b1;
	fork
		forever #(`clk_period/2) w_clk <= ~w_clk;
		forever #(`clk_period/2) r_clk <= ~r_clk;
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
//if($test$plusargs("DUMP_FSDB"))
begin
	$fsdbDumpfile("test_tb.fsdb");  //记录波形，波形名字testname.fsdb
	$fsdbDumpvars("+all");  //+all参数，dump SV中的struct结构体
	$fsdbDumpSVA();   //将assertion的结果存在fsdb中
	$fsdbDumpMDA(0, tb_asyn_fifo);  //dump memory arrays
	//0: 当前级及其下面所有层级，如top.A, top.A.a，所有在top下面的多维数组均会被dump
	//1: 仅仅dump当前组，也就是说，只dump top这一层的多维数组。
	#(`SIM_TIMEOUT);
	$finish(2);
end
end


endmodule
