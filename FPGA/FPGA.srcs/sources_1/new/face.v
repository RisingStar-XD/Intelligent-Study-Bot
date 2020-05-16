`timescale 1ns / 1ps

module face(valid,clk,counter,s,e,EOF);
    
    input valid;
    input clk;
    input EOF;
    input [9:0] counter;
    
    output reg [9:0] s;
    output reg [9:0] e;
    
    reg [2:0]shift;
    
    initial
    begin
        s=10'b1111111111;
        e=10'b1111111111;
    end
    
    reg clr;
    
    always @(negedge clk)
        if(EOF)
            clr<=1;
        else
            clr<=0;
    
    always @(posedge clk)
    begin
        shift[2]<=shift[1];
        shift[1]<=shift[0];
        shift[0]<=valid;
    end
    
    always @(posedge clk)
    begin
        if(clr)
        begin
            s<=10'b1111111111;
            e<=10'b1111111111;
        end
        else
        begin
            if(shift==3'b111)
            begin
                if(s==10'b1111111111)
                begin
                    s<=counter-2;
                end
            end
            else if(s!=10'b1111111111)
            begin
                e<=counter;
                s<=10'b1111111111;
            end
        end
    end
    
endmodule
