`timescale 1ns / 1ps

module Counter_Shift(
    EOF_in,line_counter_in,row_counter_in,pixel_counter_in,EOL_in,
    EOF_1,EOF_4,EOL_4,
    line_counter_2,row_counter_2,
    line_counter_3,row_counter_3,
    line_counter_4,row_counter_4,
    pixel_counter_4,
    clk,rst,EN
    );
    
    input EOF_in,EOL_in;
    input [9:0] line_counter_in;
    input [8:0] row_counter_in;
    input [18:0] pixel_counter_in;
    input clk;
    input rst;
    input EN;
    
    output reg EOF_1;
    reg EOL_1;
    reg [9:0] line_counter_1;
    reg [8:0] row_counter_1;
    reg [18:0] pixel_counter_1;
    
    reg EOF_2;
    reg EOL_2;
    output reg [9:0] line_counter_2;
    output reg [8:0] row_counter_2;
    reg [18:0] pixel_counter_2;
    
    reg EOF_3;
    reg EOL_3;
    output reg [9:0] line_counter_3;
    output reg [8:0] row_counter_3;
    reg [18:0] pixel_counter_3;
    
    output reg EOF_4;
    output reg EOL_4;
    output reg [9:0] line_counter_4;
    output reg [8:0] row_counter_4;
    output reg [18:0] pixel_counter_4;
    
    initial
    begin
        {EOF_1,EOL_1,line_counter_1,row_counter_1,pixel_counter_1}=0;
        {EOF_2,EOL_2,line_counter_2,row_counter_2,pixel_counter_2}=0;
        {EOF_3,EOL_3,line_counter_3,row_counter_3,pixel_counter_3}=0;
        {EOF_4,EOL_4,line_counter_4,row_counter_4,pixel_counter_4}=0;
    end
    
    always @(clk)
    begin
        if(rst)
        begin
            {EOF_1,EOL_1,line_counter_1,row_counter_1,pixel_counter_1}<=0;
            {EOF_2,EOL_2,line_counter_2,row_counter_2,pixel_counter_2}<=0;
            {EOF_3,EOL_3,line_counter_3,row_counter_3,pixel_counter_3}<=0;
            {EOF_4,EOL_4,line_counter_4,row_counter_4,pixel_counter_4}<=0;
        end
        else if (EN)
        begin
            EOF_1<=EOF_in;
            EOL_1<=EOL_in;
            line_counter_1<=line_counter_in;
            row_counter_1<=row_counter_in;
            pixel_counter_1<=pixel_counter_in;
        
            EOF_2<=EOF_1;
            EOL_2<=EOL_1;
            line_counter_2<=line_counter_1;
            row_counter_2<=row_counter_1;
            pixel_counter_2<=pixel_counter_1;
        
            EOF_3<=EOF_2;
            EOL_3<=EOL_2;
            line_counter_3<=line_counter_2;
            row_counter_3<=row_counter_2;
            pixel_counter_3<=pixel_counter_2;
        
            EOF_4<=EOF_3;
            EOL_4<=EOL_3;
            line_counter_4<=line_counter_3;
            row_counter_4<=row_counter_3;
            pixel_counter_4<=pixel_counter_3;
        end
    end
    
endmodule
