`timescale 1ns / 1ps

module line_checker(clk,image,en,valid,ready,line_counter,addr,EEOF);
    
    input clk;
    input image;
    input en;
    
    output reg valid;
    output reg ready;
    output EEOF;
    output reg [9:0] line_counter;
    output [18:0] addr;
    
    parameter line=640;
    parameter row=480;
    parameter threshold=100;
    
    reg flag;
    
    reg [8:0] row_counter;
    reg [8:0] match;
    
    assign EEOF=!flag;
    
    always @(posedge en)
    begin
        flag<=1;
        line_counter<=0;
        row_counter<=0;
    end
    
    always @(posedge clk)
    begin
        if(flag)
        begin
            if((line_counter==line)&(row_counter==row))
            begin
                flag<=0;
                line_counter<=0;
                row_counter<=0;
            end
            else if(row_counter==row)
            begin
                line_counter<=line_counter+1;
                row_counter<=0;
            end
        end
    end
    
    function [18:0] addr_calc;
        input [9:0] line_counter;
        input [8:0] row_counter;
        addr_calc=640*row_counter+line_counter;
    endfunction
    
    assign addr=addr_calc(line_counter,row_counter);
    
    always @(posedge clk)
    begin
        if(flag)
            if(row_counter==row)
            begin
                if(match>=threshold)
                    valid<=1;
                else
                    valid<=0;
                ready<=1;
                match<=0;
            end
            else
            begin
                if(image)
                    match<=match+1;
                ready<=0;
            end
    end
    
endmodule
