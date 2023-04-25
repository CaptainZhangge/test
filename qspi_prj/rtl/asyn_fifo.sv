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
output 	[DATA_WIDTH-1:0]	rdata,
output						full,
output 						empty
);

parameter	ADDR_WIDTH = log(DEEPTH);

wire						com_rst_n;
reg							syn_w_rst_n;
reg							syn_r_rst_n;
wire	[ADDR_WIDTH:0]		waddr_p;
wire	[ADDR_WIDTH:0]		waddr_p_gray;
wire	[ADDR_WIDTH:0]		raddr_p;
wire	[ADDR_WIDTH:0]		raddr_p_gray;
wire	[ADDR_WIDTH-1:0] 	mem [DATA_WIDTH-1:0]; 
reg		[DATA_WIDTH-1:0] 	rdata_r;
reg		[DATA_WIDTH-1:0] 	rdata_cur;
wire	[ADDR_WIDTH:0]		waddr_p_gray_2d;
wire	[ADDR_WIDTH:0]		waddr_p_gray_d;
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
else if(wen && (~full))begin
	waddr_p <= waddr_p + 1'b1;
end

assign waddr_p_gray = waddr_p ^ (waddr_p >> 1);

//mem
always@(*)begin
	if(wen && (~full))
	mem[waddr_p-1:0] <= wdata;
end

//r add
always@(posedge r_clk or negedge syn_r_rst_n)
if(!syn_r_rst_n)begin
	raddr_p <= {{ADDR_WIDTH+1}{1'd0}};
end
else if(ren && (~empty))begin
	raddr_p <= raddr_p + 1'b1;
end

assign raddr_p_gray = raddr_p ^ (raddr_p >> 1);

//r data
always@(posedge r_clk or negedge syn_r_rst_n)
if(!syn_r_rst_n)begin
	rdata_r <= {{ADDR_WIDTH+1}{1'd0}};
end
else if(ren && (~empty))begin
	rdata_r <= mem[raddr_p-1:0];
end

assign rdata_cur = (ren && (~empty))?mem[addr_p-1]:rdata_r;
assign rdata = DELAY?rdata_r:rdata_cur;

//full empty
always@(posedge r_clk or negedge syn_r_rst_n)
if(!syn_r_rst_n)begin
	{waddr_p_gray_2d,waddr_p_gray_d} <= {{{ADDR_WIDTH+1}{1'd0}},{{ADDR_WIDTH+1}{1'd0}}};
end
else begin
	{waddr_p_gray_2d,waddr_p_gray_d} <= {waddr_p_gray_d,waddr_p_gray};
end

always@(posedge w_clk or negedge syn_w_rst_n)
if(!syn_w_rst_n)begin
	{raddr_p_gray_2d,raddr_p_gray_d} <= {{{ADDR_WIDTH+1}{1'd0}},{{ADDR_WIDTH+1}{1'd0}}};
end
else begin
	{raddr_p_gray_2d,raddr_p_gray_d} <= {raddr_p_gray_d,raddr_p_gray};
end

assign empty = (waddr_p_gray_2d ==  raddr_p_gray)?1'b1:1'b0;
assign full  = ({~raddr_p_gray_2d[ADDR_WIDTH],raddr_p_gray_2d[ADDR_WIDTH-1:0]} == waddr_p_gray)?1'b1:1'b0;

endmodule      
