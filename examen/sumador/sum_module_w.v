//aquí ya nada más lo que se hace es hacer un wrap, se pone el reloj, switches, displays y botones 
//se establecen los bits y se instancia "sum module" con sus parametros. 
//además fue necesario usar el BCD module y el 4 displays para que aparezcan en la tarjeta los números

module sum_module_w(

    input  wire MAX10_CLK1_50,
    input  wire [1:0] KEY,
    input  wire [7:0] SW,

    output wire [0:6] HEX0,
    output wire [0:6] HEX1,
    output wire [0:6] HEX2,
    output wire [0:6]HEX3
);

wire [19:0] resultado;
wire start;
wire reset;

assign start = ~KEY[1];
assign reset = ~KEY[0];

sum_module SUMADOR (

    .clk(MAX10_CLK1_50),
    .rst(reset),
    .numero(SW),
    .inicio(start),
    .resultado(resultado)

);

BCD_4display DISP (

    .bcd_in(resultado),
    .D_un(HEX0),
    .D_de(HEX1),
    .D_ce(HEX2),
    .D_mi(HEX3)

);

endmodule

//pd: no manches profe si era cierto lo que dijo, me senté a programarlo y salió bien fácil, ya sin la presión del examen la cosa cambia :D 