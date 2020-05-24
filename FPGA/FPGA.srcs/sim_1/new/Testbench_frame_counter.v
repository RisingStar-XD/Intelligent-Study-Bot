`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/22 16:24:16
// Design Name: 
// Module Name: Testbench_frame_counter
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


module Testbench_frame_counter();
    
    reg     CMOS_ACTIVE_VIDEO;
    reg     rst;
    
    wire    [9:0] LINE_CNT;
    wire    [8:0] ROW_CNT;
    wire    [18:0] pixel_counter;
    wire        EOF;
    wire        EOL;
    
    frame_counter frame_counter(
        .CLK(CMOS_ACTIVE_VIDEO),
        .line_counter(LINE_CNT),
        .row_counter(ROW_CNT),  
        .EOF(EOF)
    );
    
    initial 
    begin
        CMOS_ACTIVE_VIDEO = 0;  
    end

    
endmodule
