`timescale 1ns / 1ps 

module IrisDT_p_a (SEPAL_LENGTH, SEPAL_WIDTH, PETAL_LENGTH, PETAL_WIDTH,cls);

parameter N = 'd8;
parameter C = 'd2;
input logic[N-1:0]SEPAL_LENGTH, SEPAL_WIDTH, PETAL_LENGTH, PETAL_WIDTH;
output logic [C-1:0] cls;

logic ns0,ns1,ns2,ns3,ns4,ns5,ns6,ns7,ns8,ns9,ns10,ns11,ns12,ns13,ns14;
logic cls0,cls1,cls2;
assign ns0 = 1;
assign ns1= (PETAL_LENGTH <83)? ns0: 0;
assign ns2= (PETAL_LENGTH <83)? 0:ns0;
assign ns3= (PETAL_WIDTH <53)? ns2: 0;
assign ns10= (PETAL_WIDTH <53)? 0:ns2;
assign ns4= (PETAL_LENGTH <158)? ns3: 0;
assign ns5= (PETAL_LENGTH <158)? 0:ns3;
assign ns6= (PETAL_WIDTH <50)? ns5: 0;
assign ns7= (PETAL_WIDTH <50)? 0:ns5;
assign ns8= (SEPAL_WIDTH <91)? ns7: 0;
assign ns9= (SEPAL_WIDTH <91)? 0:ns7;
assign ns11= (PETAL_LENGTH <155)? ns10: 0;
assign ns14= (PETAL_LENGTH <155)? 0:ns10;
assign ns12= (SEPAL_WIDTH <99)? ns11: 0;
assign ns13= (SEPAL_WIDTH <99)? 0:ns11;
assign cls0 = ns1;
assign cls1 = ns4|ns8|ns13;
assign cls2 = ns6|ns9|ns12|ns14;
always_comb
begin
casex({cls0,cls1,cls2})
3'b100: cls = 'd0;
3'b010: cls = 'd1;
3'b001: cls = 'd2;
		default: cls = '0;
	endcase
end

endmodule
