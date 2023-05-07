`timescale 1ns/1ps
module asyn_fifo#(
parameter	DEEPTH		= 4 ,
parameter   DATA_WIDTH	= 8 ,
parameter   DELAY		= 1
)(
input						w_clk,
input 						w_rst_n,
input               		w_en,
input 	[DATA_WIDTH-1:0]	wdata,
input						r_clk,
input 						r_rst_n,
input						r_en,
output 	[DATA_WIDTH-1:0]	rdata,
output						full,
output 						empty
);

parameter	ADDR_WIDTH = $clog2(DEEPTH);

wire						com_rst_n;
reg							syn_w_rst_n;
reg							syn_r_rst_n;
reg 	[ADDR_WIDTH:0]		waddr_p;
wire	[ADDR_WIDTH:0]		waddr_p_gray;
reg 	[ADDR_WIDTH:0]		waddr_p_gray_r;
reg 	[ADDR_WIDTH:0]		raddr_p;
wire	[ADDR_WIDTH:0]		raddr_p_gray;
reg 	[ADDR_WIDTH:0]		raddr_p_gray_r;
reg 	[ADDR_WIDTH-1:0] 	mem [DATA_WIDTH-1:0]; 
reg		[DATA_WIDTH-1:0] 	rdata_r;
reg		[DATA_WIDTH-1:0] 	rdata_cur;
reg 	[ADDR_WIDTH:0]		waddr_p_gray_2d;
reg 	[ADDR_WIDTH:0]		waddr_p_gray_d;
reg 	[ADDR_WIDTH:0]		raddr_p_gray_2d;
reg 	[ADDR_WIDTH:0]		raddr_p_gray_d;

//asyn rst 
assign com_rst_n = w_rst_n && r_rst_n;

always@(posedge w_clk or negedge w_rst_n)
if(!w_rst_n)begin
	syn_w_rst_n <= 1'd0;
end 
else begin
	syn_w_rst_n <= com_rst_n;
end

always@(posedge r_clk or negedge r_rst_n)
if(!r_rst_n)begin
	syn_r_rst_n <= 1'd0;
end 
else begin
	syn_r_rst_n <= com_rst_n;
end

//w add
always@(posedge w_clk or negedge syn_w_rst_n)
if(!syn_w_rst_n)begin
	waddr_p <= {{ADDR_WIDTH+1}{1'd0}};
end
else if(w_en && (~full))begin
	waddr_p <= waddr_p + 1'b1;
end

assign waddr_p_gray = waddr_p ^ (waddr_p >> 1);

always@(posedge w_clk or negedge syn_w_rst_n)
if(!syn_w_rst_n)begin
	waddr_p_gray_r <= {{ADDR_WIDTH+1}{1'd0}};
end
else begin
	waddr_p_gray_r <= waddr_p_gray;
end
//mem
always@(*)begin
	if(w_en && (~full))
	mem[waddr_p[ADDR_WIDTH-1:0]] <= wdata;
end

//r add
always@(posedge r_clk or negedge syn_r_rst_n)
if(!syn_r_rst_n)begin
	raddr_p <= {{ADDR_WIDTH+1}{1'd0}};
end
else if(r_en && (~empty))begin
	raddr_p <= raddr_p + 1'b1;
end

assign raddr_p_gray = raddr_p ^ (raddr_p >> 1);

always@(posedge r_clk or negedge syn_r_rst_n)
if(!syn_r_rst_n)begin
	raddr_p_gray_r  <= {{ADDR_WIDTH+1}{1'd0}};
end
else begin
	raddr_p_gray_r <= raddr_p_gray;
end
 

//r data
always@(posedge r_clk or negedge syn_r_rst_n)
if(!syn_r_rst_n)begin
	rdata_r <= {{DATA_WIDTH}{1'd0}};
end
else if(r_en && (~empty))begin
	rdata_r <= mem[raddr_p[ADDR_WIDTH-1:0]];
end

assign rdata_cur = (r_en && (~empty))?mem[raddr_p-1]:rdata_r;
assign rdata = DELAY?rdata_r:rdata_cur;

//full empty
always@(posedge r_clk or negedge syn_r_rst_n)
if(!syn_r_rst_n)begin
	{waddr_p_gray_2d,waddr_p_gray_d} <= {{{ADDR_WIDTH+1}{1'd0}},{{ADDR_WIDTH+1}{1'd0}}};
end
else begin
	{waddr_p_gray_2d,waddr_p_gray_d} <= {waddr_p_gray_d,waddr_p_gray_r};
end

always@(posedge w_clk or negedge syn_w_rst_n)
if(!syn_w_rst_n)begin
	{raddr_p_gray_2d,raddr_p_gray_d} <= {{{ADDR_WIDTH+1}{1'd0}},{{ADDR_WIDTH+1}{1'd0}}};
end
else begin
	{raddr_p_gray_2d,raddr_p_gray_d} <= {raddr_p_gray_d,raddr_p_gray_r};
end

assign empty = (waddr_p_gray_2d ==  raddr_p_gray)?1'b1:1'b0;
assign full  = ({~raddr_p_gray_2d[ADDR_WIDTH:ADDR_WIDTH-1],raddr_p_gray_2d[ADDR_WIDTH-2:0]} == waddr_p_gray)?1'b1:1'b0;

endmodule      
