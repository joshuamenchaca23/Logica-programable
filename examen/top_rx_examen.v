module top_rx_examen( 
	input wire MAX10_CLK1_50, 
	input wire [1:0] KEY, 
	input wire [15:0] ARDUINO_IO, 
	output wire[0:6] HEX0, 
	output wire[0:6] HEX1, 
	output wire[0:6] HEX2, 
	output wire[0:6] HEX3
); 

wire data_ready; 
wire[7:0] data_out; 
reg[7:0] guardar_data; //guarda el ultimo dato recibido 

//instanciamos el UART_RX 

UART_Rx #(
     .BAUD_RATE(9600),
     .CLOCK_FREQ(50_000_000),
     .BITS(8)
) RX_inst (
     .clk(MAX10_CLK1_50),
     .rst(!KEY[1]),
     .rx_in(ARDUINO_IO[0]), //aquí está el cable que me decía el profe, asi se conecta con el Tx internamente
     .data_out(data_out),
     .data_ready(data_ready)
);

always @(posedge MAX10_CLK1_50 or negedge KEY[1]) begin
     if(!KEY[1])
          guardar_data <= 0;
     else if(data_ready)
          guardar_data <= data_out;
end

BCD_4display DISP_RX (
     .bcd_in(guardar_data),
     .D_un(HEX0),
     .D_de(HEX1),
     .D_ce(HEX2),
     .D_mi(HEX3)
);

endmodule



