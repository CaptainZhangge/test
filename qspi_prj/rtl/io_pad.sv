module io_pad#(
parameter	QSPI_MODE = 2'b01
	)(
input	[3:0]	oen ,//input
input	[3:0]	dout,//input
output	[3:0]	din ,//output
inout	[3:0]	DQ );

genvar i;
parameter	QSPI_STAND = 2'b00,
			QSPI_DUAL  = 2'b01,
			QSPI_QUEN  = 2'b10;	

always@(*)begin
	case(QSPI_MODE)
		2'b00:begin

		end
		2'b01:begin

		end
	endcase
end

generate for(i=0; i < 4; i=i+1)begin:pad_
	//oen 1:input
	assign din [i] = DQ[i];
	assign DQ  [i] = ~oen[i] ?dout[i]:z;
end

endmodule