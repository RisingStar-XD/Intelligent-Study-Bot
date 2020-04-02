`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2020 02:27:49 PM
// Design Name: 
// Module Name: Closing
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


module Closing(line_counter,row_counter,opened,CLK,out);
    
    input [9:0] line_counter;
    input [8:0] row_counter;
    input opened;
    input CLK;
    
    output out;
    
    wire [7:0] Window1,Window2;
    
    Window_gen Window_gen1(
    .line_counter(line_counter),
    .row_counter(row_counter),
    .result(opened),
    .Window(Window1),
    .CLK(CLK)
    );
    
    wire dilated;
    
    Dilating Dilating(
        .Window(Window1),
        .out(dilated)
    );
    
    Window_gen Window_gen2(
    .line_counter(line_counter),
    .row_counter(row_counter),
    .result(dilated),
    .Window(Window2),
    .CLK(CLK)
    );
    
    Eroding Eroding(
        .Window(Window2),
        .out(out)
    );
    
endmodule
