`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/23 10:37:17
// Design Name: 
// Module Name: Testbench_Opening
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


module Testbench_Opening();

    reg         CMOS_ACTIVE_VIDEO;
    reg [9:0]   LINE_CNT_2;
    reg         RESULT;
    reg [8:0]   ROW_CNT_2;
    
    wire        OPEN_OUT;

    Opening Opening(
        .CLK(CMOS_ACTIVE_VIDEO),
        .line_counter(LINE_CNT_2),
        .result(RESULT),
        .row_counter(ROW_CNT_2),
        .out(OPEN_OUT)
    );
    
    initial
    begin
        CMOS_ACTIVE_VIDEO = 0;
        LINE_CNT_2 = 0;
        RESULT = 0;
        ROW_CNT_2 = 0;
    end
endmodule
