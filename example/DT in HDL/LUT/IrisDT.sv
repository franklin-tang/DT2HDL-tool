`timescale 1ns / 1ps 

module IrisDT (SEPAL_LENGTH, SEPAL_WIDTH, PETAL_LENGTH, PETAL_WIDTH,cls);

parameter N = 'd8;
parameter C = 'd2;
input logic[N-1:0]SEPAL_LENGTH, SEPAL_WIDTH, PETAL_LENGTH, PETAL_WIDTH;
output logic [C-1:0] cls;

logic ns0,ns2,ns3,ns5,ns7,ns10,ns11;
parameter logic[N-1:0] t0 = 8'd83;
parameter logic[N-1:0] t2 = 8'd53;
parameter logic[N-1:0] t3 = 8'd158;
parameter logic[N-1:0] t5 = 8'd50;
parameter logic[N-1:0] t7 = 8'd91;
parameter logic[N-1:0] t10 = 8'd155;
parameter logic[N-1:0] t11 = 8'd99;

assign ns0 = (PETAL_LENGTH < t0)? 1:0;
assign ns2 = (PETAL_WIDTH < t2)? 1:0;
assign ns3 = (PETAL_LENGTH < t3)? 1:0;
assign ns5 = (PETAL_WIDTH < t5)? 1:0;
assign ns7 = (SEPAL_WIDTH < t7)? 1:0;
assign ns10 = (PETAL_LENGTH < t10)? 1:0;
assign ns11 = (SEPAL_WIDTH < t11)? 1:0;

always_comb
begin
    casex({ns0,ns2,ns3,ns5,ns7,ns10,ns11})
		7'b1??????: cls = 'd0;
		7'b011????: cls = 'd1;
		7'b0101???: cls = 'd2;
		7'b01001??: cls = 'd1;
		7'b01000??: cls = 'd2;
		7'b00???11: cls = 'd2;
		7'b00???10: cls = 'd1;
		7'b00???0?: cls = 'd2;
		default: cls = '0;
	endcase
end

endmodule
