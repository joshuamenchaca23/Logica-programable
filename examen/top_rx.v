//este es el modulo top inicial de Rx, lo que hace es recibir los datos de Tx
//tiene un botón que resetea el dato, y una signal rx con Arduino_IO que por ahí recibe los datos 	
	
	module top_rx (
		 input  wire MAX10_CLK1_50,
		 input  wire [1:0]  KEY,
		 output wire [15:0] ARDUINO_IO,
		 output wire [0:6]  HEX0,
		 output wire [0:6]  HEX1,
		 output wire [0:6]  HEX2,
		 output wire [0:6]  HEX3
	);

	wire data_ready;
	wire [7:0] data_out;



	UART_Rx #(
		 .BAUD_RATE(9600),
		 .CLOCK_FREQ(50_000_000),
		 .BITS(8)
	) TX_inst (
		 .clk(MAX10_CLK1_50),
		 .rst(!KEY[1]),
		 .rx_in(ARDUINO_IO[0]),
		 .data_out(data_out),
		 .data_ready(data_ready)
	);

	BCD_4display DISP_TX (
		 .bcd_in(data_out - "0"),
		 .D_un(HEX0),
		 .D_de(HEX1),
		 .D_ce(HEX2),
		 .D_mi(HEX3)
	);

	endmodule