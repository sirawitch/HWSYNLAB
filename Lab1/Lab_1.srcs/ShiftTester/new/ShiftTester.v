`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.08.2022 08:27:07
// Design Name: 
// Module Name: ShiftTester
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


module ShiftTester(

    );
    wire[1:0] q1, q2;
    reg clock, d;
    ShiftA s1(q1,clock,d);
    ShiftB s2(q2,clock,d);
    always
        #10 
        clock=~clock;
    initial 
    begin
        #0
        clock=0;
        d=0;
        
        #20
        d=1;
        
        #35
        d=0;
        
        #100 
        $finish;
    end
    always
        #8 d=~d;
endmodule
