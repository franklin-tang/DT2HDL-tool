`timescale 1ns / 1ps 

module classificationDT_P (Va, Vb, Vc, Ia, Ib, Ic,cls);

parameter N = 'd8;
parameter C = 'd3;
input logic[N-1:0]Va, Vb, Vc, Ia, Ib, Ic;
output logic [C-1:0] cls;

logic ns0,ns1,ns2,ns3,ns4,ns5,ns6,ns7,ns8,ns9,ns10,ns11,ns12,ns13,ns14,ns15,ns16,ns17,ns18,ns19,ns20,ns21,ns22,ns23,ns24,ns25,ns26,ns27,ns28,ns29,ns30,ns31,ns32,ns33,ns34,ns35,ns36,ns37,ns38,ns39,ns40,ns41,ns42,ns43,ns44,ns45,ns46,ns47,ns48,ns49,ns50,ns51,ns52;
logic cls0,cls1,cls2,cls3,cls4,cls5;
assign ns0 = 1;
assign ns1= (Ic <137)? ns0: 0;
assign ns30= (Ic <137)? 0:ns0;
assign ns2= (Ia <136)? ns1: 0;
assign ns17= (Ia <136)? 0:ns1;
assign ns3= (Ia <117)? ns2: 0;
assign ns10= (Ia <117)? 0:ns2;
assign ns4= (Ib <134)? ns3: 0;
assign ns7= (Ib <134)? 0:ns3;
assign ns5= (Ib <114)? ns4: 0;
assign ns6= (Ib <114)? 0:ns4;
assign ns8= (Ic <122)? ns7: 0;
assign ns9= (Ic <122)? 0:ns7;
assign ns11= (Ib <143)? ns10: 0;
assign ns14= (Ib <143)? 0:ns10;
assign ns12= (Ib <123)? ns11: 0;
assign ns13= (Ib <123)? 0:ns11;
assign ns15= (Vb <112)? ns14: 0;
assign ns16= (Vb <112)? 0:ns14;
assign ns18= (Ic <120)? ns17: 0;
assign ns23= (Ic <120)? 0:ns17;
assign ns19= (Ib <231)? ns18: 0;
assign ns22= (Ib <231)? 0:ns18;
assign ns20= (Vc <159)? ns19: 0;
assign ns21= (Vc <159)? 0:ns19;
assign ns24= (Ib <122)? ns23: 0;
assign ns27= (Ib <122)? 0:ns23;
assign ns25= (Vc <172)? ns24: 0;
assign ns26= (Vc <172)? 0:ns24;
assign ns28= (Ib <140)? ns27: 0;
assign ns29= (Ib <140)? 0:ns27;
assign ns31= (Vc <138)? ns30: 0;
assign ns46= (Vc <138)? 0:ns30;
assign ns32= (Vc <120)? ns31: 0;
assign ns39= (Vc <120)? 0:ns31;
assign ns33= (Ib <120)? ns32: 0;
assign ns36= (Ib <120)? 0:ns32;
assign ns34= (Vb <134)? ns33: 0;
assign ns35= (Vb <134)? 0:ns33;
assign ns37= (Ib <161)? ns36: 0;
assign ns38= (Ib <161)? 0:ns36;
assign ns40= (Va <128)? ns39: 0;
assign ns43= (Va <128)? 0:ns39;
assign ns41= (Va <122)? ns40: 0;
assign ns42= (Va <122)? 0:ns40;
assign ns44= (Ia <89)? ns43: 0;
assign ns45= (Ia <89)? 0:ns43;
assign ns47= (Vb <133)? ns46: 0;
assign ns50= (Vb <133)? 0:ns46;
assign ns48= (Ib <125)? ns47: 0;
assign ns49= (Ib <125)? 0:ns47;
assign ns51= (Ib <184)? ns50: 0;
assign ns52= (Ib <184)? 0:ns50;
assign cls0 = ns13;
assign cls1 = ns6|ns28;
assign cls2 = ns5|ns9|ns12|ns15|ns25|ns29;
assign cls3 = ns20|ns22|ns37|ns38|ns41|ns42|ns51;
assign cls4 = ns16|ns34|ns35|ns45|ns48|ns49;
assign cls5 = ns8|ns21|ns26|ns44|ns52;
always_comb
begin
casex({cls0,cls1,cls2,cls3,cls4,cls5})
6'b100000: cls = 'd0;
6'b010000: cls = 'd1;
6'b001000: cls = 'd2;
6'b000100: cls = 'd3;
6'b000010: cls = 'd4;
6'b000001: cls = 'd5;
		default: cls = '0;
	endcase
end

endmodule
