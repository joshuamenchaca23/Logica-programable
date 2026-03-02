module count(
	input clk,
	input rst,
	input up_down,
	input load,
	input [6:0] data_in,
	output reg [6:0] counter
);

always @(posedge clk or posedge rst) 
begin 
    if (rst)
        counter <= 0;
	    else if (load)
        begin
            if (data_in > 100)
                counter <= 100;  
            else
                counter <= data_in;
        end

    else
        begin
            if (up_down)  
                begin
                    if(counter >= 100)
                        counter <= 0;
                    else 
                        counter <= counter + 1;
                end
            else  // Cuenta hacia abajo
                begin 
                    if (counter == 0)
                        counter <= 100;
                    else
                        counter <= counter - 1;
                end
        end
end

endmodule