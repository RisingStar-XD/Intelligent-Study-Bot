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


module Opening(line_counter,row_counter,result,CLK,out,line_counter_o,row_counter_o);
    
    input [9:0] line_counter;
    input [8:0] row_counter;
    input result;
    input CLK;
    
    output out;
    output [9:0] line_counter_o;
    output [8:0] row_counter_o;
    
    wire [8:0] Window1,Window2;
    
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
    
    wire [9:0] line1;
    wire [8:0] row1;
    wire stage1_out;
    
    Window_gen Window_gen2(
    .line_counter(line1),
    .row_counter(row1),
    .result(stage1_out),
    .Window(Window2),
    .CLK(CLK)
    );
    
    wire dialated;
    
    Dilating Dilating(
        .Window(Window2),
        .out(dialated)
    );
    
    WC WC1(
        .line_in(line_counter),
        .line_out(line1),
        .row_in(row_counter),
        .row_out(row1)
    );
    
    WC WC2(
        .line_in(line1),
        .line_out(line_counter_o),
        .row_in(row1),
        .row_out(row_counter_o)
    );
    
    OC_Control OC_Control(
        .clk(CLK),
        .line_counter1(line_counter),
        .row_counter1(row_counter),
        .line_counter2(line1),
        .row_counter2(row1),
        .stage1_in(eroded),
        .in(dialated),
        .stage1_out(stage1_out),
        .out(out)
    );
    
endmodule
