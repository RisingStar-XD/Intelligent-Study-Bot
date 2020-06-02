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

    reg [23:0] YCgCr_Data;
    reg CLK;
    reg EOF;
    
    wire result;
    
     Gauss_Comparator Gauss_Comparator(
        .EOF(EOF),
        .CLK(CLK),
        .YCgCr_Data(YCgCr_Data),
        .result(result)
    );
    
    
    
    initial
    begin
    YCgCr_Data = 24'b101010010100101010011001;
    CLK = 0;
        forever
        begin
        #5 CLK = ~CLK;
        YCgCr_Data = YCgCr_Data +1;    
        end
    end
    
    
    
endmodule
