`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2020 08:31:28 AM
// Design Name: 
// Module Name: Counter_Shift
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


module Counter_Shift(
    EOF_in,line_counter_in,row_counter_in,
    EOF_1,
    line_counter_2,row_counter_2,
    line_counter_3,row_counter_3
    );
    
    input EOF_in;
    input [9:0] line_counter_in;
    input [8:0] row_counter_in;
    
    output reg EOF_1;
    reg [9:0] line_counter_1;
    reg [8:0] row_counter_1;
    
    reg EOF_2;
    output reg [9:0] line_counter_2;
    output reg [8:0] row_counter_2;
    
    reg EOF_3;
    output reg [9:0] line_counter_3;
    output reg [8:0] row_counter_3;
    
    initial
    begin
    {EOF_1,line_counter_1,row_counter_1}=0;
    {EOF_2,line_counter_2,row_counter_2}=0;
    end
    
    always @(*)
    begin
        EOF_1<=EOF_in;
        line_counter_1<=line_counter_in;
        row_counter_1<=row_counter_in;
        
        EOF_2<=EOF_1;
        line_counter_2<=line_counter_1;
        row_counter_2<=row_counter_1;
    end
    
endmodule
