`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/23 11:01:37
// Design Name: 
// Module Name: Testbench_face
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


module Testbench_face();

    reg         EOF_4;
    reg         EOL_4;
    reg [9:0]   LIN_CNT_4;
    reg         ROW_VALID;
    
    initial
    begin
        EOF_4 = 0;
        EOL_4 = 0;
        LIN_CNT_4 = 0;
        ROW_VALID = 0;
    end

endmodule
