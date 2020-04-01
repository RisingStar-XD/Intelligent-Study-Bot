`timescale 1ns / 1ps

module Light_comp(RGB_Data_in,RGB_Data_out,GSI_Data,ch);
    
    input [23:0] RGB_Data_in;
    input [7:0]GSI_Data;
    output reg [23:0] RGB_Data_out;
    output ch;
    
    parameter frames=900;//update the reference white parameter every 900 frames
    parameter size=307200;
    
    reg [29:0] count;
    reg EN;
    reg [32:0] R,G,B;
    
    wire [31:0] coe;
    
    comp_cal comp_cal(
        .EN(EN),
        .GSI_Data(GSI_Data),
        .coe(coe),
        .ch(ch)
    );
    
    initial
    begin
        count=0;
        RGB_Data_out=0;
        EN=1;
    end
    
    always @(*)
    begin
        if (count==(frames*size))
        begin
            count<=0;
            EN=1;
        end
        else if(count>size)
        begin
            count<=count+1;
            EN<=0;
        end
        else
            count<=count+1;
    end
    
    always @(*)
    begin
        R=RGB_Data_in[7:0]*coe;
        G=RGB_Data_in[15:8]*coe;
        B=RGB_Data_in[23:16]*coe;
        RGB_Data_out[7:0]=R[31:24];
        RGB_Data_out[15:8]=G[31:24];
        RGB_Data_out[23:16]=B[31:24];
    end
    
endmodule
