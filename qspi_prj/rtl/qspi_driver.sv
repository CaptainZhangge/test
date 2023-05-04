`timescale 1ns / 1ps

module qspi_driver
(
output                  O_qspi_clk          , // SPI总线串行时钟线
output reg              O_qspi_cs           , // SPI总线片选信号
output reg              O_qspi_mosi         , // SPI总线输出信号线，也是QSPI Flash的输入信号线
input                   I_qspi_miso         , // SPI总线输入信号线，也是QSPI Flash的输出信号线
                                            
input                   I_rst_n             , // 复位信号

input                   I_clk_25M           , // 25MHz时钟信号
input       [4:0]       I_cmd_type          , // 命令类型
input       [7:0]       I_cmd_code          , // 命令码
input       [23:0]      I_qspi_addr         , // QSPI Flash地址

output reg              O_done_sig          , // 指令执行结束标志
output reg  [7:0]       O_read_data         , // 从QSPI Flash读出的数据
output reg              O_read_byte_valid   , // 读一个字节完成的标志
output reg  [3:0]       O_qspi_state          // 状态机，用于在顶层调试用
);


parameter   C_IDLE            =   4'b0000  ; // 空闲状态
parameter   C_SEND_CMD        =   4'b0001  ; // 发送命令码
parameter   C_SEND_ADDR       =   4'b0010  ; // 发送地址码
parameter   C_READ_WAIT       =   4'b0011  ; // 读等待
parameter   C_WRITE_DATA      =   4'b0101  ; // 写数据
parameter   C_FINISH_DONE     =   4'b0110  ; // 一条指令执行结束

reg         [7:0]   R_read_data_reg     ; // 从Flash中读出的数据用这个变量进行缓存，等读完了在把这个变量的值给输出
reg                 R_qspi_clk_en       ; // 串行时钟使能信号
reg                 R_data_come_single  ; // 单线操作读数据使能信号，当这个信号为高时
            
reg         [7:0]   R_cmd_reg           ; // 命令码寄存器
reg         [23:0]  R_address_reg       ; // 地址码寄存器 
reg         [7:0]   R_write_bits_cnt    ; // 写bit计数器，写数据之前把它初始化为7，发送一个bit就减1
reg         [8:0]   R_write_bytes_cnt   ; // 写字节计数器，发送一个字节数据就把它加1
reg         [7:0]   R_read_bits_cnt     ; // 写bit计数器，接收一个bit就加1
reg         [8:0]   R_read_bytes_cnt    ; // 读字节计数器，接收一个字节数据就把它加1
reg         [8:0]   R_read_bytes_num    ; // 要接收的数据总数
reg                 R_read_finish       ; // 读数据结束标志位

wire        [7:0]   W_rom_addr          ;  
wire        [7:0]   W_rom_out           ;  

assign O_qspi_clk = R_qspi_clk_en ? I_clk_25M : 0   ; // 产生串行时钟信号
assign W_rom_addr = R_write_bytes_cnt               ;


// 功能：用时钟的下降沿发送数据

always @(negedge I_clk_25M)
begin
    if(!I_rst_n)
        begin
            O_qspi_cs           <=  1'b1   ;        
            O_qspi_state        <=  C_IDLE ;
            R_cmd_reg           <=  0      ;
            R_address_reg       <=  0      ;
            R_qspi_clk_en       <=  1'b0   ;  //SPI clock输出不使能
            R_write_bits_cnt    <=  0      ;
            R_write_bytes_cnt   <=  0      ;
            R_read_bytes_num    <=  0      ;    
            R_address_reg       <=  0      ;
            O_done_sig          <=  1'b0   ;
            R_data_come_single  <=  1'b0   ;           
        end
    else
        begin
            case(O_qspi_state)
                C_IDLE:  // 初始化各个寄存器，当检测到命令类型有效(命令类型的最高位位1)以后,进入发送命令码状态
                    begin                              
                        R_qspi_clk_en  <=   1'b0         ;
                        O_qspi_cs      <=   1'b1         ;
                        O_qspi_mosi    <=   1'b0         ;    
                        R_cmd_reg      <=   I_cmd_code   ;
                        R_address_reg  <=   I_qspi_addr  ;
                        O_done_sig     <=   1'b0         ;            
                        if(I_cmd_type[4] == 1'b1) 
                            begin                //如果flash操作命令请求
                                O_qspi_state        <=  C_SEND_CMD  ;
                                R_write_bits_cnt    <=  7           ;        
                                R_write_bytes_cnt   <=  0           ;
                                R_read_bytes_num    <=  0           ;                    
                            end
                    end
                C_SEND_CMD: // 发送8-bit命令码状态 
                    begin
                        R_qspi_clk_en       <=  1'b1    ; // 打开SPI串行时钟SCLK的使能开关
                        O_qspi_cs           <=  1'b0    ; // 拉低片选信号CS
                        if(R_write_bits_cnt > 0) 
                            begin                           //如果R_cmd_reg还没有发送完
                                O_qspi_mosi        <=  R_cmd_reg[R_write_bits_cnt] ;         //发送bit7~bit1位
                                R_write_bits_cnt   <=  R_write_bits_cnt-1'b1       ;
                            end                            
                        else 
                            begin                                 //发送bit0
                                O_qspi_mosi <=  R_cmd_reg[0]    ;
                                if ((I_cmd_type[3:0] == 4'b0001) | (I_cmd_type[3:0] == 4'b0100)) 
                                    begin    //如果是写使能指令(Write Enable)或者写不使能指令(Write Disable)
                                        O_qspi_state    <=  C_FINISH_DONE   ;
                                    end                          
                                else if (I_cmd_type[3:0] == 4'b0011) 
                                    begin    //如果是读状态寄存器指令(Read Register)
                                        O_qspi_state        <=  C_READ_WAIT ;
                                        R_write_bits_cnt    <=  7           ;
                                        R_read_bytes_num    <=  1           ;//读状态寄存器指令需要接收一个数据 
                                    end                             
                                else if( (I_cmd_type[3:0] == 4'b0010) || (I_cmd_type[3:0] == 4'b0101) || (I_cmd_type[3:0] == 4'b0111) || (I_cmd_type[3:0] == 4'b0000) ) 
                                    begin // 如果是扇区擦除(Sector Erase),页编程指令(Page Program),读数据指令(Read Data),读设备ID指令(Read Device ID)                          
                                        O_qspi_state        <=  C_SEND_ADDR ;
                                        R_write_bits_cnt    <=  23          ; // 这几条指令后面都需要跟一个24-bit的地址码
                                    end
                            end
                    end
                C_SEND_ADDR: // 发送地址状态
                    begin
                        if(R_write_bits_cnt > 0)  //如果R_cmd_reg还没有发送完
                            begin                                 
                                O_qspi_mosi        <=  R_address_reg[R_write_bits_cnt] ; //发送bit23~bit1位
                                R_write_bits_cnt   <=  R_write_bits_cnt    -   1       ;    
                            end                                 
                        else 
                            begin 
                                O_qspi_mosi <=  R_address_reg[0]    ;   //发送bit0
                                if(I_cmd_type[3:0] == 4'b0010) // 扇区擦除(Sector Erase)指令
                                    begin  //扇区擦除(Sector Erase)指令发完24-bit地址码就执行结束了，所以直接跳到结束状态
                                        O_qspi_state <= C_FINISH_DONE   ;    
                                    end
                                else if (I_cmd_type[3:0] == 4'b0101) // 页编程(Page Program)指令
                                    begin                              
                                        O_qspi_state        <=  C_WRITE_DATA    ;
                                        R_write_bits_cnt    <=  7               ;                       
                                    end
                                else if (I_cmd_type[3:0] == 4'b0000) // 读Device ID指令
                                    begin             
                                        O_qspi_state        <=  C_READ_WAIT     ;
                                        R_read_bytes_num    <=  2               ; //接收2个数据的Device ID
                                    end                                                         
                                else if (I_cmd_type[3:0] == 4'b0111) // 读数据(Read Data)指令
                                    begin
                                        O_qspi_state        <=  C_READ_WAIT     ;
                                        R_read_bytes_num    <=  256             ;   //接收256个数据        
                                    end                                        
                            end
                    end                  
                C_READ_WAIT: // 读等待状态
                    begin
                        if(R_read_finish)  
                            begin
                                O_qspi_state        <=  C_FINISH_DONE   ;
                                R_data_come_single  <=  1'b0            ;
                            end
                        else
                            begin
                                R_data_come_single  <=  1'b1            ; // 单线模式下读数据标志信号，此信号为高标志正在接收数据
                            end
                    end
                C_WRITE_DATA: // 写数据状态
                    begin
                        if(R_write_bytes_cnt < 256) // 往QSPI Flash中写入 256个数据
                            begin                       
                                if(R_write_bits_cnt > 0) //如果数据还没有发送完
                                    begin                           
                                        O_qspi_mosi         <=  W_rom_out[R_write_bits_cnt] ; //发送bit7~bit1位
                                        R_write_bits_cnt    <=  R_write_bits_cnt  - 1'b1    ;                        
                                    end                 
                                else 
                                    begin                                 
                                        O_qspi_mosi         <=  W_rom_out[0]                ; //发送bit0
                                        R_write_bits_cnt    <=  7                           ;
                                        R_write_bytes_cnt   <=  R_write_bytes_cnt + 1'b1    ;
                                    end
                            end
                        else 
                            begin
                                O_qspi_state    <=  C_FINISH_DONE   ;
                                R_qspi_clk_en   <=  1'b0            ;
                            end
                    end
                C_FINISH_DONE:
                    begin
                        O_qspi_cs           <=  1'b1    ;
                        O_qspi_mosi         <=  1'b0    ;
                        R_qspi_clk_en       <=  1'b0    ;
                        O_done_sig          <=  1'b1    ;
                        R_data_come_single  <=  1'b0    ;
                        O_qspi_state        <=  C_IDLE  ;
                    end
                default:O_qspi_state    <=  C_IDLE      ;
            endcase         
        end
end

//
// 功能：接收QSPI Flash发送过来的数据    
//
always @(posedge I_clk_25M)
begin
    if(!I_rst_n)
        begin
            R_read_bytes_cnt    <=  0       ;
            R_read_bits_cnt     <=  0       ;
            R_read_finish       <=  1'b0    ;
            O_read_byte_valid   <=  1'b0    ;
            R_read_data_reg     <=  0       ;
            O_read_data         <=  0       ;
        end
    else if(R_data_come_single)   // 此信号为高表示接收数据从QSPI Flash发过来的数据
        begin
            if(R_read_bytes_cnt < R_read_bytes_num) 
                begin            
                    if(R_read_bits_cnt < 7)  //接收一个Byte的bit0~bit6    
                        begin                         
                            O_read_byte_valid   <=  1'b0                               ;
                            R_read_data_reg     <=  {R_read_data_reg[6:0],I_qspi_miso} ;
                            R_read_bits_cnt     <=  R_read_bits_cnt +   1'b1           ;
                        end
                    else  
                        begin
                            O_read_byte_valid   <=  1'b1                               ;  //一个byte数据有效
                            O_read_data         <=  {R_read_data_reg[6:0],I_qspi_miso} ;  //接收bit7
                            R_read_bits_cnt     <=  0                                  ;
                            R_read_bytes_cnt    <=  R_read_bytes_cnt    +   1'b1       ;
                        end
                end                               
            else 
                begin 
                    R_read_bytes_cnt    <=  0       ;
                    R_read_finish       <=  1'b1    ;
                    O_read_byte_valid   <=  1'b0    ;
                end
        end                               
    else 
        begin
            R_read_bytes_cnt    <=  0       ;
            R_read_bits_cnt     <=  0       ;
            R_read_finish       <=  1'b0    ;
            O_read_byte_valid   <=  1'b0    ;
            R_read_data_reg     <=  0       ;
        end
end         

rom_data rom_data_inst (
  .clka(I_clk_25M), // input clka
  .addra(W_rom_addr), // input [7 : 0] addra
  .douta(W_rom_out) // output [7 : 0] douta
);

endmodule
