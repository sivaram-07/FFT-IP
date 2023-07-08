module counter_input(clk,count);
input clk;
output reg [9:0] count;
initial
begin
count=10'b0000000000;
end
always@(posedge clk)
begin
count<=count+10'b0000000001;
end
endmodule
