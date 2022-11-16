`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.09.2022 16:12:47
// Design Name: 
// Module Name: bcdtester
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


module bcdtester(

    );
    wire [3:0] outputs;
    wire cout, bout;
    reg clk, set9, set0, inc, dec;
    BCDCounter bcd(outputs,cout,bout,set9,set0,inc,dec,clk);
    always
        #10 clk=~clk;
    initial begin
        #0 clk=0;inc=0;dec=0;set9=0;set0=0;
        #20
        #10 inc = 1;
        #310
        #10 inc=0; dec=0; set0 = 1;
        #10 set0=0;
        #10 set9=0; dec = 1;
        #310
        #10 inc=0; dec=0; set0 = 1;
        #10 set0=0; set9 = 1;
        #30 set9=0; 
        #50 ;
    end

endmodule
