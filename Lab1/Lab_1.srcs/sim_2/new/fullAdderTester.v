`timescale 1ns/1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:
// Design Name: 
// Module Name: 
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


module fullAdderTester(

    );
        reg a,b,cin;
        wire cout,s;
        fullAdder2 a2(cout,s,a,b,cin);
    initial
    begin
        //$dumpfile("time.dump");
        //$dumpvars(2,a1);
        $monitor("time %t: {%b %b} <- {%d %d %d}", $time,cout,s,a,b,cin);
        #0;
        a = 0 ;  b = 0 ; cin = 0 ;
        #10
        a = 0 ;  b = 0 ; cin = 1 ;
        #10
        a = 0 ;  b = 1 ; cin = 0 ;
        #10
        a = 0 ;  b = 1 ; cin = 1 ;
        #10
        a = 1 ;  b = 0 ; cin = 0 ;
        #10
        a = 1 ;  b = 0 ; cin = 1 ;
        #10
        a = 1 ;  b = 1 ; cin = 0 ;
        #10
        a = 1 ;  b = 1 ; cin = 1 ;
        #10
        $finish;
    end
endmodule
