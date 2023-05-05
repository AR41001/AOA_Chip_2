`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2023 03:47:35 AM
// Design Name: 
// Module Name: Processor
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Processor(clk, reset, D_out,D_OUT, Address, D_in, mw_en, status);
	input 	clk, reset; 
	input 	[15:0] D_in; 
	output 	 D_out;
	output [15:0] D_OUT;
	output Address;
	output 	[7:0] status; 
	output 	mw_en; 
	
	//wires: 
	wire 	[15:0] ir_out; 
	wire 	N, Z, C; 
	wire 	[2:0] W_Adr, R_Adr, S_Adr; 
	wire 	adr_sel, s_sel; 
	wire 	pc_ld, pc_inc, pc_sel, ir_ld; 
	wire 	rw_en; 
	wire	[3:0] Alu_Op; 
	
	// This instantiates the Control Unit module. We use this as a way to inner
	// connect the wires,inputs,and outputs from this module to the inputs,outputs
	// and wires from the control unit module.
	cu		u0 ( .clk(clk), .reset(reset), .IR(ir_out), .N(N), .Z(Z), .C(C),
					.W_Adr(W_Adr), .R_Adr(R_Adr), .S_Adr(S_Adr), 						 
					.adr_sel(adr_sel), .s_sel(s_sel), 							
					.pc_ld(pc_ld), .pc_inc(pc_inc), .pc_sel(pc_sel), .ir_ld(ir_ld), 	
					.mw_en(mw_en), .rw_en(rw_en), .alu_op(Alu_Op), .status(status)); 
			 
	// This instantiates the CPU_EU module that we use in order to inner connects 
	// the I/O and wires of this module to the I/O and wires from the cpu_eu.
	CPU_EU u1 ( .clk(clk), .reset(reset), 
					.pc_ld(pc_ld), .pc_sel(pc_sel), .pc_inc(pc_inc), .ir_ld(ir_ld), 
					.adr_sel(adr_sel), .W_En(rw_en), .S_Sel(s_sel), 
					.address(Address), .D_out(D_out),.D_in(D_in), .C(C), .N(N), .Z(Z),
					.W_Adr(W_Adr), .R_Adr(R_Adr), .S_Adr(S_Adr), .Alu_Op(Alu_Op), .ir_out(ir_out)); 
					
	//Button_Press u3 ( .clk(clk), .BUTTONS(D_in), .Increase_duty(inc), .Decrease_duty(dec));
				
	PWM_Generator      u2 ( .clk(clk), .increase_duty(D_out), .decrease_duty(D_out), .PWM_OUT(D_OUT) );
	
    //Button_Press       u3 (  .clk(clk),  .BUTTONS(D_in), .Increase_duty(D_out), .Decrease_duty(D_out));
    
assign status[7] = 0;
assign status[6] = 0;
assign status[5] = 0;
assign status[4] = 0;
assign status[3] = 0;
assign status[2] = 0;
assign status[1] = 0;
assign status[0] = 0;

assign D_OUT [15] = 0;
assign D_OUT [14] = 0;
assign D_OUT [13] = 0;
assign D_OUT [12] = 0;
assign D_OUT [11] = 0;
assign D_OUT [10] = 0;
assign D_OUT [9] = 0;
assign D_OUT [8] = 0;
assign D_OUT [7] = 0;
assign D_OUT [6] = 0;
assign D_OUT [5] = 0;
assign D_OUT [4] = 0;
assign D_OUT [3] = 0;
assign D_OUT [2] = 0;
assign D_OUT [1] = 0;
assign D_OUT [0] = 0;



endmodule
