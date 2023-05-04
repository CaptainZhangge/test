module qspi_ctrl_top(
	input 			ref_clk  ,
	input 			rst_n    ,
	output 			clk_o    ,
	output 			ce       ,
  input       flash_do ,
  output      flash_di
	//inout [3:0]	DQ	    
	);
//axi
wire			    aclk		     ;
wire			    aresetn		   ;
wire	[31:0]	m_axi_awaddr ;
wire	[ 2:0]	m_axi_awprot ;
wire			    m_axi_awvalid;
wire			    m_axi_awready;
wire	[31:0]	m_axi_wdata	 ;
wire	[ 3:0]	m_axi_wstrb	 ;
wire			    m_axi_wvalid ;
wire			    m_axi_wready ;
wire	[ 1:0]	m_axi_bresp	 ;
wire			    m_axi_bvalid ;
wire			    m_axi_bready ;
wire	[31:0]	m_axi_araddr ;
wire	[ 2:0]	m_axi_arprot ;
wire			    m_axi_arvalid;
wire			    m_axi_arready;
wire	[31:0]	m_axi_rdata	 ;
wire	[ 1:0]	m_axi_rresp	 ;
wire			    m_axi_rvalid ;
//qspi
wire  [23:0]  id           ;
reg           qspi_clk     ;
//wire		      clk_o		     ;			
wire	[3:0]  	oen 		     ;			
//wire			    ce		       ;
//wire	[ 3:0]	din			     ;
//wire	[ 3:0]	dout		     ;
wire   din          ;
wire   dout         ;

//ref div 2
always @(posedge ref_clk or negedge rst_n)
if(!rst_n) begin
    qspi_clk   <=  1'b0        ;
end else begin
    qspi_clk   <=  ~qspi_clk   ;
end
/*
//jtag to axi ip
jtag_axi_0 u_jtag_axi_0 (
  .aclk			    	(aclk			    ),// input wire aclk
  .aresetn			  (aresetn		  ),// input wire aresetn
  .m_axi_awaddr		(m_axi_awaddr	),// output wire [31 : 0] m_axi_awaddr
  .m_axi_awprot		(m_axi_awprot	),// output wire [2 : 0] m_axi_awprot
  .m_axi_awvalid	(m_axi_awvalid),// output wire m_axi_awvalid
  .m_axi_awready	(m_axi_awready),// input wire m_axi_awready
  .m_axi_wdata		(m_axi_wdata	),// output wire [31 : 0] m_axi_wdata
  .m_axi_wstrb		(m_axi_wstrb	),// output wire [3 : 0] m_axi_wstrb
  .m_axi_wvalid		(m_axi_wvalid	),// output wire m_axi_wvalid
  .m_axi_wready		(m_axi_wready	),// input wire m_axi_wready
  .m_axi_bresp		(m_axi_bresp	),// input wire [1 : 0] m_axi_bresp
  .m_axi_bvalid		(m_axi_bvalid	),// input wire m_axi_bvalid
  .m_axi_bready		(m_axi_bready	),// output wire m_axi_bready
  .m_axi_araddr		(m_axi_araddr	),// output wire [31 : 0] m_axi_araddr
  .m_axi_arprot		(m_axi_arprot	),// output wire [2 : 0] m_axi_arprot
  .m_axi_arvalid	(m_axi_arvalid),// output wire m_axi_arvalid
  .m_axi_arready	(m_axi_arready),// input wire m_axi_arready
  .m_axi_rdata		(m_axi_rdata	),// input wire [31 : 0] m_axi_rdata
  .m_axi_rresp		(m_axi_rresp	),// input wire [1 : 0] m_axi_rresp
  .m_axi_rvalid		(m_axi_rvalid	),// input wire m_axi_rvalid
  .m_axi_rready		(m_axi_rready	) // output wire m_axi_rready
);

//pad
io_pad  u_io_pad(
.oen  (oen  ),//input
.dout (dout ),//input
.din  (din  ),//output
.DQ   (DQ	  )	 
);
*/
//qspi to ctrl
qspi_ctrl u_qspi_ctrl(
.clk  				  (qspi_clk		  ),// input
.rst_n				  (rst_n			  ),// input
.din  				  (flash_do		  ),// input
.aclk				    (aclk			    ),// input wire aclk
.aresetn			  (aresetn		  ),// input wire aresetn
.m_axi_awaddr		(m_axi_awaddr	),// output wire [31 : 0] m_axi_awaddr
.m_axi_awprot		(m_axi_awprot	),// output wire [2 : 0] m_axi_awprot
.m_axi_awvalid	(m_axi_awvalid),// output wire m_axi_awvalid
.m_axi_awready	(m_axi_awready),// input wire m_axi_awready
.m_axi_wdata		(m_axi_wdata	),// output wire [31 : 0] m_axi_wdata
.m_axi_wstrb		(m_axi_wstrb	),// output wire [3 : 0] m_axi_wstrb
.m_axi_wvalid		(m_axi_wvalid	),// output wire m_axi_wvalid
.m_axi_wready		(m_axi_wready	),// input wire m_axi_wready
.m_axi_bresp		(m_axi_bresp	),// input wire [1 : 0] m_axi_bresp
.m_axi_bvalid		(m_axi_bvalid	),// input wire m_axi_bvalid
.m_axi_bready		(m_axi_bready	),// output wire m_axi_bready
.m_axi_araddr		(m_axi_araddr	),// output wire [31 : 0] m_axi_araddr
.m_axi_arprot		(m_axi_arprot	),// output wire [2 : 0] m_axi_arprot
.m_axi_arvalid	(m_axi_arvalid),// output wire m_axi_arvalid
.m_axi_arready	(m_axi_arready),// input wire m_axi_arready
.m_axi_rdata		(m_axi_rdata	),// input wire [31 : 0] m_axi_rdata
.m_axi_rresp		(m_axi_rresp	),// input wire [1 : 0] m_axi_rresp
.m_axi_rvalid		(m_axi_rvalid	),// input wire m_axi_rvalid
.m_axi_rready		(m_axi_rready	),// output wire m_axi_rready
.id             (id           ),
.clk_o				  (clk_o			  ),//output
//.oen 				    (oen			    ),//output
.ce 				    (ce 			    ),//output
.dout 				  (flash_di		  ) //output
);


ila_0 u_ila_0 (
  .clk    (qspi_clk), // input wire clk
  .probe0({31'd0,ce}), // input wire [31:0]  probe0  
  .probe1({30'd0,flash_do,flash_di}), // input wire [31:0]  probe1 
  .probe2({8'd0,id}) // input wire [31:0]  probe2
);

endmodule