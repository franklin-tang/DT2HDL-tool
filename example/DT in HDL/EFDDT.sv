`timescale 1ns / 1ps 

module EFDDT (Va,Vb,Vc,Ia,Ib,Ic,cls);

parameter N = 'd8;
parameter C = 'd1;
input logic[N-1:0] Va,Vb,Vc,Ia,Ib,Ic;
output logic [C-1:0] cls;

logic ns0,ns1,ns2,ns3,ns6,ns10,ns11,ns12,ns15;
parameter logic[N-1:0] t0 = 8'd119;
parameter logic[N-1:0] t1 = 8'd196;
parameter logic[N-1:0] t2 = 8'd63;
parameter logic[N-1:0] t3 = 8'd111;
parameter logic[N-1:0] t6 = 8'd61;
parameter logic[N-1:0] t10 = 8'd143;
parameter logic[N-1:0] t11 = 8'd138;
parameter logic[N-1:0] t12 = 8'd116;
parameter logic[N-1:0] t15 = 8'd142;

assign ns0 = (Ib < t0)? 1:0;
assign ns1 = (Va < t1)? 1:0;
assign ns2 = (Vb < t2)? 1:0;
assign ns3 = (Ib < t3)? 1:0;
assign ns6 = (Vc < t6)? 1:0;
assign ns10 = (Ib < t10)? 1:0;
assign ns11 = (Ia < t11)? 1:0;
assign ns12 = (Ia < t12)? 1:0;
assign ns15 = (Ia < t15)? 1:0;

always_comb
begin
    casex({ns0,ns1,ns2,ns3,ns6,ns10,ns11,ns12,ns15})
		9'b1111?????: cls = 'd1;
		9'b1110?????: cls = 'd0;
		9'b110?1????: cls = 'd1;
		9'b110?0????: cls = 'd1;
		9'b10???????: cls = 'd0;
		9'b0????111?: cls = 'd1;
		9'b0????110?: cls = 'd0;
		9'b0????10?1: cls = 'd1;
		9'b0????10?0: cls = 'd1;
		9'b0????0???: cls = 'd1;
		default: cls = '0;
	endcase
end

endmodule

