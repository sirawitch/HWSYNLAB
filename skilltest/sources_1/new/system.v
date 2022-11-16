`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2021 04:30:40 PM
// Design Name: 
// Module Name: system
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

module system(
    output wire[7:0]led,
    input wire clk
    );
    
    wire targetClk;
    wire toggleClk;
    wire [32:0] tclk;
    assign tclk[0] = clk;
    genvar c;
    generate for(c = 0 ; c < 27 ; c = c + 1 ) begin 
        clockDiv fDiv(tclk[c+1],tclk[c]);
    end endgenerate
    
    clockDiv fdivTarget(targetClk,tclk[25]);
    clockDiv fdivTarget2(toggleClk,tclk[26]);
    reg [3:0] st,nst;
    reg [4:0] lout;
    assign led[4:0] = lout;
    assign led[7] = toggleClk;
    initial begin
    st = 0;
    nst = 0;
    end
    
    always @(posedge targetClk) begin
        st = nst;
    end
    
    always @(st) begin
        case(st)
        4'b0000: lout = 5'b00000;
        4'b0001: lout = 5'b01010;
        4'b0010: lout = 5'b00100;
        4'b0011: lout = 5'b01110;
        4'b0100: lout = 5'b10001;
        default: lout = 5'b00000;
        endcase
        nst = (st + 1 ) % 5;
      end
endmodule
