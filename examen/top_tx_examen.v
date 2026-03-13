module top_tx_examen( 
	input clk, 
	input reset,
	input boton,
	input selector,
	output wire out_dato, 
   output reg [7:0] data_tx, 
	output reg start_tx,	
); 

wire busy; //es mi estado que va pasando de un estado a otro 

wire UART_wire; 

reg [2:0] state; 
reg [2:0] index; 

//parametros para los estados 

parameter IDLE=0, ENVIAR= 1, wait_busy= 2; 

//registros para los displays de done y de 0100

reg [7:0] disp_done[3:0]; //le puse 8 bits porque esos se necesitan para el display y 4 bits para la palabra done 
reg [7:0] disp_numeros[3:0]; 

initial begin 
	disp_done[0]= 8'b0110_0100;//d
	disp_done[1]= 8'b0110_1111;//o
	disp_done[2]= 8'b0110_1110;//n
	disp_done[3]= 8'b0110_0101;//e
	
	disp_numeros[0] = 8'b00110000; // '0'
	disp_numeros[1] = 8'b00110001; // '1'
	disp_numeros[2] = 8'b00110000; // '0'
	disp_numeros[3] = 8'b00110000; // '0'
	
end 

always@(posedge clk or posedge reset) begin 
	if(reset)begin 
		state<= IDLE;	
		index<= 0; 
		start_tx<=0; 
	//se inicializa primero todo 
	end 
	
	else begin 
		case (boton)
		IDLE: 
		 begin 
			start_tx<=0;
			
		if (boton) begin 
		 index<=0; 
		 state<= ENVIAR; //pasa al siguiente estado 
		 end
	end 
	
	ENVIAR:
  	 begin
	  if (selector)
	    data_tx<=disp_done[index]; //si el switch está abajo manda el dato de done 
	  else 
	    data_tx<= disp_numeros[index]; 
		 
	start_tx<=1; 
	state<=wait_busy; 
	
	end 
	
	wait_busy: 
		begin 
			start_tx<=0; 
		if(!busy) begin  
			if(index < 3) begin 
				index<= index+1; 
				state<=ENVIAR; 
			end 
		else begin 
			state<=IDLE; 
		end 
	end 
end
		default: state <= IDLE;
		endcase 
	end 
end
	
UART_Tx #(
    .BAUD_RATE(9600),
    .CLOCK_FREQ(50_000_000),
    .BITS(8)
) TX_inst (

    .clk(clk),
    .rst(reset),
    .data_in(data_tx),
    .start(start_tx),
    .tx_out(out_dato),
    .busy(busy)

);

endmodule



	
		
	
	
	
	
		