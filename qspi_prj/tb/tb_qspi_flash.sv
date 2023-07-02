`timescale 1ns/1ps

`define    SIM_TIMEOUT  500000000
`define    SIM
`timescale 1ns/1ps
module tb_qspi_flash();

        `include "UserData.h"
        `include "DevParam.h"
        //`include "glbl.v"

        `define    clk_period   T
 
        reg                 clk       ;
        reg                 rst_n     ;
        wire            clk_o     ;
        wire            flash_cs_n;
        wire            flash_d   ;
        wire            flash_scl ;
        
        wire            flash_q   ;
        
        wire            q         ;

        wire            Vpp_W_DQ2 ;
        
        `ifdef SIM
        reg     flash_en;
        `endif

        `ifdef HOLD_pin
                tri1 HOLD_DQ3;
        `endif

        `ifdef RESET_pin
                wire RESET_DQ3;
        `endif


        qspi_ctrl_top flash_rdid_inst(
                .ref_clk                        (clk        ),
                .rst_n                          (rst_n      ),
                `ifdef SIM
                .flash_en                       (flash_en   ),
                `endif
                .flash_di                       (flash_di   ),
                .clk_o                          (clk_o      ),
                .ce                             (flash_cs_n ),
                .flash_do                       (flash_do   )
);
 
        N25Qxxx m25p16_inst(
                .C_                             (clk_o         ),
                .DQ0                            (flash_di      ),
                .S                              (flash_cs_n    ),
                .Vcc                            (32'd3000      ),
                .Vpp_W_DQ2                      (1'b1          ),
                .HOLD_DQ3                       (1'b1          ),
                .DQ1                            (flash_do      )
);
        

initial begin
        /*
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
*/
#1000000000;
#(`SIM_TIMEOUT);
#(`SIM_TIMEOUT);
#(`SIM_TIMEOUT);
#(`SIM_TIMEOUT);

$finish(2);
end


`ifdef SIM
initial begin
flash_en <= 1'b0;
 #(full_access_power_up_delay+100);
$display("===================FLASH EN enable=================");
@(posedge clk);
#0.1
flash_en <= 1'b1;
#(`clk_period);
#0.1
flash_en <= 1'd0;
#(`clk_period*4000)

$finish(2);
end
`endif

//clk
initial begin
        clk     <= 1'b0;
        forever #(`clk_period/2) clk <= ~clk;
end
//rst
initial begin
        rst_n   <= 1'b0;
        #103;
        rst_n   <= 1'b1;
end

initial begin
//if($test$plusargs("DUMP_FSDB"))
begin
        $fsdbDumpfile("tb_qspi_flash.fsdb");  //                           testname.fsdb
        $fsdbDumpvars("+all");  //+all         dump SV      struct         
        $fsdbDumpSVA();   //   assertion               fsdb   
        $fsdbDumpMDA(0, tb_qspi_flash);  //dump memory arrays
        //0:                                        top.A, top.A.a            top                              dump
        //1:       dump                              dump top                           
        #(`SIM_TIMEOUT);
        #(`SIM_TIMEOUT);
        #(`SIM_TIMEOUT);
        #(`SIM_TIMEOUT);
        $finish(2);
end
end


endmodule
