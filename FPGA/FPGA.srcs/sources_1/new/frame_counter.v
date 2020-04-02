`timescale 1ns / 1ps

module frame_counter(CLK,rst,line_counter,row_counter,EOF);
    
    input CLK;
    input rst;
    
    output reg [9:0] line_counter;
    output reg [8:0] row_counter;
    output reg EOF;
    
    
    parameter line_width=640;
    parameter row_width=480;
    
    initial
    begin
    line_counter=0;
    row_counter=0;
    end
    
    always @(CLK)
    begin
        if(row_counter==row_width)
        begin
            EOF<=1;
            row_counter<=0;
            line_counter<=0;
        end
        else if(line_counter==line_width)
        begin
            line_counter<=0;
            row_counter<=row_counter+1;
        end
        else
        begin
            line_counter<=line_counter+1;
            EOF<=0;
        end
    end
    
endmodule
