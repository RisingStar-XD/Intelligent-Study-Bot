`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/30/2020 09:32:31 AM
// Design Name: 
// Module Name: OC_Control
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


module OC_Control(clk,line_counter1,row_counter1,line_counter2,row_counter2,stage1_in,in,stage1_out,out);
    
    input clk;
    input [9:0] line_counter1;
    input [8:0] row_counter1;
    input [9:0] line_counter2;
    input [8:0] row_counter2;
    
    input stage1_in,in;
    
    output reg stage1_out,out;
    
    always @(posedge clk)
    begin
        if((row_counter1==0)|(row_counter1==480)|(line_counter1==0)|(line_counter1==640))
        begin
            stage1_out<=0;
        end
        else
        begin
            stage1_out<=stage1_in;
        end
    end
    
    always @(posedge clk)
    begin
        if((row_counter2==0)|(row_counter2==480)|(line_counter2==0)|(line_counter2==640))
        begin
            out<=0;
        end
        else
        begin
            out<=in;
        end
    end
    
endmodule
