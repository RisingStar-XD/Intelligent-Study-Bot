`timescale 1ns / 1ps

module Integral_image_gen(CLK,MCLK,GSI_Data,Addr_read,Addr_write,Intei_Data_i,Intei_Data_o,rst);

    input CLK;//Driving clock
    input [7:0] GSI_Data;//8-Bits GSI Data
    input Intei_Data_i;//Integral image data input
    input rst;
    
    output MCLK;//Communication clock
    output [21:0] Addr_read,Addr_write;
    output Intei_Data_o;//Integral image data output
    
    parameter width=1920;
    parameter height=1080;
    
    reg [10:0]x,y;
    reg rst_r;
    
    initial
    begin
    x=0;
    y=0;
    end
    
    always @ (posedge CLK)
        rst_r <= rst;
    
    always @(posedge CLK, posedge rst_r)
    begin
        if(rst_r)
        begin
            x=0;
            y=0;
        end
        else
        begin
            
        end
    end
    
endmodule
