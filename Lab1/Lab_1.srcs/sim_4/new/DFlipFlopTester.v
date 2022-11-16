`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.08.2022 08:15:45
// Design Name: 
// Module Name: DFlipFlopTester
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


module DFlipFlopTester(

    );
    reg clock, nreset, d;
    DFlipFlop D1(q,clock,nreset,d);
    always
        #10 clock=~clock;
    initial
        begin
            //$dumpfile("testDFlipFlop.dump");
            //$dumpvars(1,D1);
            #0 
            d = 0 ; clock = 0 ; nreset = 1 ;
            #55
            nreset = 0;
            #10
            d = 0 ; clock = 0 ;
            #50
            nreset=1;
            #1000 
            $finish;
        end
    always
        #8 d=~d;
endmodule
