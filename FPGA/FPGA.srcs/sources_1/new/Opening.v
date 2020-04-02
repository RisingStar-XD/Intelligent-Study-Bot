`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2020 02:20:52 PM
// Design Name: 
// Module Name: Opening
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


module Opening(line_counter,row_counter,result,CLK,out);
    
    input [9:0] line_counter;
    input [8:0] row_counter;
    input result;
    input CLK;
    
    output out;
    
    wire [7:0] Window1,Window2;
    
    Window_gen Window_gen1(
    .line_counter(line_counter),
    .row_counter(row_counter),
    .result(result),
    .Window(Window1),
    .CLK(CLK)
    );
    
    wire eroded;
    
    Eroding Eroding(
        .Window(Window1),
        .out(eroded)
    );
    
    Window_gen Window_gen2(
    .line_counter(line_counter),
    .row_counter(row_counter),
    .result(eroded),
    .Window(Window2),
    .CLK(CLK)
    );
    
    Dilating Dilating(
        .Window(Window2),
        .out(out)
    );
    
endmodule
