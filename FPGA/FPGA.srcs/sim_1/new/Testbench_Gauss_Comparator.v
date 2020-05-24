`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/23 10:29:12
// Design Name: 
// Module Name: Testbench_Gauss_Comparator
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


module Testbench_Gauss_Comparator();
    reg [23:0]  YCgCr_DATA;
    
    wire    RESULT;

    Gauss_Comparator Gauss_Comparator(
        .YCgCr_Data(YCgCr_DATA),
        .result(RESULT)
    );

    initial
    begin
        YCgCr_DATA = 0;
    end

endmodule
