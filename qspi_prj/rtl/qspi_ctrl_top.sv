module qspi_ctrl_top(
        input                   ref_clk  ,
        input                   rst_n    ,
        `ifdef SIM
        input                   flash_en ,
        `endif
        output                  clk_o    ,
        output                  ce       ,
        input                   flash_do ,
        output                  flash_di
        //inout [3:0]   DQ          
        );
//axi
wire                        aclk                     ;
wire                        aresetn                ;
wire    [31:0]  m_axi_awaddr ;
wire    [ 2:0]  m_axi_awprot ;
wire                        m_axi_awvalid;
wire                        m_axi_awready;
wire    [31:0]  m_axi_wdata      ;
wire    [ 3:0]  m_axi_wstrb      ;
wire                        m_axi_wvalid ;
wire                        m_axi_wready ;
wire    [ 1:0]  m_axi_bresp      ;
wire                        m_axi_bvalid ;
wire                        m_axi_bready ;
wire    [31:0]  m_axi_araddr ;
wire    [ 2:0]  m_axi_arprot ;
wire                        m_axi_arvalid;
wire                        m_axi_arready;
wire    [31:0]  m_axi_rdata      ;
wire    [ 1:0]  m_axi_rresp      ;
wire                        m_axi_rvalid ;
//qspi
wire  [23:0]  id           ;
reg           qspi_clk     ;
//wire                clk_o                  ;                  
wire    [3:0]   oen                  ;                  
//wire                      ce                 ;
//wire  [ 3:0]  din                          ;
//wire  [ 3:0]  dout                 ;
wire   din          ;
wire   dout         ;

//div 2
always @(posedge ref_clk or negedge rst_n)
if(!rst_n) begin
    qspi_clk   <=  1'b0        ;
end else begin
    qspi_clk   <=  ~qspi_clk   ;
end
/*
//jtag to axi ip
jtag_axi_0 u_jtag_axi_0 (
  .aclk                         (aclk                       ),// input wire aclk
  .aresetn                        (aresetn                ),// input wire aresetn
  .m_axi_awaddr         (m_axi_awaddr   ),// output wire [31 : 0] m_axi_awaddr
  .m_axi_awprot         (m_axi_awprot   ),// output wire [2 : 0] m_axi_awprot
  .m_axi_awvalid        (m_axi_awvalid),// output wire m_axi_awvalid
  .m_axi_awready        (m_axi_awready),// input wire m_axi_awready
  .m_axi_wdata          (m_axi_wdata    ),// output wire [31 : 0] m_axi_wdata
  .m_axi_wstrb          (m_axi_wstrb    ),// output wire [3 : 0] m_axi_wstrb
  .m_axi_wvalid         (m_axi_wvalid   ),// output wire m_axi_wvalid
  .m_axi_wready         (m_axi_wready   ),// input wire m_axi_wready
  .m_axi_bresp          (m_axi_bresp    ),// input wire [1 : 0] m_axi_bresp
  .m_axi_bvalid         (m_axi_bvalid   ),// input wire m_axi_bvalid
  .m_axi_bready         (m_axi_bready   ),// output wire m_axi_bready
  .m_axi_araddr         (m_axi_araddr   ),// output wire [31 : 0] m_axi_araddr
  .m_axi_arprot         (m_axi_arprot   ),// output wire [2 : 0] m_axi_arprot
  .m_axi_arvalid        (m_axi_arvalid),// output wire m_axi_arvalid
  .m_axi_arready        (m_axi_arready),// input wire m_axi_arready
  .m_axi_rdata          (m_axi_rdata    ),// input wire [31 : 0] m_axi_rdata
  .m_axi_rresp          (m_axi_rresp    ),// input wire [1 : 0] m_axi_rresp
  .m_axi_rvalid         (m_axi_rvalid   ),// input wire m_axi_rvalid
  .m_axi_rready         (m_axi_rready   ) // output wire m_axi_rready
);

//pad
io_pad  u_io_pad(
.oen  (oen  ),//input
.dout (dout ),//input
.din  (din  ),//output
.DQ   (DQ         )      
);
*/
wire    inst_clk_o;
/*
STARTUPE2  #(
    .PROG_USR("FALSE"), // Activate program event security feature. Requires encrypted bitstreams.
    .SIM_CCLK_FREQ(0.0) // Set the Configuration Clock Frequency(ns) for simulation
)
STARTUPE2_inst
(
    .CFGCLK(), // 1-bit output: Configuration main clock output
    .CFGMCLK(), // 1-bit output: Configuration internal oscillator clock output
    .EOS(), // 1-bit output: Active high output signal indicating the End Of Startup.
    .PREQ(), // 1-bit output: PROGRAM request to fabric output
    .CLK(0), // 1-bit input: User start-up clock input
    .GSR(0), // 1-bit input: Global Set/Reset input (GSR cannot be used for the port name)
    .GTS(0), // 1-bit input: Global 3-state input (GTS cannot be used for the port name)
    .KEYCLEARB(1), // 1-bit input: Clear AES Decrypter Key input from Battery-Backed RAM (BBRAM)
    .PACK(1), // 1-bit input: PROGRAM acknowledge input
    .USRCCLKO(clk_o), // 1-bit input: User CCLK input
    .USRCCLKTS(0), // 1-bit input: User CCLK 3-state enable input
    .USRDONEO(1), // 1-bit input: User DONE pin output control
    .USRDONETS(1) // 1-bit input: User DONE 3-state enable outpu
);
*/
//qspi to ctrl
qspi_ctrl u_qspi_ctrl(
.clk                              (qspi_clk               ),// input
.rst_n                            (rst_n                          ),// input
`ifdef SIM
.flash_en                          (flash_en),
`endif
.din                              (flash_do               ),// input
.aclk                               (aclk                           ),// input wire aclk
.aresetn                          (aresetn                ),// input wire aresetn
.m_axi_awaddr           (m_axi_awaddr   ),// output wire [31 : 0] m_axi_awaddr
.m_axi_awprot           (m_axi_awprot   ),// output wire [2 : 0] m_axi_awprot
.m_axi_awvalid  (m_axi_awvalid),// output wire m_axi_awvalid
.m_axi_awready  (m_axi_awready),// input wire m_axi_awready
.m_axi_wdata            (m_axi_wdata    ),// output wire [31 : 0] m_axi_wdata
.m_axi_wstrb            (m_axi_wstrb    ),// output wire [3 : 0] m_axi_wstrb
.m_axi_wvalid           (m_axi_wvalid   ),// output wire m_axi_wvalid
.m_axi_wready           (m_axi_wready   ),// input wire m_axi_wready
.m_axi_bresp            (m_axi_bresp    ),// input wire [1 : 0] m_axi_bresp
.m_axi_bvalid           (m_axi_bvalid   ),// input wire m_axi_bvalid
.m_axi_bready           (m_axi_bready   ),// output wire m_axi_bready
.m_axi_araddr           (m_axi_araddr   ),// output wire [31 : 0] m_axi_araddr
.m_axi_arprot           (m_axi_arprot   ),// output wire [2 : 0] m_axi_arprot
.m_axi_arvalid  (m_axi_arvalid),// output wire m_axi_arvalid
.m_axi_arready  (m_axi_arready),// input wire m_axi_arready
.m_axi_rdata            (m_axi_rdata    ),// input wire [31 : 0] m_axi_rdata
.m_axi_rresp            (m_axi_rresp    ),// input wire [1 : 0] m_axi_rresp
.m_axi_rvalid           (m_axi_rvalid   ),// input wire m_axi_rvalid
.m_axi_rready           (m_axi_rready   ),// output wire m_axi_rready
.id             (id           ),
.clk_o                            (clk_o          ),//output
//.oen                              (oen                            ),//output
.ce                                 (ce                             ),//output
.dout                             (flash_di               ) //output
);

/*
ila_0 u_ila_0 (
  .clk    (qspi_clk), // input wire clk
  .probe0({31'd0,ce}), // input wire [31:0]  probe0  
  .probe1({29'd0,clk_o,flash_do,flash_di}), // input wire [31:0]  probe1 
  .probe2({8'd0,id}) // input wire [31:0]  probe2
);
*/

endmodule
