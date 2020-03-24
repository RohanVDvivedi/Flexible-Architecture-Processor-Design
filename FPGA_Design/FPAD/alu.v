`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:26:37 03/19/2020 
// Design Name: 
// Module Name:    alu 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module alu(
    input [7:0] r_addr,
    input [7:0] w_addr,
    inout [7:0] bus,
    input clk
    );
	 
	/*
		ALU
		read addresses  => 0x10 - 0x17
		write addresses => 0x10 - 0x12
	*/
	 
	reg[7:0] Imm;
	reg[7:0] A;
	reg[7:0] B;
	 
	always@(posedge(clk))
	begin
		case(w_addr)
			8'h10 : Imm <= r_addr;
			8'h11 : A   <= bus;
			8'h12 : B   <= bus;
		endcase
	end
	
	reg[7:0] result;
	
	wire[8:0] add_result;
	assign add_result = A+B;
	
	always@(*)
	begin
		case(r_addr)
			8'h10 : result = Imm;
			8'h11 : result = A & B;
			8'h12 : result = A | B;
			8'h13 : result = A ^ B;
			8'h14 : result = add_result[7:0];
			8'h15 : result = {4'b0,add_result[8],A==B,A<B,A>B};
			8'h16 : result = A<<B[2:0];
			8'h17 : result = A>>B[2:0];
			default : result = 8'bz;
		endcase
	end
	
	assign bus = result;

endmodule
