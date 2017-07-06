module test(clk,rst,q,stop,a,y);
input clk,rst,stop,a;
output reg[3:0]q;
output reg[6:0]y;
reg div_clk;
integer n;
always@(posedge clk )
begin
	n=n+1;
	if(n==25000000)begin
		n=0;
		div_clk=div_clk+1;
	end
end


always@(posedge div_clk)
begin
if(rst)
	q<=4'b0000;
else begin
	if(a) begin
		if(stop)
		q<=q;
		else
		q<=q+1;
		end
	else begin
		if(stop)
		q<=q;
		else
		q<=q-1;
		end
end

end

always@(q)
begin
case(q)
		4'b0000:y=7'b1000000;
		4'b0001:y=7'b1111001;
		4'b0010:y=7'b0100100;
		4'b0011:y=7'b0110000;
		4'b0100:y=7'b0011001;
		4'b0101:y=7'b0010010;
		4'b0110:y=7'b0000010;
		4'b0111:y=7'b1111000;
		4'b1000:y=7'b0000000;
		4'b1001:y=7'b0010000;
		4'b1010:y=7'b0001000;
		4'b1011:y=7'b0000011;
		4'b1100:y=7'b0100111;
		4'b1101:y=7'b0100001;
		4'b1110:y=7'b0000100;
		4'b1111:y=7'b0001110;
		endcase
end
endmodule