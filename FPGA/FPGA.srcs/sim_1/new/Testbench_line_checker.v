`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/28 16:24:56
// Design Name: 
// Module Name: Testbench_line_checker
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


module Testbench_line_checker();
    reg     CMOS_FRAME_DATA;
    reg     EOF_4;

 
    wire line_valid;
    wire line_ready;
    wire EEOF;
    wire im;
    wire [9:0] check_counter;
    wire [18:0] check_addr;
    
    
    line_checker line_checker(
        .clk(CMOS_FRAME_DATA),
        .en(EOF_4),
        
        .valid(line_valid),
        .ready(line_ready),
        .line_counter(check_counter),
        .image(im),
        .addr(check_addr),
        .EEOF(EEOF)
    );
    
    initial
    begin
        CMOS_FRAME_DATA = 0;
        EOF_4 = 0;
        
    #100 EOF_4 = 1;
    forever
    begin
    #5 CMOS_FRAME_DATA = ~CMOS_FRAME_DATA ; 
    end
    
    
    end 
endmodule
