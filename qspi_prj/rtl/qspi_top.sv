module qspi_top
(
    input         I_clk         ,
    input         I_rst_n       ,

    output        O_qspi_clk    , // SPI总线串行时钟线
    output        O_qspi_cs     , // SPI总线片选信号
    output        O_qspi_mosi   , // SPI总线输出信号线，也是QSPI Flash的输入信号线
    input         I_qspi_miso     // SPI总线输入信号线，也是QSPI Flash的输出信号线
     
);
     
reg [3:0]   R_state             ;
reg [7:0]   R_flash_cmd         ;
reg [23:0]  R_flash_addr        ;
reg         R_clk_25M           ;
reg [4:0]   R_cmd_type          ;
                                
wire        W_done_sig          ;
wire [7:0]  W_read_data         ;
wire        W_read_byte_valid   ;
wire [2:0]  R_qspi_state        ;


          
//功能：二分频逻辑          
          
always @(posedge I_clk or negedge I_rst_n)
begin
    if(!I_rst_n) 
        R_clk_25M   <=  1'b0        ;
    else 
        R_clk_25M   <=  ~R_clk_25M  ;
end



//功能：测试状态机

always @(posedge R_clk_25M or negedge I_rst_n)
begin
    if(!I_rst_n) 
        begin
            R_state         <=  4'd0        ;
            R_flash_addr    <=  24'd0       ;
            R_flash_cmd     <=  8'h00       ;
            R_cmd_type      <=  5'b0_0000   ;
        end
     else 
        begin
            case(R_state)           
                4'd0://读Device ID指令
                    begin
                        if(W_done_sig) 
                            begin 
                                R_flash_cmd <= 8'h00            ; 
                                R_state     <= R_state + 1'b1   ; 
                                R_cmd_type  <= 5'b0_0000        ; 
                            end
                        else 
                            begin 
                                R_flash_cmd  <= 8'h90           ; 
                                R_flash_addr <= 24'd0           ; 
                                R_cmd_type   <= 5'b1_0000       ; 
                            end     
                    end 
                4'd1://写Write disable instruction
                    begin
                        if(W_done_sig) 
                            begin 
                                R_flash_cmd <= 8'h00            ; 
                                R_state     <= R_state + 1'b1   ;
                                R_cmd_type  <= 5'b0_0000        ; 
                            end
                        else 
                            begin 
                                R_flash_cmd <= 8'h04            ; 
                                R_cmd_type  <= 5'b1_0100        ; 
                            end     
                    end                
                4'd2://写使能(Write Enable)指令
                    begin
                        if(W_done_sig) 
                            begin 
                                R_flash_cmd <= 8'h00            ; 
                                R_state     <= R_state + 1'b1   ; 
                                R_cmd_type  <= 5'b0_0000        ; 
                            end
                        else 
                            begin
                                R_flash_cmd <= 8'h06            ; 
                                R_cmd_type  <= 5'b1_0001        ; 
                            end
                    end         
                4'd3:// 扇区擦除(Sector Erase)指令
                    begin
                        if(W_done_sig) 
                            begin 
                                R_flash_cmd <= 8'h00            ; 
                                R_state     <= R_state + 1'b1   ; 
                                R_cmd_type  <= 5'b0_0000        ; 
                            end
                        else 
                            begin 
                                R_flash_cmd <= 8'h20            ; 
                                R_flash_addr<= 24'd0            ; 
                                R_cmd_type  <= 5'b1_0010        ; 
                            end
                    end
            
                4'd4://读状态寄存器1, 当Busy位(状态寄存器1的最低位)为0时表示擦除操作完成
                    begin
                        if(W_done_sig) 
                            begin 
                                if(W_read_data[0]==1'b0) 
                                    begin 
                                        R_flash_cmd <= 8'h00            ; 
                                        R_state     <= R_state + 1'b1   ;
                                        R_cmd_type  <= 5'b0_0000        ; 
                                    end
                                else 
                                    begin 
                                        R_flash_cmd <= 8'h05        ; 
                                        R_cmd_type  <= 5'b1_0011    ; 
                                    end
                            end
                        else 
                            begin 
                                R_flash_cmd <= 8'h05        ; 
                                R_cmd_type  <= 5'b1_0011    ; 
                            end
                    end
                4'd5://写使能(Write Enable)指令
                    begin
                        if(W_done_sig) 
                            begin 
                                R_flash_cmd <= 8'h00            ; 
                                R_state     <= R_state + 1'b1   ; 
                                R_cmd_type  <= 5'b0_0000        ; 
                            end
                        else 
                            begin
                                R_flash_cmd <= 8'h06            ; 
                                R_cmd_type  <= 5'b1_0001        ; 
                            end
                    end             
                4'd6: //页编程操作(Page Program): 把存放在ROM中的数据写入QSPI Flash中
                    begin
                        if(W_done_sig) 
                            begin 
                                R_flash_cmd <= 8'h00            ; 
                                R_state     <= R_state + 1'b1   ; 
                                R_cmd_type  <= 5'b0_0000        ; 
                            end
                        else 
                            begin 
                                R_flash_cmd <= 8'h02            ; 
                                R_flash_addr<= 24'd0            ; 
                                R_cmd_type  <= 5'b1_0101        ; 
                            end
                    end
                4'd7://读状态寄存器1, 当Busy位(状态寄存器1的最低位)为0时表示写操作完成
                    begin
                        if(W_done_sig) 
                            begin 
                                if(W_read_data[0]==1'b0) 
                                    begin 
                                        R_flash_cmd <= 8'h00            ; 
                                        R_state     <= R_state + 1'b1   ;
                                        R_cmd_type  <= 5'b0_0000        ; 
                                    end
                                else 
                                    begin 
                                        R_flash_cmd <= 8'h05        ; 
                                        R_cmd_type  <= 5'b1_0011    ; 
                                    end
                            end
                        else 
                            begin 
                                R_flash_cmd <= 8'h05        ; 
                                R_cmd_type  <= 5'b1_0011    ; 
                            end
                    end           
                4'd8://读256 Bytes
                    begin
                        if(W_done_sig) 
                            begin 
                                R_flash_cmd <= 8'h00            ; 
                                R_state     <= R_state + 1'b1   ;
                                R_cmd_type  <= 5'b0_0000        ; 
                            end
                        else 
                            begin 
                                R_flash_cmd <= 8'h03            ; 
                                R_flash_addr<= 24'd0            ; 
                                R_cmd_type  <= 5'b1_0111        ; 
                            end
                    end
            
                4'd9:// 空闲状态
                    begin
                        R_flash_cmd <= 8'h00            ; 
                        R_state     <= 4'd9             ;
                        R_cmd_type  <= 5'b0_0000        ; 
                    end
                default :   R_state     <= 4'd0         ;
            endcase
        end           
end 
qspi_driver U_qspi_driver
(
.O_qspi_clk          (O_qspi_clk        ), // SPI总线串行时钟线
.O_qspi_cs           (O_qspi_cs         ), // SPI总线片选信号
.O_qspi_mosi         (O_qspi_mosi       ), // SPI总线输出信号线，也是QSPI Flash的输入信号线
.I_qspi_miso         (I_qspi_miso       ), // SPI总线输入信号线，也是QSPI Flash的输出信号线
                   
.I_rst_n             (I_rst_n           ), // 复位信号

.I_clk_25M           (R_clk_25M         ), // 25MHz时钟信号
.I_cmd_type          (R_cmd_type        ), // 命令类型
.I_cmd_code          (R_flash_cmd       ), // 命令码
.I_qspi_addr         (R_flash_addr      ), // QSPI Flash地址

.O_done_sig          (W_done_sig        ), // 指令执行结束标志
.O_read_data         (W_read_data       ), // 从QSPI Flash读出的数据
.O_read_byte_valid   (W_read_byte_valid ), // 读一个字节完成的标志
.O_qspi_state        (R_qspi_state      )  // 状态机，用于在顶层调试用
);
     
wire [35:0]     CONTROL0    ;
wire [69:0]     TRIG0       ;
icon icon_inst (
    .CONTROL0(CONTROL0) // INOUT BUS [35:0]
);

ila ila_inst (
    .CONTROL(CONTROL0)  , // INOUT BUS [35:0]
    .CLK(I_clk)           ,      // IN
    .TRIG0(TRIG0)      // IN BUS [255:0]
);                                                     

assign  TRIG0[7:0]      =   W_read_data         ;                                               
assign  TRIG0[8]        =   W_read_byte_valid   ;   
assign  TRIG0[12:9]     =   R_state             ;        
assign  TRIG0[16:13]    =   R_qspi_state        ;   
assign  TRIG0[17]       =   W_done_sig          ;    
assign  TRIG0[18]       =   I_qspi_miso         ;  
assign  TRIG0[19]       =   O_qspi_mosi         ;  
assign  TRIG0[20]       =   O_qspi_cs           ;  
assign  TRIG0[21]       =   O_qspi_clk          ; 
assign  TRIG0[26:22]    =   R_cmd_type          ; 
assign  TRIG0[34:27]    =   R_flash_cmd         ; 
assign  TRIG0[58:35]    =   R_flash_addr        ; 
assign  TRIG0[59]       =   I_rst_n             ; 


endmodule