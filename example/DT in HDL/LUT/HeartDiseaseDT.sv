`timescale 1ns / 1ps 

module HeartDiseaseDT (age, sex, cp, trestbps, chol, fbs, restecg, thalach, exang, oldpeak, slope, ca, thal,cls);

parameter N = 'd8;
parameter C = 'd1;
input logic[N-1:0]age, sex, cp, trestbps, chol, fbs, restecg, thalach, exang, oldpeak, slope, ca, thal;
output logic [C-1:0] cls;

logic ns0,ns1,ns2,ns3,ns4,ns7,ns10,ns11,ns15,ns16,ns19,ns20,ns23,ns26,ns27,ns28,ns29,ns33,ns34,ns37,ns40,ns42,ns44;
parameter logic[N-1:0] t0 = 8'd1;
parameter logic[N-1:0] t1 = 8'd1;
parameter logic[N-1:0] t2 = 8'd3;
parameter logic[N-1:0] t3 = 8'd1;
parameter logic[N-1:0] t4 = 8'd97;
parameter logic[N-1:0] t7 = 8'd147;
parameter logic[N-1:0] t10 = 8'd21;
parameter logic[N-1:0] t11 = 8'd74;
parameter logic[N-1:0] t15 = 8'd110;
parameter logic[N-1:0] t16 = 8'd71;
parameter logic[N-1:0] t19 = 8'd108;
parameter logic[N-1:0] t20 = 8'd106;
parameter logic[N-1:0] t23 = 8'd110;
parameter logic[N-1:0] t26 = 8'd63;
parameter logic[N-1:0] t27 = 8'd56;
parameter logic[N-1:0] t28 = 8'd183;
parameter logic[N-1:0] t29 = 8'd29;
parameter logic[N-1:0] t33 = 8'd1;
parameter logic[N-1:0] t34 = 8'd63;
parameter logic[N-1:0] t37 = 8'd81;
parameter logic[N-1:0] t40 = 8'd1;
parameter logic[N-1:0] t42 = 8'd166;
parameter logic[N-1:0] t44 = 8'd3;

assign ns0 = (cp < t0)? 1:0;
assign ns1 = (ca < t1)? 1:0;
assign ns2 = (thal < t2)? 1:0;
assign ns3 = (exang < t3)? 1:0;
assign ns4 = (thalach < t4)? 1:0;
assign ns7 = (thalach < t7)? 1:0;
assign ns10 = (oldpeak < t10)? 1:0;
assign ns11 = (chol < t11)? 1:0;
assign ns15 = (trestbps < t15)? 1:0;
assign ns16 = (chol < t16)? 1:0;
assign ns19 = (chol < t19)? 1:0;
assign ns20 = (thalach < t20)? 1:0;
assign ns23 = (chol < t23)? 1:0;
assign ns26 = (oldpeak < t26)? 1:0;
assign ns27 = (age < t27)? 1:0;
assign ns28 = (trestbps < t28)? 1:0;
assign ns29 = (chol < t29)? 1:0;
assign ns33 = (sex < t33)? 1:0;
assign ns34 = (age < t34)? 1:0;
assign ns37 = (chol < t37)? 1:0;
assign ns40 = (slope < t40)? 1:0;
assign ns42 = (thalach < t42)? 1:0;
assign ns44 = (thal < t44)? 1:0;

always_comb
begin
    casex({ns0,ns1,ns2,ns3,ns4,ns7,ns10,ns11,ns15,ns16,ns19,ns20,ns23,ns26,ns27,ns28,ns29,ns33,ns34,ns37,ns40,ns42,ns44})
		23'b11111??????????????????: cls = 'd0;
		23'b11110??????????????????: cls = 'd1;
		23'b1110?1?????????????????: cls = 'd0;
		23'b1110?0?????????????????: cls = 'd1;
		23'b110???11???????????????: cls = 'd1;
		23'b110???10???????????????: cls = 'd0;
		23'b110???0????????????????: cls = 'd0;
		23'b10??????11?????????????: cls = 'd1;
		23'b10??????10?????????????: cls = 'd0;
		23'b10??????0?11???????????: cls = 'd0;
		23'b10??????0?10???????????: cls = 'd0;
		23'b10??????0?0?1??????????: cls = 'd1;
		23'b10??????0?0?0??????????: cls = 'd0;
		23'b0????????????1111??????: cls = 'd0;
		23'b0????????????1110??????: cls = 'd1;
		23'b0????????????110???????: cls = 'd0;
		23'b0????????????10??11????: cls = 'd1;
		23'b0????????????10??10????: cls = 'd1;
		23'b0????????????10??0?1???: cls = 'd1;
		23'b0????????????10??0?0???: cls = 'd0;
		23'b0????????????0??????1??: cls = 'd1;
		23'b0????????????0??????01?: cls = 'd0;
		23'b0????????????0??????001: cls = 'd1;
		23'b0????????????0??????000: cls = 'd0;
		default: cls = '0;
	endcase
end

endmodule