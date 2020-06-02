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
    
    wire        Eroded_out;
    wire        OPEN_OUT;

    Opening Opening(
        .CLK(CMOS_ACTIVE_VIDEO),
        .line_counter(LINE_CNT_2),
        .result(RESULT),
        .row_counter(ROW_CNT_2),
        .out(OPEN_OUT),
        .eroded(Eroded_out)
    );
    
    initial
    begin
        CMOS_ACTIVE_VIDEO = 1;
        LINE_CNT_2 = 10'b0011010111;
        ROW_CNT_2 = 9'b001001001;
        RESULT = 1;
        
        forever 
        begin
        #10  CMOS_ACTIVE_VIDEO = ~ CMOS_ACTIVE_VIDEO;
        LINE_CNT_2 = LINE_CNT_2 +1;
        ROW_CNT_2 =  ROW_CNT_2 +1;
        #5 RESULT = ~RESULT  ;
        end
    end
endmodule

//forever 
//        begin
//        #10  CMOS_ACTIVE_VIDEO = ~ CMOS_ACTIVE_VIDEO;
//        LINE_CNT_2 = LINE_CNT_2 +1;
//        ROW_CNT_2 =  ROW_CNT_2 +1;
//        RESULT = ~RESULT  ;
//        end

// #15 RESULT = 1;CMOS_ACTIVE_VIDEO = 1;
//        #10 LINE_CNT_2 = LINE_CNT_2 +1;
//            ROW_CNT_2 =  ROW_CNT_2 +1; 
//        #15 RESULT = 0;CMOS_ACTIVE_VIDEO = 0;
//        #10 LINE_CNT_2 = LINE_CNT_2 +1;
//            ROW_CNT_2 =  ROW_CNT_2 +1; 
        