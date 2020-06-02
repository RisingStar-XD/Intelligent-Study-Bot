`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/23 10:58:07
// Design Name: 
// Module Name: Testbench_row_checker
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


module Testbench_row_checker();
    reg         EOL_4;
    reg         CMOS_ACTIVE_VIDEO;
    reg         CLOSE_OUT;
    
    wire        ROW_VALID;

 row_checker row_checker(
        .EOL(EOL_4),
        .clk(CMOS_ACTIVE_VIDEO),
        .valid(ROW_VALID),
        .result(CLOSE_OUT)
    );
    
    initial
    begin
        EOL_4 = 0;
        CMOS_ACTIVE_VIDEO = 0;
        CLOSE_OUT = 0;
        #10 CLOSE_OUT = 1;
        forever #10 CMOS_ACTIVE_VIDEO = ~CMOS_ACTIVE_VIDEO;
        #10000 EOL_4 = 1;
       
    end
    
endmodule
