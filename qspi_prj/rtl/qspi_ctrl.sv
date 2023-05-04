module qspi_ctrl    (
input			    clk  			,//spi_clk 
input			    rst_n			,
input	    	    din  			,
input			    aclk			,
input			    aresetn			,
input	[31:0]	    m_axi_awaddr	,
input	[ 2:0]	    m_axi_awprot	,
input			    m_axi_awvalid	,
output			    m_axi_awready	,
input	[31:0]	    m_axi_wdata		,
input	[ 3:0]	    m_axi_wstrb		,
input			    m_axi_wvalid	,
output			    m_axi_wready	,
output	[ 1:0]	    m_axi_bresp		,
output			    m_axi_bvalid	,
input			    m_axi_bready	,
input	[31:0]	    m_axi_araddr	,
input	[ 2:0]	    m_axi_arprot	,
input			    m_axi_arvalid	,
output			    m_axi_arready	,
output	[31:0]	    m_axi_rdata		,
output	[ 1:0]	    m_axi_rresp		,
output			    m_axi_rvalid	,
input			    m_axi_rready	,
output	reg [23:0]  id              ,
output				clk_o			,
//output	[3:0]	oen			    ,
output	reg 		ce 			    ,
output	reg    		dout 			 
);

parameter		RID_CMD	= 8'h9F;

parameter	IDLE   = 5'b00000,
			COM    = 5'b00001,
			ADDR   = 5'b00010,
			DATA   = 5'b00100;

reg	[9:0]	count;
reg			en 	 ;
reg [4:0]   cur_state;
reg [4:0]	next_state;

reg 	[7:0]	cmd_reg;
reg     [2:0]   cmd_cnt;
reg             cmd_done;
reg     [4:0]   data_i_cnt;
reg 			data_i_en;
reg 			data_i_en_r;
wire 			data_i_en_neg;

assign clk_o = (~ce) && clk;

always@(posedge clk or negedge rst_n)
if(!rst_n)begin
	count <= 'd0;
end else if(count == 10'd1022)begin
	count <= count; 
end else begin
	count <= count + 1'd1;
end

always@(posedge clk or negedge rst_n)
if(!rst_n)begin
	en <= 1'd0;
end else if(count == 10'd1021)begin
	en <= 1'd1;
end else begin
	en <= 1'd0;
end 

always@(negedge  clk or negedge rst_n)
if(!rst_n)begin
	ce <= 1'd1;
end else if(data_i_en_neg) begin
	ce <= 1'd1;
end else if(en) begin
	ce <= 1'd0;
end 

always@(posedge clk or negedge rst_n)
if(!rst_n)begin
	cmd_reg <= RID_CMD; 
end else if(ce == 1'b0 && en == 1'b0)begin
	cmd_reg <= cmd_reg << 1;
end

always@(posedge clk or negedge rst_n)
if(!rst_n)begin
	dout <= 1'd0;
end else if((ce == 1'b0) && (en == 1'b0))begin
	dout <= cmd_reg[7];
end

always@(posedge clk or negedge rst_n)
if(!rst_n)begin
	cmd_cnt <= 3'd7; 
end else if(ce == 1'b0 && en == 1'b0)begin
	cmd_cnt <= cmd_cnt -1;
end 

always@(posedge clk or negedge rst_n)
if(!rst_n)begin
	cmd_done <= 1'd0; 
end else if(cmd_cnt == 3'd1)begin
	cmd_done <= 1'd1;
end else begin
	cmd_done <= 1'd0;
end

always@(posedge clk or negedge rst_n)
if(!rst_n)begin
	data_i_en <= 1'b0;	
end else if(data_i_cnt == 5'd23)begin 
	data_i_en <= 1'b0;
end else if(cmd_done)begin
	data_i_en <= 1'b1;
end

always@(posedge clk or negedge rst_n)
if(!rst_n)begin
	data_i_en_r <= 1'b0;	
end else begin
	data_i_en_r <= data_i_en;
end

assign data_i_en_neg = data_i_en_r && (~data_i_en_r);

always@(posedge clk or negedge rst_n)
if(!rst_n)begin
	data_i_cnt <= 5'b0;	
end else if(data_i_cnt == 5'd23)begin 
	data_i_cnt <= 5'b0;
end else if(data_i_en)begin
	data_i_cnt <= data_i_cnt + 1'b1;
end

always@(posedge clk or negedge rst_n)
if(!rst_n)begin
	id <= 24'd0;
end else if(data_i_en)begin
	id <= {{id[22:0]},din};
end 

endmodule  