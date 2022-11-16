`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.09.2022 21:22:25
// Design Name: 
// Module Name: SinglePortRAM
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

module SinglePortRAM (
    output reg [7:0] addr , // Address
    output reg [7:0] dout, // Out
    input wire [7:0] din, // In
    input wire oe , // Output Enable
    input wire clk , we, reset
    ) ;
    
    reg [7:0] mem [255:0];
    reg a;
    initial begin
        dout = 0;
        addr = 0;
        a = 0;
    end
    
    always @(posedge clk) begin
        if(we) begin // write enable = write d_input into RAM
            if(a==0)
                mem[addr] = din;
                if(addr==255)
                    a=1;
                addr = addr+1;
        end
        if(reset||(oe && addr == 0&&a == 0)) begin // reset button or empty stack
            dout = 0;
            addr = 0;
            a = 0;
        end
        if(oe && (addr > 0|| a == 1)) begin // read from stack to d_output
            addr = addr-1;
            dout = mem[addr];
            mem[addr] = 0;
            a = 0 ;
        end
    end
endmodule
