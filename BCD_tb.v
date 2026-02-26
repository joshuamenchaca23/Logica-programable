module BCD_tb(); 

reg [3:0] bcd_in;
wire [6:0] bcd_out; 

BCD DUT(.bcd_in(bcd_in),.bcd_out(bcd_out));

initial begin  
repeat(50) 
begin 
	bcd_in=$random%16; 
	#10; 
end
		
$stop; 
$finish; 
		
end
initial begin 
	$monitor("bcd_in= %b, bcd_out= %b",bcd_in,bcd_out);
end
endmodule 