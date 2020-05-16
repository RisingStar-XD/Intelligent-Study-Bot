`timescale 1ns / 1ps

module row_checker(result,EOL,clk,valid);
    
    input result;
    input EOL;
    input clk;
    
    output reg valid;
    
    parameter threshold=80;
    
    reg [9:0] num;
    
    initial
    begin
        num=0;
        valid=0;
    end
    
    always @(posedge clk)
    begin
        if(EOL)
        begin
            if(num>threshold)
                valid<=1;
            else
                valid<=0;
            if(result)
                num<=1;
            else
                num<=0;
        end
        else
            if(result)
                num<=num+1;
    end
    
endmodule
