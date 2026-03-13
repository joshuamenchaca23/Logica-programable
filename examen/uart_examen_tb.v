`timescale 1ns/1ps

module uart_examen_tb;


reg clk;
reg rst;
reg start;
reg [7:0] data_tx;

wire tx_line;
wire busy;

wire [7:0] data_rx;
wire data_ready;


initial clk = 0;
always #10 clk = ~clk;

// Instancia del TX
UART_Tx #(
    .BAUD_RATE(9600),
    .CLOCK_FREQ(50_000_000),
    .BITS(8)
) TX (
    .clk(clk),
    .rst(rst),
    .data_in(data_tx),
    .start(start),
    .tx_out(tx_line),
    .busy(busy)
);


UART_Rx #(
    .BAUD_RATE(9600),
    .CLOCK_FREQ(50_000_000),
    .BITS(8)
) RX (
    .clk(clk),
    .rst(rst),
    .rx_in(tx_line),
    .data_out(data_rx),
    .data_ready(data_ready)
);

//solamente voy a enviar un bit 
initial begin
	//inicializar todo
    clk = 0;
    rst = 1;
    start = 0;
    data_tx = 0;
    #100;
    rst = 0;

    //enviar el dato
    data_tx = 8'h30;
    start = 1;
    #20;
    start = 0;

    // Esperar a que RX reciba el dato
    wait(data_ready);
    $display("TX='%c' (0x%0h)  RX='%c' (0x%0h)", data_tx, data_tx, data_rx, data_rx);

    #1000;
    $stop;
end

endmodule

//este es un intento sencillo de test bench, no sale como se esperaría, no me toma las se