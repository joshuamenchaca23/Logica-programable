module top_tx_examen_w( 
	input MAX10_CLK1_50, 
	input [1:0] KEY, 
	input [9:0] SW, 
	output wire [15:0] ARDUINO_IO, 
	output wire [0:6] HEX0,
	output wire [0:6] HEX1,
	output wire [0:6] HEX2,
	output wire [0:6] HEX3
	
); 

wire [7:0] data_tx;
wire start_tx;

wire busy; //es mi estado que va pasando de un estado a otro 

wire UART_wire; 
wire [7:0] data_out;
wire data_ready;

reg [2:0] state; 
reg [2:0] index; 



parameter IDLE=0, ENVIAR= 1, wait_busy= 2; 



reg [7:0] disp_done[3:0]; //le puse 8 bits porque esos se necesitan para el display y 4 bits para la palabra done 
reg [7:0] disp_numeros[3:0]; 

top_tx_examen instancia( 
	.clk(MAX10_CLK1_50),
	.reset(~KEY[0]),
	.data_tx(data_tx), 
	.start_tx(start_tx),
	.boton(~KEY[1]),
	.selector(SW[9]),
	.out_dato(ARDUINO_IO[1])
);
BCD_4display DISP_TX (
    .bcd_in(data_tx),
    .D_un(HEX0),
    .D_de(HEX1),
    .D_ce(HEX2),
    .D_mi(HEX3)
);

endmodule

//decidi hacer un top y aqui mejor definir los switches, displays y todo porque no me estaba funcionando 
//tiene la misma lógica y funcionamiento, prácticamente instancio y defino 

	
		
	
	
	
	
		