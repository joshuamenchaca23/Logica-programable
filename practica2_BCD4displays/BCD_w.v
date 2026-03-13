module BCD_w( 
	input [3:0] SW, 
	output [0:6] HEX0
	); 
	
	BCD_module WRAP( 
		.bcd_in(SW), 
		.bcd_out(HEX0)
); 

endmodule 

