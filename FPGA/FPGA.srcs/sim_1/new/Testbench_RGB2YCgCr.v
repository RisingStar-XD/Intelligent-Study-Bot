`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/23 10:23:35
// Design Name: 
// Module Name: Testbench_RGB2YCgCr
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


module Testbench_RGB2YCgCr();
    
    reg [23:0]  RGB_DATA_OUT_C;
    
    wire    [23:0]  YCgCr_DATA;

    RGB2YCgCr RGB2YCgCr(
        .RGB_Data(RGB_DATA_OUT_C),
        .YCgCr_Data(YCgCr_DATA)
    );    
    
    initial
    begin
        RGB_DATA_OUT_C = 0;
    
    
    end
endmodule
