/* 

En este codigo se hace el test bench para verificar si un numero es primo, 
en caso que lo sea, prenderá un LED. Se utilizó un rango de un valor de 1 bit 
es decir de 0 a 15. Se utilizó un for para iterar cada uno de los numeros. 

*/ 


module primos_tb(); 

reg [3:0] N; //Declaracion de variable de los numeros 
wire out; 
integer C; //Variable de control 
primos DUT(.N(N),.out(out));  

initial 
	begin 
	$display("simulacion iniciada"); 
	for (C=0; C<15; C=C + 1) //se utilizó un for para establecer el rango de 0 a 15, y se le suma de 1 en 1 
	begin 
	N=C[3:0]; //Definición de la variable de control de 4 bits 
	#10; //Delay 
	end 

	$display("simulación finalizada"); 
	$stop; 
	$finish;
end 
	
initial begin 
	$monitor("N=%b", out0 %b, N,out);
end 
endmodule 
	
		