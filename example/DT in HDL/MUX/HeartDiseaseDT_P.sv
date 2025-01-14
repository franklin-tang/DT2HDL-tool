`timescale 1ns / 1ps 

module HeartDiseaseDT_P (age, sex, cp, trestbps, chol, fbs, restecg, thalach, exang, oldpeak, slope, ca, thal,cls);

parameter N = 'd8;
parameter C = 'd1;
input logic[N-1:0]age, sex, cp, trestbps, chol, fbs, restecg, thalach, exang, oldpeak, slope, ca, thal;
output logic [C-1:0] cls;

logic ns0,ns1,ns2,ns3,ns4,ns5,ns6,ns7,ns8,ns9,ns10,ns11,ns12,ns13,ns14,ns15,ns16,ns17,ns18,ns19,ns20,ns21,ns22,ns23,ns24,ns25,ns26,ns27,ns28,ns29,ns30,ns31,ns32,ns33,ns34,ns35,ns36,ns37,ns38,ns39,ns40,ns41,ns42,ns43,ns44,ns45,ns46;
logic cls0,cls1;
assign ns0 = 1;
assign ns1= (cp <1)? ns0: 0;
assign ns26= (cp <1)? 0:ns0;
assign ns2= (ca <1)? ns1: 0;
assign ns15= (ca <1)? 0:ns1;
assign ns3= (thal <3)? ns2: 0;
assign ns10= (thal <3)? 0:ns2;
assign ns4= (exang <1)? ns3: 0;
assign ns7= (exang <1)? 0:ns3;
assign ns5= (thalach <97)? ns4: 0;
assign ns6= (thalach <97)? 0:ns4;
assign ns8= (thalach <147)? ns7: 0;
assign ns9= (thalach <147)? 0:ns7;
assign ns11= (oldpeak <21)? ns10: 0;
assign ns14= (oldpeak <21)? 0:ns10;
assign ns12= (chol <74)? ns11: 0;
assign ns13= (chol <74)? 0:ns11;
assign ns16= (trestbps <110)? ns15: 0;
assign ns19= (trestbps <110)? 0:ns15;
assign ns17= (chol <71)? ns16: 0;
assign ns18= (chol <71)? 0:ns16;
assign ns20= (chol <108)? ns19: 0;
assign ns23= (chol <108)? 0:ns19;
assign ns21= (thalach <106)? ns20: 0;
assign ns22= (thalach <106)? 0:ns20;
assign ns24= (chol <110)? ns23: 0;
assign ns25= (chol <110)? 0:ns23;
assign ns27= (oldpeak <63)? ns26: 0;
assign ns40= (oldpeak <63)? 0:ns26;
assign ns28= (age <56)? ns27: 0;
assign ns33= (age <56)? 0:ns27;
assign ns29= (trestbps <183)? ns28: 0;
assign ns32= (trestbps <183)? 0:ns28;
assign ns30= (chol <29)? ns29: 0;
assign ns31= (chol <29)? 0:ns29;
assign ns34= (sex <1)? ns33: 0;
assign ns37= (sex <1)? 0:ns33;
assign ns35= (age <63)? ns34: 0;
assign ns36= (age <63)? 0:ns34;
assign ns38= (chol <81)? ns37: 0;
assign ns39= (chol <81)? 0:ns37;
assign ns41= (slope <1)? ns40: 0;
assign ns42= (slope <1)? 0:ns40;
assign ns43= (thalach <166)? ns42: 0;
assign ns44= (thalach <166)? 0:ns42;
assign ns45= (thal <3)? ns44: 0;
assign ns46= (thal <3)? 0:ns44;
assign cls0 = ns5|ns8|ns13|ns14|ns18|ns21|ns22|ns25|ns30|ns32|ns39|ns43|ns46;
assign cls1 = ns6|ns9|ns12|ns17|ns24|ns31|ns35|ns36|ns38|ns41|ns45;
always_comb
begin
casex({cls0,cls1})
2'b10: cls = 'd0;
2'b01: cls = 'd1;
		default: cls = '0;
	endcase
end

endmodule
