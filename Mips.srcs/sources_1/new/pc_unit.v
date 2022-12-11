`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.12.2022 14:59:38
// Design Name: 
// Module Name: pc_unit
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

module pc_unit(
    input                   i_clk,
    input                   i_reset,
    input                   i_pc_reset,
    input                   i_stall,
    input   [32 - 1 : 0]    i_new_pc,
    output  [32 - 1 : 0]    o_pc_value
);

reg [32 - 1 : 0] data_pc;
reg [32 - 1 : 0] pc_value_reg;

always @(posedge i_clk)
begin
    data_pc <= (i_pc_reset || i_reset) ? 0 : i_new_pc;
end

always @(negedge i_clk)
begin
    pc_value_reg <= i_stall ? pc_value_reg : data_pc;
end

assign o_pc_value = pc_value_reg;

endmodule