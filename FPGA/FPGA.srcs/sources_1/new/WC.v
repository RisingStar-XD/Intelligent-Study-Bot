`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/02/2020 09:08:05 PM
// Design Name: 
// Module Name: WC
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


module WC(line_in,line_out,row_in,row_out);
    
    input [8:0] row_in;
    input [9:0] line_in;
    
    output reg [8:0] row_out;
    output reg [9:0] line_out;
    
    always @(row_in)
    begin
        if(row_in==1)
            row_out<=480;
        else
            row_out<=row_in-1;
    end
    
    always @(line_in)
    begin
        if(line_in==1)
            line_out<=480;
        else
            line_out<=line_in-1;
    end
    
endmodule
