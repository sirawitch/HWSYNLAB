`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.09.2022 16:12:47
// Design Name: 
// Module Name: singlepulsertester
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


module singlepulsertester(

    );
    wire d2;
    reg clk, pushed;
    singlePulser sp(d2,pushed,clk);
    always
        #10 clk=~clk;
    initial begin
        #0  clk=0; pushed=0;
        #20
        #5  pushed = 1;
        #10 pushed = 0;
        #5  pushed = 1;
        #20 pushed = 0;
        #60 pushed = 1;
        #12 pushed = 0;    
        #600 $finish;
    end
endmodule
