`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.09.2022 15:26:59
// Design Name: 
// Module Name: dFlipFlop
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

module dFlipflop(
    output reg q,
    output reg notq,
    input d,
    input clk
    );
    
    reg state;
    initial state = 0;
    always @(posedge clk) state = d;
    always @(state) {q,notq} = {state,~state};
    
endmodule