`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:24:30 03/19/2020 
// Design Name: 
// Module Name:    register_file 
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
module register_file(
    input [7:0] r_addr,
    input [7:0] w_addr,
    inout [7:0] bus,
    input clk
    );
	 
	 /*
			Register file internal addresses 0x00 - 0x0f
	 */
	 
	reg[7:0] registers[15:0];
	 
	always@(posedge(clk))
	begin
		registers[w_addr] <= (w_addr[7:4] == 4'b0) ? bus : 8'bz;
	end
	assign bus = (r_addr[7:4] == 4'b0) ? registers[r_addr] : 8'bz;

endmodule
