module BCD_4displays #(parameter N_in=10, N_out=7)( 
	input[N_in-1:0] bcd_in, //cuando se haga el wrap va a ir al swich  
	output[N_out-1:0] D_un, D_de, D_ce, D_mi); //Se hace la separación de los bits en distintas salidas
	
	wire[3:0]unidades, decenas, centenas, millares;  //asignación para guardar los valores de entrada
		
		assign unidades = bcd_in%10   ; //modulo 10 para separar el bit en unidades 
		
		assign decenas= (bcd_in/10)%10; //dividir entre 10, y sacar modulo 10 para separar en decenas
		
		assign centenas= (bcd_in/100)%10; //dividir entre 100, y sacar modulo para separar en centenas  
		
		assign millares= (bcd_in/1000)%10;  
endmodule 
