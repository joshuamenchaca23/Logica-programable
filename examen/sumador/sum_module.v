
//para este ejercicio quise aplicar una máquina de estados sencilla, son 3 estados 
//ESPERA (IDLE), SUMAR y FIN, el usuario ingresa un número con los switches, con un contador (indice) 
//se van recorriendo los numeros desde 0 hasta numero y en el resultado, se imprime la suma tal cual. 
module sum_module(

    input wire clk,
    input wire rst,
    input wire inicio,
    input wire [7:0] numero,

    output reg [19:0] resultado
);

reg [7:0] indice;
reg [1:0] estado;

parameter ESPERA = 0, SUMAR = 1, FIN = 2;

always @(posedge clk or posedge rst) begin

    if (rst) begin
        indice <= 0;
        resultado <= 0;
        estado <= ESPERA;
    end
    else begin
        case (estado)
		  
        ESPERA: begin
            indice <= 0;
            resultado <= 0;
            if (inicio)
                estado <= SUMAR;
        end

        SUMAR: begin
            if (indice <= numero) begin
                resultado <= resultado + indice;
                indice <= indice + 1;
            end
            else begin
                estado <= FIN;
            end

        end
		  
        FIN: begin
		  
		  //le tuve que agregar esto, porque sino se queda atrapado en este estado, y solo se actualiza al presionar el boton de reset
		  //aplicando esto, la solucion es hacer que también desde FIN se puedan reiniciar los datos 
             if(inicio) begin
                indice <= 0;
                resultado <= 0;
                estado <= SUMAR;
            end
        end	  
        default: estado <= ESPERA;

        endcase
    end

end

endmodule