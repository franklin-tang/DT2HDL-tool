`timescale 1ns / 1ps 

module detectionDT_P (Va, Vb, Vc, Ia, Ib, Ic,cls);

parameter N = 'd8;
parameter C = 'd1;
input logic[N-1:0]Va, Vb, Vc, Ia, Ib, Ic;
output logic [C-1:0] cls;

logic ns0,ns1,ns2,ns3,ns4,ns5,ns6,ns7,ns8,ns9,ns10,ns11,ns12,ns13,ns14,ns15,ns16,ns17,ns18;
logic cls0,cls1;
assign ns0 = 1;
assign ns1= (Ib <119)? ns0: 0;
assign ns10= (Ib <119)? 0:ns0;
assign ns2= (Va <196)? ns1: 0;
assign ns9= (Va <196)? 0:ns1;
assign ns3= (Vb <63)? ns2: 0;
assign ns6= (Vb <63)? 0:ns2;
assign ns4= (Ib <111)? ns3: 0;
assign ns5= (Ib <111)? 0:ns3;
assign ns7= (Vc <61)? ns6: 0;
assign ns8= (Vc <61)? 0:ns6;
assign ns11= (Ib <143)? ns10: 0;
assign ns18= (Ib <143)? 0:ns10;
assign ns12= (Ia <138)? ns11: 0;
assign ns15= (Ia <138)? 0:ns11;
assign ns13= (Ia <116)? ns12: 0;
assign ns14= (Ia <116)? 0:ns12;
assign ns16= (Ia <142)? ns15: 0;
assign ns17= (Ia <142)? 0:ns15;
assign cls0 = ns5|ns9|ns14;
assign cls1 = ns4|ns7|ns8|ns13|ns16|ns17|ns18;
always_comb
begin
casex({cls0,cls1})
2'b10: cls = 'd0;
2'b01: cls = 'd1;
		default: cls = '0;
	endcase
end

endmodule
