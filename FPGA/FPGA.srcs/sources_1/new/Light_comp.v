`timescale 1ns / 1ps

module Light_comp(RGB_Data_in,RGB_Data_out,GSI_Data,EOF);
    
    input [23:0] RGB_Data_in;
    input [7:0]GSI_Data;
    input EOF;
    
    output [23:0] RGB_Data_out;
    
    parameter frames=900;//update the reference white parameter every 900 frames
    parameter size=307200;
    
    reg EN;
    reg [9:0]fcount;
    
    wire [31:0] coe;
    
    comp_cal comp_cal(
        .EN(EN),
        .EOF(EOF),
        .GSI_Data(GSI_Data),
        .coe(coe)
    );
    
    initial
    begin
        EN=1;
        fcount=0;
    end
    
    always @(posedge EOF)
    begin
        if (fcount==frames)
        begin
            fcount<=fcount+1;
            EN<=1;
        end
        else
        begin
            fcount<=fcount+1;
            EN<=0;
        end
    end
    
    function [23:0] RGB_calc;
        input [23:0] RGB_Data_in;
        input [31:0] coe;
        reg [32:0] R,G,B;
        begin
            R=RGB_Data_in[7:0]*coe;
            G=RGB_Data_in[15:8]*coe;
            B=RGB_Data_in[23:16]*coe;
            RGB_calc[7:0]=R[31:24];
            RGB_calc[15:8]=G[31:24];
            RGB_calc[23:16]=B[31:24];
        end
    endfunction
    
    assign RGB_Data_out=RGB_calc(RGB_Data_in,coe);
    
endmodule
