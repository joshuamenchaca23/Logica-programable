module password_fsm_tb();

reg rst, CLOCK_50;
reg [3:0] SW;
reg [1:0] KEY;

wire [0:6] HEX0;
wire [0:6] HEX1;
wire [0:6] HEX2;
wire [0:6] HEX3;

wire busy;

password_fsm DUT(
    .SW(SW),
    .KEY(KEY),
    .CLOCK_50(CLOCK_50),
    .rst(rst),
    .HEX0(HEX0),
    .HEX1(HEX1),
    .HEX2(HEX2),
    .HEX3(HEX3),
	 .busy(busy)
);

initial begin
CLOCK_50 = 0;
rst = 0;
forever
    #10 CLOCK_50 = ~CLOCK_50;
end


initial
begin
    $display("sim iniciada");
    
    SW = 0;
    KEY = 2'b11;   // botones no presionados (activos en bajo)
    
    #30;
    rst = 1;
    #10;
    rst = 0;
    #10;

    // Password 2-0-2-6
    
    SW = 4'd2;
    KEY[0] = 0;
    #20;
    KEY[0] = 1;
    #20;
    
    SW = 4'd0;
    KEY[0] = 0;
    #20;
    KEY[0] = 1;
    #20;
    
    SW = 4'd2;
    KEY[0] = 0;
    #20;
    KEY[0] = 1;
    #20;
    
    SW = 4'd6;
    KEY[0] = 0;
    #20;
    KEY[0] = 1;
    #20;
    
    repeat(20)
begin
    SW = $random%10;
    KEY[0] = 0;
    #20;
    KEY[0] = 1;
    #20;
    
    // Esperar mientras busy esté alto
    while(busy)
        @(posedge CLOCK_50);
    
    #20;
end
end

initial begin
    $monitor("SW=%d , HEX0=%b , HEX1=%b , HEX2=%b , HEX3=%b", SW, HEX0, HEX1, HEX2, HEX3);
end

endmodule