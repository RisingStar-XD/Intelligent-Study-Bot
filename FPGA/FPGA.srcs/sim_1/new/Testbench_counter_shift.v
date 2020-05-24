`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/22 16:24:58
// Design Name: 
// Module Name: Testbench_counter_shift
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


module Testbench_counter_shift();
    reg         EOF_in;
    reg [9:0] LINE_CNT;
    reg [8:0] ROW_CNT;
    reg         CMOS_ACTIVE_VIDEO;
  
    wire        EOF_1;
    wire    [9:0] LINE_CNT_2;
    wire    [8:0] ROW_CNT_2;
    wire    [9:0] LINE_CNT_3;
    wire    [8:0] ROW_CNT_3;
    wire        EOF_4;
    wire        EOL_4;
    wire    [9:0] LINE_CNT_4;
    wire    [18:0] PIXEL_CNT_4;


    Counter_Shift Counter_Shift(
        .EOF_in(EOF_in),
        .clk(CMOS_ACTIVE_VIDEO),
        .line_counter_in(LINE_CNT),
        .row_counter_in(ROW_CNT),
        .EOF_1(EOF_1),
        .EOF_4(EOF_4),
        .EOL_4(EOL_4),
        .line_counter_2(LINE_CNT_2),
        .line_counter_3(LINE_CNT_3),
        .line_counter_4(LINE_CNT_4),
        .pixel_counter_4(PIXEL_CNT_4),
        .row_counter_2(ROW_CNT_2),
        .row_counter_3(ROW_CNT_3)
    );
    
    initial
    begin
        EOF_in = 0;
        LINE_CNT = 10'b0000000000;
        ROW_CNT = 9'b000000000;
        CMOS_ACTIVE_VIDEO = 0;
    end
    
    

endmodule
