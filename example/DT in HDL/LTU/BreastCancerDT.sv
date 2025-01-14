`timescale 1ns / 1ps 

module BreastCancerDT (radius_mean, texture_mean, perimeter_mean, area_mean, smoothness_mean, compactness_mean, concavity_mean, concave_points_mean, symmetry_mean, fractal_dimension_mean, radius_se, texture_se, perimeter_se, area_se, smoothness_se, compactness_se, concavity_se, concave_points_se, symmetry_se, fractal_dimension_se, radius_worst, texture_worst, perimeter_worst, area_worst, smoothness_worst, compactness_worst, concavity_worst, concave_points_worst, symmetry_worst, fractal_dimension_worst,cls);

parameter N = 'd8;
parameter C = 'd1;
input logic[N-1:0]radius_mean, texture_mean, perimeter_mean, area_mean, smoothness_mean, compactness_mean, concavity_mean, concave_points_mean, symmetry_mean, fractal_dimension_mean, radius_se, texture_se, perimeter_se, area_se, smoothness_se, compactness_se, concavity_se, concave_points_se, symmetry_se, fractal_dimension_se, radius_worst, texture_worst, perimeter_worst, area_worst, smoothness_worst, compactness_worst, concavity_worst, concave_points_worst, symmetry_worst, fractal_dimension_worst;
output logic [C-1:0] cls;

logic ns0,ns1,ns2,ns3,ns5,ns9,ns11,ns12,ns16,ns17,ns18,ns22,ns23,ns25,ns28,ns29;
parameter logic[N-1:0] t0 = 8'd49;
parameter logic[N-1:0] t1 = 8'd69;
parameter logic[N-1:0] t2 = 8'd34;
parameter logic[N-1:0] t3 = 8'd36;
parameter logic[N-1:0] t5 = 8'd9;
parameter logic[N-1:0] t9 = 8'd133;
parameter logic[N-1:0] t11 = 8'd12;
parameter logic[N-1:0] t12 = 8'd72;
parameter logic[N-1:0] t16 = 8'd106;
parameter logic[N-1:0] t17 = 8'd54;
parameter logic[N-1:0] t18 = 8'd18;
parameter logic[N-1:0] t22 = 8'd25;
parameter logic[N-1:0] t23 = 8'd86;
parameter logic[N-1:0] t25 = 8'd3;
parameter logic[N-1:0] t28 = 8'd237;
parameter logic[N-1:0] t29 = 8'd164;

assign ns0 = (perimeter_worst < t0)? 1:0;
assign ns1 = (concave_points_worst < t1)? 1:0;
assign ns2 = (symmetry_worst < t2)? 1:0;
assign ns3 = (concave_points_worst < t3)? 1:0;
assign ns5 = (fractal_dimension_se < t5)? 1:0;
assign ns9 = (texture_worst < t9)? 1:0;
assign ns11 = (fractal_dimension_se < t11)? 1:0;
assign ns12 = (smoothness_worst < t12)? 1:0;
assign ns16 = (texture_worst < t16)? 1:0;
assign ns17 = (perimeter_worst < t17)? 1:0;
assign ns18 = (concave_points_mean < t18)? 1:0;
assign ns22 = (concave_points_mean < t22)? 1:0;
assign ns23 = (radius_worst < t23)? 1:0;
assign ns25 = (smoothness_se < t25)? 1:0;
assign ns28 = (texture_worst < t28)? 1:0;
assign ns29 = (radius_worst < t29)? 1:0;

always_comb
begin
    casex({ns0,ns1,ns2,ns3,ns5,ns9,ns11,ns12,ns16,ns17,ns18,ns22,ns23,ns25,ns28,ns29})
		16'b1111????????????: cls = 'd0;
		16'b11101???????????: cls = 'd1;
		16'b11100???????????: cls = 'd0;
		16'b110?????????????: cls = 'd0;
		16'b10???1??????????: cls = 'd0;
		16'b10???011????????: cls = 'd1;
		16'b10???010????????: cls = 'd1;
		16'b10???00?????????: cls = 'd0;
		16'b0???????111?????: cls = 'd0;
		16'b0???????110?????: cls = 'd0;
		16'b0???????10??????: cls = 'd1;
		16'b0???????0??11???: cls = 'd0;
		16'b0???????0??101??: cls = 'd1;
		16'b0???????0??100??: cls = 'd1;
		16'b0???????0??0??11: cls = 'd1;
		16'b0???????0??0??10: cls = 'd1;
		16'b0???????0??0??0?: cls = 'd1;
		default: cls = '0;
	endcase
end

endmodule
