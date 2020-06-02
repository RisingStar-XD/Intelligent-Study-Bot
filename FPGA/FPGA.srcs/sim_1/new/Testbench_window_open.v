`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/29 11:21:27
// Design Name: 
// Module Name: Testbench_window_open
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


module Testbench_window_open();

    reg [9:0] line_counter;
    reg [8:0] row_counter;
    reg result;
    reg CLK;
    
    wire    [8:0] Window;

    Window_gen Window_gen (
    .line_counter(line_counter),
    .row_counter(row_counter),
    .result(result),
    .CLK(CLK),
    .Window(Window)
    );
    
    initial
    begin
        line_counter = 10'b1010010101;
        row_counter = 9'b100001010;
        CLK = 0;
        result = 0;
        
        forever
        begin
        #10 CLK = ~CLK;
        result = ~result;
        line_counter = line_counter+1;
        row_counter = row_counter+1;
        end
        
    end
    
    
endmodule
