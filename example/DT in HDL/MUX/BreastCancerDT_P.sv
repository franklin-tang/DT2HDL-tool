`timescale 1ns / 1ps 

module BreastCancerDT_P (radius_mean, texture_mean, perimeter_mean, area_mean, smoothness_mean, compactness_mean, concavity_mean, concave_points_mean, symmetry_mean, fractal_dimension_mean, radius_se, texture_se, perimeter_se, area_se, smoothness_se, compactness_se, concavity_se, concave_points_se, symmetry_se, fractal_dimension_se, radius_worst, texture_worst, perimeter_worst, area_worst, smoothness_worst, compactness_worst, concavity_worst, concave_points_worst, symmetry_worst, fractal_dimension_worst,cls);

parameter N = 'd8;
parameter C = 'd1;
input logic[N-1:0]radius_mean, texture_mean, perimeter_mean, area_mean, smoothness_mean, compactness_mean, concavity_mean, concave_points_mean, symmetry_mean, fractal_dimension_mean, radius_se, texture_se, perimeter_se, area_se, smoothness_se, compactness_se, concavity_se, concave_points_se, symmetry_se, fractal_dimension_se, radius_worst, texture_worst, perimeter_worst, area_worst, smoothness_worst, compactness_worst, concavity_worst, concave_points_worst, symmetry_worst, fractal_dimension_worst;
output logic [C-1:0] cls;

logic ns0,ns1,ns2,ns3,ns4,ns5,ns6,ns7,ns8,ns9,ns10,ns11,ns12,ns13,ns14,ns15,ns16,ns17,ns18,ns19,ns20,ns21,ns22,ns23,ns24,ns25,ns26,ns27,ns28,ns29,ns30,ns31,ns32;
logic cls0,cls1;
assign ns0 = 1;
assign ns1= (perimeter_worst <49)? ns0: 0;
assign ns16= (perimeter_worst <49)? 0:ns0;
assign ns2= (concave_points_worst <69)? ns1: 0;
assign ns9= (concave_points_worst <69)? 0:ns1;
assign ns3= (symmetry_worst <34)? ns2: 0;
assign ns8= (symmetry_worst <34)? 0:ns2;
assign ns4= (concave_points_worst <36)? ns3: 0;
assign ns5= (concave_points_worst <36)? 0:ns3;
assign ns6= (fractal_dimension_se <9)? ns5: 0;
assign ns7= (fractal_dimension_se <9)? 0:ns5;
assign ns10= (texture_worst <133)? ns9: 0;
assign ns11= (texture_worst <133)? 0:ns9;
assign ns12= (fractal_dimension_se <12)? ns11: 0;
assign ns15= (fractal_dimension_se <12)? 0:ns11;
assign ns13= (smoothness_worst <72)? ns12: 0;
assign ns14= (smoothness_worst <72)? 0:ns12;
assign ns17= (texture_worst <106)? ns16: 0;
assign ns22= (texture_worst <106)? 0:ns16;
assign ns18= (perimeter_worst <54)? ns17: 0;
assign ns21= (perimeter_worst <54)? 0:ns17;
assign ns19= (concave_points_mean <18)? ns18: 0;
assign ns20= (concave_points_mean <18)? 0:ns18;
assign ns23= (concave_points_mean <25)? ns22: 0;
assign ns28= (concave_points_mean <25)? 0:ns22;
assign ns24= (radius_worst <86)? ns23: 0;
assign ns25= (radius_worst <86)? 0:ns23;
assign ns26= (smoothness_se <3)? ns25: 0;
assign ns27= (smoothness_se <3)? 0:ns25;
assign ns29= (texture_worst <237)? ns28: 0;
assign ns32= (texture_worst <237)? 0:ns28;
assign ns30= (radius_worst <164)? ns29: 0;
assign ns31= (radius_worst <164)? 0:ns29;
assign cls0 = ns4|ns7|ns8|ns10|ns15|ns19|ns20|ns24;
assign cls1 = ns6|ns13|ns14|ns21|ns26|ns27|ns30|ns31|ns32;
always_comb
begin
casex({cls0,cls1})
2'b10: cls = 'd0;
2'b01: cls = 'd1;
		default: cls = '0;
	endcase
end

endmodule
